//
//  Language.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/5.
//

import Foundation

enum Language: CaseIterable {
    case en
    case zh
    case ja
    case `default`
    
    var text: String {
        switch self {
        case .en:
            return "en"
        case .zh:
            return "zh-Hans"
        case .ja:
            return "ja"
        case .default:
            return "en"
        }
    }
    
    var name: String {
        switch self {
        case .en:
            return "English"
        case .zh:
            return "简体中文"
        case .ja:
            return "日本語"
        case .default:
            return "默认"
        }
    }
}
