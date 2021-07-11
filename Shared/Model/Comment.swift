//
//  LandmarkComment.swift
//  Landmarks
//
//  Created by niccari on 2021/07/11.
//

import Foundation

// Hashable needs to distinct each comment instancez
struct Comment: Hashable {
    var user: User
    var date: Date
    var text: String
    
    static func == (lhs: Comment, rhs: Comment) -> Bool {
        return
            lhs.user == rhs.user
            && lhs.date == rhs.date
            && lhs.text == rhs.text
    }


    func hash(into hasher: inout Hasher) {
        hasher.combine(user)
        hasher.combine(date)
        hasher.combine(text)
    }
}
