//
//  ProfileSummaryView.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/12/25.
//

import Foundation
import SwiftUI
import SwiftData


struct ProfileSummaryView: View {
    var profile: Profile // ✅ Accepts a Profile model

    var body: some View {
        VStack(spacing: 10) {
            // **Profile Header**
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Goal Weight")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text("\(profile.weight, specifier: "%.1f") lbs")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            }

            Divider()

            // **Macronutrients Section**
            HStack {
                ProfileItemView(label: "Calories", value: profile.calories, unit: "kcal", color: Color.red)
                ProfileItemView(label: "Protein", value: profile.protein, unit: "g", color: Color.green)
                ProfileItemView(label: "Carbs", value: profile.carbohydrates, unit: "g", color: Color.blue)
                ProfileItemView(label: "Fat", value: profile.fat, unit: "g", color: Color.orange)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
        .padding(.horizontal, 16)
    }
}

// **✅ Fixed ProfileItemView with Explicit Color Type**
struct ProfileItemView: View {
    var label: String
    var value: Double
    var unit: String
    var color: Color // ✅ Explicitly defining color as Color type

    var body: some View {
        VStack {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            Text("\(value, specifier: "%.1f") \(unit)")
                .font(.headline)
                .foregroundColor(color) // ✅ Now Color is properly inferred
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProfileSummaryView(profile: Profile(weight: 180, calories: 2500, protein: 150, carbohydrates: 200, fat: 70))
}
