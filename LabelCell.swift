

import UIKit

class LabelCell: UICollectionViewCell {
    
    fileprivate static let insets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
    fileprivate static let font = UIFont.systemFont(ofSize: 17)
    
    static var singleLineHeight: CGFloat {
        return font.lineHeight + insets.top + insets.bottom
    }
    
    let imageWidth:CGFloat = 95
    let imageHeight:CGFloat = 170
    
    let view: UIImageView = {
        let view = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 320, height: 270))
        view.image = UIImage.init(named: "photo.jpg")
        view.contentMode = UIViewContentMode.top
        //view.backgroundColor = UIColor.blue
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .red
        label.numberOfLines = 1
        label.font.withSize(5)
        label.font = LabelCell.font
        return label
    }()
    
    let separator: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor(red: 200/255.0, green: 199/255.0, blue: 204/255.0, alpha: 1).cgColor
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(view)
        view.addSubview(label)
        //contentView.layer.addSublayer(separator)
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = contentView.bounds
        //label.frame = UIEdgeInsetsInsetRect(bounds, LabelCell.insets)
        label.frame = CGRect.init(x: 0, y: (view.image?.size.height)!, width: view.frame.width, height: view.frame.height-(view.image?.size.height)!)
        let height: CGFloat = 0.5
        let left = LabelCell.insets.left
        separator.frame = CGRect(x: left, y: bounds.height - height, width: bounds.width - left, height: height)
    }
    
    override var isHighlighted: Bool {
        didSet {
            contentView.backgroundColor = UIColor(white: isHighlighted ? 0.9 : 1, alpha: 1)        }
    }
    
}
