//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
	let id: String
	let title: String
	let dueDate: TimeInterval
	let createdDate: TimeInterval
	var isDone: Bool

	mutating func setDonde(_ state: Bool) {
		isDone = state
	}

}
