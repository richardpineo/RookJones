
import Combine
import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
	enum Mode {
		case SelectLevel
		case PlayLevel
	}

	var currentMode: Mode = .SelectLevel

	func playLevel() {
		currentMode = .PlayLevel

		withAnimation {
			objectWillChange.send()
		}
	}

	func selectLevel() {
		currentMode = .SelectLevel

		withAnimation {
			objectWillChange.send()
		}
	}
}
