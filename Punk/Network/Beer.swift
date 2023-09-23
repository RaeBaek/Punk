//
//  Beer.swift
//  Punk
//
//  Created by 백래훈 on 2023/09/22.
//

import Foundation

// MARK: - BeerElement
struct BeerElement: Codable {
    let id: Int
    let name, tagline, firstBrewed, description: String
    let imageURL: String?
    let abv: Double
    let ibu: Double?
    let targetFg: Int
    let targetOg: Double
    let ebc: Int?
    let srm, ph: Double?
    let attenuationLevel: Double
    let foodPairing: [String]
    let brewersTips: String

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
    }
}

typealias Beer = [BeerElement]
