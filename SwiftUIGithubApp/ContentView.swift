//
//  ContentView.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/27.
//

import SwiftUI
import SimpleToast

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    private var isShowingBinding: Binding<Bool> {
        $store.appState.interaction.isShowingToast
    }
    
    var body: some View {
        ZStack {
            if store.appState.interaction.isLogined {
                HomeView()
                    .onDisappear {
                        print("Main Tab onDisappear")
                    }

            } else {
                Login()
                    .onDisappear {
                        print("Login Tab onDisappear")
                    }
                
            }
        }
        .environment(\.locale, .init(identifier: store.appState.settings.changer.language.text))
        .simpleToast(isPresented: isShowingBinding, options: store.appState.interaction.toastOptions) {
            HStack {
                Image(systemName: "exclamationmark.triangle")
                Text(store.appState.interaction.toastMessage)
            }
            .padding()
            .background(Color.black.opacity(0.8))
            .foregroundColor(Color.white)
            .cornerRadius(10)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
