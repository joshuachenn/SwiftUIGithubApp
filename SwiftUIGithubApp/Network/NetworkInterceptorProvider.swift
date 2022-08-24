//
//  NetworkInterceptorProvider.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/30.
//

import Foundation
import Apollo

//拦截器提供者
struct NetworkInterceptorProvider: InterceptorProvider {
    private let store: ApolloStore
    private let client: URLSessionClient
    
    init(store: ApolloStore, client: URLSessionClient) {
        self.store = store
        self.client = client
    }
    
    func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        return [
            MaxRetryInterceptor(), // 最大重试
            CacheReadInterceptor(store: store),
            // AddTokenInterceptor(), // custom interceptor
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(), // 对未成功执行的操作，检查GraphQL服务器响应的响应代码，传递给错误回调
            JSONResponseParsingInterceptor(cacheKeyForObject: store.cacheKeyForObject), // json解析为GraphQLResult对象，通过HTTPResponse回调出去
            AutomaticPersistedQueryInterceptor(), //
            // UserManagementInterceptor
            CacheWriteInterceptor(store: store) //将请求返回的数据写入ApolloiOS的缓存中
        ]
    }
}
