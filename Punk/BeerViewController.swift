//
//  BeerViewController.swift
//  Punk
//
//  Created by 백래훈 on 2023/09/22.
//

import UIKit

class BeerViewController: UIViewController {

    let beerViewModel = BeerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        beerViewModel.request { data in
//            dump(data)
//        }
        
        beerViewModel.requestConvertible { data in
            dump(data)
        }
        
    }

}

