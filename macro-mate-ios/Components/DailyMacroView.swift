
//
//  DailyMacroView.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/8/25.
//

import Foundation
import SwiftUI

import SwiftData

struct DailyMacroCardView: View {
    var protein: Double
    var carbs: Double
    var fat: Double
    var remainingCalories: Double
    

    var body: some View {
            VStack(spacing: 10) {
                // Macro Values (Protein, Carbs, Fat)
                HStack(spacing: 50) {
                    MacroItemView(value: protein, label: "Protein")
                    MacroItemView(value: carbs, label: "Carbs")
                    MacroItemView(value: fat, label: "Fat")
                }
                .padding(.horizontal)

                // Progress Bar for Remaining Calories
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Image(systemName: "pencil") // Edit icon
                            .foregroundColor(.gray)
                        
                        Text("\(remainingCalories, specifier: "%.1f") kcal Remaining")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    
                    ProgressView(value: remainingCalories / 2000) // Example total calories
                        .progressViewStyle(LinearProgressViewStyle())
                }
                .padding(.horizontal)

            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 3)
            .padding(.horizontal, 16)
    }
}

    // Macro Item View for Protein, Carbs, Fat
    struct MacroItemView: View {
        var value: Double
        var label: String

        var body: some View {
            VStack {
                Text("\(value, specifier: "%.1f")")
                    .font(.title2)
                    .foregroundColor(.red)
                    .bold()
                Text(label)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }

// Preview
#Preview {
    DailyMacroCardView(protein: 165, carbs: 165, fat: 40, remainingCalories: 1680)
}





