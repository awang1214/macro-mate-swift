//
//  AddFoodModal.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/9/25.
//


/*
 In the Add food modal, List most recently added foods under the following and add it to the list view when
 clicking and saving on the food
 */
import SwiftUI
import SwiftData

struct AddFoodView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var foodName: String = ""
    @State private var calories: String = ""
    @State private var protein: String = ""
    @State private var carbs: String = ""
    @State private var fat: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Food Details")) {
                    TextField("Food Name", text: $foodName)
                    TextField("Calories", text: $calories)
                    TextField("Protein (g)", text: $protein)
                    TextField("Carbs (g)", text: $carbs)
                    TextField("Fat (g)", text: $fat)
                }
            }
            .toolbar {
                ToolbarItem() {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem() {
                    Button("Add") {
                        saveFood()
                        dismiss()
                    }
                    .fontWeight(.bold)
                    .disabled(foodName.isEmpty || calories.isEmpty || protein.isEmpty || carbs.isEmpty || fat.isEmpty)
                }
            }
        }
    }

    private func saveFood() {
        if let cal = Double(calories),
           let pro = Double(protein),
           let car = Double(carbs),
           let fa = Double(fat) {
            let newFood = Food(name: foodName, calories: cal, protein: pro, carbohydrates: car, fat: fa)
            modelContext.insert(newFood)
        }
    }
}

#Preview {
    AddFoodView()
        .modelContainer(for: Food.self, inMemory: true)
}
