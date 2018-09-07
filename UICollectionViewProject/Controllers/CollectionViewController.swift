//
//  CollectionViewController.swift
//  CollectionViewSample
//
//  Created by Farid on 9/7/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import UIKit

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
        
        self.collectionViewImages.delegate = self
        self.collectionViewImages.dataSource = self
        
        //collectionViewImages.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
        
    }
    
    
    //MARK: DELEGATE METHODs
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return responseDataItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as! CustomCollectionViewCell
        
        collectionViewCell.lblCellCollectionView.text = "\(responseDataItem[indexPath.row].id)"
        
        guard let url = responseDataItem[indexPath.row].smallURLLink else { return collectionViewCell }
        
        if let image = cache.object(forKey: url as NSURL) {
            
            DispatchQueue.main.async {
                collectionViewCell.imgCellCollectionView.image = image
            }
        } else {
            
            collectionViewCell.imgCellCollectionView.loadFromURL(myUrl: url)
        }
        
        return collectionViewCell
    }
    
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
            
            self.responseDataItem = responseData
            
            self.reloadColectionView()
            
        }
    }
    
    // Reload collection view
    private func reloadColectionView() {
        
        DispatchQueue.main.async {
            self.collectionViewImages.reloadData()
        }
    }
    
    
    /*
     let imageSession = URLSession(configuration: .ephemeral)
     let cache = NSCache<NSURL, UIImage>()
     
     func loadImage(from url: URL, completion: @escaping (UIImage) -> Void)
     {
     if let image = cache.object(forKey: url as NSURL)
     {
     completion(image)
     }
     else
     {
     let task = imageSession.dataTask(with: url) { (imageData, _, _) in
     guard let imageData = imageData,
     let image = UIImage(data: imageData)
     else { return }
     
     self.cache.setObject(image, forKey: url as NSURL)
     DispatchQueue.main.async {
     completion(image)
     }
     
     }
     task.resume()
     }
     }
     
     */
    
}
