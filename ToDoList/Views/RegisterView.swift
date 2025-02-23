//
//  RegisterView.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct RegisterView: View {
	@StateObject var viewModel = RegisterViewViewModel()
	@FocusState private var focusedField: Field?

	enum Field {
		case name,email, password
	}

	var body: some View {
		NavigationView {
			VStack {
				// Header
				HeaderView(
					tittle: "Register",
					subtittle: "Start your journey",
					angle: 15,
					backgroundColor: Color(
						red: 186 / 255, green: 216 / 255, blue: 182 / 255)
				).offset(y: -100)

				VStack(spacing: 0) {

					//Full Name Field Row
					HStack {
						TextField("Full Name", text: $viewModel.name)
							.textFieldStyle(DefaultTextFieldStyle())
							.autocorrectionDisabled()
							.focused($focusedField, equals: .name)
						Spacer()
					}
					.padding()
					Divider()
					
					//Email Field Row
					HStack {
						TextField("Email Address", text: $viewModel.email)
							.textFieldStyle(DefaultTextFieldStyle())
							.autocorrectionDisabled()
							.focused($focusedField, equals: .email)
						Spacer()
					}
					.padding()
					Divider()
					
					//Password Field Row
					HStack {
						SecureField("Password", text: $viewModel.password)
							.textFieldStyle(DefaultTextFieldStyle())
							.autocorrectionDisabled()
							.focused($focusedField, equals: .password)
						Spacer()
					}
					.padding()
					Divider()
					
					// Register Button Row
					HStack {
						Spacer()
						TLButton(
							title: "Create Account",
							background: Color(
								red: 58 / 255, green: 125 / 255, blue: 68 / 255),
							action: {
								viewModel.register()
							}
						)
						.frame(height: 80)
						Spacer()
					}
					.padding(.all, 1)
					
				}
				.background(Color(UIColor.secondarySystemGroupedBackground))
				.cornerRadius(10)
				.padding(.horizontal)
				.offset(y: -150)
			}
			.background(Color(UIColor.systemGroupedBackground))
			.navigationBarHidden(true)
			// Dismiss the keyboard when tapping outside any text field
			.onTapGesture {
				focusedField = nil
			}
		}
	}
}

#Preview {
	RegisterView()
}
