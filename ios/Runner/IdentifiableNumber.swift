//
//  IdentifiableNumber.swift
//  Runner
//
//  Created by Dmytro Plashkin on 16.04.2024.
//

import Foundation

struct IdentifiableNumber: Codable, Comparable {
    let number: Int64
    let label: String
    let modificationDate: Date
    let isRemoved: Bool

    // MARK: - Comparable
    static func < (lhs: IdentifiableNumber, rhs: IdentifiableNumber) -> Bool {
        return lhs.number < rhs.number
    }
}
