//
//  Trend.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/27.
//

import SwiftUI

struct Trend: View {
    var body: some View {
        NavigationView {
            Text("Trend")
                .navigationTitle(Text("趋势"))
        }
        .navigationViewStyle(.stack)
    }
}

struct Trend_Previews: PreviewProvider {
    static var previews: some View {
        Trend()
    }
}
