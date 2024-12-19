//
//  Int+DeclinationDays.swift
//  Surf_alexiosdev
//
//  Created by Алексей on 19.12.2024.
//

import Foundation

extension Int {
    func symbol() -> String {
        var dayString: String!
        if "1".contains("\(self % 10)") { dayString = "символ"}
        if "234".contains("\(self % 10)") { dayString = "символа" }
        if "567890".contains("\(self % 10)") { dayString = "символов"}
        if 11...14 ~= self % 100 { dayString = "символов"}
        return "\(self) " + dayString
    }
}
