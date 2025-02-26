//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct ToDoListItemView: View {
	@StateObject var viewModel = ToDoListItemViewViewModel()
	let item: ToDoListItem
	var onItemTap: (() -> Void)? = nil

	var body: some View {
		HStack {
			HStack{
				VStack(alignment: .leading) {
					Text(item.title)
						.font(.body)

					Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
						.font(.footnote)
						.foregroundColor(Color(.secondaryLabel))
				}
				Spacer()
			}
			.contentShape(Rectangle())
			.onTapGesture {
				onItemTap?()
			}

			Button {
				viewModel.toggleIsDone(item: item)
			} label: {
				Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
					.foregroundColor(.green)
			}
			.padding(20)
		}
	}
}
#Preview {
	ToDoListItemView(
		item: .init(
			id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970,
			createdDate: Date().timeIntervalSince1970, isDone: true)
	)
}
