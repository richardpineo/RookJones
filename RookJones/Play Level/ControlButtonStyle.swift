
import Foundation
import SwiftUI

struct ControlButtonStyle: ButtonStyle {
	var bgColor: Color = .accentColor

	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.padding(20)
			.background(
				ZStack {
					RoundedRectangle(cornerRadius: 10, style: .continuous)
						.fill(bgColor)
				}
			)
			.scaleEffect(configuration.isPressed ? 0.95 : 1)
			.animation(.spring())
			.foregroundColor(.white)
	}
}
