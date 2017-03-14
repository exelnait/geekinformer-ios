//
//  CardViewController.swift
//  GeekInformer
//
//  Created by Рауф on 24.02.17.
//  Copyright © 2017 Рауф. All rights reserved.
//

import Foundation
import UIKit
import UIKit
import RxSwift


class CardViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    fileprivate let rssCard = "rssCard"
    //fileprivate let rssImage = "rssImage"
    var cards: [Card]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Parse.getNews().subscribe(onNext: { (data) -> Void in
            self.cards = data
            self.collectionView?.reloadData()
        })
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(RssCell.self, forCellWithReuseIdentifier: rssCard)
        //collectionView?.register(RssImageCell.self, forCellWithReuseIdentifier: rssImage)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = cards?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: RssCell
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: rssCard, for: indexPath) as! RssCell
        
        
        cell.nameLabel.text = cards?[indexPath.item].title
        cell.image.image = cards?[indexPath.item].cover
        cell.logoImage.image = cards?[indexPath.item].logo
        cell.author.text = cards?[indexPath.item].author
        cell.date.text = cards?[indexPath.item].published_date_human
        if(cards?[indexPath.item].type == "rss" && cards?[indexPath.item].cover == nil){
            cell.content.text = (cards?[indexPath.item] as! RssCard).content_snippet
        }
        else {
            cell.content.text = ""
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 0, bottom: 10, right: 0)
    }
}
