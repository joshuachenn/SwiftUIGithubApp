//
//  WebContent.swift
//  SwiftUIDemoApp
//
//  Created by Joshua on 2022/7/3.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
 
    var url: URL
    var store: Store?
    private var webView: WKWebView
    
    init(url: URL, store: Store?=nil) {
        self.url = url
        self.store = store
        webView = WKWebView()
    }
    
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        // Delegate methods go here
        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
            // alert functionality goes here
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            let redirectString = navigationAction.request.url?.absoluteString
            if redirectString?.starts(with: "gsygithubapp://authed") ?? false {
                print("redirectString \(redirectString!)")
                let code = navigationAction.request.url?.queryParameters["code"] ?? ""
                if code.count == 0 {
                    decisionHandler(.cancel)
                    return
                }
                // gsygithubapp://authed?code=6be3df607e0d7fa58515&state=app
                self.parent.store?.dispatch(.oauthWebFinished(code: String(code)))
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//            print("didStartProvisionalNavigation")
            self.parent.store?.appState.interaction.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//            print("didFinish navigation")
            self.parent.store?.appState.interaction.isLoading = false
        }
        
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        }
        
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
 
    func makeUIView(context: Context) -> WKWebView {
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        print("webView updateUIView")
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
    }
}

struct WebContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: WebView(url: URL(string: "www.baidu.com")!)) {
              Text("baidu")
            }
        }
    }
}

struct WebContentView_Previews: PreviewProvider {
    static var previews: some View {
        WebContentView()
    }
}
