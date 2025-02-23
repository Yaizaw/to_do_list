//
//  NewItemView.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct NewItemView: View {
	@StateObject var viewModel = NewItemViewViewModel()
	@Binding var newItemPresented: Bool

	var body: some View {
		VStack {
			Text("New Item")
				.font(.title)
				.bold()
				.padding()

			Form {
				// Title
				TextField("Title", text: $viewModel.title)
					.textFieldStyle(DefaultTextFieldStyle())

				// Due Date
				DatePicker("Due Date", selection: $viewModel.dueDate)
					.datePickerStyle(GraphicalDatePickerStyle())

				// Button
				TLButton(
					title: "Save",
					background: Color(
						red: 45 / 255, green: 51 / 255, blue: 107 / 255)
				) {

					if viewModel.canSave {
						viewModel.save()
						newItemPresented = false
					} else {
						viewModel.showAlert = true
					}
				}
				.padding()
			}
			.offset(y: 50)
			.alert(isPresented: $viewModel.showAlert) {
				Alert(
					title: Text("Error"),
					message: Text(
						"Please fill in all fields and select due date newer than is today or newer."
					))
			}
		}
	}
}

#Preview {
	NewItemView(
		newItemPresented: Binding(
			get: {
				return true
			},
			set: { _ in

			}))
}
