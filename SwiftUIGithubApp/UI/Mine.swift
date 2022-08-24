//
//  Mine.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/27.
//

import SwiftUI

struct Mine: View {
    var body: some View {
        NavigationView {
            Text("Mine")
                .navigationTitle(Text("我的"))
        }
        .navigationViewStyle(.stack)
    }
}

struct Mine_Previews: PreviewProvider {
    static var previews: some View {
        Mine()
    }
}
