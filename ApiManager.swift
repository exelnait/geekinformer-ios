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
    class func getUserNews() -> Observable<[Card]> {
        return ApiService.getUserNews().map { (response, data) in
            var data = JSON(data)["data"]
            //print(data)
            var cards = [Card]()
            var title = String()
            var author = String()
            var published_date_human = String()
            var published_date = String()
            var type = String()
            var logo = UIImage.init(named: "error.png")
            
            for item in 0...data["rss"].count {

                title = data["rss"][item]["title"].stringValue
                author = data["rss"][item]["author"].stringValue
                published_date = data["rss"][item]["published_date"].stringValue
                published_date_human = data["rss"][item]["published_date_human"].stringValue
                type = data["rss"][item]["type"].stringValue
                if let url = NSURL(string: data["rss"][item]["logo"].stringValue) {
                    if let data = NSData(contentsOf: url as URL) {
                        logo = UIImage(data: data as Data)!
                    }
                }
                cards.append(Card.init(title: title, author: author, published_date: published_date, published_date_human: published_date_human, type: type, logo: logo!))
            }
            return cards
        }
    }
}
