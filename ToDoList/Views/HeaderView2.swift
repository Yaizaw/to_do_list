//
//  HeaderView.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct HeaderView2: View {
	let tittle: String
	let backgroundColor: Color

	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 0)
				.foregroundColor(
					Color(backgroundColor)
				)
			VStack {
				Text(tittle)
					.font(.system(size: 40))
					.foregroundColor(Color.black)
					.bold()

			}
			.padding(.all, 25).padding(.top, 90)
		}
		.frame(width: UIScreen.main.bounds.width * 3, height: 50)
		.offset(y: -70)
	}
}

#Preview {
	HeaderView2(
		tittle: "Tittle",
		backgroundColor: Color(
			red: 251 / 225, green: 210 / 255, blue: 136 / 255)
	)
}
