//
//  ViewController.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 19/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    fileprivate var homeModel: Home?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableInit()
        HomeServices.shared.fetchHomeData { [weak self] (home) in
            if let home = home {
                self?.homeModel = home
                self?.homeTableView.reloadData()
            }
        }
    }
    
    private func tableInit() {
        homeTableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.cellIdentifier)
        homeTableView.register(BannerTableViewCell.nib(), forCellReuseIdentifier: BannerTableViewCell.cellIdentifier)
        homeTableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.cellIdentifier)
        homeTableView.register(ListTableViewCell.nib(), forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeModel?.widgets.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let homeViewModel = HomeViewModel(widget: homeModel!.widgets[indexPath.row])
        switch homeViewModel.widget {
        case .banner:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.cellIdentifier, for: indexPath) as! BannerTableViewCell
            cell.configure(with: title ?? "")
            return cell
        case .collection:
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.cellIdentifier, for: indexPath) as! CollectionTableViewCell
            cell.configure(with: homeViewModel)
            return cell
        case .list:
            let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as! ListTableViewCell
            cell.configure(with: title ?? "")
            return cell
        case .none:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.cellIdentifier, for: indexPath)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let widget = Widgets.init(rawValue: homeModel?.widgets[indexPath.row].identifier ?? "")
        let title = homeModel?.widgets[indexPath.row].sectionTitle
        switch widget {
        case .banner:
            if title == nil {
                return .init(150)
            } else {
                return .init(180)
            }
        case .collection:
            return (title == nil) ? .init(200) : .init(230)
        case .list:
            return .init(400)
        case .none:
            return .init(0)
        }
    }
}
