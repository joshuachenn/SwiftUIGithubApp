//
//  LocalStorage.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/28.
//

import Foundation

class LocalStorage<T: Codable> {
    
    static func save(key: String, value: T) {
        let standard = UserDefaults.standard
        standard.set(value, forKey: key)
        standard.synchronize()
    }
    
    static func get(key: String) -> T? {
        let standard = UserDefaults.standard
        let value = standard.value(forKey: key) as? T
        return value
    }
    
    static func getData(key: String) -> Data? {
        let standard = UserDefaults.standard
        let value = standard.data(forKey: key)
        return value
    }
    
    static func remove(key: String) {
        let standard = UserDefaults.standard
        standard.removeObject(forKey: key)
    }
    
    static func saveObject(key: String, value: T) {
        do {
            
            let encoder = JSONEncoder()
            let data = try encoder.encode(value)
            print("encode data: \(String(data: data, encoding: .utf8)!)")
            
            let standard = UserDefaults.standard
            standard.set(data, forKey: key)
            standard.synchronize()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    static func getObject(with key: String) -> Result<T, AppError> {
        let userData = LocalStorage.getData(key: key)
        guard let userData = userData else {
            return .failure(.localStorageNilFor(key: key))
        }
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: userData)
            return .success(object)
        } catch {
            return .failure(.decodeError(error))
        }
    }
    
}
