//
//  RssCell.swift
//  GeekInformer
//
//  Created by Рауф on 12.03.17.
//  Copyright © 2017 Рауф. All rights reserved.
//

import UIKit


class RssCell : UICollectionViewCell{
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 21.0)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var author: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var date: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let content: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "photo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "photo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(content)
        addSubview(image)
        addSubview(logoImage)
        addSubview(author)
        addSubview(date)
        
        image.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height/2)
        nameLabel.frame = CGRect.init(x: 0, y: frame.height/2, width: frame.width, height: 20)
        content.frame = CGRect.init(x: 0, y: frame.height+10, width: frame.width, height: 20)
        logoImage.frame = CGRect.init(x: 10, y: frame.height-50, width: 40, height: 40)
        author.frame = CGRect.init(x: 60, y: frame.height, width: 40, height: 10)
        date.frame = CGRect.init(x: 60, y: frame.height, width: 40, height: 10)
        
//        image.backgroundColor = UIColor.green
//        nameLabel.backgroundColor = UIColor.brown
//        logoImage.backgroundColor = UIColor.cyan
//        author.backgroundColor = UIColor.cyan
//        date.backgroundColor = UIColor.gray
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : image]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-[v1]-10-[v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : image, "v1" : nameLabel, "v2" : logoImage]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-5-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : logoImage, "v1" : author]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-5-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : logoImage, "v1" : date]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v3]-[v0]-[v1][v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: [ "v3" : image, "v0":nameLabel, "v1" : author, "v2" : date]))
        
    }
    
}
