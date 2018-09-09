//
//  JSONParser.swift
//  UICollectionViewProject
//
//  Created by Farid on 9/9/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import Foundation

class JSONParser {
    
    static func parseData(_ data: Data) -> [ResponsesData] {
        
        var result = [ResponsesData]()
        do {
            
            let decoder = JSONDecoder()
            result = try decoder.decode([ResponsesData].self, from: data)
            
        } catch let error {
            
            print("can't conver data to JSON \(error)")
        }
        
        return result
        
    }
}
