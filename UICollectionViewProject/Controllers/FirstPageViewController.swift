//
//  FirstPageViewController.swift
//  CollectionViewSample
//
//  Created by Farid on 9/7/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    @IBOutlet weak var imgCircle: UIImageView!
    @IBOutlet weak var imgBackground: UIImageView!
    
    @IBOutlet weak var lblUICollectionViewText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgCircle.alpha = 0
        self.lblUICollectionViewText.alpha = 0
        self.imgBackground.alpha = 0
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadAnimation()
    }
    
    func loadAnimation() {
        
        UIView.animate(withDuration: 3, animations: {
            
            self.imgCircle.alpha = 1
            self.lblUICollectionViewText.alpha = 1
            
            self.imgBackground.alpha = 0.3
            
        }) { (finished) in
            
            if finished {
                
                self.collectionViewControllerTransition()
                
            }
        }
    }
    
    ///View Transition
    private func collectionViewControllerTransition() {
        
        let CollectionViewPageVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarID") as! TabBarViewController
        self.navigationController?.present(CollectionViewPageVC, animated: true, completion: nil)
    }
}
