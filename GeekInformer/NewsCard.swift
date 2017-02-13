    //  trends.swift
    //  GeekInformer
    
    //  Created by Рауф on 04.02.17.
    //  Copyright © 2017 Рауф. All rights reserved.
    //
    
    import Foundation
    import UIKit
    
    class NewsCard{
        
        var title:String
        var author:String
        var published_date_human:String
        var type:String
        var logo:UIImage
        
        
        init(title: String, author: String, published_date_human: String, type: String, logo: UIImage)
        {
            self.title = title
            self.author = author
            self.published_date_human = published_date_human
            self.type = type
            self.logo = logo
        }
        
}

