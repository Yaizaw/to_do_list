//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
	@Published var title = ""
	@Published var dueDate = Date()
	@Published var showAlert = false

	// Optional property to store the item being edited
	private var itemToEdit: ToDoListItem?

	// Computed property to easily know if we're editing
	var isEditing: Bool {
		return itemToEdit != nil
	}

	// Custom initializer that accepts an optional item
	init(item: ToDoListItem? = nil) {
		self.itemToEdit = item
		if let item = item {
			self.title = item.title
			self.dueDate = Date(timeIntervalSince1970: item.dueDate)
		}
	}

	func save() {
		guard canSave else { return }
		guard let uid = Auth.auth().currentUser?.uid else { return }
		let db = Firestore.firestore()

		if let item = itemToEdit {
			// Update the existing item
			let updatedItem = ToDoListItem(
				id: item.id,
				title: title,
				dueDate: dueDate.timeIntervalSince1970,
				createdDate: item.createdDate, // Preserve original creation date
				isDone: item.isDone
			)
			db.collection("users")
				.document(uid)
				.collection("todoItems")
				.document(item.id)
				.setData(updatedItem.asDictionary())
		} else {
			// Create a new item
			let newId = UUID().uuidString
			let newItem = ToDoListItem(
				id: newId,
				title: title,
				dueDate: dueDate.timeIntervalSince1970,
				createdDate: Date().timeIntervalSince1970,
				isDone: false
			)
			db.collection("users")
				.document(uid)
				.collection("todoItems")
				.document(newId)
				.setData(newItem.asDictionary())
		}
	}

	var canSave: Bool {
		guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
		// Allow dueDate from today onwards (adjust as needed)
		guard dueDate >= Date().addingTimeInterval(-86400) else { return false }
		return true
	}
}
