//
//  Home.swift
//  Server-Driven-UI
//
//  Created by bagasstb on 21/03/21.
//

import Marshal

struct Home: Unmarshaling {
    
    let widgets: [Widget]
    
    init(object: MarshaledObject) throws {
        widgets = try object.value(for: "widgets")
    }
}

struct Widget: Unmarshaling {
    
    let identifier: String
    let sectionTitle: String?
    let sectionSubtitle: String?
    let type: String?
    let style: Style?
    
    init(object: MarshaledObject) throws {
        identifier = try object.value(for: "identifier")
        sectionTitle = try object.value(for: "title")
        sectionSubtitle = try object.value(for: "secondaryTitle")
        type = try object.value(for: "type")
        style = try object.value(for: "style")
    }
}

struct Style: Unmarshaling {
    
    let backgroundColor: String?
    let pictureFormat: String?
    
    init(object: MarshaledObject) throws {
        backgroundColor = try object.value(for: "backgroundColor")
        pictureFormat = try object.value(for: "pictureFormat")
    }
}

