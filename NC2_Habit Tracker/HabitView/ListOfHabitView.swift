//
//  ListOfHabitView.swift
//  NC2_Habit Tracker
//
//  Created by Firdavs Juraev on 06/12/23.
//

import SwiftUI

//enum days {
//    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
//}
//let howOftenOptions = ["Daily(7 days)", "Weekdays(Mon-Fri)", "Weekly", "Monthly"]
//var howOften = howOftenOptions[0]
//var imoji = Image.self
//var habitName = ""
//
//class ListOfHabitView {
//    Habit(var habits = [howOften = howOftenOptions[0]], name = "brush teeth", imoji = "Chart")
//}
struct Habit: Identifiable {
    
    var id: UUID = UUID()
    
    
    var name: String
    var date: String = ""
    var imageName: String
}

class ListOfHabits {
    
    var habits = [
        Habit(name: "brush teeth", date: "Tuesday", imageName: "Chart"),
        Habit(name: "gym", date: "Sunday", imageName: "Julia"),
        Habit(name: "reading", date: "Saturday", imageName: "Marleen"),
        Habit(name: "sleeping", date: "Saturday", imageName: "Orasta"),
        Habit(name: "SwiftUI", date: "06/11/23", imageName: ""),
        Habit(name: "breakfast", date: "05/11/23", imageName: "Antonio")
    ]
}

