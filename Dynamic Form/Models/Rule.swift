//
//  Rule.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 25/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import Foundation

// MARK: - Rule
struct Rule: Codable {
    let condition, value, action, otherwise: String?
    let targets: [String]?
}
