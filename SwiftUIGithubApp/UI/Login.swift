//
//  Login.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/30.
//

import SwiftUI

struct Login: View {
    var body: some View {
        ZStack {
            AnimatableGradients()
            ParticlesView()
                .ignoresSafeArea()
            LoginCard()
                .keyboardAdaptive()
            ActionSheet()
                .animation(.default)
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
