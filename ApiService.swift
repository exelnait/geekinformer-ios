//
//  Api Service.swift
//  GeekInformer
//
//  Created by Рауф on 12.02.17.
//  Copyright © 2017 Рауф. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import SwiftyJSON

class ApiService{
    class func getUserNews()-> Observable<DataRequest>{
        return request(.get, "https://geekinformer.net/api/1/news/last")
    }
}
