//
//  BannerTableViewCell.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 22/03/21.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    static let cellIdentifier = "bannerCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerImageView.layer.cornerRadius = 10
    }

    static func nib() -> UINib {
        return UINib(nibName: "BannerTableViewCell", bundle: nil)
    }
    
    public func configure(with: String) {
        if with == "" {
            titleLabel.isHidden = true
        } else {
            titleLabel.isHidden = false
            titleLabel.text = with
        }
    }
}
