//
//  FiltremeTableViewController.swift
//  TchnFshn
//
//  Created by Nazik on 10.12.2020.
//

import UIKit

protocol FiltremeTableViewControllerProtocol {
    func categorySelected(categoryName:String)
}


class FiltremeTableViewController: UITableViewController {
    
    var delegate : FiltremeTableViewControllerProtocol?
    let cameraCellId = "cameraCellId"
    var categories: [String] = ["men%20clothing","jewelery","electronics", "women%20clothing"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cameraCellId, for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.categorySelected(categoryName: categories[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    
    
}
