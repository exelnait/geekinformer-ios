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
            var video_id = String()
            var logo = UIImage.init(named: "error.png")
            var cover = UIImage.init(named: "error.png")
            
            var modelName = "rss"
            for _ in 0...2 {
            for item in 0...data[modelName].count {
                cover = UIImage.init()
                title = data[modelName][item]["title"].stringValue
                author = data[modelName][item]["author"].stringValue
                published_date = data[modelName][item]["published_date"].stringValue
                published_date_human = data[modelName][item]["published_date_human"].stringValue
                type = data[modelName][item]["type"].stringValue
                if let url = NSURL(string: data[modelName][item]["logo"].stringValue) {
                    if let data = NSData(contentsOf: url as URL) {
                        logo = UIImage(data: data as Data)!
                        }
                    }
                if let url = NSURL(string: data[modelName][item]["cover_big"].stringValue) {
                    if let data = NSData(contentsOf: url as URL) {
                        cover = UIImage(data: data as Data)!
                        }
                    }
                if (modelName == "rss"){
                    cards.append(Card.init(title: title, author: author, published_date: published_date, published_date_human: published_date_human, type: type, logo: logo!, cover: cover!))
                }
                if (modelName == "youtube"){
                    video_id = data[modelName][item]["video_id"].stringValue
                    cards.append(YouTubeCard.init(title: title, author: author, published_date: published_date, published_date_human: published_date_human, type: type, logo: logo!, cover: cover!, video_id: video_id))
                }
                
                }
                if (modelName == "rss"){
                    modelName = "youtube"
                }
//                if (modelName == "youtube"){
//                    modelName = "itunes"
//                }
            }
            return cards
        }
    }
}
