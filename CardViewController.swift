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


class CardViewController: UICollectionViewController{
    var image: [UIImage] = [#imageLiteral(resourceName: "error"),#imageLiteral(resourceName: "error"),#imageLiteral(resourceName: "error"),#imageLiteral(resourceName: "error"),#imageLiteral(resourceName: "error"),#imageLiteral(resourceName: "error"),#imageLiteral(resourceName: "error"),#imageLiteral(resourceName: "error"),#imageLiteral(resourceName: "error")]
    var text: [String] = ["loading","loading","loading","loading","loading","loading","loading","loading","loading",]
    override func viewDidLoad() {
    super.viewDidLoad()
        
        ApiManager.getUserNews().subscribe(onNext: { (data) -> Void in
            print("ALALAL", data.count)
            // Pumped out an int
            for i in 0...self.image.count-1{
                self.image[i] = data[i].cover
                self.text[i] = data[i].title
            }
            self.collectionView?.reloadData()
        }, onError: { (error) -> Void in
            // ERROR!
        })
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellForCollectionView
        cell.backgroundColor = UIColor.white
        cell.Label.text = text[indexPath.row]
        cell.ImgView.image = image[indexPath.row]
        
        return cell
    }
}
