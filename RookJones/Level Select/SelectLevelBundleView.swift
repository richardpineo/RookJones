
import SwiftUI

struct SelectLevelBundleView: View {
    var bundle: LevelBundle

    var body: some View {
        VStack {
            Text(bundle.name)
            HStack(alignment: .top, spacing: 0) {
                ForEach(Array(bundle.levels.enumerated()), id: \.offset) { index, level in
                    NavigationLink(
                        destination: PlayLevelView(
                            level: level.level
                        )
                    ) {
                        SelectLevelEntryView(level: level, index: index)
                    }
                }
            }
        }
    }
}

struct SelectLevelBundleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelBundleView(bundle: LevelBundleLoader().levelBundles[0])
            .previewLayout(.fixed(width: 500, height: 200))
    }
}
