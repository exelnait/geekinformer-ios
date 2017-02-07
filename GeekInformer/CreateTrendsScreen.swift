//
//  CreateTrendsScreen.swift
//  GeekInformer
//
//  Created by Рауф on 06.02.17.
//  Copyright © 2017 Рауф. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


public class createTrendsView: UIViewController{

    @IBOutlet weak var view: UIScrollView!
    @IBOutlet weak var myScrollView: UIScrollView!
class func createTrendsView(objects: [TrendsScreen]=[]){
    //let myImages=["error.png","error.png","error.png","error.png","error.png","error.png","error.png","error.png"]
    let imageWidth:CGFloat = 95
    let imageHeight:CGFloat = 170
    let imagebackHeight:CGFloat = 200
    var xPosition:CGFloat = 10
    let yPosition:CGFloat = 10
    let spacer:CGFloat = 5
    var scrollViewContentSize:CGFloat=0;
    for index in 0 ..< objects.count
    {
        //let myImages = objects[index].image
        let myImage:UIImage = objects[index].image
        let backImageView:UIImageView = UIImageView()
        let myImageView:UIImageView = UIImageView()
        
        let label:UILabel = UILabel.init(frame: CGRect.init(x: xPosition, y: yPosition+100, width: imageWidth, height: 0))
        label.text = objects[index].name
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.init(name: "Roboto", size: 16)
        label.textColor = objects[index].fontcolor
        label.sizeToFit()
        
        let button:UIButton = UIButton.init(frame: CGRect.init(x: xPosition, y: yPosition+imageHeight, width: imageWidth, height: 40))
        var backgrondcolor:UIColor = objects[index].color
        backgrondcolor = backgrondcolor.darker(by: 20)!
        button.backgroundColor = backgrondcolor
        button.isHighlighted = true
        button.titleLabel?.font = UIFont.init(name: "Roboto", size: 14)
        button.setTitle("Подписаться", for: .normal)
        button.setTitleColor(objects[index].fontcolor, for: .normal)
        
        myImageView.image = myImage
        myImageView.contentMode = UIViewContentMode.scaleAspectFit
        myImageView.frame.size.width = imageWidth
        myImageView.frame.size.height = imageHeight
        myImageView.center = view.center
        myImageView.frame.origin.x = xPosition
        myImageView.frame.origin.y = yPosition-40
        
        backImageView.backgroundColor=objects[index].color
        backImageView.frame.size.width = imageWidth
        backImageView.frame.size.height = imagebackHeight
        backImageView.center = view.center
        backImageView.frame.origin.x = xPosition
        backImageView.frame.origin.y = yPosition
        
        myScrollView.addSubview(backImageView)
        myScrollView.addSubview(myImageView)
        myScrollView.addSubview(label)
        myScrollView.addSubview(button)
        
        xPosition+=imageWidth + spacer
        scrollViewContentSize+=imageHeight + spacer
        myScrollView.contentSize = CGSize(width:self.myScrollView.frame.width*4.1, height:self.myScrollView.frame.height)
    }
    }
}
