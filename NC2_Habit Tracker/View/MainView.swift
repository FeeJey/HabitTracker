//
//  MainView.swift
//  NC2_Habit Tracker
//
//  Created by Firdavs Juraev on 05/12/23.
//

import SwiftUI

struct MainView: View {
    
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            HabitModelView()
                .tabItem {
                    Label("Habits", systemImage: "figure.mind.and.body")
                }.tag(1)
            
            TrackHomeView()
                .tabItem {
                    Label("Track", systemImage: "point.bottomleft.filled.forward.to.point.topright.scurvepath")
                }.tag(2)
            
            SettingsModelView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }.tag(3)
        }
    }
}

#Preview {
    MainView()
}
