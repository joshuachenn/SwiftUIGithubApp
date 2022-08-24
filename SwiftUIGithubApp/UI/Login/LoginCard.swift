//
//  LoginCard.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/4.
//

import SwiftUI

struct LoginCard: View {
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @EnvironmentObject var store: Store
    private var isShowingSheet: Binding<Bool> {
        $store.appState.interaction.isShowingOAuthWeb
    }
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 90, height: 90)
                .padding(.top, 30)
                
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                TextField("login_username_hint_text", text: $emailAddress)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                
            }
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            
            Divider()
            HStack {
                Image(systemName: "keyboard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                TextField("login_password_hint_text", text: $emailAddress)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                
            }
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            Divider()
            
            HStack {
                
                Button {
                    store.dispatch(.login)
                } label: {
                    Text("login_text")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity)
                }
                .background(.primary)
                .cornerRadius(5)
                
                Button {
                    store.dispatch(.oauthWeb)
                } label: {
                    Text("oauth_text")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity)
                }
                .background(.primary)
                .cornerRadius(5)
                .sheet(isPresented: isShowingSheet) {
                    WebView(url: URL(string: NetConfig.OAuthUrlString)!, store: store)
                        .overlay {
                            if store.appState.interaction.isLoading {
                                ScalingCircles()
                            }
                        }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
            
            Button {
                store.dispatch(.selectLanguage)
            } label: {
                Text("switch_language")
                    .foregroundColor(.gray)
            }
            .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
            
        }
        .background(.white)
        .cornerRadius(10)
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
    }
}

struct LoginCard_Previews: PreviewProvider {
    static var previews: some View {
        LoginCard()
    }
}
