//
//  ContentView.swift
//  NC2_Habit Tracker
//
//  Created by Firdavs Juraev on 05/12/23.
//

import SwiftUI

struct HabitModelView: View {
    
    @State private var addViewIsPresented: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                ScrollView {
                    VStack {
                                            Image("Chart")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 120, height: 155)
                                                .padding()
                                                .frame(maxWidth: .infinity, alignment: .top)
                        
                        Text("mammaMia")
                    }
                    //.padding()
                }
            }
            
            //.navigationTitle("My Habits")
            .toolbar{
                
                
                ToolbarItem (placement: .topBarLeading) {
                    Button(action:{}) {
                        Image(systemName: "ellipsis.circle")
                    }
                }
                
                ToolbarItem (placement: .topBarTrailing){
                    Button("Add", systemImage: "plus.circle.fill") {
                        addViewIsPresented.toggle()
                    }
                }
            }
            .sheet(isPresented: $addViewIsPresented) {
                plusView()
            }
        }
    }
       
    }


#Preview {
    HabitModelView()
}
