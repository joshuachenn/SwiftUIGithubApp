//
//  URLEx.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/8.
//

import Foundation
import Moya

extension URL {
    var queryParameters: QueryParameters { return QueryParameters(url: self) }
}

class QueryParameters {
    let queryItems: [URLQueryItem]
    init(url: URL?) {
        queryItems = URLComponents(string: url?.absoluteString ?? "")?.queryItems ?? []
        print(queryItems)
    }
    subscript(name: String) -> String? {
        return queryItems.first(where: { $0.name == name })?.value
    }
}


public extension URL {

    /// Initialize URL from Moya's `TargetType`.
    init<T: TargetType>(target: T) {
        // When a TargetType's path is empty, URL.appendingPathComponent may introduce trailing /, which may not be wanted in some cases
        // See: https://github.com/Moya/Moya/pull/1053
        // And: https://github.com/Moya/Moya/issues/1049
        let targetPath = target.path
        if targetPath.isEmpty {
            self = target.baseURL
        } else {
         //   self = target.baseURL.appendingPathComponent(targetPath)
          //修改如下，如果有更好的方法，欢迎补充
            let urlWithPath = target.baseURL.absoluteString + targetPath
            self = URL(string: urlWithPath) ?? target.baseURL
        }
    }
}
