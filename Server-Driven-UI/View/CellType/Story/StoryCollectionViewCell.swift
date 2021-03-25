//
//  StoryCollectionViewCell.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 25/03/21.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    static let cellIndentifier  = "storyCell"
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = (UIScreen.main.bounds.width / 4) / 2
    }

    static func nib() -> UINib {
        return UINib(nibName: "StoryCollectionViewCell", bundle: nil)
    }
}
