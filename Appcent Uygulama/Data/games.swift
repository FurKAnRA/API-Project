//
//  games.swift
//  Appcent Uygulama
//
//  Created by Furkan Kara on 13.05.2021.
//

import Foundation

struct game  {
    var gameId  : Int =  0
    var gameName  : String
    var releasedDate : String
    var image  : String
    var rating : Double = 0
    var favorites : Bool = false
    init(_ dictionary  : [String : Any]) {
        self.gameId = dictionary["id"] as? Int ?? 0
        self.gameName = dictionary["name"] as? String ?? ""
        self.releasedDate = dictionary["released"] as? String ?? ""
        self.image = dictionary["background_image"] as? String ?? ""
        self.rating = dictionary["rating"] as? Double ?? 0
       
       
    }
}



