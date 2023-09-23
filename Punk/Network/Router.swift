//
//  Router.swift
//  Punk
//
//  Created by 백래훈 on 2023/09/22.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    // 케이스 선언
    case beers
    case single(id: String) // 연관값, associated value
    case random
    
    // baseURL 연산 프로퍼티 선언
    // BeerAPI와 다른점이라면 선언 타입이 String이 아닌 URL이라는 점
    private var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2/beers")!
    }
    
    // 케이스 별 path 선언
    // baseURL 뒤에 붙을 path (타입은 String)
    private var path: String {
        switch self {
        case .beers:
            return ""
        case .single(let id):
            return "/\(id)"
        case .random:
            return "/random"
        }
    }
    
    // 호출 메서드 (.get)
    var method: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return request
    }
}

