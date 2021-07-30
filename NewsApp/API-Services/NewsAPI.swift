//
//  NewsAPI.swift
//  NewsApp
//
//  Created by Karthika on 7/29/21.
//

import Foundation
public protocol NetworkTask {
    func cancel()
    func resume()
}
public protocol NetworkProvider {
    func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTask
}

extension URLSession: NetworkProvider {
    public func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTask {
        let task: URLSessionDataTask = dataTask(with: url, completionHandler: completionHandler)
        return task
    }
}
extension URLSessionTask: NetworkTask {}

class NewsAPI {
    
    static var backendURL : String {
        return "https://api.nytimes.com/svc/"
    }
    private let session: NetworkProvider
    private let decoder = JSONDecoder()
    init(session: NetworkProvider = URLSession.shared) {
        self.session = session
        decoder.dateDecodingStrategy = .secondsSince1970
    }
    
    public func call<T: Endpoint>(endpoint: T, completion: @escaping (Result<T.ModelType, Error>) -> ()) {
     
        let request = endpoint.request
        print("In call\(request)")
        session.dataTask(with: request) { data, response           , error in
            guard error == nil else {
                _ = error! as NSError
                return completion(.failure(error!))
            }
            guard (response as? HTTPURLResponse) != nil else {
                return completion(.failure(error!))
            }
            guard let data = data else {
                return completion(.failure(error!))
            }
            DispatchQueue.main.async {
                            do {
                                let model = try self.decoder.decode(T.ModelType.self, from: data)
                                return completion(.success(model))
                            } catch {
                                print("Connection Error")
                            }
                        
                    
            }
        }.resume()
    }
}
