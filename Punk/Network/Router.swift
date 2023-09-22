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
    private var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2/beers")!
    }
    
    // 케이스 별 path 선언
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

