//
//  AppAction.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/27.
//

import SimpleToast

enum AppAction {
    case login
    case loginFinished(done: Bool)
    case oauthWeb
    case oauthWebFinished(code: String)
    case accessTokenRequest
    case accessTokenRequestDone(token: String)
    case logout
    case selectLanguage
    case selectLanguageFinished
    case showToast(message: String)
    case userStar(name: String)
    case requestDynamic(page: Int=1)
    case requestEvents(name: String, page: Int?=1, perPage: Int?=20)
    case requestEventsDone(events: [Event])
}
