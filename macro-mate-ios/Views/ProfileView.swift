//
//  ProfileView.swift
//  macro-mate-ios
//
//  Created by Alan Wang on 2/9/25.
//

import Foundation
import SwiftUI
import SwiftData

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var showEditGoalModal = false
    @Query private var profiles: [Profile] // ✅ Fetch stored profile dynamically

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if let profile = profiles.first { // ✅ Display existing profile
                    ProfileSummaryView(profile: profile)
                } else {
                    Text("No profile found.")
                        .foregroundColor(.gray)
                        .font(.title2)
                        .padding()

                    Button("Create Profile") {
                        Task {
                            await createAndEditProfile() // ✅ Create a new profile safely
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                Spacer()

                // **Edit Profile Button**
                Button(action: {
                    showEditGoalModal = true
                }) {
                    HStack {
                        Image(systemName: "pencil.circle")
                        Text("Edit Profile")
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20) // ✅ Adjusted spacing
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $showEditGoalModal) {
                if let existingProfile = profiles.first {
                    EditGoalsView(profile: existingProfile) // ✅ Open edit modal
                }
            }
        }
        .modelContainer(for: Profile.self, isAutosaveEnabled: true)
    }
    
    // **✅ Fixed Function to Create and Edit a Profile**
    @MainActor
    private func createAndEditProfile() async {
        if profiles.isEmpty { // ✅ Ensure only one profile exists
            let newProfile = Profile(weight: 180, calories: 2500, protein: 150, carbohydrates: 200, fat: 70)
            modelContext.insert(newProfile) // ✅ Persist new profile

            // ✅ Delay UI update to ensure profile is created before modal opens
            await Task.sleep(UInt64(0.2 * 1_000_000_000))
        }
        showEditGoalModal = true // ✅ Open modal after insertion
    }
}

#Preview {
    ProfileView()
        .modelContainer(for: Profile.self, inMemory: true, isAutosaveEnabled: true)
}
