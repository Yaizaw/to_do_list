//
//  User.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import Foundation


struct User: Codable {
	let id: String
	let name: String
	let email: String
	let joined: TimeInterval
}
