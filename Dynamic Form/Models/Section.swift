//
//  Section.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 25/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import Foundation

// MARK: - Section
struct Section: Codable {
    let label: String
    var elements: [Element]
}
