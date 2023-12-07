//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by zsm on 12/7/23.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID = UUID()
    let error: Error
    let guidance: String
}
