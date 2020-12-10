//
//  ProductData.swift
//  TchnFshn
//
//  Created by Nazik on 10.12.2020.
//

import Foundation

struct ProductData : Codable {
//    var data: [Data]
    let id: Int?
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String?
}

//struct Data :Codable {
//    let id: Int
//    let title: String
//    let price: Double
//    let description: String
//    let category: String
//    let image: String
//}
