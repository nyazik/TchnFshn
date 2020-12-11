//
//  TabbarViewController.swift
//  TchnFshn
//
//  Created by Nazik on 10.12.2020.
//

import UIKit

class TabbarViewController: UITabBarController {
    @IBOutlet weak var back: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set(name: "opportunity", for: 0)
        self.navigationController?.isNavigationBarHidden = true

    }
    
    func set(name: String, for index: Int) {
        let vehicleController = (viewControllers?[index] ) as? ViewController
    }
}
