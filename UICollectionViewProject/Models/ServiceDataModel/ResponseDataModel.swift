//
//  ResponseServiceDataModel.swift
//  CollectionViewSample
//
//  Created by Farid on 9/7/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import Foundation

struct ResponsesData: Codable {
    
    var id : Int
    var smallURL: String
    var mediumURL: String
    var originalURL: String
    
    // Convert StringURLs to URLs
    var smallURLLink: URL? {
        
        
        
        guard let safeURLString = smallURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return nil }

        return URL(string: safeURLString)

    }
    
    var mediumURLLink: URL? {
        
        guard let safeURLString = mediumURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return nil }
        
        return URL(string: safeURLString)
    }
    
    var originalURLLink: URL? {
        
        guard let safeURLString = originalURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return nil }
        
        return URL(string: safeURLString)
    }
}


/*
 
 JSON Sample:
 
 {
 "id": 1,
 "smallURL": "https://prodfa.am.files.1drv.com/y4maqcYHZ_hdD4Cfystkt0HgLid35SHJN5F1_xpWmG1vVoB3vDV2kt6Q7mylZLDw74KIdBT9QWV7RQ7FoqmLEvORT5y-2lX45WH4GzJ00Eilw0TFEZWYCoIz65rxekeFBRXZNUZmBJS0twly-gBw3TNst0Ly3NSj6VM9P4GWEvQTbstmuK9HYqt93xQsqPKUvvGTcjkryMON9sPJY7Tm62iJg?width=256&height=144&cropmode=none",
 "mediumURL": "https://prodfa.am.files.1drv.com/y4maqcYHZ_hdD4Cfystkt0HgLid35SHJN5F1_xpWmG1vVoB3vDV2kt6Q7mylZLDw74KIdBT9QWV7RQ7FoqmLEvORT5y-2lX45WH4GzJ00Eilw0TFEZWYCoIz65rxekeFBRXZNUZmBJS0twly-gBw3TNst0Ly3NSj6VM9P4GWEvQTbstmuK9HYqt93xQsqPKUvvGTcjkryMON9sPJY7Tm62iJg?width=1024&height=576&cropmode=none",
 "originalURL": "https://prodfa.am.files.1drv.com/y4maqcYHZ_hdD4Cfystkt0HgLid35SHJN5F1_xpWmG1vVoB3vDV2kt6Q7mylZLDw74KIdBT9QWV7RQ7FoqmLEvORT5y-2lX45WH4GzJ00Eilw0TFEZWYCoIz65rxekeFBRXZNUZmBJS0twly-gBw3TNst0Ly3NSj6VM9P4GWEvQTbstmuK9HYqt93xQsqPKUvvGTcjkryMON9sPJY7Tm62iJg?width=3840&height=2160&cropmode=none"
 },
 
 */
