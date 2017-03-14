    //  trends.swift
    //  GeekInformer
    
    //  Created by Рауф on 04.02.17.
    //  Copyright © 2017 Рауф. All rights reserved.
    //
    
    import UIKit
    
    class ItunesCard:Card{
        
        var audio_url:String
        
        
        init(title: String, author: String, published_date: String , published_date_human: String, type: String, logo: UIImage, cover: UIImage, audio_url: String)
        {
            self.audio_url = audio_url
            super.init(title: title, author: author, published_date: published_date, published_date_human: published_date_human, type: type, logo: logo, cover: cover)
        }
        
    }
    
