//
//  NetworkProvider.swift
//  UserDataApp
//
//  Created by Anna Hakobyan on 07.10.24.
//

import Foundation

class NetworkProvider: ObservableObject {
    private let baseURL = "https://randomuser.me/api/"

    func getUsers(page: Int, results: Int) async throws -> [User] {
        let urlString = "\(baseURL)?page=\(page)&results=\(results)"

        guard let url = URL(string: urlString) else {
           throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
        return userResponse.results
    }
}
