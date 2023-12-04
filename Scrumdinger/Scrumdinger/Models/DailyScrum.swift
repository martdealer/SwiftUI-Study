//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by zsm on 12/4/23.
//

import Foundation

struct DailyScrum: Identifiable {
    var id: UUID = UUID()
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable{
        let id: UUID = UUID()
        var name: String
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}

extension DailyScrum {
    static var sampleData: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden"], lengthInMinutes: 5, theme: .poppy)
        ]
    }
}
