//
//  SwiftUIGithubAppApp.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/27.
//

import SwiftUI

@main
struct SwiftUIGithubAppApp: App {
    private let store = Store()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
            
        }
    }
}
