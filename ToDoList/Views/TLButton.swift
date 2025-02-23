//
//  TLButton.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct TLButton: View {
	let title: String
	let background: Color
	let action: () -> Void

	var body: some View {
		Button {
			action()
		} label: {
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(
						background)
				Text(title)
					.foregroundColor(Color.white)
					.bold()
			}
		}.padding()
	}
}

#Preview {
	TLButton(
		title: "Value",
		background: Color(red: 91 / 255, green: 188 / 255, blue: 255 / 255)
	) {
		//	Action
	}
}
