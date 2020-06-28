
import Combine
import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    enum Mode {
        case SelectLevel
        case PlayLevel
    }

    var currentMode: Mode = .SelectLevel

    var currentLevel: Level?

    func playLevel(level: Level) {
        currentMode = .PlayLevel
        currentLevel = level

        withAnimation {
            objectWillChange.send()
        }
    }

    func selectLevel() {
        currentMode = .SelectLevel
        currentLevel = nil

        withAnimation {
            objectWillChange.send()
        }
    }
}
