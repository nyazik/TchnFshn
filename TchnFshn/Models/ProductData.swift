//
//  ProductData.swift
//  TchnFshn
//
//  Created by Nazik on 10.12.2020.
//

import Foundation

struct ProductData : Codable, Equatable {
    let id: Int?
    var title: String
    let price: Double
    let description: String
    let category: String
    let image: String?
}
