//
//  SelectedImage.swift
//  UICollectionViewProject
//
//  Created by Farid on 9/22/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import Foundation

class  SelectedImage {
    
    var originalURL : URL?
    
    private init () {}
    
    static let shared = SelectedImage.init()

}
