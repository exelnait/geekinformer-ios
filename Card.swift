    //  trends.swift
    //  GeekInformer
    
    //  Created by Рауф on 04.02.17.
    //  Copyright © 2017 Рауф. All rights reserved.
    //
    
    import Foundation
    import UIKit
    
    class Card{
        
        var title:String
        var published_date:String
        var published_date_human:String
        var type:String
        var logo:UIImage
        var author:String
        
        init(title: String, author: String, published_date: String, published_date_human: String, type:String, logo: UIImage)
        {
            self.author = author
            self.title = title
            self.published_date = published_date
            self.published_date_human = published_date_human
            self.type = type
            self.logo = logo
        }
        
    }
    
