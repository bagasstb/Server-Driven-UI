//
//  CollectionTypeCollectionViewCell.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 22/03/21.
//

import UIKit

class CollectionTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    static let cellIdentifier = "collectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
    }

    static func nib() -> UINib {
        return UINib(nibName: "CollectionTypeCollectionViewCell", bundle: nil)
    }
}
