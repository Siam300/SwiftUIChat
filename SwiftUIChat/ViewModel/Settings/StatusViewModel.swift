//
//  StatusViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 6/1/24.
//

import Foundation

class StatusViewModel: ObservableObject {
    @Published var status: UserStatus = .notConfigured
    
    func updateStauts(_ status: UserStatus) {
        self.status = status
    }
}

enum UserStatus: Int, CaseIterable, Codable {
    case notConfigured
    case available
    case busy
    case school
    case movie
    case work
    case batteryLow
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title: String {
        switch self {
        case .notConfigured: return "Click here to update your status"
        case .available: return "Available"
        case .busy: return "Busy"
        case .school: return "School"
        case .movie: return "Movie"
        case .work: return "Work"
        case .batteryLow: return "Battery Low"
        case .meeting: return "Meeting"
        case .gym: return "Gym"
        case .sleeping: return "Sleeping"
        case .urgentCallsOnly: return "Urgent Calls Only"
        }
    }
}
