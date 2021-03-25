//
//  HomeTableViewCell.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 22/03/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let cellIdentifier = "homeCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }

    
}
