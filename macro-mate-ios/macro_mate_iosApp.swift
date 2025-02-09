//
//  macro_mate_iosApp.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/8/25.
//

import SwiftUI
import SwiftData

@main
struct macro_mate_iosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Food.self, Profile.self, WeightEntry.self], isAutosaveEnabled: true)
    }
}
