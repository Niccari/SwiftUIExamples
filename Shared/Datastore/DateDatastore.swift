//
//  Date.swift
//  Landmarks
//
//  Created by niccari on 2021/07/11.
//

import Foundation

class DateDatastore {
    static let shared = DateDatastore()

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()


    func format(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
