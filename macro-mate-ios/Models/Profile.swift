//
//  Profile.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/9/25.
//

import Foundation
import SwiftData

@Model
class Profile {
    public var weight: Double
    public var calories: Double
    public var protein: Double
    public var carbohydrates: Double
    public var fat: Double
    
    init(weight: Double, calories: Double, protein: Double, carbohydrates: Double, fat: Double) {
        self.calories = calories
        self.weight = weight
        self.protein = protein
        self.carbohydrates = carbohydrates
        self.fat = fat
    }
}

