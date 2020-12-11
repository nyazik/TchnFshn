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
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var siralaButton: UIButton!
    
    fileprivate let cellIdentifier = "PhotoCell"
    private var product: [ProductData] = []
    private var searchProduct : [ProductData] = []
    
    var searching = false
        
    var categoryName = ""
    var siralaName = ""
    var productProvider = ProductProvider()
    var productDetailViewController: ProductDetailViewController?
    var productDetailStoryboardID = "productDetailStoryboardID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 25
        containerView.backgroundColor = UIColor.white
        setupCollectionView()
        fetchPhotos()

    }
    
    
    
    func fetchPhotos() {
        print("Fetching...")
        productProvider.fetch(category: categoryName, sirala: siralaName) {product in
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
        _ = UIStoryboard(name: "Main", bundle: nil)
        let filtreVC = storyboard?.instantiateViewController(identifier: "FiltreVC") as! FiltremeTableViewController
        filtreVC.delegate = self
        present(filtreVC, animated: false, completion: nil)
    }
    
    
    @IBAction func siralaPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {

                print(sender.isSelected)
            print("desc")
            siralaName = "desc"
            }
            else {
                print(sender.isSelected)
                siralaName = "asc"
                print("asc")
            }
        fetchPhotos()
    }
    
    
}

//MARK:- UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        productDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: productDetailStoryboardID) as? ProductDetailViewController
        productDetailViewController!.modalPresentationStyle = .popover
        let popover = self.productDetailViewController!.popoverPresentationController
        
        let cell = self.collectionView.cellForItem(at: indexPath) as! PhotoCell
        let _ = productDetailViewController?.view
        
        productDetailViewController?.productImage.image = cell.productImageView.image
        
        let data = self.product[indexPath.item]
        
        productDetailViewController?.populate(with: data)

        popover!.sourceView = self.view
        
        present(self.productDetailViewController!, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
                as? PhotoCell else {return UICollectionViewCell()}
    
        if searching {
            if let imageUrl = searchProduct[indexPath.item].image {
                let url = URL(string: imageUrl)
                cell.productImageView.kf.setImage(with: url)
                let cena = searchProduct[indexPath.item].price
                cell.procustPrice.text = String("\(cena) TL")
                cell.productDescription.text =   String(searchProduct[indexPath.item].title)
            }
        }else{
            if let imageUrl = product[indexPath.item].image {
                let url = URL(string: imageUrl)
                cell.productImageView.kf.setImage(with: url)
                let cena = product[indexPath.item].price
                cell.procustPrice.text = String("\(cena) TL")
                cell.productDescription.text =   String(product[indexPath.item].title)
            }
        }
        
//        if let imageUrl = product[indexPath.item].image {
//            let url = URL(string: imageUrl)
//            cell.productImageView.kf.setImage(with: url)
//            let cena = product[indexPath.item].price
//            cell.procustPrice.text = String("\(cena) TL")
//            cell.productDescription.text =   String(product[indexPath.item].title)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching {
            return searchProduct.count
        }else{
            return product.count
        }
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
        fetchPhotos()
    }
    
    
}


extension ViewController : UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
  
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchProduct = product.filter({ (product: ProductData) -> Bool in
            return product.title.lowercased().contains(searchText.lowercased())
        })
        searching = true
        fetchPhotos()
        collectionView.reloadData()
    }
}

