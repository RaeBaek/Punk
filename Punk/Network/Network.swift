//
//  Network.swift
//  Punk
//
//  Created by 백래훈 on 2023/09/22.
//

import Foundation
import Alamofire

final class Network {
    
    static let shared = Network()
    
    private init() { }
    
    //MARK: Router
    func requestConvertible<T: Decodable>(type: T.Type, api: BeerAPI, completionHandler: @escaping (Result<T, Error>) -> Void) {
        AF.request(api.endPoint).validate(statusCode: 200...500)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
    
    
    //MARK: BeerAPI
    // 제네릭 선언
    func requestAPI<T: Decodable>(type: T.Type, api: BeerAPI, completionHandler: @escaping (Result<T, Error>) -> Void) {
        AF.request(api.endPoint).validate(statusCode: 200...500)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
    
}
