//
//  LogINVIew.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct LoginView: View {
	@StateObject var viewModel = LogInViewViewModel()
	@FocusState private var focusedField: Field?

	enum Field {
		case email, password
	}

	var body: some View {
		NavigationView {
			VStack {
				// Header
				HeaderView(
					tittle: "To Do List",
					subtittle: "Get your tasks done",
					angle: -15,
					backgroundColor: Color(red: 169/255, green: 181/255, blue: 223/255)
				)

				// Form container with tap gesture to clear focus
				VStack(spacing: 0) {
					if !viewModel.errorMessage.isEmpty {
						HStack {
							Text(viewModel.errorMessage)
								.foregroundColor(.red)
							Spacer()
						}
						.padding()
						Divider()
					}

					// Email Field Row
					HStack {
						TextField("Email Address", text: $viewModel.email)
							.textFieldStyle(DefaultTextFieldStyle())
							.autocorrectionDisabled()
							.focused($focusedField, equals: .email)
						Spacer()
					}
					.padding()
					Divider()

					// Password Field Row
					HStack {
						SecureField("Password", text: $viewModel.password)
							.textFieldStyle(DefaultTextFieldStyle())
							.autocorrectionDisabled()
							.focused($focusedField, equals: .password)
						Spacer()
					}
					.padding()
					Divider()

					// Log In Button Row
					HStack {
						Spacer()
						TLButton(
							title: "Log In",
							background: Color(red: 45/255, green: 51/255, blue: 107/255),
							action: { viewModel.logIn() }
						)
						.frame(height: 80)
						Spacer()
					}
					.padding(.all, 1)
				}
				.background(Color(UIColor.secondarySystemGroupedBackground))
				.cornerRadius(10)
				.padding(.horizontal)
				.offset(y: -50)

				// Create Account Link
				VStack {
					Text("Don't have an account?")
					NavigationLink("Create an account", destination: RegisterView())
				}
				.padding(.bottom, 30)
				

				Spacer()
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
	LoginView()
}
