//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import FirebaseFirestore
import Foundation

/// ViewModel for list of item view
/// Primary tab
class ToDoListViewViewModel: ObservableObject {
	@Published var showingNewItemView = false
	private let userId: String
	init(userId: String) {
		self.userId = userId
	}
	/// Delete to do list item
	/// - Parameter id: Item id to delete
	func delete(id: String) {
		let db = Firestore.firestore()

		db.collection("users")
			.document(userId)
			.collection("todoItems")
			.document(id)
			.delete()

	}
}
