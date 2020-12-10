//
//  PhotoCell.swift
//  TchnFshn
//
//  Created by Nazik on 10.12.2020.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var procustPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
