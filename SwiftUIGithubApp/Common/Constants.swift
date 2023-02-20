//
//  Constants.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/4.
//

import UIKit

let ScreenW = UIScreen.main.bounds.size.width
let ScreenH = UIScreen.main.bounds.size.height

class NetConfig {
    static let CLIENT_ID = "2fd400b86d6c21408c17"
    static let CLIENT_SECRET = "872ae4de3ba08c199d0bffc5c5fe12f69403eecf"
    
    static let OAuthUrlString = "https://github.com/login/oauth/authorize?client_id=\(NetConfig.CLIENT_ID)&state=app&scope=user,repo,gist,notifications,read:org,workflow&redirect_uri=gsygithubapp://authed"
}
