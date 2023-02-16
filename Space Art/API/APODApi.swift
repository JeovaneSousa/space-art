//
//  APODApi.swift
//  Space Art
//
//  Created by jeovane.barbosa on 29/12/22.
//

import Foundation

class APODApi {
    
    let httpRequest: HttpRequest
    
    init(httpRequest: HttpRequest = .init()) {
        self.httpRequest = httpRequest
    }
    
    func getPhotos(mainQueue: DispatchQueue = .main,
                   completionHandler: @escaping (ApiResult<[Photo]>) -> Void) {
        
        httpRequest.execute { (result: HttpResult<[Photo]>) in
            switch result {
                
            case .success(let photos):
                mainQueue.async {
                    completionHandler(.success(photos))
                }
                
            case .failure(let error):
                mainQueue.async {
                    completionHandler(.failure(.NetworkError(error)))
                }
            }
        }
    }
}

enum ApiError: Swift.Error, LocalizedError {
    case NetworkError(NetworkError)

    var errorMessage: String? {
        switch self {
        case .NetworkError(let error): return "An error occurred: \(error.errorMessage)"
        }
    }
}
    


