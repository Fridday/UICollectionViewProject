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
            
            guard let RespData = data else {
                completionHandler(nil, "Data Error")
                return
            }
            
            //Parse json data:
            let seriveData = JSONParser.parseData(RespData)
            completionHandler(seriveData, nil)
        }
        
        dataTask.resume()
    }
    
}


