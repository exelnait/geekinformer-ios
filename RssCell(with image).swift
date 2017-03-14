////
////  RssCell.swift
////  GeekInformer
////
////  Created by Рауф on 12.03.17.
////  Copyright © 2017 Рауф. All rights reserved.
////
//
//import UIKit
//
//
//class RssImageCell : RssCell{
//    
//    
//    override init(frame: CGRect){
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    let image: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage.init(named: "photo")
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//    
//    
//    override func setupViews() {
//        backgroundColor = UIColor.red
//        
//        //addSubview(dividerLineView)
//        addSubview(image)
//        addSubview(nameLabel)
//        addSubview(content)
//        
//        if(image.frame.size.height != CGFloat.init(0)){
//            nameLabel.frame = CGRect.init(x: 0, y: frame.height+10, width: frame.width, height: 10)
//            content.frame = CGRect.init(x: 0, y: frame.height+30, width: frame.width, height: frame.height/2)
//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2][v3]|", options: NSLayoutFormatOptions(), metrics: nil, views: [ "v2": nameLabel, "v3": content]))
//        }
//        else {
//            image.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height/2)
//            nameLabel.frame = CGRect.init(x: 0, y: frame.height-image.frame.height, width: frame.width, height: 10)
//            content.frame = CGRect.init(x: 0, y: frame.height-image.frame.height+30, width: frame.width, height: frame.height/2)
//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1][v2][v3]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": image, "v2": nameLabel, "v3": content]))
//        }
//        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
//        
//        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v1][v2(80)][v3]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": image, "v2": nameLabel, "v3": content]))
//        
//    }
//    
//}
