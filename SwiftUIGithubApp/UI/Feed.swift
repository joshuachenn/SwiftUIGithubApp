//
//  Feed.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/27.
//

import SwiftUI

struct Feed: View {
    @EnvironmentObject var store: Store
    var body: some View {
        NavigationView {
            VStack {
                Text("Feed")
                    .navigationTitle(Text("动态"))
                Button {
                    store.dispatch(.logout)
                } label: {
                    Text("退出登录")
                }
            }

        }
        .navigationViewStyle(.stack)
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
