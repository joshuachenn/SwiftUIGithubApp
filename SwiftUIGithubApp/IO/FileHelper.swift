//
//  FileHelper.swift
//  PokeMaster
//
//  Created by 王 巍 on 2019/08/22.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation

//let appDecoder: JSONDecoder = {
//    let decoder = JSONDecoder()
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//    dateFormatter.locale = Locale(identifier: "zh_CN")
//    dateFormatter.timeZone = TimeZone(secondsFromGMT: TimeZone.current.secondsFromGMT())
//    decoder.dateDecodingStrategy = .formatted(dateFormatter)
//    decoder.keyDecodingStrategy = .convertFromSnakeCase
//    return decoder
//}()
//
//let appEncoder: JSONEncoder = {
//    let encoder = JSONEncoder()
//    encoder.keyEncodingStrategy = .convertToSnakeCase
//    return encoder
//}()

enum FileHelper {

    static func loadBundledJSON<T: Decodable>(file: String) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("Resource not found: \(file)")
        }
        return try! loadJSON(from: url)
    }

    static func loadJSON<T: Decodable>(from url: URL) throws -> T {
        let data = try Data(contentsOf: url)
        print("events data: \(String(data: data, encoding: .utf8)!)")
        print("[Event]?.self type \(type(of: [Event]?.self))")
        print("[Event].self type \(type(of: [Event].self))")
        print("T.self type \(type(of: T.self))")
        return try appDecoder.decode(T.self, from: data)
    }

    static func loadJSON<T: Decodable>(
        from directory: FileManager.SearchPathDirectory,
        fileName: String
    ) throws -> T
    {
        guard let url = FileManager.default.urls(for: directory, in: .userDomainMask).first else {
            throw Swift.fatalError()
        }
        print("Local Caches: \(url)")
        do {
            return try loadJSON(from: url.appendingPathComponent(fileName))
        } catch {
            print("loadJSON error: \(error.localizedDescription)")
            throw error
        }
    }

    static func writeJSON<T: Encodable>(_ value: T, to url: URL) throws {
        let data = try appEncoder.encode(value)
        try data.write(to: url)
    }

    static func writeJSON<T: Encodable>(
        _ value: T,
        to directory: FileManager.SearchPathDirectory,
        fileName: String
    ) throws
    {
        guard let url = FileManager.default.urls(for: directory, in: .userDomainMask).first else {
            return
        }
        try writeJSON(value, to: url.appendingPathComponent(fileName))
    }

    static func delete(from directory: FileManager.SearchPathDirectory, fileName: String) throws {
        guard let url = FileManager.default.urls(for: directory, in: .userDomainMask).first else {
            return
        }
        try FileManager.default.removeItem(at: url.appendingPathComponent(fileName))
    }
}
