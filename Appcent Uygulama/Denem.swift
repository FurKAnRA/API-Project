//
//  Denem.swift
//  Appcent Uygulama
//
//  Created by Furkan Kara on 10.05.2021.
//

import Foundation

class deneme: () {
    <#code#>
}
let headers = [
    "x-rapidapi-key": "0ccc77eda7msh85175a2c5aa7ab0p160a7cjsn75b7b1f6b788",
    "x-rapidapi-host": "rawg-video-games-database.p.rapidapi.com"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://rawg-video-games-database.p.rapidapi.com/games")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error)
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
    }
})

dataTask.resume()
