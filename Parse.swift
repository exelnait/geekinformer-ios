import Foundation
import Alamofire
import SwiftyJSON
import RxSwift


class Parse{
    class func getNews() -> Observable<[Card]>{
        return ApiManager.getUserNews().map { data in
            let data2 = data.dictionary
            let data = data
            //print(data)
            let componentArray = [String] (data2!.keys)
            //print(data?["rss"]?[0]["id"].stringValue)
            var cards = [Card]()
            var title = String()
            var author = String()
            var published_date_human = String()
            var published_date = String()
            var type = String()
            var video_id = String()
            var audio_url = String()
            var logo = UIImage.init()
            var cover = UIImage.init()
            var content_snippet = String()
            
            //for typeitem in data?.keys.startIndex...data?.keys.endIndex{
            
            for index in 0...componentArray.count-1{
                
                let typeid = componentArray[index] as String
                
                for item in 0...5 {
                    cover = UIImage.init()
                    title = data[typeid][item]["title"].stringValue
                    author = data[typeid][item]["author"].stringValue
                    published_date = data[typeid][item]["published_date"].stringValue
                    published_date_human = data[typeid][item]["published_date_human"].stringValue
                    type = data[typeid][item]["type"].stringValue
                    content_snippet = data[typeid][item]["content_snippet"].stringValue
                    video_id = data[typeid][item]["video_id"].stringValue
                    audio_url = data[typeid][item]["audio_url"].stringValue
                    if let url = NSURL(string: data[typeid][item]["logo"].stringValue) {
                        if let data = NSData(contentsOf: url as URL) {
                            logo = UIImage(data: data as Data)!
                        }
                    }
                    if let url = NSURL(string: data[typeid][item]["cover_big"].stringValue) {
                        if let data = NSData(contentsOf: url as URL) {
                            cover = UIImage(data: data as Data)!
                        }
                    }
                    if(typeid ==  "rss"){
                        cards.append(RssCard.init(title: title, author: author, published_date: published_date, published_date_human: published_date_human, type: type, logo: logo, cover: cover, content_snippet: content_snippet))
                    }
                    if(typeid == "itunes"){
                        cards.append(ItunesCard.init(title: title, author: author, published_date: published_date, published_date_human: published_date_human, type: type, logo: logo, cover: cover, audio_url: audio_url))
                    }
                    if(typeid == "youtube"){
                        cards.append(YouTubeCard.init(title: title, author: author, published_date: published_date, published_date_human: published_date_human, type: type, logo: logo, cover: cover, video_id: video_id))
                    }
                    
                }
            }
            return cards
        }
    }
}






