//
//  NewsViewController.swift
//  GeekInformer
//
//  Created by Рауф on 12.02.17.
//  Copyright © 2017 Рауф. All rights reserved.
//

import Foundation
import UIKit
import IGListKit
import RxSwift

final class NewsViewController : UIViewController, IGListAdapterDataSource, UIScrollViewDelegate {

        
        lazy var adapter: IGListAdapter = {
            return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        }()
        let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        lazy var items = Array(0...20)
        var loading = false
        let spinToken = "spinner"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(collectionView)
            adapter.collectionView = collectionView
            adapter.dataSource = self
            adapter.scrollViewDelegate = self
            ApiManager.getUserNews().subscribe(onNext: { (data) -> Void in
                // Pumped out an int
                print(data)
            }, onError: { (error) -> Void in
                // ERROR!
            }, onCompleted: { () -> Void in
                // There are no more signals
            }) { () -> Void in
                // We disposed this subscription
            }
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            collectionView.frame = view.bounds
        }
        
        //MARK: IGListAdapterDataSource
        
        func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
            var objects = items as [IGListDiffable]
            
            if loading {
                objects.append(spinToken as IGListDiffable)
            }
            
            return objects
        }
        
        func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
            if let obj = object as? String, obj == spinToken {
                return spinnerSectionController()
            } else {
                return LabelSectionController()
            }
        }
    
        func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }
        
        //MARK: UIScrollViewDelegate
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
            if !loading && distance < 200 {
                loading = true
                adapter.performUpdates(animated: true, completion: nil)
                DispatchQueue.global(qos: .default).async {
                    // fake background loading task
                    sleep(2)
                    DispatchQueue.main.async {
                        self.loading = false
                        let itemCount = self.items.count
                        self.items.append(contentsOf: Array(itemCount..<itemCount + 100))
                        self.adapter.performUpdates(animated: true, completion: nil)
                    }
                }
            }
        }
    }

