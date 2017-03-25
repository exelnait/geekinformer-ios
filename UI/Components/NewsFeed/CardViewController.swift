//
//  NewsFeedViewController.swift
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
    fileprivate let rssCard_image = "rssCard(image)"
    fileprivate let itunesCard = "itunesCard"
    fileprivate let youtubeCard = "youtubeCard"
    
    var cards: [Card]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Parse.getNews().subscribe(onNext: { (data) -> Void in
            self.cards = data
            self.collectionView?.reloadData()
        })
        
        collectionView?.backgroundColor = UIColor.white
        
        
        collectionView?.register(UINib.init(nibName: "RssCell(Image)", bundle: nil), forCellWithReuseIdentifier: rssCard_image)
        collectionView?.register(UINib.init(nibName: "RssCell", bundle: nil), forCellWithReuseIdentifier: rssCard)
        collectionView?.register(UINib.init(nibName: "ItunesCell", bundle: nil), forCellWithReuseIdentifier: itunesCard)
        collectionView?.register(UINib.init(nibName: "YouTubeCell", bundle: nil), forCellWithReuseIdentifier: youtubeCard)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = cards?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if(cards?[indexPath.item].type == "rss" && cards?[indexPath.item].cover.cgImage == nil){
            
            return CGSize.init(width: view.frame.width, height: 300)
        }
        if(cards?[indexPath.item].type == "rss" && cards?[indexPath.item].cover.cgImage != nil){
            
            return CGSize.init(width: view.frame.width, height: 300)
        }
        if(cards?[indexPath.item].type == "youtube"){
            return CGSize.init(width: view.frame.width, height: 300)
        }
        else {
            return CGSize.init(width: view.frame.width, height: 150)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        
        if(cards?[indexPath.item].type == "rss" && cards?[indexPath.item].cover.cgImage == nil){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: rssCard, for: indexPath) as! RssCell
            (cell as! RssCell).Content.text = (cards?[indexPath.item] as! RssCard).content_snippet
            (cell as! RssCell).Title.text = cards?[indexPath.item].title
            (cell as! RssCell).Logo.image = cards?[indexPath.item].logo
            (cell as! RssCell).Author.text = cards?[indexPath.item].author
            (cell as! RssCell).Published_date_human.text = cards?[indexPath.item].published_date_human
        }
        else if(cards?[indexPath.item].type == "rss" && cards?[indexPath.item].cover.cgImage != nil){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: rssCard_image, for: indexPath) as! RssCell_Image
            (cell as! RssCell_Image).Cover.image = cards?[indexPath.item].cover
            (cell as! RssCell_Image).Title.text = cards?[indexPath.item].title
            (cell as! RssCell_Image).Logo.image = cards?[indexPath.item].logo
            (cell as! RssCell_Image).Author.text = cards?[indexPath.item].author
            (cell as! RssCell_Image).Published_date_human.text = cards?[indexPath.item].published_date_human
        }
        else if(cards?[indexPath.item].type == "itunes") {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: itunesCard, for: indexPath) as! ItunesCell
            (cell as! ItunesCell).Cover.image = cards?[indexPath.item].cover
            (cell as! ItunesCell).Title.text = cards?[indexPath.item].title
            (cell as! ItunesCell).Logo.image = cards?[indexPath.item].logo
            (cell as! ItunesCell).Author.text = cards?[indexPath.item].author
            (cell as! ItunesCell).Published_date_human.text = cards?[indexPath.item].published_date_human
        }
        else if(cards?[indexPath.item].type == "youtube") {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: youtubeCard, for: indexPath) as! YouTubeCell
            (cell as! YouTubeCell).Cover.image = (cards?[indexPath.item] as! YouTubeCard).cover
            (cell as! YouTubeCell).Title.text = cards?[indexPath.item].title
            (cell as! YouTubeCell).Logo.image = cards?[indexPath.item].logo
            (cell as! YouTubeCell).Author.text = cards?[indexPath.item].author
            (cell as! YouTubeCell).Published_date_human.text = cards?[indexPath.item].published_date_human
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 0, bottom: 10, right: 0)
    }
}
