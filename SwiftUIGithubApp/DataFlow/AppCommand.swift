//
//  AppCommand.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/27.
//

import Foundation
import Combine

protocol AppCommand {
    func execute(in store: Store)
}


class ShowToastCommand: AppCommand {
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    func execute(in store: Store) {
        message = NSLocalizedString(message, comment: "ShowToastCommand")
        store.dispatch(.showToast(message: message))
    }
}

class AccessTokenCommand: AppCommand {
    let code: String
    
    init(code: String) {
        self.code = code
    }
    
    func execute(in store: Store) {
        let token = SubscriptionToken()
        AccessTokenRequest(code: code)
            .publisher
            .sink { completion in
                guard case let .failure(error) = completion else { return }
                print(error)
                store.dispatch(.showToast(message: error.localizedDescription))
                token.unseal()
            } receiveValue: { accessToken in
                print("accessToken \(accessToken)")
                let auth = "bearer " + accessToken
                LocalStorage.save(key: Config.TOKEN_KEY, value: auth)
                store.dispatch(.accessTokenRequestDone(token: accessToken))
                token.unseal()
            }
            .seal(in: token)

    }
}

class UserInfoRequestCommand: AppCommand {
    func execute(in store: Store) {
        let token = SubscriptionToken()
        UserInfoRequest()
            .publisher
            .sink { completion in
                guard case let .failure(error) = completion else { return }
                store.dispatch(.showToast(message: error.localizedDescription))
                token.unseal()
            } receiveValue: { user in
                LocalStorage.saveObject(key: Config.USER_INFO, value: user)
                store.dispatch(.loginFinished(done: true))
                store.dispatch(.userStar(name: user.login ?? ""))
                token.unseal()
            }
            .seal(in: token)

    }
}


class UserStarRequestCommand: AppCommand {
    let name: String
    init(name: String) {
        self.name = name
    }
    func execute(in store: Store) {
        let token = SubscriptionToken()
        GithubUserRequest(userName: name)
            .userStarPublisher
            .sink { completion in
                guard case let .failure(error) = completion else { return }
                store.dispatch(.showToast(message: error.localizedDescription))
                token.unseal()
            } receiveValue: {
                
                let result = LocalStorage<User>.getObject(with: Config.USER_INFO)
                switch result {
                case .success(var user):
                    user.starred = $0
                    LocalStorage.saveObject(key: Config.USER_INFO, value: user)
                case .failure(let appError):
                    store.dispatch(.showToast(message: appError.localizedDescription))
                }
                
                token.unseal()
            }
            .seal(in: token)
    }
}


struct UserEventDAOCommand: AppCommand {
    let name: String
    let page: Int?
    let perPage: Int?
    func execute(in store: Store) {
        let token = SubscriptionToken()
        UserEventDaoRequest(name: name, page: page, perPage: perPage)
            .userEventPublisher
            .sink { completion in
                guard case let .failure(error) = completion else { return }
                store.dispatch(.showToast(message: "userEvent \(error.localizedDescription)"))
                token.unseal()
            } receiveValue: { events in
                store.dispatch(.requestEventsDone(events: events))
                token.unseal()
            }
            .seal(in: token)

    }
}

struct UserRequestDynamicCommand: AppCommand {
    let page: Int
    func execute(in store: Store) {
        let result = LocalStorage<User>.getObject(with: Config.USER_INFO)
        if case let .success(user) = result, user.login?.count != 0 {
            let daoCommand = UserEventDAOCommand(name: user.login!, page: page, perPage: 20)
            daoCommand.execute(in: store)
        }
    }
}

class SubscriptionToken {
    var cancellable: AnyCancellable?
    func unseal() { cancellable = nil }
}

extension AnyCancellable {
    func seal(in token: SubscriptionToken) {
        token.cancellable = self
    }
}
