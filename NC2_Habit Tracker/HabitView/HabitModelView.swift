//
//  ContentView.swift
//  NC2_Habit Tracker
//
//  Created by Firdavs Juraev on 05/12/23.
//

import SwiftUI
import SwiftData

struct HabitModelView: View {
    
    @State private var addViewIsPresented: Bool = false
    @State var viewModel = ListOfHabits()
    @State var searcherbar: String = ""
    @Environment(\.colorScheme) var colorscheme
    
    @Query(filter: #Predicate<habItem> { habit in
        habit.type == "Feeling"
    }, sort: \habItem.startDate, order: .reverse)
    var feelingItems: [habItem]

    @Query(filter: #Predicate<habItem> { habit in
        habit.type != "Feeling"
    }, sort: \habItem.startDate, order: .reverse)
    var notFeelingItems: [habItem]
    
    var body: some View {
        NavigationStack {
                ScrollView {
                    VStack{
                        ForEach(viewModel.habits) { habit in
                            NavigationLink {
                                HabitDetailView(habit: habit)
                            } label: {
                                HStack {
                                    Image(systemName: "person.fill")
                                        .imageScale(.large)
                                    
                                    Text(habit.name)
                                        .font(.title2)
                                        .bold()
                                }
                                .padding(.trailing)
                            }
                            .foregroundColor(colorscheme == .light ? .black : .white)
                            Divider()
                        }
                    }
                }
//            ScrollView(.horizontal) /*making horizontally scrollable*/ {
//                HStack(spacing: 16) {
//                    ForEach(feelingItems) { item in //each time when u press, it goes to the same page
//                        NavigationLink {
//                            HabitItemView(trackItem: item)
//                        } label: {
//                            TrackFeelingItemRow(trackItem: item)
//                                .contextMenu {
//                                    Button("Delete", systemImage: "trash", role: .destructive) {
//                                        item.deleteFrom(modelContext)
//                                    }
//                                } preview: {
//                                    TrackItemPreviewView(trackItem: item)
//                                }
//                        }
//                    }
//                }
//                .padding(.horizontal)
//            }
//            .scrollClipDisabled()
                .navigationTitle("My Habits")
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
                .searchable(text: $searcherbar, prompt: "Search")
        }
    }
       
        var searchResults: [Habit] {
            if searcherbar.isEmpty {
                return viewModel.habits
            } else {
                return viewModel.habits.filter { $0.name.lowercased().range(of:searcherbar.lowercased()) != nil }
            }
        }
    
}

#Preview {
    HabitModelView()
}
