//
//  ToDoListItemViews.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
	@StateObject var viewModel: ToDoListViewViewModel
	@FirestoreQuery var items: [ToDoListItem]

	@State private var selectedItem: ToDoListItem?

	init(userId: String) {
		self._items = FirestoreQuery(
			collectionPath: "users/\(userId)/todoItems"
		)
		self._viewModel = StateObject(
			wrappedValue: ToDoListViewViewModel(userId: userId)
		)
	}

	var body: some View {
		NavigationView {
			VStack {
				HeaderView2(
					tittle: "To-do List",
					backgroundColor: Color(
						red: 186 / 255, green: 216 / 255, blue: 182 / 255)
				).offset(y: 10)

				List(items) { item in
					ToDoListItemView(item: item, onItemTap: {
						selectedItem = item
						viewModel.showingNewItemView = true
					})
					.swipeActions(allowsFullSwipe: false) {
						Button("Delete") {
							viewModel.delete(id: item.id)
						}
						.tint(.red)
					}
				}
			}
			.toolbar {
				Button {
					selectedItem = nil
					viewModel.showingNewItemView = true
				} label: {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $viewModel.showingNewItemView) {
				NewItemView(newItemPresented: $viewModel.showingNewItemView, itemToEdit: selectedItem)
			}
		}
	}
}

#Preview {
	ToDoListView(userId: "LM78HO3iPBRmRWv9w3lWUdrmNB83")
}
