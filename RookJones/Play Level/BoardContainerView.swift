
import SwiftUI

struct BoardContainerView: View {
        var level: Level
    
    var body: some View {
        BoardView(level: level)
    }
}

struct BoardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        BoardContainerView(level: levelBundles[0].levels[1].level)
    }
}
