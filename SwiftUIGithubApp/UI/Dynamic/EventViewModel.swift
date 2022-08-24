//
//  EventViewModel.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/27.
//

import Foundation

struct EventViewModel: Identifiable {
    let event: Event
    
    var id: Int { Int(event.id ?? "0")! }
    
    private(set) var actionTime: String?
    private(set) var actionUserAvatar: URL?
    private(set) var actionDesc: String?
    private(set) var actionName: String?
    private(set) var actionUserName: String?
    
    init(event: Event) {
        self.event = event
        self.actionUserName = event.actor?.login
        self.actionTime = event.createdAt?.callTimeAfterNow()
        self.actionUserAvatar = URL(string: event.actor?.avatarUrl ?? "")
        let tuple = event.getActionAndDescription()
        self.actionName = tuple.0
        self.actionDesc = tuple.1
    }
    
    static func sample() -> Self {
        let actor = User(login: "N-Shar-ma", avatarUrl: "https://avatars.githubusercontent.com/u/68962290?")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: TimeZone.current.secondsFromGMT())
        let date = dateFormatter.date(from: "2022-07-26T07:47:34Z")
        
        let repo = Repo(id: 778899, name: "zulip/zulip")
        
        let event = Event(repo: repo, actor: actor, createdAt: date, type: "SampleEvent")
        
        return EventViewModel(event: event)
    }
}
