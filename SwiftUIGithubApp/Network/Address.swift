//
//  Address.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/4.
//

import Foundation

enum Address {
    
    static let host = "https://api.github.com/"
    static let hostWeb = "https://github.com/"
    static let graphicHost = "https://ghchart.rshah.org/"
    static let updateUrl = "https://gitee.com/CarGuo/GSYGithubAppFlutter/releases"
    
    static let OAuth = "https://github.com/login/oauth/authorize?client_id=\(NetConfig.CLIENT_ID)&state=app&scope=user,repo,gist,notifications,read:org,workflow&redirect_uri=gsygithubapp://authed"
}
