

import UIKit
import IGListKit

final class LabelSectionController: IGListSectionController, IGListSectionType {
    
    var object: String?
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 300)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
        cell.label.text = object
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
    
    func didSelectItem(at index: Int) {}
    
}
