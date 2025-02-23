//
//  ToDoListItemsViews.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
	@StateObject var viewModel: ToDoListViewViewModel
	@FirestoreQuery var items: [ToDoListItem]

	init(userId: String) {
		self._items = FirestoreQuery(
			collectionPath: "users/\(userId)/todoItems"
		)
		self._viewModel = StateObject(
			wrappedValue: ToDoListViewViewModel(
				userId: userId)
		)
	}

	var body: some View {
		NavigationView {
			VStack {
				List(items) { item in
					ToDoListItemsView(item: item)
						.swipeActions {
							Button("Delete") {
								viewModel.delete(id: item.id)

							}
							.tint(.red)

						}

				}
			}
			.navigationTitle("To Do List")
			.toolbar {
				Button {
					// Action
					viewModel.showingNewItemView = true
				} label: {
					Image(systemName: "plus")
				}

			}
			.sheet(isPresented: $viewModel.showingNewItemView) {
				NewItemView(newItemPresented: $viewModel.showingNewItemView)

			}
		}
	}
}

#Preview {
	ToDoListView(userId: "LM78HO3iPBRmRWv9w3lWUdrmNB83")
}
