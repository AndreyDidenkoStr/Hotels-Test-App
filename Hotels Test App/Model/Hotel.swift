//
//  Hotels.swift
//  Hotels Test App
//
//  Created by Andrey Kapitalov on 04.08.2022.
//

import Foundation

struct Hotel: Codable {
    let id: String
    let name: String
    let address: String
    let stars: Int
    let distance: Double
    let suitesAvailability: String
    let image: String
    let lat: Double
    let lon: Double
    
    enum CodingKeys: String, CodingKey {
        case id, name, address, stars, distance, image
        case suitesAvailability = "suites_availability"
        case lat, lon
    }
}
