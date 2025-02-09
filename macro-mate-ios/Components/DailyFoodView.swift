//
//  DailyFoodView.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/8/25.
//
import SwiftUI
import SwiftData


/*
 - Make it so swipe commands allow you to delete food
 - Eventually add Edit foods to commands
 */

struct DailyFoodView: View { // ✅ Renamed from FoodCardView
    @Environment(\.modelContext) private var modelContext
    @Query private var foodList: [Food]

    @State private var showAddFoodModal = false // ✅ Controls modal visibility

    var body: some View {
        VStack {
            // **Food List - Scrollable Cards**
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(foodList) { food in
                        FoodItemCard(food: food)
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(minHeight: 400, maxHeight: 950) // ✅ Expands dynamically before scrolling


            // **Add Food Button**
            HStack{
                Spacer()
                ActionButton(icon: "plus.circle", text: "") {
                    showAddFoodModal = true
                }
                Spacer()
            }
        }
        .sheet(isPresented: $showAddFoodModal) { // ✅ Opens modal
            AddFoodView()
        }
    }
}

// **✅ Food Item Card**
struct FoodItemCard: View {
    var food: Food

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(food.name)
                .font(.headline)

            Text("\(food.calories, specifier: "%.1f") kcal | P: \(food.protein, specifier: "%.1f")g | C: \(food.carbohydrates, specifier: "%.1f")g | F: \(food.fat, specifier: "%.1f")g")
                .font(.caption)
                .foregroundColor(.gray)

            Divider()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal, 16)
    }
}

#Preview {
    DailyFoodView()
        .modelContainer(for: Food.self, inMemory: true)
}
