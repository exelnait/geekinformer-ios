    //  trends.swift
    //  GeekInformer
    
    //  Created by Рауф on 04.02.17.
    //  Copyright © 2017 Рауф. All rights reserved.
    //
    
    import Foundation
    import UIKit
    
    class TrendsScreen{
        
        var name:String
        var image:UIImage
        var color:UIColor
        var fontcolor:UIColor
        var url:String
        var button:UIButton
        
        
        init(name: String, image: UIImage, color: UIColor, fontcolor: UIColor, url: String, button: UIButton)
        {
            self.name = name
            self.image = image
            self.color = color
            self.fontcolor = fontcolor
            self.url = url
            self.button = button
        }
        
}

