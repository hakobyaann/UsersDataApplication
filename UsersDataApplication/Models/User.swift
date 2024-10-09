//
//  User.swift
//  UserDataApp
//
//  Created by Anna Hakobyan on 07.10.24.
//
import Foundation

import Foundation

struct User: Identifiable, Codable {
    let name: Name
    let location: Location
    let picture: Picture
    let cell: String

    var id: String {
        return cell
    }

    func fullname() -> String {
        return "Anawdksbfj"
    }

    init(name: Name, location: Location, picture: Picture, cell: String) {
        self.name = name
        self.location = location
        self.picture = picture
        self.cell = cell
    }
}
