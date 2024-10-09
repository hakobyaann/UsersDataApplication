//
//  User.swift
//  UserDataApp
//
//  Created by Anna Hakobyan on 07.10.24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var user: User

    var body: some View {
        ZStack {
            Color(hex: "#e4f58a")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "house")
                            .foregroundColor(Color(hex: "#2d5817"))
                            .padding()
                            .background(Color(hex: "#d5ef50"))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.top)
                .padding(.horizontal)
                UserInfoView(user: user)
                    .padding(.top, 20)
                Spacer()
            }
            .padding(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct UserInfoView: View {
    var user: User
    var body: some View {
        VStack {
            if let url = URL(string: user.picture.large) {
                ZStack {
                    Circle()
                        .stroke(Color(hex: "#2d5817") ?? .black, lineWidth: 10)
                        .frame(width: 150, height: 150)
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 150, height: 150)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }

        Text(user.fullname())
            .font(.largeTitle)
            .foregroundColor(Color(hex: "#2d5817") ?? .black)

        Text("Location: \(user.location.street.fullAddress), \(user.location.city), \(user.location.country)")
            .font(.subheadline)
            .foregroundColor(Color(hex: "#2d5817") ?? .black)
    }
}

#Preview {
    ProfileView(user: User(
        name: Name(title: "Ms", first: "Anna", last: "Hakobyan"),
        location: Location(street: Street(number: 111, name: "StreetName"), city: "Yerevan", country: "Armenia"), picture: Picture(
            large: "https://randomuser.me/api/portraits/women/48.jpg"
        ), cell: "sdfjdn"
    ))
}
