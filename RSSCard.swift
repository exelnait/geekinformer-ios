import Foundation
import UIKit

class Card{
    
    var title:String
    var published_date:String
    var published_date_human:String
    var type:String
    var logo:UIImage
    var author:String
    var cover:UIImage
    var content_snippet:String
    
    init(title: String, author: String, published_date: String, published_date_human: String, type:String, logo: UIImage, cover: UIImage, content_snippet: String)
    {
        self.author = author
        self.title = title
        self.published_date = published_date
        self.published_date_human = published_date_human
        self.type = type
        self.logo = logo
        self.cover = cover
        self.content_snippet = content_snippet
    }
}
