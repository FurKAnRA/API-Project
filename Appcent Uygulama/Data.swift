//
//  Data.swift
//  Appcent Uygulama
//
//  Created by Furkan Kara on 12.05.2021.
//

import Foundation


struct Data : Decodable {
    var results : results
    
    enum CodingKeys : String,CodingKey {
        case name = "name"
        case releasedData = "releasedData"
    }
}


struct results : Decodable{
    var name : String
    var releasedData : String
    var background_image : String
    
}
