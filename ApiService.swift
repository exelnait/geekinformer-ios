import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import SwiftyJSON

class ApiService{
    class func getUserNews() -> Observable<(HTTPURLResponse, Any)>{
        print("request")
        return requestJSON(.get, "https://geekinformer.net/api/1/news/last")
    }
}
