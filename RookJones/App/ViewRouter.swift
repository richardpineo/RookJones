
import Combine
import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
	@EnvironmentObject var levelEnvironment: LevelEnvironment

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
