    //  trends.swift
    //  GeekInformer
    
    //  Created by Рауф on 04.02.17.
    //  Copyright © 2017 Рауф. All rights reserved.
    //
    
    import UIKit
    
    class YouTubeCard:Card{
        
        var video_id:String
        
        
        init(title: String, author: String, published_date: String , published_date_human: String, type: String, logo: UIImage, cover: UIImage, video_id: String)
        {
            self.video_id = video_id
            super.init(title: title, author: author, published_date: published_date, published_date_human: published_date_human, type: type, logo: logo, cover: cover)
        }
        
    }
    
