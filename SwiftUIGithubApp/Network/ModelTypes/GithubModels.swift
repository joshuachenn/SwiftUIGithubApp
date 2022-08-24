//
//  Repository.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/26.
//

import Foundation

struct User: Codable {
    var login: String? = nil
    var id: Int? = nil
    var nodeId: String? = nil
    var avatarUrl: String? = nil
    var gravatarId: String? = nil
    var url: String? = nil
    var htmlUrl: String? = nil
    var followersUrl: String? = nil
    var followingUrl: String? = nil
    var gistsUrl: String? = nil
    var starredUrl: String? = nil
    var subscriptionsUrl: String? = nil
    var organizationsUrl: String? = nil
    var reposUrl: String? = nil
    var eventsUrl: String? = nil
    var receivedEventsUrl: String? = nil
    var type: String? = nil
    var siteAdmin: Bool? = nil
    var name: String? = nil
    var company: String? = nil
    var blog: String? = nil
    var location: String? = nil
    var email: String? = nil
    var starred: String? = "---"
    var bio: String? = nil
    var publicRepos: Int? = nil
    var publicGists: Int? = nil
    var followers: Int? = nil
    var following: Int? = nil
    var createdAt: Date? = nil
    var updatedAt: Date? = nil
    var privateGists: Int? = nil
    var totalPrivateRepos: Int? = nil
    var ownedPrivateRepos: Int? = nil
    var diskUsage: Int? = nil
    var collaborators: Int? = nil
    var twoFactorAuthentication: Bool? = nil
}



struct Repo: Codable {
    var id: Int? = nil
    var name: String? = nil
    var url: String? = nil
}

struct Reactions: Codable {
    var hooray: Int? = nil
    var rocket: Int? = nil
    var laugh: Int? = nil
    var heart: Int? = nil
    var confused: Int? = nil
    var eyes: Int? = nil
    var totalgetObjectount: Int? = nil
    var minusOne: Int? = nil
    var plusOne: Int? = nil
    
    enum CodingKeys: String, CodingKey {
        case hooray, rocket, laugh, heart, confused, eyes, totalgetObjectount
        case minusOne = "-1"
        case plusOne = "+1"
    }
}

struct Orgnization: Codable {
    var id: Int? = nil
    var login: String? = nil
    var avatarUrl: String? = nil
    var url: String? = nil
    var gravatarId: String? = nil
}

struct HrefLink: Codable {
    var href: String? = nil
}

struct Links: Codable {
    var pullRequest: HrefLink? = nil
    var html: HrefLink? = nil
    var `self`: HrefLink? = nil
    var comments: HrefLink? = nil
    var reviewgetObjectomment: HrefLink? = nil
    var commits: HrefLink? = nil
    var statuses: HrefLink? = nil
    var issue: HrefLink? = nil
    var reviewgetObjectomments: HrefLink? = nil
}

struct License: Codable {
    var nodeId: String? = nil
    var key: String? = nil
    var spdxId: String? = nil
    var name: String? = nil
    var url: String? = nil
}

struct Comment: Codable {
    var startSide: String? = nil
    var originalgetObjectommitId: String? = nil
    var inReplyToId: Int? = nil
    var position: Int? = nil
    var url: String? = nil
    var reactions: Reactions? = nil
    var side: String? = nil
    var updatedAt: Date? = nil
    var path: String? = nil
    var pullRequestReviewId: Int? = nil
    var body: String? = nil
    var id: Int? = nil
    var user: User? = nil
    var line: Int? = nil
    var pullRequestUrl: String? = nil
    var originalLine: Int? = nil
    var originalStartLine: Int? = nil
    var diffHunk: String? = nil
    var _links: Links? = nil
    var commitId: String? = nil
    var nodeId: String? = nil
    var createdAt: Date? = nil
    var authorAssociation: String? = nil
    var startLine: Int? = nil
    var htmlUrl: String? = nil
}

struct Repository: Codable {
    var keysUrl: String? = nil
    var statusesUrl: String? = nil
    var issuesUrl: String? = nil
    var license: License? = nil
    var issueEventsUrl: String? = nil
    var hasProjects: Bool? = nil
    var id: Int? = nil
    var allowForking: Bool? = nil
    var owner: User? = nil
    var visibility: String? = nil
    var defaultBranch: String? = nil
    var eventsUrl: String? = nil
    var subscriptionUrl: String? = nil
    var watchers: Int? = nil
    var gitgetObjectommitsUrl: String? = nil
    var subscribersUrl: String? = nil
    var cloneUrl: String? = nil
    
    var hasWiki: Bool? = nil
    var url:String? = nil
    var fork: Bool? = nil
    var notificationsUrl: String? = nil
    var description: String? = nil
    var collaboratorsUrl: String? = nil
    var deploymentsUrl: String? = nil
    var archived: Bool? = nil
    var topics: [String]? = nil
    var languagesUrl: String? = nil
    var hasIssues: Bool? = nil
    var commentsUrl: String? = nil
    var isTemplate: Bool? = nil
    var `private`: Bool? = nil
    var size: Int? = nil
    var gitTagsUrl: String? = nil
    var updatedAt: Date? = nil
    var sshUrl: String? = nil
    var name: String? = nil
    var webgetObjectommitSignoffRequired: Bool? = nil
    var contentsUrl: String? = nil
    var archiveUrl: String? = nil
    var milestonesUrl: String? = nil
    var blobsUrl: String? = nil
    var nodeId: String? = nil
    var contributorsUrl: String? = nil
    var openIssuesgetObjectount: Int? = nil
    var forksgetObjectount: Int? = nil
    var treesUrl: String? = nil
    var svnUrl: String? = nil
    var commitsUrl: String? = nil
    var createdAt: Date? = nil
    var forksUrl: String? = nil
    var hasDownloads: Bool? = nil
    var mirrorUrl: String? = nil
    var homepage: String? = nil
    var teamsUrl: String? = nil
    var branchesUrl: String? = nil
    var disabled: Bool? = nil
    var issuegetObjectommentUrl: String? = nil
    var mergesUrl: String? = nil
    var gitRefsUrl: String? = nil
    var gitUrl: String? = nil
    var forks: Int? = nil
    var openIssues: Int? = nil
    var hooksUrl: String? = nil
    var htmlUrl: String? = nil
    var stargazersUrl: String? = nil
    var assigneesUrl: String? = nil
    var compareUrl: String? = nil
    var fullName: String? = nil
    var tagsUrl: String? = nil
    var releasesUrl: String? = nil
    var pushedAt: Date? = nil
    var labelsUrl: String? = nil
    var downloadsUrl: String? = nil
    var stargazersgetObjectount: Int? = nil
    var watchersgetObjectount: Int? = nil
    var language: String? = nil
    var hasPages: Bool? = nil
}

struct BranchInfo: Codable {
    var sha: String? = nil
    var label: String? = nil
    var user: User? = nil
    var repo: Repository? = nil
    var ref: String? = nil
}

struct Label: Codable {
    var `default`: Bool? = nil
    var color: String? = nil
    var id: Int? = nil
    var nodeId: String? = nil
    var description: String? = nil
    var name: String? = nil
    var url: String? = nil
}

struct PullRequest: Codable {
    var head: BranchInfo? = nil
    var patchUrl: String? = nil
    var id: Int? = nil
    var createdAt: Date? = nil
    var activeLockReason: String? = nil
    var state: String? = nil
    var requestedTeams: [User]? = nil
    var body: String? = nil
    var autoMerge: Bool? = nil
    var htmlUrl: String? = nil
    var nodeId: String? = nil
    var url: String? = nil
    var locked: Bool? = nil
    var labels: [Label]? = nil
    var number: Int? = nil
    var commentsUrl: String? = nil
    var user: User? = nil
    var requestedReviewers: [User]? = nil
    var reviewgetObjectommentUrl: String? = nil
    var _links: Links? = nil
    var assignee: User? = nil
    var issueUrl: String? = nil
    var diffUrl: String? = nil
    var commitsUrl: String? = nil
    var mergegetObjectommitSha: String? = nil
    var milestone: String? = nil
    var mergedAt: Date? = nil
    var base: BranchInfo? = nil
    var updatedAt: Date? = nil
    var draft: Bool? = nil
    var assignees: [User]? = nil
    var title: String? = nil
    var statusesUrl: String? = nil
    var closedAt: Date? = nil
    var reviewgetObjectommentsUrl: String? = nil
}

struct Release: Codable {
    var id: Int? = nil
    var tagName: String? = nil
    var targetCommitish: String? = nil
    var name: String? = nil
    var body: String? = nil
    var bodyHtml: String? = nil
    var tarballUrl: String? = nil
    var zipballUrl: String? = nil
    var draft: Bool? = nil
    var prerelease: Bool? = nil
    var createdAt: Date? = nil
    var publishedAt: Date? = nil
    var author: User? = nil
    
}

struct PushEventCommit: Codable {
    var sha: String? = nil
    var author: User? = nil
    var message: String? = nil
    var distinct: Bool? = nil
    var url: String? = nil
}


struct Payload: Codable {
    var comment: Comment? = nil
    var action: String? = nil
    var pullRequest: PullRequest? = nil
    var issue: PullRequest? = nil
    var pushId: Int? = nil
    var size: Int? = nil
    var distinctSize: Int? = nil
    var ref: String? = nil
    var head: String? = nil
    var before: String? = nil
    var refType: String? = nil
    var description: String? = nil
    var pusherType: String? = nil
    var release: Release? = nil
    var commits: [PushEventCommit]? = nil
}

struct Event: Codable {
    var repo: Repo? = nil
    var actor: User? = nil
    var `public`: Bool? = nil
    var id: String? = nil
    var createdAt: Date? = nil
    var org: Orgnization? = nil
    var payload: Payload? = nil
    var type: String? = nil
    
    enum `Type` {
        case CommitCommentEvent
        case CreateEvent
        case DeleteEvent
        case ForkEvent
        case GollumEvent
        case InstallationEvent
        case InstallationRepositoriesEvent
        case IssueCommentEvent
        case IssuesEvent
        case MarketplacePurchaseEvent
        case MemberEvent
        case OrgBlockEvent
        case ProjectCardEvent
        case ProjectColumnEvent
        case PublicEvent
        case PullRequestEvent
        case PullRequestReviewEvent
        case ReleaseEvent
        case WatchEvent
        case SampleEvent
        
        var description: String {
            "\(self)"
        }
    }
}

extension Event {
    // 返回Action 和 Des 的元组
    // 事件描述与动作
    func getActionAndDescription() -> (String, String) {
        var action: String = ""
        var desc: String = ""
        
        switch self.type {
        case "CommitCommentEvent":
            action = "Commit comment at " + (self.repo?.name ?? "")
        case "CreateEvent":
           if (self.payload!.refType == "repository") {
             action = "Created repository " + (self.repo?.name ?? "")
           } else {
             action = "Created " +
                self.payload!.refType! +
                self.payload!.ref! +
                " at " +
                self.repo!.name!
           }
        case "DeleteEvent":
            action = "Delete " +
                self.payload!.refType! +
                self.payload!.ref! +
                " at " +
                (self.repo?.name ?? "")
        case "ForkEvent":
            let originRepo = (self.repo?.name ?? "")
            let newRepo = self.actor!.login! + "/" + (self.repo?.name ?? "")
            action = "Forked " + originRepo + " to " + newRepo
        case "GollumEvent":
            action = self.actor!.login! + " a wiki page "
        case "InstallationEvent":
            action = self.payload!.action! + " an Github App "
        case "InstallationRepositoriesEvent":
            action = self.payload!.action! + " repository from an installation "
        case "IssueCommentEvent":
            action = self.payload!.action! +
                        " comment on issue " +
                        String(self.payload!.issue!.number!) +
                        " in " +
                        (self.repo?.name ?? "")
            desc = self.payload!.comment!.body!
        case "IssuesEvent":
            action = self.payload!.action! +
                        " issue " +
                        String(self.payload!.issue!.number!) +
                        " in " +
                        (self.repo?.name ?? "")
            desc = self.payload!.issue!.title!;
        case "MarketplacePurchaseEvent":
            action = self.payload!.action! + " marketplace plan "
        case "MemberEvent":
            action = self.payload!.action! + " member to " + self.repo!.name!
        case "OrgBlockEvent":
            action = self.payload!.action! + " a user "
        case "ProjectCardEvent", "ProjectColumnEvent":
            action = self.payload!.action! + " a project "
        case "PublicEvent":
            action = "Made " + self.repo!.name! + " public"
        case "PullRequestEvent":
            action = self.payload!.action! + " pull request " + self.repo!.name!
        case "PullRequestReviewEvent":
            action = self.payload!.action! + " pull request review at" + self.repo!.name!
        case "PullRequestReviewCommentEvent":
            action = self.payload!.action! +
            " pull request review comment at" +
            self.repo!.name!
        case "PushEvent":
            var ref = self.payload!.ref!
            ref = ref.substring(from: ref.index(ref.lastIndex(of: "/")!, offsetBy: 1))
            action = "Push to " + ref + " at " + self.repo!.name!
            
            var descSpan = ""
            let commits = self.payload!.commits!
            let count = commits.count
            let maxLines = 4
            let max = count > maxLines ? maxLines - 1 : count
            for i in 0..<max {
                let commit = commits[i]
                if i != 0 {
                    descSpan += "\n"
                }
                let sha = commit.sha!.subString(in: 0..<7)
                descSpan += sha
                descSpan += " "
                descSpan += commit.message!
            }
            
            if count > maxLines {
                descSpan = descSpan + "\n" + "..."
            }
            
        case "ReleaseEvent":
            action = self.payload!.action! +
                        " release " +
                        self.payload!.release!.tagName! +
                        " at " +
                        self.repo!.name!
            
        case "WatchEvent":
            action = self.payload!.action! + " " + self.repo!.name!
            
        case "SampleEvent":
            action = "This is a Sample Event:"  + self.repo!.name!
            desc = "IIts not clear how to use customize bootstrap 5 RTL , I read the documentation on bootstrap & RTLCSS but it is still not clearcustomize bootstrap 5 RTL , I read the documentation on bootstrap & RTLCSS but it is still not clea"
        default:
            action = ""
            desc = ""
        }
        
        return (action, desc)
    }
}

