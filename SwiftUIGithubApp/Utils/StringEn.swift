//
//  StringEn.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/28.
//

import Foundation

final class StringEn: StringBase {
    
    var welcomeMessage: String =  "Welcome To SwiftUI Github App";

    var app_name: String =  "CZHSwiftUIGithubApp";

    var app_ok: String =  "ok";

    var app_cancel: String =  "cancel";

    var app_empty: String =  "Empty(oﾟ▽ﾟ)o";

    var app_licenses: String =  "licenses";

    var app_close: String =  "close";

    var app_version: String =  "version";

    var app_back_tip: String =  "Exit？";

    var app_not_new_version: String =  "No new version.";

    var app_version_title: String =  "Update Version";

    var nothing_now: String =  "Nothing";

    var loading_text: String =  "Loading···";

    var option_web: String =  "browser";

    var option_copy: String =  "copy";

    var option_share: String =  "share";

    var option_web_launcher_error: String =  "url error";

    var option_share_title: String =  "share form GSYGitHubFlutter： ";

    var option_share_copy_success: String =  "Copy Success";

    var login_text: String =  "Login";

    var oauth_text: String =  "OAuth";

    var Login_out: String =  "Logout";

    var Login_deprecated: String =  "The API via password authentication will remove on November 13, 2020 by Github";

    var home_reply: String =  "Feedback";

    var home_change_language: String =  "Language";

    var home_change_grey: String =  "Grey App";

    var home_about: String =  "About";

    var home_check_update: String =  "CheckUpdate";

    var home_history: String =  "History";

    var home_user_info: String =  "Profile";

    var home_change_theme: String =  "Theme";

    var home_language_default: String =  "Default";

    var home_language_zh: String =  "中文";

    var home_language_en: String =  "English";

    var switch_language: String =  "select language";

    var home_theme_default: String =  "Default";

    var home_theme_1: String =  "Theme1";

    var home_theme_2: String =  "Theme2";

    var home_theme_3: String =  "Theme3";

    var home_theme_4: String =  "Theme4";

    var home_theme_5: String =  "Theme5";

    var home_theme_6: String =  "Theme6";

    var login_username_hint_text: String =  "username";

    var login_password_hint_text: String =  "password";

    var login_success: String =  "Login Success";

    var network_error_401: String =  "Http 401";

    var network_error_403: String =  "Http 403";

    var network_error_404: String =  "Http 404";

    var network_error_422: String =  "Request Body Error，Please Check Github ClientId or Account/PW";

    var network_error_timeout: String =  "Http timeout";

    var network_error_unknown: String =  "Http unknown error";

    var network_error: String =  "network error";

    var github_refused: String =  "Github Api Error[OS Error: Connection refused]. Please switch networks or try again later ";

    var load_more_not: String =  "nothing";

    var load_more_text: String =  "loading";

    var home_dynamic: String =  "Dynamic";

    var home_trend: String =  "Trend";

    var home_my: String =  "My";

    var trend_user_title: String =  "China User Trend";

    var trend_day: String =  "today";

    var trend_week: String =  "week";

    var trend_month: String =  "month";

    var trend_all: String =  "all";

    var user_tab_repos: String =  "repos";

    var user_tab_fans: String =  "fan";

    var user_tab_focus: String =  "focus";

    var user_tab_star: String =  "star";

    var user_tab_honor: String =  "honor";

    var user_dynamic_group: String =  "Members;";

    var user_dynamic_title: String =  "Dynamic";

    var user_focus: String =  "Focused";

    var user_un_focus: String =  "Focus";

    var user_focus_no_support: String =  "Not Support。";

    var user_create_at: String =  "Create at：";

    var user_orgs_title: String =  "organization";

    var repos_tab_readme: String =  "readme";

    var repos_tab_info: String =  "info";

    var repos_tab_file: String =  "file";

    var repos_tab_issue: String =  "issue";

    var repos_tab_activity: String =  "activity";

    var repos_tab_commits: String =  "commits";

    var repos_tab_issue_all: String =  "all";

    var repos_tab_issue_open: String =  "open";

    var repos_tab_issue_closed: String =  "close";

    var repos_option_release: String =  "release";

    var repos_option_branch: String =  "branch";

    var repos_fork_at: String =  "Fork at ";

    var repos_create_at: String =  "create at ";

    var repos_last_commit: String =  "last commit at ";

    var repos_all_issue_count: String =  "all Issue：";

    var repos_open_issue_count: String =  "open Issue：";

    var repos_close_issue_count: String =  "close Issue：";

    var repos_issue_search: String =  "Search";

    var repos_no_support_issue: String =  "No Supprot Issue";

    var issue_reply: String =  "reply";

    var issue_edit: String =  "edit";

    var issue_open: String =  "open";

    var issue_close: String =  "close";

    var issue_lock: String =  "lock";

    var issue_unlock: String =  "unlock";

    var issue_reply_issue: String =  "reply Issue";

    var issue_commit_issue: String =  "commit Issue";

    var issue_edit_issue: String =  "edit issue";

    var issue_edit_issue_commit: String =  "edit reply";

    var issue_edit_issue_edit_commit: String =  "Edit";

    var issue_edit_issue_delete_commit: String =  "Delete";

    var issue_edit_issue_copy_commit: String =  "Copy";

    var issue_edit_issue_content_not_be_null: String =  "Could't not be empty";

    var issue_edit_issue_title_not_be_null: String =  "Could't not be empty";

    var issue_edit_issue_title_tip: String =  "please input title";

    var issue_edit_issue_content_tip: String =  "please input content";

    var notify_title: String =  "Notify";

    var notify_tab_all: String =  "all";

    var notify_tab_part: String =  "part";

    var notify_tab_unread: String =  "unread";

    var notify_unread: String =  "unread";

    var notify_readed: String =  "read";

    var notify_status: String =  "status";

    var notify_type: String =  "type";

    var search_title: String =  "Search";

    var search_tab_repos: String =  "Repos";

    var search_tab_user: String =  "User";

    var release_tab_release: String =  "Release";

    var release_tab_tag: String =  "Tag";

    var user_profile_name: String =  "name";

    var user_profile_email: String =  "email";

    var user_profile_link: String =  "link";

    var user_profile_org: String =  "company";

    var user_profile_location: String =  "location";

    var user_profile_info: String =  "info";

    var search_type: String =  "type";

    var search_sort: String =  "sort";

    var search_language: String =  "language";


}
