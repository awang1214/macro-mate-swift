//
//  CalendarView.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/8/25.
//

import Foundation

/*
 
TODO:
 - implement calendar view with each day -> clicking into a month can expand to the specific month to click a day
 - Each day is labeled with weight for that day, as well as green or red for hitting caloric goal
 - Clicking a day opens the daily view for that specific day
 - Add weight in Calendar View
 
*/
import SwiftUI
import SwiftData

struct CalendarView: View {
    @Binding var selectedDate: Date // ✅ Default to today
    @State private var weight: String = "" // ✅ User input for weight
    @Environment(\.modelContext) private var modelContext
    @Query private var weightEntries: [WeightEntry] // ✅ Fetch weight data

    private let calendar = Calendar.current

    var body: some View {
        NavigationStack {
            Spacer()
            Spacer()
            Spacer()
            VStack {
                // **Date Picker (Graphical Calendar)**
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.graphical) // ✅ Native Calendar UI
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .padding(.horizontal, 16)

                // **Weight Entry Section (HStack Card)**
                Spacer()
                HStack {
                    TextField("Enter weight", text: $weight)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Save") {
                        saveWeight()
                    }
                    .fontWeight(.bold)
                    .disabled(weight.isEmpty)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 3)
                .padding(.horizontal, 16)

                // **Show Saved Weight for Selected Date**
                if let weightForDate = getWeight(for: selectedDate) {
                    Text("Weight: \(weightForDate, specifier: "%.1f") lbs")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                } else {
                    Text("No weight recorded for \(formattedDate(selectedDate))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
                }

                Spacer()
            }
            .navigationTitle("Calendar")
        }
    }

    // **Helper Methods**
    private func saveWeight() {
        if let weightValue = Double(weight) {
            let newEntry = WeightEntry(date: selectedDate, weight: weightValue) // ✅ Save for selected date
            modelContext.insert(newEntry)
            weight = "" // ✅ Clear input after saving
        }
    }

    private func getWeight(for date: Date) -> Double? {
        return weightEntries.first(where: { calendar.isDate($0.date, inSameDayAs: date) })?.weight
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    CalendarView(selectedDate: .constant(Date()))
        .modelContainer(for: [Food.self, Profile.self, WeightEntry.self], isAutosaveEnabled: true)
}
