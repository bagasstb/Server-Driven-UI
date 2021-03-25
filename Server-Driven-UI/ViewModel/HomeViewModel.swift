//
//  HomeViewModel.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 21/03/21.
//

import Foundation

struct HomeViewModel {
  
    var title: [String?] = []
    let widgets: [WidgetList]
    
    init(home: Home) {
        var collection: [WidgetList] = []
        for widget in home.widgets {
            let widgetId = WidgetList.init(rawValue: widget.identifier)
            if let widgetId = widgetId {
                collection.append(widgetId)
                self.title.append(widget.sectionTitle)
            }
        }
        
        widgets = collection
    }
}

enum WidgetList: String {
    case banner = "BANNER"
    case collection = "CAROUSEL"
    case list = "LIST"
}

enum WidgetType: String {
    case standard = "STANDARD"
    case bullet = "BULLET"
    case organization = "ORGANIZATION"
    case complate = "COMPLETE"
    case story = "STORY"
    case playlist = "PLAYLIST"
    case artist = "ARTIST"
    case parent = "PARENT-WIDGET"
    case vertical = "VERTICAL"
}
