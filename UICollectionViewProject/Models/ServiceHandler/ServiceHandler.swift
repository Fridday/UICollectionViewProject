//
//  serviceHandler.swift
//  CollectionViewSample
//
//  Created by Farid on 9/7/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import UIKit

typealias completionHandler = (([ResponsesData]?,String?) -> Void)

class ServiceHandler {
    
    //Create Session:
    let session: URLSession = .shared
    
    func getImagesURLs(completionHandler: @escaping completionHandler) {
        
        //Create a URL:
        let serviceURL = ServicesURL()
        let urlString = serviceURL.serviceURL
        
        guard let endpointURL = URL(string: urlString) else {
            completionHandler(nil, "URL Error")
            return
        }
        
        //Create a session Task:
        let dataTask = session.dataTask(with: endpointURL) { (data, responce, error) in
            
            if error != nil {
                completionHandler(nil, "Error!")
            }
            
            guard let jsonData = data else {
                completionHandler(nil, "Data Error")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let seriveData = try decoder.decode([ResponsesData].self, from: jsonData)
                completionHandler(seriveData, nil)
                
            } catch {
                
                completionHandler(nil, "JSON Erorr")
            }
        }
        
        dataTask.resume()
    }
    
    
    func loadImage(url: URL, completionHandler: @escaping ((UIImage?, String?) -> Void)) {
        
        let task = session.dataTask(with: url) { (imageData, response, error) in
            
            if error != nil {
                completionHandler(nil, "Error!")
            }
            
            guard let imageData = imageData else { return }
            
            let image = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                completionHandler(image, nil)
            }
            
        }
        task.resume()
    }
    
}


