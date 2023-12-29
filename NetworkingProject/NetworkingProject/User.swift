//
//  User.swift
//  NetworkingProject
//
//  Created by zsm on 12/29/23.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    var id : UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "Jae-Seung", age: 27, company: "inpage", email: "rewqer@gmail.com", address: "555, example, address", about: "Swift Programming", registered: Date.now, tags: ["swift", "swiftui", "dogs"], friends: [])
}

struct Friend: Hashable, Identifiable, Codable {
    let id: UUID
    var name: String
}
