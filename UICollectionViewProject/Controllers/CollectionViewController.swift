//
//  CollectionViewController.swift
//  CollectionViewSample
//
//  Created by Farid on 9/7/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import UIKit
import SDWebImage

var gSelectedIndexPath: Int?
var gImageUrl: URL?

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: OUTLETs
    
    @IBOutlet weak var collectionViewImages: UICollectionView! {
        
        didSet { getServiceImagesInfo() }
    }
    
    //MARK: VARIABLEs
    
    var webService = ServiceHandler()
    var responseDataItem = [ResponsesData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.collectionViewImages.delegate = self
        self.collectionViewImages.dataSource = self
        
        //collectionViewImages.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
        
    }
    
    
    //MARK: DELEGATE METHODs
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //collectionViewImages.deselectItem(at: indexPath, animated: true)
        
        gSelectedIndexPath = indexPath.row
        gImageUrl = responseDataItem[indexPath.row].originalURLLink
        
        let nextPage = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewControllerID") as! ImageViewController
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.responseDataItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cvCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as! CustomCollectionViewCell
        
        cvCell.lblCellCollectionView.text = "\(self.responseDataItem[indexPath.row].id)"
        
        cvCell.imgCellCollectionView.sd_setImage(with: self.responseDataItem[indexPath.row].smallURLLink, placeholderImage: #imageLiteral(resourceName: "TabBarHome"))
        
        return cvCell
    }
    
    // Collection View Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        return CGSize.init(width: (screenWidth-55) / 2, height: (screenWidth-55) / 2 * 1.481)
        
    }
    
    //MARK: PRIVATE FUNCTIONs
    
    //Get images information:
    private func getServiceImagesInfo() {
        
        webService.getImagesURLs { (response, error) in
            
            if error != nil {
                print(error!)
            }
            
            guard let responseData = response else { return }
            
            DispatchQueue.main.async {
                
                self.responseDataItem = responseData
                self.collectionViewImages.reloadData()
            }
        }
    }
    
}
