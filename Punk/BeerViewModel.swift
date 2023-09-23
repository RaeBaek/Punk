//
//  BeerViewModel.swift
//  Punk
//
//  Created by 백래훈 on 2023/09/22.
//

import Foundation

final class BeerViewModel {
    
    //MARK: BeerAPI
    func request(completionHandler: @escaping (Beer) -> Void) {
        Network.shared.requestAPI(type: Beer.self, api: .random) { response in
            switch response {
            case .success(let success):
                dump(success)
                completionHandler(success)
            case .failure(let failure):
                dump(failure)
                print(failure.localizedDescription)
            }
        }
    }
    
    //MARK: Router
    func requestConvertible(completionHandler: @escaping (Beer) -> Void) {
        Network.shared.requestConvertible(type: Beer.self, api: .single(id: "123")) { response in
            switch response {
            case .success(let success):
                dump(success)
                completionHandler(success)
            case .failure(let failure):
                dump(failure)
                print(failure.localizedDescription)
            }
        }
    }
    
}
