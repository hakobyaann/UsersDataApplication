//
//  User.swift
//  UserDataApp
//
//  Created by Anna Hakobyan on 07.10.24.
//

import SwiftUI

struct MainView: View {
    var networkProvider = NetworkProvider()
    @State private var users: [User] = []

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#d5ef50")
                    .ignoresSafeArea()
                VStack {
                    Text("Users List")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(Color(hex: "#2d5817") ?? .black)

                    List(users) { user in
                        NavigationLink(destination: ProfileView(user: user)) {
                            VStack(alignment: .leading) {
                                Text(user.fullname())
                                    .foregroundColor(Color(hex: "#2d5817") ?? .black)
                                    .fontWeight(.bold)
                                Text(user.location.street.fullAddress.isEmpty ? "Address not available" : user.location.street.fullAddress)
                                    .foregroundColor(Color(hex: "#2d5817") ?? .black)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(hex: "#ABC32F"))
                            .cornerRadius(10)
                            .shadow(color: Color(hex: "#2d5817") ?? Color.black, radius: 3)
                        }
                        .listRowBackground(Color(hex: "#d5ef50"))
                        .listRowSeparator(.hidden)
                        .scrollIndicators(.hidden)
                    }
                    .listStyle(.plain)
                    .frame(maxHeight: .infinity)
                }
            }
        }
        .onAppear {
            Task {
                await loadUsers()
            }
        }
    }

    private func loadUsers() async {
        do {
            users = try await networkProvider.getUsers(page: 1, results: 20)
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    MainView()
}
