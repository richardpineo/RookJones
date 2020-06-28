
import SwiftUI

struct LevelEntryView: View {
    var level: LevelUI
    
    var body: some View {
        HStack {
            Text(level.shortName)
                .font(.headline)
                .padding(8.0)
                .border(Color.gray, width: 2)
                .foregroundColor(.red)
            Text(level.level.name)
                .font(.caption)
        }
    }
}

struct LevelEntryView_Previews: PreviewProvider {
    static var previews: some View {
        LevelEntryView(level: LevelBundleLoader().levelBundles[0].levels[0])
         .previewLayout(.fixed(width: 200, height: 100))
    }
}
