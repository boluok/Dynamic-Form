//
//  Element.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 25/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import Foundation

// MARK: - Element
struct Element: Codable {
    let type: String
    let file: String?
    let uniqueID: String?
    let rules: [Rule]?
    let label: String?
    let isMandatory: Bool?
    let keyboard, formattedNumeric, mode: String?

    enum CodingKeys: String, CodingKey {
        case type, file
        case uniqueID = "unique_id"
        case rules, label, isMandatory, keyboard, formattedNumeric, mode
    }
}
