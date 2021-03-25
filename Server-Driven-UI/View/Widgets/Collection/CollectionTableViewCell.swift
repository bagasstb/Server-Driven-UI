//
//  CollectionTableViewCell.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 22/03/21.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let cellIdentifier = "collectionCell"
    private var widgetType: WidgetType?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        collectionView.register(CollectionTypeCollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionTypeCollectionViewCell.cellIdentifier)
        collectionView.register(StoryCollectionViewCell.nib(), forCellWithReuseIdentifier: StoryCollectionViewCell.cellIndentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    public func configure(with: HomeViewModel) {
        setTitle(with.title)
        setSubtitle(with.subtitle)
        widgetType = with.type
        collectionView.reloadData()
    }
    
    private func setTitle(_ title: String?) {
        if let title = title {
            titleLabel.text = title
            titleLabel.isHidden = false
        } else {
            titleLabel.isHidden = true
        }
    }
    
    private func setSubtitle(_ subtitle: String?) {
        if let subtitle = subtitle {
            subtitleLabel.text = subtitle
            subtitleLabel.isHidden = false
        } else {
            subtitleLabel.isHidden = true
        }
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let type = widgetType {
            switch type {
            case .story:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.cellIndentifier, for: indexPath)
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionTypeCollectionViewCell.cellIdentifier, for: indexPath)
                return cell
            }
        }
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionTypeCollectionViewCell.cellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let type = widgetType {
            switch type {
            case .story:
                return .init(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4)
            default:
                return .init(width: UIScreen.main.bounds.width / 2.7, height: collectionView.frame.height)
            }
        } else {
            return .init(width: UIScreen.main.bounds.width / 2.7, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
