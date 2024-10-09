//
//  Picture.swift
//  UserDataApp
//
//  Created by Anna Hakobyan on 08.10.24.
//

import Foundation

struct Picture: Codable {
    let large: String

    init(large: String) {
        self.large = large
    }
}
