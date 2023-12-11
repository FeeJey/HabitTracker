//
//  SingleHabitView.swift
//  NC2_Habit Tracker
//
//  Created by Firdavs Juraev on 11/12/23.
//

import SwiftUI


struct SingleHabitView: View {
    
    
    @State private var title: String = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            VStack(alignment: .center) {
                Text(title)
                    .font(.largeTitle)
                    .fontDesign(.serif)
                    .fontWeight(.black)
            }
        }
    }
}

#Preview {
    SingleHabitView()
}
