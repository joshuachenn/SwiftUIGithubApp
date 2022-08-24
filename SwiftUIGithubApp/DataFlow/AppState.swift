//
//  AppState.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/27.
//

import Foundation
import Combine
import SimpleToast
import Moya


struct AppState {
    var settings = Settings()
    var interaction = UserInteraction()
    var eventList = EventList()
}


extension AppState {
    struct Settings {
        var actionSheetOffset = ScreenH
        var changer = SettingsChanger()
        
        class SettingsChanger {
            @Published var language = Language.en
            var languagePublisher: AnyPublisher<Language, Never> {
                return $language
                    .eraseToAnyPublisher()
            }
        }
    }
}

extension AppState {
    struct UserInteraction {
        var isShowingToast = false
        var isLoading = false
        var toastOptions = SimpleToastOptions(alignment: .center, hideAfter: 3)
        var toastMessage = ""
        var isShowingOAuthWeb = false
        
        var isLogined = false
        var isRequestLogin = false
        var isRequesting = false
        
    }
}

extension AppState {
    struct EventList {
        @FileStorage(directory: .cachesDirectory, fileName: "events.json")
        var events: [Event]?
        
        func getDisplayEvms() -> [EventViewModel] {
            print("getDisplayEvms \(events?.count ?? 0)")
            guard let events = events else {
                return []
            }
            var evms: [EventViewModel] = []
            for event in events {
                let evm = EventViewModel(event: event)
                evms.append(evm)
            }
            return evms
        }
    }
    
}

