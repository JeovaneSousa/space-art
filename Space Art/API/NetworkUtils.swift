//
//  NetworkUtils.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 06/02/23.
//

import Foundation

typealias ApiResult<T> = Result<T, ApiError>
typealias HttpResult<T> = Result<T, NetworkError>
typealias HttpHeader = [String: String]
typealias DataTaskResult = Result<Data, Error>

enum HttpMethod: String {
    case GET, POST, PUT, DELETE
}

extension HTTPURLResponse {
    var inSucessRange: Bool {
        self.statusCode >= 200 && self.statusCode < 300
    }
}

extension Result {
    init(error: Failure?, data: Success?) {
        
        if let error = error {
            self = .failure(error)
            return
        }
        
        if let data = data {
            self = .success(data)
            return
        }
        
        preconditionFailure("Unable to create Result.")
    }
}
