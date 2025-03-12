//
//  MealEntry.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 3/12/25.
//

import SwiftData
import Foundation

@Model
class MealEntry {
    var food: Food
    var dateAdded: Date
    var servingSize: Double

    init(food: Food, dateAdded: Date, servingSize: Double = 1.0) {
        self.food = food
        self.dateAdded = dateAdded
        self.servingSize = servingSize
    }
}
