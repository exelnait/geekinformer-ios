import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import SwiftyJSON

class ApiService{
//    class func getUserNews() -> DataRequest {
//        return Alamofire.request("https://geekinformer.net/api/1/news/last")
//    }
    class func getUserNews() -> Observable<(HTTPURLResponse, Any)>{
        return requestJSON(.get, "https://geekinformer.net/api/1/news/last")
    }
}
