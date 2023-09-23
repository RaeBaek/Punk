//
//  BeerAPI.swift
//  Punk
//
//  Created by 백래훈 on 2023/09/22.
//

import Foundation
import Alamofire

// API 열거형 생성
enum BeerAPI {
    
    // 케이스 선언
    case beers
    case single(id: String) // 연관값, associated value
    case random
    
    // baseURL 연산 프로퍼티 선언
    private var baseURL: String {
        return "https://api.punkapi.com/v2/beers"
    }
    
    // 케이스 별 엔드포인트 연산 프로퍼티 선언
    var endPoint: URL {
        switch self {
        case .beers:
            return URL(string: baseURL)!
        case .single(let id):
            return URL(string: baseURL + "/\(id)")!
        case .random:
            return URL(string: baseURL + "/random")!
        }
    }
    
    // 호출 메서드 (.get)
    var method: HTTPMethod {
        return .get
    }
}
