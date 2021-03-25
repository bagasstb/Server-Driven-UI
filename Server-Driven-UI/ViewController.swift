//
//  ViewController.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 19/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    fileprivate var homeViewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableInit()
        HomeServices.shared.fetchHomeData { (home) in
            if let home = home {
                let homeViewModel = HomeViewModel(home: home)
                self.homeViewModel = homeViewModel
                self.homeTableView.reloadData()
                print("Home Widget \(homeViewModel.widgets)")
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
        return homeViewModel?.widgets.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let widget = homeViewModel?.widgets[indexPath.row]
        let title = homeViewModel?.title[indexPath.row]
        switch widget {
        case .banner:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.cellIdentifier, for: indexPath) as! BannerTableViewCell
            cell.configure(with: title ?? "")
            return cell
        case .collection:
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.cellIdentifier, for: indexPath) as! CollectionTableViewCell
            cell.configure(with: title ?? "")
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
        let widget = homeViewModel?.widgets[indexPath.row]
        let title = homeViewModel?.title[indexPath.row]
        switch widget {
        case .banner:
            if title == nil {
                return .init(150)
            } else {
                return .init(180)
            }
        case .collection:
            return .init(200)
        case .list:
            return .init(400)
        case .none:
            return .init(0)
        }
    }
}
