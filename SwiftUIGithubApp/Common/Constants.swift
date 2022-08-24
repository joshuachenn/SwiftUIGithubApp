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
    static let CLIENT_ID = ""
    static let CLIENT_SECRET = ""
    
    static let OAuthUrlString = "https://github.com/login/oauth/authorize?client_id=\(NetConfig.CLIENT_ID)&state=app&scope=user,repo,gist,notifications,read:org,workflow&redirect_uri=gsygithubapp://authed"
}
