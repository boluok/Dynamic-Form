//
//  Form.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 25/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import Foundation

// MARK: - Form
struct Form: Codable {
    let id, name: String?
    let pages: [Page]?
}
