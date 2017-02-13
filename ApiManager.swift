//
//  ApiManager.swift
//  GeekInformer
//
//  Created by Рауф on 12.02.17.
//  Copyright © 2017 Рауф. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiManager{
    class func getUserNews(){
        ApiService.getUserNews().responseJSON { response in
       if let value = response.result.value
        {
        var json = JSON(value)
            print(json)
        var objects = [NewsCard]()
        var title = String()
        var author = String()
        var published_date_human = String()
        var type = String()
        var logo = UIImage.init(named: "error.png")
        
        for item in 0...json["data"].count
        {
            
            title = json["data"][item]["title"].stringValue
            author = json["data"][item]["author"].stringValue
            published_date_human = json["data"][item]["published_date_human"].stringValue
            type = json["data"][item]["type"].stringValue
            if let url = NSURL(string: json["data"][item]["logo"].stringValue) {
                if let data = NSData(contentsOf: url as URL) {
                    logo = UIImage(data: data as Data)!
                }
                
        }
            
            objects.append(NewsCard.init(title: title, author: author, published_date_human: published_date_human, type: type, logo: logo!))
                }
            }
        }
    }
}
