//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for single to do list item view (each row in tiems list)
class ToDoListItemViewViewModel: ObservableObject {
	init() {}

	func toggleIsDone(item: ToDoListItem) {
		var itemCopy = item
		itemCopy.setDonde(!item.isDone)

		guard let uid = Auth.auth().currentUser?.uid else {
			return
		}

		let db = Firestore.firestore()
		db.collection("users")
			.document(uid)
			.collection("todoItems")
			.document(itemCopy.id)
			.setData(itemCopy.asDictionary())

	}
}
