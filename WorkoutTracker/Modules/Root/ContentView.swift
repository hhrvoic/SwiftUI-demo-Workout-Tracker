//
//  ContentView.swift
//  WorkoutTracker
//
//  Created by Hrvoje Hrvoić on 09/10/2019.
//  Copyright © 2019 Hrvoje Hrvoić. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    // To create a user interface with tabs, place views in a TabView and apply the tabItem(_:) modifier to the contents of each tab.

    var body: some View {
        TabView {
            LogWorkout()
            .tabItem {
                Image(systemName: "plus.circle")
            }
            
            WorkoutHistory()
                .tabItem {
                    Image(systemName: "calendar")
            }
        }
        .font(.title) // Make icons bigger
        .accentColor(Color(.systemOrange))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HistoryStore.instance)
    }
}
