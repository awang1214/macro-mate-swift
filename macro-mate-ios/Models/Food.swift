//
//  Food.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/8/25.
//

import Foundation
import SwiftData

@Model
class Food {
    public var name: String
    public var calories: Double
    public var protein: Double
    public var carbohydrates: Double
    public var fat: Double
    
    init(name: String, calories: Double, protein: Double, carbohydrates: Double, fat: Double) {
        self.calories = calories
        self.name = name
        self.protein = protein
        self.carbohydrates = carbohydrates
        self.fat = fat
    }
}

