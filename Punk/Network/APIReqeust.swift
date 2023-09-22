//
//  APIReqeust.swift
//  Punk
//
//  Created by 백래훈 on 2023/09/22.
//

import Foundation
import Alamofire

final class APIReqeust {
    
    static let shared = APIReqeust()
    
    private init() { }
    
    // Result 사용
  //func beers(api: BeerAPI, completionHandler: @escaping (Beer?, Error?) -> Void)
    func beers(api: BeerAPI, completionHandler: @escaping (Result<Beer, Error>) -> Void) {
        AF.request(api.endPoint, method: api.method).responseDecodable(of: Beer.self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                print(error)
                completionHandler(.failure(error))
            }
        }
    }
    
    // 기존까지 학습했던 Codable 구조체와 Error
    func single(api: BeerAPI, completionHandler: @escaping (Beer?, Error?) -> Void) {
        AF.request(api.endPoint).validate(statusCode: 200...500)
            .responseDecodable(of: Beer.self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(data, nil)
            case .failure(let error):
                print(error)
                completionHandler(nil, error)
            }
        }
    }
    
    // 목적이 다른 함수명으로 명명했지만 내부는 결국 같은 코드를 작성하고 있었다.
    func random(api: BeerAPI, completionHandler: @escaping (Beer?, Error?) -> Void) {
        AF.request(api.endPoint, method: api.method).responseDecodable(of: Beer.self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(data, nil)
            case .failure(let error):
                print(error)
                completionHandler(nil, error)
            }
        }
    }
    
}
