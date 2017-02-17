import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

class ApiManager{
//    class func getUserNews0(completionHandler: @escaping ([NewsCard]) -> Void ){
//        ApiService.getUserNews().responseJSON { response in
//            if let value = response.result.value {
//                var json = JSON(value)
//                var objects = [NewsCard]()
//                var title = String()
//                var author = String()
//                var published_date_human = String()
//                var type = String()
//                var logo = UIImage.init(named: "error.png")
//        
//                for item in 0...json["data"].count {
//                    title = json["data"]["rss"][item]["title"].stringValue
//                    author = json["data"]["rss"][item]["author"].stringValue
//                    published_date_human = json["data"]["rss"][item]["published_date_human"].stringValue
//                    type = json["data"]["rss"][item]["type"].stringValue
//                    if let url = NSURL(string: json["data"]["rss"][item]["logo"].stringValue) {
//                        if let data = NSData(contentsOf: url as URL) {
//                            logo = UIImage(data: data as Data)!
//                        }
//                    }
//                    objects.append(NewsCard.init(title: title, author: author, published_date_human: published_date_human, type: type, logo: logo!))
//                }
//                completionHandler(objects)
//            }
//        }
//    }
    class func getUserNews() -> Observable<Any> {
        return ApiService.getUserNews().map { (response, data) in
            var data = JSON(data)["data"]
//            var cards = Array<NewsCard>()

//            for item in data["rss"] {
//                var title = String()
//                var author = String()
//                var published_date_human = String()
//                var type = String()
//                var logo = UIImage.init(named: "error.png")
//                title = item["title"].stringValue
//                author = item["author"].stringValue
//                published_date_human = item["published_date_human"].stringValue
//                type = item["type"].stringValue
//                if let url = NSURL(string: item["logo"].stringValue) {
//                    if let data = NSData(contentsOf: url as URL) {
//                        logo = UIImage(data: data as Data)!
//                    }
//                }
//                cards.append(NewsCard.init(title: title, author: author, published_date_human: published_date_human, type: type, logo: logo!))
//            }
            return [1,2,3]
        }
    }
}
