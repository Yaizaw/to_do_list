//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
	@Published var currrentUserId: String = ""

	private var handler: AuthStateDidChangeListenerHandle?

	init() {
		self.handler = Auth.auth().addStateDidChangeListener {
			[weak self] _, user in
			DispatchQueue.main.async {
				self?.currrentUserId = user?.uid ?? ""
			}
		}
	}
	public var isSignedIn: Bool {
		return Auth.auth().currentUser != nil
	}
}
