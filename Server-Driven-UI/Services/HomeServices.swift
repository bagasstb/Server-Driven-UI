//
//  HomeServices.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 21/03/21.
//

import Alamofire

struct HomeServices {
    
    static let shared = HomeServices()
    
    func fetchHomeData(_ callback: ((_: Home?)->Void)) {
        if let path = Bundle.main.path(forResource: "home", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    let homeData = try Home(object: jsonResult)
                    callback(homeData)
                }
            } catch let e {
                print("error \(e.localizedDescription)")
                callback(nil)
            }
        }
    }
}
