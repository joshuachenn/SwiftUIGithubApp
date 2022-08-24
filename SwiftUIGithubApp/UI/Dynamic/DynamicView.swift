//
//  DynamicView.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/31.
//

import SwiftUI

struct DynamicView: View {
    
    @EnvironmentObject var store: Store
    private var eventList: AppState.EventList {
        store.appState.eventList
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(eventList.getDisplayEvms()) { evm in
//                    ForEach(eventList.getDisplayEvms()) { evm in
//                        VStack {
                            NavigationLink(destination: Text(evm.actionUserName!)) {
                                EventItemView(evm: evm, needImage: true)
                            }
//                        }
//                    }
                }
                .listStyle(.plain)
                .refreshable {
                    store.dispatch(.requestDynamic(page: 1))
                }
                .onAppear {
                    if store.appState.eventList.events == nil || store.appState.eventList.events?.count == 0 {
                        print("request events")
                        store.dispatch(.requestDynamic(page: 1))
                    }
                }
                .navigationTitle("Dynamics")
            }
        }
    }
}

struct DynamicView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicView()
    }
}
