//
//  ContentView.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel = MainViewViewModel()

	var body: some View {
		if viewModel.isSignedIn, !viewModel.currrentUserId.isEmpty {
			accountView

		} else {
			LoginView()
		}
	}
	@ViewBuilder
	var accountView: some View {
		TabView {
			ToDoListView(userId: viewModel.currrentUserId)
				.tabItem {
					Label("Home", systemImage: "house")
				}
			ProfileView()
				.tabItem {
					Label("Profile", systemImage: "person.circle")
				}
		}
	}
}

#Preview {
	MainView()
}
