//
//  BlockableNumber.swift
//  Runner
//
//  Created by Dmytro Plashkin on 16.04.2024.
//

import Foundation

struct BlockableNumber: Codable, Comparable {
    let number: Int64
    let modificationDate: Date
    let isRemoved: Bool

    // MARK: - Comparable
    static func < (lhs: BlockableNumber, rhs: BlockableNumber) -> Bool {
        return lhs.number < rhs.number
    }
}
