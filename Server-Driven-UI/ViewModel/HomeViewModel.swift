//
//  HomeViewModel.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 21/03/21.
//

import Foundation

struct HomeViewModel {
  
    let title: String?
    let subtitle: String?
    let widget: Widgets?
    let type: WidgetType?
    
    init(widget: Widget) {
        self.title = widget.sectionTitle
        self.subtitle = widget.sectionSubtitle
        self.widget = Widgets.init(rawValue: widget.identifier)
        if let widgetType = widget.type {
            self.type = WidgetType.init(rawValue: widgetType)
        } else {
            self.type = nil
        }
    }
}

enum Widgets: String {
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

enum PictureFormat: String {
    case square = "SQUARE"
    case rectangle = "RECTANGLE"
    case circle = "CIRCLE"
}
