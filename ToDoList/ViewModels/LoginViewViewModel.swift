//
//  LogInViewViewModel.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import FirebaseAuth
import Foundation

class LogInViewViewModel: ObservableObject {
	@Published var email = ""
	@Published var password = ""
	@Published var errorMessage = ""

	init() {}

	func logIn() {
		guard validate() else {
			return
		}
		// Try log in
		Auth.auth().signIn(withEmail: email, password: password)

	}
	private func validate() -> Bool {
		errorMessage = ""
		guard
			!email
				.trimmingCharacters(in: .whitespaces).isEmpty,
			!password
				.trimmingCharacters(in: .whitespaces).isEmpty
		else {
			errorMessage = "Please fill in all fields"
			return false
		}
		guard email.contains("@") && email.contains(".") else {
			errorMessage = "Please enter valid email"
			return false
		}
		return true

	}
}
