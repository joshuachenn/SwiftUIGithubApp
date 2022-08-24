//
//  GithubRequest.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/6.
//

import Foundation
import Moya
import Combine
import CombineMoya

struct UserInfoRequest {
    var userName = ""
    
    var publisher: AnyPublisher<User, Error> {
        gitHubProvider
            .requestPublisher(.myUserInfo)
            .map { $0.data }
            .decode(type: User.self, decoder: appDecoder)
            .eraseToAnyPublisher()
    }
    
}

struct AccessTokenRequest {
    let code: String
    
    var publisher:  AnyPublisher<String, MoyaError> {
        gitHubProvider
            .requestPublisher(.accessToken(code))
            .map {
                let dataString = String(data: $0.data, encoding: .utf8)
                if let string = dataString {
                    let url = URL(string: "https://github.com?" + string)!
                    return url.queryParameters["access_token"] ?? ""
                }
                return ""
            }
            .eraseToAnyPublisher()
    }
}

struct GithubUserRequest {
    let userName: String
    
    // 在header中提起stared count
    var userStarPublisher: AnyPublisher<String, MoyaError> {
        gitHubProvider
            .requestPublisher(.userStar(userName, nil))
            .map { response in
                let allHeaders = response.response?.allHeaderFields
                print(allHeaders ?? "allHeaders is empty")
                guard let allHeaders = allHeaders else {
                    return ""
                }
                let link = allHeaders["Link"]
                guard let link = link else {
                    return ""
                }
                let indexStart = "\(link)".findLast("page=") + 5
                let indexEnd = "\(link)".findLast(">")
                
                return "\(link)".subString(in: indexStart..<indexEnd)
            }
            .eraseToAnyPublisher()
    }
}

struct UserEventDaoRequest {
    let name: String
    let page: Int?
    let perPage: Int?
    
    var userEventPublisher: AnyPublisher<[Event], Error> {
        gitHubProvider
            .requestPublisher(.requestEvents(name, page, perPage))
            .map { $0.data }
            .decode(type: [Event].self, decoder: appDecoder)
            .eraseToAnyPublisher()
    }
}
