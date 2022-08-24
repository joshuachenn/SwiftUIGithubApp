//
//  CZHStringZh.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/27.
//

import Foundation

final class StringZh: StringBase {
    
    var welcomeMessage: String = "Welcome To SwiftUI Github App";
    
    var app_name: String = "CZHSwiftUI Github";

    var app_ok: String =  "确定";

    var app_cancel: String =  "取消";

    var app_empty: String =  "目前什么也没有哟";

    var app_licenses: String =  "协议";

    var app_close: String =  "关闭";

    var app_version: String =  "版本";

    var app_back_tip: String =  "确定要退出应用？";

    var app_not_new_version: String =  "当前没有新版本";

    var app_version_title: String =  "版本更新";

    var nothing_now: String =  "目前什么都没有。";

    var loading_text: String =  "努力加载中···";

    var option_web: String =  "浏览器打开";

    var option_copy: String =  "复制链接";

    var option_share: String =  "分享";

    var option_web_launcher_error: String =  "url异常";

    var option_share_title: String =  "分享自GSYGitHubFlutter： ";

    var option_share_copy_success: String =  "已经复制到粘贴板";

    var login_text: String =  "账号登录";

    var oauth_text: String =  "安全登陆";

    var Login_out: String =  "退出登录";

    var Login_deprecated: String =  "账号密码登陆的 API 将被 Github 弃用，请使用安全登陆。"

    var home_reply: String =  "问题反馈";

    var home_change_language: String =  "语言切换";

    var home_change_grey: String =  "灰度 App";

    var home_about: String =  "关于";

    var home_check_update: String =  "检测更新";

    var home_history: String =  "阅读历史";

    var home_user_info: String =  "个人信息";

    var home_change_theme: String =  "切换主题";

    var home_language_default: String =  "默认";

    var home_language_zh: String =  "中文";

    var home_language_en: String =  "English";

    var switch_language: String =  "切换语言";

    var home_theme_default: String =  "默认主题";

    var home_theme_1: String =  "主题1";

    var home_theme_2: String =  "主题2";

    var home_theme_3: String =  "主题3";

    var home_theme_4: String =  "主题4";

    var home_theme_5: String =  "主题5";

    var home_theme_6: String =  "主题6";

    var login_username_hint_text: String =  "github用户名，请不要用邮箱";

    var login_password_hint_text: String =  "请输入密码";

    var login_success: String =  "登录成功";

    var network_error_401: String =  "[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]";

    var network_error_403: String =  "403权限错误";

    var network_error_404: String =  "404错误";

    var network_error_422: String =  "请求实体异常，请确保 Github ClientId 、账号秘密等信息正确。";

    var network_error_timeout: String =  "请求超时";

    var network_error_unknown: String =  "其他异常";

    var network_error: String =  "网络错误";

    var github_refused: String =  "Github Api 出现异常[Connection refused]，建议换个网络环境或者稍后再试";

    var load_more_not: String =  "没有更多数据";

    var load_more_text: String =  "正在加载更多";

    var home_dynamic: String =  "动态";

    var home_trend: String =  "趋势";

    var home_my: String =  "我的";

    var trend_user_title: String =  "中国用户趋势";

    var trend_day: String =  "今日";

    var trend_week: String =  "本周";

    var trend_month: String =  "本月";

    var trend_all: String =  "全部";

    var user_tab_repos: String =  "仓库";

    var user_tab_fans: String =  "粉丝";

    var user_tab_focus: String =  "关注";

    var user_tab_star: String =  "星标";

    var user_tab_honor: String =  "荣耀";

    var user_dynamic_group: String =  "组织成员";

    var user_dynamic_title: String =  "个人动态";

    var user_focus: String =  "已关注";

    var user_un_focus: String =  "关注";

    var user_focus_no_support: String =  "不支持关注组织。";

    var user_create_at: String =  "创建于：";

    var user_orgs_title: String =  "所在组织";

    var repos_tab_readme: String =  "详情";

    var repos_tab_info: String =  "动态";

    var repos_tab_file: String =  "文件";

    var repos_tab_issue: String =  "ISSUE";

    var repos_tab_activity: String =  "动态";

    var repos_tab_commits: String =  "提交";

    var repos_tab_issue_all: String =  "所有";

    var repos_tab_issue_open: String =  "打开";

    var repos_tab_issue_closed: String =  "关闭";

    var repos_option_release: String =  "版本";

    var repos_option_branch: String =  "分支";

    var repos_fork_at: String =  "Fork于 ";

    var repos_create_at: String =  "创建于 ";

    var repos_last_commit: String =  "最后提交于 ";

    var repos_all_issue_count: String =  "所有Issue数：";

    var repos_open_issue_count: String =  "开启Issue数：";

    var repos_close_issue_count: String =  "关闭Issue数：";

    var repos_issue_search: String =  "搜索";

    var repos_no_support_issue: String =  "该项目没有开启 Issue";

    var issue_reply: String =  "回复";

    var issue_edit: String =  "编辑";

    var issue_open: String =  "打开";

    var issue_close: String =  "关闭";

    var issue_lock: String =  "锁定";

    var issue_unlock: String =  "解锁";

    var issue_reply_issue: String =  "回复Issue";

    var issue_commit_issue: String =  "提交Issue";

    var issue_edit_issue: String =  "编译Issue";

    var issue_edit_issue_commit: String =  "编译回复";

    var issue_edit_issue_edit_commit: String =  "编辑";

    var issue_edit_issue_delete_commit: String =  "删除";

    var issue_edit_issue_copy_commit: String =  "复制";

    var issue_edit_issue_content_not_be_null: String =  "内容不能为空";

    var issue_edit_issue_title_not_be_null: String =  "标题不能为空";

    var issue_edit_issue_title_tip: String =  "请输入标题";

    var issue_edit_issue_content_tip: String =  "请输入内容";

    var notify_title: String =  "通知";

    var notify_tab_all: String =  "所有";

    var notify_tab_part: String =  "参与";

    var notify_tab_unread: String =  "未读";

    var notify_unread: String =  "未读";

    var notify_readed: String =  "已读";

    var notify_status: String =  "状态";

    var notify_type: String =  "类型";

    var search_title: String =  "搜索";

    var search_tab_repos: String =  "仓库";

    var search_tab_user: String =  "用户";

    var release_tab_release: String =  "版本";

    var release_tab_tag: String =  "标记";

    var user_profile_name: String =  "名字";

    var user_profile_email: String =  "邮箱";

    var user_profile_link: String =  "链接";

    var user_profile_org: String =  "公司";

    var user_profile_location: String =  "位置";

    var user_profile_info: String =  "简介";

    var search_type: String =  "类型";

    var search_sort: String =  "排序";

    var search_language: String =  "语言";
}
