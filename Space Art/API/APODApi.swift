//
//  APODApi.swift
//  Space Art
//
//  Created by jeovane.barbosa on 29/12/22.
//

import Foundation

class APODApi {
    
    var decoder: JSONDecoder?
    var session: URLSession?
    var dataTask: URLSessionDataTask?
    var count: Int = 12
    var apiKey: String = "dcmmmySJyGWkzZaooad3ZmrKkuOYiVdaDwFKc5R7"
    
    init(decoder: JSONDecoder? = JSONDecoder(), session: URLSession? = URLSession.shared) {
        self.decoder = decoder
        self.session = session
    }
    
    func getPhotos(completionHandler: @escaping (ApiResponse) -> Void) {
        
        //prepare URL
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)&count=\(count)") else {return}
        print(url)
        dataTask?.cancel()
        dataTask = session?.dataTask(with: url, completionHandler: { [weak self] data, response, error in
            
            defer {
                self?.dataTask = nil
            }
            
            //Check for errors making the request
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(ApiResponse.failure(.requestFailed(error)))
                }
                return
            }
            
            //Check for errors in the server response
            guard let data = data,
                 let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.fetchFailed))
                }
                return
            }
            
            //Check for error in parsing the data
            do {
                guard let self = self else {return}
                
                let result = try self.decoder?.decode([Photo].self, from: data)
                
                print(result!)
                
                DispatchQueue.main.async {
                    guard let result = result else {return}
                    completionHandler(.sucess(result))
                }
                
            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(.invalidData))
                }
            }
        })
        dataTask?.resume()
    }
}

extension APODApi {
    enum Error: Swift.Error, LocalizedError {
        case requestFailed(Swift.Error)
        case fetchFailed
        case invalidData
        
        var errorDescription: String? {
            switch self {
            case .requestFailed(let error):
                return "Error while making the request: \(error.localizedDescription)"
            case .fetchFailed:
                return "Unable to retrive data from the server."
            case .invalidData:
                return "Unable to parse data"
            }
        }
    }
    
    enum ApiResponse {
        case sucess([Photo])
        case failure(APODApi.Error)
    }
}
