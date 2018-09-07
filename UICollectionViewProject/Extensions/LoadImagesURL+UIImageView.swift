//
//  LoadImagesURL+UIImageView.swift
//  CollectionViewSample
//
//  Created by Farid on 9/7/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import UIKit

var cache = NSCache<NSURL, UIImage>()

extension UIImageView {
    
    func loadFromURL(myUrl: URL)  {
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            do {
                
                let myData = try Data.init(contentsOf: myUrl)
                let myImg = UIImage.init(data: myData)
                
                cache.setObject(myImg!, forKey: myUrl as NSURL)
                DispatchQueue.main.async {
                    self.image = myImg!
                }
                
            }catch let error {
                
                print("error is : \(error)")
            }
        }
    }
}
