//
//  ListTableViewCell.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 22/03/21.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "listCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "ListTableViewCell", bundle: nil)
    }
    
    public func configure(with: String) {
        titleLabel.text = with
    }
    
}
