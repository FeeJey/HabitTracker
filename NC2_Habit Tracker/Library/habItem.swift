//
//  habItem.swift
//  NC2_Habit Tracker
//
//  Created by Firdavs Juraev on 11/12/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
public final class habItem: Identifiable {
    @Attribute(.unique) public let id: UUID
    public var type: habitType.RawValue = habitType.weekly.rawValue
    public var desc: String = ""
    public var title: String = ""
    public var tags: [String] = []
    public var startDate: Date = Date.now
    public var endDate: Date = Date.now
    public var previousId: UUID?
    private var saved: Bool = false
    private var deleted: Bool = false

    enum habItemCodingKeys: CodingKey {
        case id
        case type
        case desc
        case tags
        case startDate
        case endDate
        case previousId
    }

    init(
        type: habitType = habitType.weekly,
        desc: String = "",
        tags: [String] = [],
        startDate: Date = Date.now,
        endDate: Date = Date.now,
        previousId: UUID? = nil
    ) {
        self.id = UUID()
        self.type = type.rawValue
        self.desc = desc
        self.tags = tags
        self.startDate = startDate
        self.endDate = endDate
        self.previousId = previousId ?? nil
    }

    init(_ item: habItem ) {
        self.id = UUID()
        self.type = item.type
        self.desc = item.desc
        self.tags = item.tags
        self.startDate = item.startDate
        self.endDate = item.endDate
        self.previousId = item.previousId
    }
}

extension habItem {
    @Transient
    public var typeAsHabitType: habitType {
        get {
            (habitType(rawValue: self.type))!
        }
        set(rawValue) {
            self.type = rawValue.rawValue
        }
    }

    @Transient
    public var typeAsInt: Int {
        get {
            return habitType.allCases.firstIndex { value in value == self.typeAsHabitType } ?? 0
        }
        set(index) {
            self.type = habitType.allCases[index].rawValue
        }
    }
}

extension habItem {
    public func addTags(_ tags: String...) -> habItem {
        for tag in tags {
            self.tags.append(tag)
        }
        return self
    }

    public func saveInto(_ modelContext: ModelContext, _ endDate: Date? = nil) {
        if !saved {
            self.saved = true
            self.endDate = endDate ?? self.endDate
            modelContext.insert(self)
            do {
                try modelContext.save()
            } catch {
                #if DEBUG
                print(error.localizedDescription)
                #endif
            }
        }
    }

    public func deleteFrom(_ modelContext: ModelContext) {
        if !deleted {
            modelContext.delete(self)
            self.deleted = true
            do {
                try modelContext.save()
            } catch {
                #if DEBUG
                print(error.localizedDescription)
                #endif
            }
        }
    }

    public func to(_ type: habitType) -> habItem {
        self.type = type.rawValue
        print(self.type)
        return self
    }

    public func startsAt(_ date: Date) -> habItem {
        self.startDate = date
        return self
    }

    public func endsAt(_ date: Date) -> habItem {
        self.endDate = date
        return self
    }

    public func startsNow() -> habItem {
        let date = Date.now
        self.startDate = date
        self.endDate = date
        return self
    }

    public func endsNow() -> habItem {
        self.endDate = Date.now
        return self
    }
}
