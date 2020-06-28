
import SwiftUI

struct SelectLevelBundleView: View {
    var bundle: LevelBundle

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(bundle.name)
                .font(.largeTitle)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                .background(Color(bundle.backgroundColor))

            HStack(alignment: .top, spacing: 0) {
                ForEach(Array(bundle.levels.enumerated()), id: \.offset) { index, level in
                    SelectLevelEntryView(level: level, index: index)
                }
                Spacer()
            }
        }
    }
}

struct SelectLevelBundleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelBundleView(bundle: levelBundles[0])
            .previewLayout(.fixed(width: 500, height: 200))
    }
}
