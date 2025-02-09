//
//  ContentView.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        TabView {
            CalendarView(selectedDate: $selectedDate)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            DailyView(selectedDate: selectedDate)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Daily")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Food.self, Profile.self, WeightEntry.self], inMemory: true, isAutosaveEnabled: true)
}
