//
//  DailyView.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/8/25.
//

import Foundation

import SwiftUI
import SwiftData

/*
Zstack of cards with a camera button on the bottom right

 
TO-DO:
 - Add a Today Title to a button that resets page macros to the current date
 - Include a camera button to take a picture of food
 - Left middle right buttons at bottom:
 - Add weight
 - Add food
 - Camera to add food
 
 - Add logic for Pulling in respective dates foods 
 
*/

struct DailyView: View {
    var selectedDate: Date

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // **Pinned Daily Macro Card**
                DailyMacroCardView(protein: 165, carbs: 165, fat: 40, remainingCalories: 1680)
                    .padding(.horizontal, 16)
                    .shadow(radius: 3)

                // **Expandable Food List**
                DailyFoodView()
                    .padding(.horizontal, 16)

                // **Bottom Action Buttons**
//                HStack {
//                    ActionButton(icon: "scalemass", text: "Add Weight") {
//                        // Add weight action
//                    }
//                    Spacer()
//                    ActionButton(icon: "camera", text: "Camera") {
//                        // Camera action
//                    }
//                }
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
            }
            .navigationTitle(formattedDate(selectedDate)) // ✅ Sets navigation title to selected date
        }
        .modelContainer(for: Food.self, inMemory: true)
    }

    // **Helper Method: Format the Selected Date**
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

// **Reusable Action Button**
struct ActionButton: View {
    var icon: String
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)

                Text(text)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    DailyView(selectedDate: Date())
        .modelContainer(for: [Food.self, Profile.self, WeightEntry.self], isAutosaveEnabled: true)
}
