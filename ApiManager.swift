import Foundation
import Alamofire
import SwiftyJSON
import RxSwift


class ApiManager{

    class func getUserNews() -> Observable<JSON> {
       return ApiService.getUserNews().map { (response, data) in
            let data = JSON(data)["data"]
            return data
        }
    }
}
