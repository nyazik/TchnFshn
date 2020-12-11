//
//  TabbarViewController.swift
//  TchnFshn
//
//  Created by Nazik on 10.12.2020.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        set(name: "opportunity", for: 0)
    }
    
    func set(name: String, for index: Int) {
        let vehicleController = (viewControllers?[index] ) as? ViewController
    }
}
