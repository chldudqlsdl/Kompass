//
//  Extension+ToDate.swift
//  Orum
//
//  Created by 차차 on 10/30/23.
//

import Foundation

extension String {
    func transformStringToDate() -> Date? { //"yyyy-MM-dd HH:mm"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone(identifier: "KST")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}
