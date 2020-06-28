
import SwiftUI

struct SelectLevelEntryView: View {
    var level: LevelUI
    var index: Int

    var body: some View {
        HStack {
            ZStack {
                Image(index % 2 == 0 ? "White Cell" : "Black Cell")
                Text(level.shortName)
                    .font(.headline)
                    .padding(8.0)
                    .border(Color.gray, width: 2)
                    .foregroundColor(.black)
                    .background(Color(.white))
            }
        }
    }
}

struct SelectLevelEntryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SelectLevelEntryView(level: levelBundles[0].levels[0],
                                 index: 0)
            SelectLevelEntryView(level: levelBundles[0].levels[1],
                                 index: 1)
        }
        .previewLayout(.fixed(width: 50, height: 50))
    }
}
