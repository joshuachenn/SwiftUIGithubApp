//
//  Github.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/4.
//

import Foundation
import Moya

public enum GitHub {
    // oauth获取access_token
    case accessToken(String)
    // 获取授权  post
    case authorization
    // 搜索 get
    case search(String, String, String="best%20match", String="desc", Int=1, Int=20)
    //搜索topic tag
    case searchTopic(String)
    //用户的仓库 get
    case userRepos(String, String="pushed")
    //仓库详情 get
    case reposDetail(String, String)
    //仓库活动 get
    case reposEvent(String, String)
    //仓库Fork get
    case reposFork(String, String)
    //仓库Star get
    case reposStar(String, String)
    //仓库Watch get
    case reposWatcher(String, String)
    //仓库提交 get
    case reposCommits(String, String)
    //仓库提交详情 get
    case reposCommitsInfo(String, String, String)
    //仓库Issue get
    case reposIssue(String, String, String="all", String="created", String="desc")
    //仓release get
    case reposRelease(String, String)
    //仓Tag get
    case reposTag(String, String)
    //仓Contributors get
    case reposContributors(String, String)
    //仓库Issue评论 get
    case issueComment(String, String, Int)
    //仓库Issue get
    case issueInfo(String, String, String)
    //增加issue评论 post
    case addIssueComment(String, String, Int)
    //编辑issue put
    case editIssue(String, String, String)
    //锁定issue put
    case lockIssue(String, String, String)
    //创建issue post
    case createIssue(String, String)
    //搜索issue
    case repositoryIssueSearch(String)
    //编辑评论 patch, delete
    case editComment(String, String, String, Bool)
    //自己的star get
    case myStars(String="updated")
    //用户的star get
    case userStar(String, String?)
    //关注仓库 put
    case resolveStarRepos(String, String)
    //订阅仓库 put
    case resolveWatcherRepos(String, String)
    //仓库内容数据 get
    case reposData(String, String)
    //仓库路径下的内容 get
    case reposDataDir(String, String, String, String?="master")
    //README 文件地址 get
    case readmeFile(String, String?)
    //我的用户信息 GET
    case myUserInfo
    //用户信息 get
    case userInfo(String)
    // get 是否关注
    case isFollow(String)
    //用户关注 get
    case userFollows(String)
    //我的关注者 get
    case myFollowers
    //用户的关注者 get
    case userFollowers(String)
    //create fork post
    case createFork(String, String)
    //branch get
    case branches(String, String)
    //fork get
    case forker(String, String, String)
    //readme get
    case getReadme(String, String)
    //用户收到的事件信息 get
    case requestEvents(String, Int?=1, Int?=20)
    //用户相关的事件信息 get
    case getEvent(String)
    //组织成员
    case getMembers(String)
    //获取用户组织
    case getUserOrgs(String)
    //通知 get
    case getNoification(Bool=false, Bool=false)
    //patch
    case setNotificationAsRead(String)
    //put
    case setAllNotificationAsRead
}

extension GitHub: TargetType {
    
    public var method: Moya.Method {
        switch self {
        case .editComment(_, _, _, let isDelete):
            return isDelete ? .delete : .patch
        case .authorization, .addIssueComment, .createIssue, .createFork, .accessToken:
            return .post
        case .setNotificationAsRead:
            return .patch
        case .editIssue, .lockIssue, .resolveStarRepos, .resolveWatcherRepos, .setAllNotificationAsRead:
            return .put
        default:
            return .get
        }
    }
    
    
    
    public var headers: [String: String]? {
        let token = LocalStorage<String>.get(key: Config.TOKEN_KEY)
        switch self {
        case .accessToken:
            return nil
        default:
            if let token = token {
                return ["Authorization": token]
            }
        }
        return nil
    }
    
    public var task: Task {
        switch self {
        case .accessToken(let code):
            return .requestParameters(parameters: ["client_id": NetConfig.CLIENT_ID,
                                                   "client_secret":NetConfig.CLIENT_SECRET,
                                                   "code":code],
                                      encoding: URLEncoding.default)
        case .search(let type, let q, let sort, let order, let page, let pageSize):
            let params: [String:Any]
            if type == "user" {
                params = ["q": q, "page": page, "perpage": pageSize]
            } else {
                params = ["q": q, "sort": sort, "order": order, "page": page, "perpage": pageSize]
            }
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .userStar(_, let sort):
            let params: [String : Any] = ["sort": sort ?? "updated", "per_page": 1]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .requestEvents(_, let page, let perPage):
            let params: [String : Any] = ["page": page!, "per_page": perPage!]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var baseURL: URL {
        switch self {
        case .accessToken:
            return URL(string: Address.hostWeb)!
        default:
            return URL(string: Address.host)!
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
            case .accessToken:
                //return MyURLEncoding.queryString
                return URLEncoding.queryString
            default:
                return JSONEncoding.default
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .accessToken:
            return .bearer
        default:
            return .bearer
        }
    }
    
    public var path: String {
        switch self {
        case .accessToken:
            return "login/oauth/access_token"
        case .authorization:
            return "authorizations"
        case .search(let type, _, _, _, _, _):
            if type == "user" {
                return "search/users"
            }
            return "search/repositories"
        case .searchTopic(let topic):
            return "search/repositories?q=topic:\(topic)&sort=stars&order=desc"
        case .userRepos(let userName, let sort):
            return "users/\(userName)/repos?sort=\(sort)"
        case .reposDetail(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName))"
        case .reposEvent(let reposOwner, let reposName):
            return"networks/\(reposOwner)\(reposName))"
        case .reposFork(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/forks"
        case .reposStar(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/stargazers"
        case .reposWatcher(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/subscribers"
        case .reposCommits(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/commits"
        case .reposCommitsInfo(let reposOwner, let reposName, let sha):
            return "repos/\(reposOwner)/\(reposName)/commits/\(sha)"
        case .reposIssue(let reposOwner, let reposName, let state, let sort, let direction):
            return "repos/\(reposOwner)/\(reposName)/issues?state=\(state)&sort=\(sort)&direction=\(direction)"
        case .reposRelease(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/releases"
        case .reposTag(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/tags"
        case .reposContributors(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/contributors"
        case .issueComment(let reposOwner, let reposName, let issueNumber):
            return "repos/\(reposOwner)/\(reposName)/issues/\(issueNumber)/comments"
        case .issueInfo(let reposOwner, let reposName, let issueNumber):
            return "repos/\(reposOwner)/\(reposName)/issues/\(issueNumber)"
        case .addIssueComment(let reposOwner, let reposName, let issueNumber):
            return "repos/\(reposOwner)/\(reposName)/issues/\(issueNumber)/comments"
        case .editIssue(let reposOwner, let reposName, let issueNumber):
            return "repos/\(reposOwner)/\(reposName)/issues/\(issueNumber)"
        case .lockIssue(let reposOwner, let reposName, let issueNumber):
            return "repos/\(reposOwner)/\(reposName)/issues/\(issueNumber)/lock"
        case .createIssue(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/issues"
        case .repositoryIssueSearch(let q):
            return "search/issues?q=\(q)"
        case .editComment(let reposOwner, let reposName, let commentId, _):
            return "repos/\(reposOwner)/\(reposName)/issues/comments/\(commentId)"
        case .myStars(let sort):
            return "users/starred?sort=\(sort)"
        case .userStar(let userName, _):
            return "users/\(userName)/starred"
        case .resolveStarRepos(let reposOwner, let repos):
            return "user/starred/\(reposOwner)/\(repos)"
        case .resolveWatcherRepos(let reposOwner, let repos):
            return "user/subscriptions/\(reposOwner)/\(repos)"
        case .reposData(let reposOwner, let repos):
            return "repos/\(reposOwner)/\(repos)/contents"
        case .reposDataDir(let reposOwner, let repos, let path, let branch):
            if let brch = branch {
                return "repos/\(reposOwner)/\(repos)/contents/\(path)?ref=\(brch)"
            }
            return "repos/\(reposOwner)/\(repos)/contents/\(path)"
        case .readmeFile(let reposFullName, let curBranch):
            if let curBranch = curBranch {
                return "repos/\(reposFullName)/readme?ref=\(curBranch)"
            }
            return "repos/\(reposFullName)/readme"
        case .myUserInfo:
            return "user"
        case .userInfo(let userName):
            return "user/\(userName)"
        case .isFollow(let name):
            return "user/following/\(name)"
        case .userFollows(let userName):
            return "users/\(userName)/following"
        case .myFollowers:
            return "user/followers"
        case .userFollowers(let userName):
            return "users/\(userName)/followers"
        case .createFork(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/forks"
        case .branches(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/branches"
        case .forker(let reposOwner, let reposName, let sort):
            return "repos/\(reposOwner)/\(reposName)/fork?sort=\(sort)"
        case .getReadme(let reposOwner, let reposName):
            return "repos/\(reposOwner)/\(reposName)/readme"
        case .requestEvents(let userName, _, _):
            return "users/\(userName)/received_events"
        case .getEvent(let userName):
            return "users/\(userName)/events"
        case .getMembers(let orgs):
            return "orgs/\(orgs)/members"
        case .getUserOrgs(let userName):
            return "users/\(userName)/orgs"
        case .getNoification(let isAll, let participating):
            if !isAll && !participating {
                return "notifications"
            }
            return "notifications?all=\(isAll)&participating=\(participating)"
        case .setNotificationAsRead(let threadId):
            return "notifications/threads/\(threadId)"
        case .setAllNotificationAsRead:
            return "notifications"
        }
    }
}

private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

let AccessTokenPlugins = AccessTokenPlugin { _ in
    let token = LocalStorage<String>.get(key: Config.TOKEN_KEY)
    return token ?? ""
}


let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request: URLRequest = try endpoint.urlRequest()
        request.httpShouldHandleCookies = true
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}


let gitHubProvider = MoyaProvider<GitHub>(requestClosure: requestClosure, plugins:
                                            [NetworkLoggerPlugin(
                                                configuration: .init(formatter:
                                                        .init(responseData: JSONResponseDataFormatter),
                                                                     logOptions: .verbose)), AccessTokenPlugins])
