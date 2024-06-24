//
//  Extensions.swift
//  FYP
//
//  Created by Mason Stephens on 24/06/2024.
//

import Foundation

extension Date {
    func adding (_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date? {
        return calendar.date(byAdding: component, value: value, to: self)
    }

    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}
