//
//  ProfileView.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct ProfileView: View {
	@StateObject var viewModel = ProfileViewViewModel()
	var body: some View {
		NavigationView {
			VStack {
				if let user = viewModel.user {
					profile(user: user)
				} else {
					Text("Loading Profile...")
				}

			}
			.navigationTitle("Profile")
		}
		.onAppear {
			viewModel.fetchUser()
		}
	}
	@ViewBuilder
	func profile(user: User) -> some View {
		Image(systemName: "person.circle.fill")
			.resizable()
			.frame(width: 150, height: 150)
			.aspectRatio(contentMode: .fit)
			.foregroundColor(.blue)
			.padding()

		// Info: Name, Email, Member since
		VStack(alignment: .leading) {
			HStack {
				Text("Name:")
					.bold()
				Text(user.name)
			}
			.padding()

			HStack {
				Text("Email:")
					.bold()
				Text(user.email)
			}
			.padding()

			HStack {
				Text("Member Since:")
					.bold()
				Text(
					"\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))"
				)
			}
			.padding()
		}
		.padding()

		// Sign out
		Button("Log Out") {
			viewModel.logOut()
		}
		.tint(.red)
		.padding()
		Spacer()
	}
}

#Preview {
	ProfileView()
}
