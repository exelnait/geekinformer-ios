import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import SwiftyJSON

class ApiService{
    class func getUserNews() -> Observable<(HTTPURLResponse, Any)>{
        return RxAlamofire
            .requestJSON(.get, "https://geekinformer.net/api/1/news/last")
            .debug()
            .catchError { error in
                return Observable.never()
            }
    }
}
