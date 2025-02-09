//
//  WeightEntry.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/9/25.
//

import Foundation
import SwiftData

@Model
class WeightEntry {
    var date: Date
    var weight: Double

    init(date: Date, weight: Double) {
        self.date = date
        self.weight = weight
    }
}
