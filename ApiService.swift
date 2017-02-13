//
//  Api Service.swift
//  GeekInformer
//
//  Created by Рауф on 12.02.17.
//  Copyright © 2017 Рауф. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiService{
    class func getUserNews()-> DataRequest{
        let response = Alamofire.request("https://geekinformer.net/api/1/news/last")
        return response
    }
}
