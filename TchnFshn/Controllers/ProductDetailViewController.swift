//
//  ProductDetailViewController.swift
//  TchnFshn
//
//  Created by Nazik on 11.12.2020.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func populate(with product: ProductData){
        
        productPrice.text = String("\(product.price) TL")
        productTitle.text = product.title
        productCategory.text = product.category
        productDescription.text = product.description
    }

}
