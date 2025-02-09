//
//  GoalModal.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/12/25.
//
import Foundation
import SwiftUI
import SwiftData

struct EditGoalsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var isSaving = false
    @State private var showConfirmation = false

    @Bindable var profile: Profile // ✅ Pass the profile for editing

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Edit Your Goals")) {
                    HStack {
                        Text("Goal Weight (lbs)")
                        Spacer()
                        TextField("180", value: $profile.weight, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 80)
                    }

                    HStack {
                        Text("Daily Calories")
                        Spacer()
                        TextField("2500", value: $profile.calories, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 80)
                    }

                    HStack {
                        Text("Daily Protein (g)")
                        Spacer()
                        TextField("150", value: $profile.protein, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 80)
                    }

                    HStack {
                        Text("Daily Carbs (g)")
                        Spacer()
                        TextField("200", value: $profile.carbohydrates, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 80)
                    }

                    HStack {
                        Text("Daily Fat (g)")
                        Spacer()
                        TextField("70", value: $profile.fat, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 80)
                    }
                }
            }
            .navigationTitle("Edit Goals")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        saveProfileChanges()
                    }
                    .fontWeight(.bold)
                    .disabled(isSaving)
                }
            }
            .alert("Profile Updated!", isPresented: $showConfirmation) {
                Button("OK", role: .cancel) { dismiss() }
            }
        }
    }

    private func saveProfileChanges() {
        isSaving = true // ✅ Prevents multiple taps

        // ✅ SwiftData automatically saves changes when modified
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isSaving = false
            showConfirmation = true // ✅ Show confirmation after saving
        }
    }
}

#Preview {
    EditGoalsView(profile: Profile(weight: 180, calories: 2500, protein: 150, carbohydrates: 200, fat: 70))
        .modelContainer(for: Profile.self, inMemory: true)
}
