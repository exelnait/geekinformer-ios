    //  trends.swift
    //  GeekInformer
    
    //  Created by Рауф on 04.02.17.
    //  Copyright © 2017 Рауф. All rights reserved.
    //
    
    import UIKit
    
    class RssCard : Card{
        
        var content_snippet:String
        
        init(title: String, author: String, published_date: String , published_date_human: String, type: String, logo: UIImage, cover: UIImage, content_snippet: String)
        {
            self.content_snippet = content_snippet
            super.init(title: title, author: author, published_date: published_date, published_date_human: published_date_human, type: type, logo: logo, cover: cover)
        }
    }
    
