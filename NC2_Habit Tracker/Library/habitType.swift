//
//  habitType.swift
//  NC2_Habit Tracker
//
//  Created by Firdavs Juraev on 11/12/23.
//

import Foundation

public enum habitType: String, Codable, CaseIterable {
    case daily = "a Day", weekly = "a Week", monthly = "a Month", yearly = "a Year"
}

public enum habitTypeDaily: String {
   case oneTime = "once", twoTimes = "twice", threeTimes = "3 times", fourTimes = "4 times", fiveTimes = "5 times"
}

public enum habitTypeWeekly: String {
    case monday = "Mon", tuesday = "Tue", wednesday = "Wed", thursday = "Thu", friday = "Fri", saturday = "Sat", sunday = "Sun"
}

public enum habitTypeMonthly: String {
    case oneTime = "once", twoTimes = "twice", threeTimes = "3 times", fourTimes = "4 times", fiveTimes = "5 times"
}

public enum habitTypeYearly: String {
    case january = "Jan", february = "Feb", march = "Mar", april = "Apr", may = "May", june = "Jun", july = "Jul", september = "Sep", october = "Oct", november = "Nov", december = "Dec"
}
