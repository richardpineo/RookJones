
import SwiftUI

struct BoardContainerView: View {
        var level: Level
    @State var scale = CGFloat(1.0)

    var body: some View {
        ScrollView {
            BoardView(level: level)
                .scaleEffect(scale)
                .gesture(MagnificationGesture()
                    .onChanged { value in
                        self.scale = value.magnitude
                    }
                )
                .border(Color(red: 0.4, green: 0.0, blue: 0.0, opacity: 1.0), width: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
                .clipped()
        }
    }
}

struct BoardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        BoardContainerView(level: levelBundles[0].levels[1].level)
    }
}
