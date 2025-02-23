//
//  HeaderView.swift
//  ToDoList
//
//  Created by Yaiza Wadhwani Valderas on 15/2/25.
//

import SwiftUI

struct HeaderView: View {
	let tittle: String
	let subtittle: String
	let angle: Double
	let backgroundColor: Color

	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 0)
				.rotationEffect(Angle(degrees: angle))
				.foregroundColor(
					Color(backgroundColor)

				)
			VStack {
				Text(tittle)
					.font(.system(size: 50))
					.foregroundColor(Color.black)
					.bold()
				Text(subtittle)
					.font(.system(size: 30))
					.foregroundColor(Color.black)

			}
			.padding(.top, 80)
		}
		.frame(width: UIScreen.main.bounds.width * 3, height: 350)
		.offset(y: -150)
	}
}

#Preview {
	HeaderView(
		tittle: "Tittle",
		subtittle: "Subtittle",
		angle: -15,
		backgroundColor: Color(
			red: 251 / 225, green: 210 / 255, blue: 136 / 255)
	)
}
