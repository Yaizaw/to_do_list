//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
	init() {
		FirebaseApp.configure()
	}
	var body: some Scene {
		WindowGroup {
			MainView()
		}
	}
}
