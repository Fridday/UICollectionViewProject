//
//  ImageViewController.swift
//  UICollectionViewProject
//
//  Created by Farid on 9/9/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import UIKit
import SDWebImage

class ImageViewController: UIViewController {

    @IBOutlet weak var imgWallpaper: UIImageView!
    
    var responseDataItem = [ResponsesData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.imgWallpaper.sd_setImage(with: SelectedImage.shared.originalURL, placeholderImage: nil)
    }

}
