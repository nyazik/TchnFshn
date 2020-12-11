//
//  ProducProvider.swift
//  TchnFshn
//
//  Created by Nazik on 10.12.2020.
//


import Foundation
import Alamofire

struct ProductProvider {
    
    let vehicleURL = "https://fakestoreapi.com/products"


    func fetch(category: String, sirala :String,
               completion: @escaping ([ProductData]) -> Void) {
        var url = "https://fakestoreapi.com/products"
        
        
        if category != "" { url += "/category/\(category)" }
        if category == "men clothing" { url  =  "https://fakestoreapi.com/products/category/men%20clothing" }
        if category == "women clothing" { url = "https://fakestoreapi.com/products/category/women%20clothing" }
        
        
        if sirala != "" { url += "?sort=\(sirala)" }
        
        AF.request(url).responseString { response in
            debugPrint(response.data as? Any)
            print(response.data)
            guard let data = response.data else {
                print("error, unable to fetch data from URL:\(url)")
                return
            }
            print(url)
            guard let decodedData = try? JSONDecoder().decode([ProductData].self, from: data) else {
                print("sorry, unable to decode json data")
                
                return
            }
            DispatchQueue.main.async {
                completion(decodedData)
            }
            print(decodedData)

        }
    }
    
    
    
}

