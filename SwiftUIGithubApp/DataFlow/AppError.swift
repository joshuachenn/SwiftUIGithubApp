//
//  AppError.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/28.
//

import Foundation

enum AppError: Error, Identifiable {
    var id: String { localizedDescription }
    
    case passwordWrong
    case networkFailed(Error)
    case networkTimeout
    case networkJsonException
    case githubApiRefused
    case success
    case userInfoError(Error)
    case localStorageNilFor(key:String)
    case decodeError(Error)
}

extension AppError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .passwordWrong: return "密码错误"
        case .networkFailed(let error): return error.localizedDescription
        case .networkTimeout:
            return "连接超时"
        case .networkJsonException:
            return "网络返回数据格式化一次"
        case .githubApiRefused:
            return "Github API Error"
        case .userInfoError(let error), .decodeError(let error):
            return error.localizedDescription
        case .success:
            return "success"
        case .localStorageNilFor(let key):
            return "Local Storage for \(key) is nil"
        }
    }
}
