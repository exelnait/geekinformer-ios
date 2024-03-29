///**
// Copyright (c) 2016-present, Facebook, Inc. All rights reserved.
// 
// The examples provided by Facebook are for non-commercial testing and evaluation
// purposes only. Facebook reserves all rights not expressly granted.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// */
//
//import UIKit
//import IGListKit
//
//final class WorkingRangeSectionController: IGListSectionController, IGListSectionType, IGListWorkingRangeDelegate {
//    
//    var height: Int?
//    var downloadedImage: UIImage?
//    var task: URLSessionDataTask?
//    
//    var urlString: String? {
//        guard let height = height,
//            let width = collectionContext?.containerSize.width
//            else { return nil }
//        return "https://unsplash.it/" + width.description + "/" + height.description
//    }
//    
//    deinit {
//        task?.cancel()
//    }
//    
//    override init() {
//        super.init()
//        workingRangeDelegate = self
//    }
//    
//    func numberOfItems() -> Int {
//        return 2
//    }
//    
//    func sizeForItem(at index: Int) -> CGSize {
//        let width: CGFloat = collectionContext?.containerSize.width ?? 0
//        let height: CGFloat = CGFloat(index == 0 ? 55 : (self.height ?? 0))
//        return CGSize(width: width, height: height)
//    }
//    
//    func cellForItem(at index: Int) -> UICollectionViewCell {
//        let cellClass: AnyClass = index == 0 ? ImageCell.self : ImageCell.self
//        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
////        if let cell = cell as? LabelCell {
////            cell.label.text = urlString
////        } else if let cell = cell as? ImageCell {
////            cell.setImage(image: downloadedImage)
////        }
//        return cell
//    }
//    
//    func didUpdate(to object: Any) {
//        self.height = object as? Int
//    }
//    
//    func didSelectItem(at index: Int) {}
//    
//    //MARK: IGListWorkingRangeDelegate
//    
//    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerWillEnterWorkingRange sectionController: IGListSectionController) {
////        guard downloadedImage == nil,
////            task == nil,
////            let urlString = urlString,
////            let url = URL(string: urlString)
////            else { return }
//        
//        let section = collectionContext?.section(for: self) ?? 0
//
//        task?.resume()
////        guard downloadedImage == nil,
////            task == nil,
////            let urlString = urlString,
////            let _ = URL(string: urlString)
////            else { return }
//        //task = URLSession.shared.dataTask(with: url) { data, response, err in
//            DispatchQueue.main.async {
//                ApiManager.getUserNews().subscribe(onNext: { (data) -> Void in
//                    print("start")
//                let image = data[section].logo
//                self.downloadedImage = image
//                if let cell = self.collectionContext?.cellForItem(at: 1, sectionController: self) as? ImageCell {
//                    cell.setImage(image: image)
//                }
//                    print("stop")
//            })
//                
//        }
//    }
////        }
////        task?.resume()
//    
//
//    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerDidExitWorkingRange sectionController: IGListSectionController) {}
//    
//}


/**
 Copyright (c) 2016-present, Facebook, Inc. All rights reserved.
 
 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit
import IGListKit

final class WorkingRangeSectionController: IGListSectionController, IGListSectionType, IGListWorkingRangeDelegate {
    
    var height: Int?
    var downloadedImage: UIImage?
    var task: URLSessionDataTask?
    
    var urlString: String? {
        guard let height = height,
            let width = collectionContext?.containerSize.width
            else { return nil }
        return "https://unsplash.it/" + width.description + "/" + height.description
    }
    
    deinit {
        task?.cancel()
    }
    
    override init() {
        super.init()
        workingRangeDelegate = self
    }
    
    func numberOfItems() -> Int {
        return 2
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        let height: CGFloat = CGFloat(index == 0 ? 55 : (self.height ?? 0))
        return CGSize(width: width, height: height)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: AnyClass = index == 1 ? ImageCell.self : LabelCell.self
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        if let cell = cell as? ImageCell {
            cell.setImage(image: downloadedImage)
        }
        else if let cell = cell as? LabelCell {
            cell.label.text = urlString
        }
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.height = object as? Int
    }
    
    func didSelectItem(at index: Int) {}
    
    //MARK: IGListWorkingRangeDelegate
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerWillEnterWorkingRange sectionController: IGListSectionController) {
//        guard downloadedImage == nil,
//            task == nil,
//            let urlString = urlString,
//            let url = URL(string: urlString)
//            else { return }
        
        let section = collectionContext?.section(for: self) ?? 0
        print("Downloading image \(urlString) for section \(section)")
        
//        task = URLSession.shared.dataTask(with: url) { data, response, err in
//            guard let data = data, let image = UIImage(data: data) else {
//                return print("Error downloading \(urlString): \(err)")
//            }
            DispatchQueue.main.async {
//                self.downloadedImage = image
//                if let cell = self.collectionContext?.cellForItem(at: 1, sectionController: self) as? ImageCell {
//                    cell.setImage(image: image)
//                }
                                ApiManager.getUserNews().subscribe(onNext: { (data) -> Void in
                                    print("start")
                                let image = data[section].logo
                                self.downloadedImage = image
                                if let cell = self.collectionContext?.cellForItem(at: 1, sectionController: self) as? ImageCell {
                                    cell.setImage(image: image)
                                }
                                    print("stop")
                            })
            }
//        }
//        task?.resume()
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerDidExitWorkingRange sectionController: IGListSectionController) {}
    
}
