//
//  CustomCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by Farid on 9/7/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCellCollectionView: UIImageView!

    @IBOutlet weak var lblCellCollectionView: UILabel!
    
    
    /* It is done in View:
     
    @IBOutlet weak var imgCellCollectionView: UIImageView!{
        didSet{
            self.imgCellCollectionView.layer.cornerRadius = 12
            self.imgCellCollectionView.layer.masksToBounds = true
        }
    }
 */
    
}
