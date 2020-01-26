//
//  Rate.swift
//  URLSession+Puhliy+Vitaliy
//
//  Created by Developer on 25.01.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct Rate: Decodable {
    let currency: String
    let baseCurrency: String
    let buy: Double
    let sell: Double
    
    enum CodingKeys: String, CodingKey {
        case currency = "ccy"
        case baseCurrency = "base_ccy"
        case buy
        case sell = "sale"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        currency = try container.decode(String.self, forKey: .currency)
        baseCurrency = try container.decode(String.self, forKey: .baseCurrency)
        buy = Double(try container.decode(String.self, forKey: .buy)) ?? 0.0
        sell = Double(try container.decode(String.self, forKey: .sell)) ?? 0.0
    }
}
