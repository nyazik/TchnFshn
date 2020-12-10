//
//  ViewController.swift
//  TchnFshn
//
//  Created by Nazik on 10.12.2020.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!

    fileprivate let cellIdentifier = "PhotoCell"
    private var product: [ProductData] = []
    var categoryName = ""

    var productProvider = ProductProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 25
        containerView.backgroundColor = UIColor.white
        setupCollectionView()
        fetchPhotos()

    }
    
    
    func fetchPhotos() {
        print("Fetching...")
        productProvider.fetch(category: categoryName){product in
                self.updatePhotosAfterFetching(product)
        }
        
    }
    func updatePhotosAfterFetching(_ photos: [ProductData]) {
        self.product = photos
        collectionView.reloadData()
    }
    

    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: cellIdentifier, bundle: nil ), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.alwaysBounceVertical = true
    }
    
    
    @IBAction func filtreButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let filtreVC = storyboard?.instantiateViewController(identifier: "FiltreVC") as! FiltremeTableViewController
        filtreVC.delegate = self
        present(filtreVC, animated: false, completion: nil)
    }
}

//MARK:- UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
                as? PhotoCell else {return UICollectionViewCell()}

        if let imageUrl = product[indexPath.item].image {
            let url = URL(string: imageUrl)
            cell.productImageView.kf.setImage(with: url)
            let cena = product[indexPath.item].price
            cell.procustPrice.text = String("\(cena) TL")
            cell.productDescription.text =   String(product[indexPath.item].title)
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    
}



//MARK:- UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let screenWidth = UIScreen.main.bounds.width
        var width = (screenWidth-30)/2
        
        width = width > 200 ? 200 : width
        return CGSize.init(width: width, height: width)
    }
}

extension ViewController : FiltremeTableViewControllerProtocol{
    func categorySelected(categoryName: String) {
        product = []
        self.categoryName = categoryName
        print("naz\(categoryName)")
        fetchPhotos()
    }
    
    
}
