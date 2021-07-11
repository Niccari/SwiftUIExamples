//
//  User.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/11.
//

import Foundation

struct User: Hashable {
    var id: String
    var name: String
    var iconUrl: String
    
    static func == (lhs: User, rhs: User) -> Bool {
        return
            lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.iconUrl == rhs.iconUrl
    }


    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(iconUrl)
    }
}

