//
//  HttpRequest.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 05/02/23.
//
import UIKit


import Foundation

class HttpRequest {
    
    let count = 10
    let apiKey = "dcmmmySJyGWkzZaooad3ZmrKkuOYiVdaDwFKc5R7"
    var session: URLSession
    var dataTask: URLSessionDataTask?
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func execute<T:Codable>(method: HttpMethod = .GET,
                            body: Codable? = nil,
                            header: HttpHeader? = nil,
                            decoder: JSONDecoder = .init(),
                            encoder: JSONEncoder = .init(),
                            completionHandler: @escaping (HttpResult<T>) -> Void) {
                              
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)&count=\(count)") else {
            preconditionFailure("Unable to create Url.")
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if let headers = header {
            headers.forEach{request.setValue($0.value, forHTTPHeaderField: $0.key)}
        }
        
        if let body = body {
            do {
                let httpBody = try encoder.encode(body)
                request.httpBody = httpBody
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
            } catch let error {
                let contextError = NetworkError.InvalidData(error)
                completionHandler(.failure(.UnableToPerformRequest(contextError)))
                return
            }
        }
        dataTask?.cancel()
        
        dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            
            defer {
                self?.dataTask = nil
            }
            
            let result: HttpResult<T> = DataTaskResult(error: error, data: data)
                .mapError { return NetworkError.UnableToPerformRequest($0)}
                .flatMap {data in return Result { try decoder.decode(T.self, from: data) }}
                .flatMapError { error in
                    if let error = error as? NetworkError {
                        return .failure(.UnableToPerformRequest(error))
                    }
                    
                    if let response = response as? HTTPURLResponse, !response.inSucessRange {
                        return .failure(.RequestFailed(response.statusCode))
                    }
                    
                    return .failure(.InvalidData(error))
                }
            
            completionHandler(result)
            
        }
        dataTask?.resume()
    }
        
}




enum NetworkError: Error, LocalizedError {
    case UnableToPerformRequest(Error)
    case RequestFailed(Int)
    case InvalidData(Error)
    
    var errorMessage: String {
        switch self {
        case .UnableToPerformRequest(let error): return "Unable to perform the request: \(error.localizedDescription)"
        case .RequestFailed(let statusCode): return "Request failed. The response code was: \(statusCode)"
        case .InvalidData(let error): return "Unable to parse. Resulted in the following error: \(error.localizedDescription)"
        }
    }
}
