//
//  HomeView.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/28.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        TabView {
            DynamicView()
                .tabItem {
                    Image(systemName: "person.2.wave.2")
                    Text("dynamics")
                }
            Trend()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("trend")
                }
            Mine()
                .tabItem {
                    Image(systemName: "person")
                    Text("mine")
                }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    @Binding var store: Store
//    static var previews: some View {
//        HomeView(store: $store)
//    }
//}
