//
//  ResponseModel.swift
//  UserDataApp
//
//  Created by Anna Hakobyan on 07.10.24.
//

import Foundation

struct UserResponse: Codable {
    let results: [User]

    init(results: [User]) {
        self.results = results
    }
}
