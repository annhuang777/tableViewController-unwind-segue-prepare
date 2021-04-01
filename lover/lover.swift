//
//  lover.swift
//  lover
//
//  Created by Pin yu Huang on 2021/3/18.
//

import Foundation

struct Lover:Codable{
    var name:String
    var star:String
    var weight:Double
    var innerBeauty:Bool
     
    
    
    //fellow codable將lovers->data->userdefault儲存 (儲存資料為了下次重新點app資料還在）
    static func saveToFile(lovers: [Lover]) {
     let propertyEncoder = PropertyListEncoder()
        
        if let data = try? propertyEncoder.encode(lovers){
    let userDefault = UserDefaults.standard
    userDefault.set(data, forKey: "lovers")
      }
    }
     
    
    
    
}

