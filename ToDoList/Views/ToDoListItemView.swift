//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct ToDoListItemsView: View {
	@StateObject var viewModel = ToDoListItemViewViewModel()
	let item: ToDoListItem

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(item.title)
					.font(.body)

				Text(
					"\(Date(timeIntervalSince1970:item.dueDate).formatted(date: .abbreviated, time: .shortened))"

				)
				.font(.footnote)
				.foregroundColor(Color(.secondaryLabel))

			}
			.padding()
			Spacer()
			Button {
				viewModel.toggleIsDone(item: item)

			} label: {
				Image(
					systemName: item.isDone ? "checkmark.circle.fill" : "circle"
				)
				.foregroundColor(.green)

			}
			.padding(20)

		}
	}
}

#Preview {
	ToDoListItemsView(
		item: .init(
			id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970,
			createdDate: Date().timeIntervalSince1970, isDone: true)
	)
}
