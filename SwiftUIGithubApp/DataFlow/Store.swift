//
//  Store.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/28.
//

import Combine

class Store: ObservableObject {
    @Published var appState = AppState()
    
    private var disposeBag = Set<AnyCancellable>()
    
    init() {
        setupObservers()
        getConfigure()
    }
    
    func getConfigure() {
        let result = LocalStorage<User>.getObject(with: Config.USER_INFO)
        switch result {
        case .success(_):
            appState.interaction.isLogined = true
        case .failure(_):
            appState.interaction.isLogined = false
        }
    }
    
    func setupObservers() {
        appState.settings.changer.languagePublisher.sink { [weak self] language in
            self?.dispatch(.selectLanguageFinished)
        }.store(in: &disposeBag)
    }
    
    func dispatch(_ action: AppAction) {
        print("[ACTION]: \(action)")
        let result = Store.reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            print("[COMMAND]: \(command)")
            command.execute(in: self)
        }
    }
    
    static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?) {
        var appState = state
        var appCommand: AppCommand?
            
        switch action {
        case .login:
            appState.interaction.isRequestLogin = true
            appCommand = ShowToastCommand(message: "Login_deprecated")
        case .loginFinished(let done):
            appState.interaction.isLogined = done
        case .oauthWeb:
            appState.interaction.isShowingOAuthWeb = true
        case .oauthWebFinished(let code):
            appCommand = AccessTokenCommand(code: code)
        case .accessTokenRequest:
            print("")
        case .accessTokenRequestDone:
            if appState.interaction.isShowingOAuthWeb {
                appState.interaction.isShowingOAuthWeb = false
                appCommand = UserInfoRequestCommand()
            }
        case .logout:
            appState.interaction.isLogined = false
        case .selectLanguage:
            appState.settings.actionSheetOffset = 0
        case .selectLanguageFinished:
            appState.settings.actionSheetOffset = ScreenH
        case .showToast(let message):
            appState.interaction.isShowingToast = true
            appState.interaction.toastMessage = message
            appState.interaction.isRequestLogin = false
        case .userStar(let name):
            appCommand = UserStarRequestCommand(name: name)
        case .requestEvents(let name, let page, let perPage):
            appCommand = UserEventDAOCommand(name: name, page: page, perPage: perPage)
        case .requestDynamic(let page):
            appState.interaction.isRequesting = true
            appCommand = UserRequestDynamicCommand(page: page)
        case .requestEventsDone(let events):
            appState.eventList.events = events
        }
        
        return (appState, appCommand)
    }
}
