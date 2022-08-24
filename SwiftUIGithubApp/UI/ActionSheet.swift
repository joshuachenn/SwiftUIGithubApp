//
//  ActionSheet.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/5.
//

import SwiftUI

struct ActionSheet: View {
    @EnvironmentObject var store: Store
    var body: some View {
        VStack{
            Spacer()
            CustomActionSheet()
                .offset(y: store.appState.settings.actionSheetOffset)
                .gesture(DragGesture()
                .onChanged({ (value) in
                    if value.translation.height > 0 {
                        store.appState.settings.actionSheetOffset = value.location.y
                    }
                })
                .onEnded({ (value) in
                    if  store.appState.settings.actionSheetOffset > 100 {
                        store.appState.settings.actionSheetOffset = UIScreen.main.bounds.height
                    }
                    else{
                        store.appState.settings.actionSheetOffset = 0
                    }
                })
            )
        }.background(( store.appState.settings.actionSheetOffset <= 100 ? Color(UIColor.label).opacity(0.3) : Color.clear).edgesIgnoringSafeArea(.all)
            .onTapGesture {
                store.appState.settings.actionSheetOffset = ScreenH
            
        })
        .edgesIgnoringSafeArea(.bottom)
    }
}

