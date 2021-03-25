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
    let list: [[String: Any]]?
    
    init(object: MarshaledObject) throws {
        identifier = try object.value(for: "identifier")
        sectionTitle = try object.value(for: "sectionTitle")
        list = try object.value(for: "list")
    }
}

