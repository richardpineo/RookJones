
import UIKit

class LevelBundle: Identifiable {
    init(name: String, backgroundColor: UIColor) {
        self.name = name
        self.backgroundColor = backgroundColor
        levels = Array<LevelUI>()
    }

    let name: String
    let backgroundColor: UIColor
    var levels: Array<LevelUI>
}
