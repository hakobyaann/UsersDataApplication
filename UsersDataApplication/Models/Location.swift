//
//  Location.swift
//  UserDataApp
//
//  Created by Anna Hakobyan on 07.10.24.
//

import Foundation

struct Location: Codable {
    let street: Street
    let city: String
    let country: String

    init(street: Street, city: String, country: String) {
        self.street = street
        self.city = city
        self.country = country
    }
}
