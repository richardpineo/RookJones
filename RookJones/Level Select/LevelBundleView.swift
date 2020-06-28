
import SwiftUI

struct LevelBundleView: View {
    var bundle: LevelBundle
    
    var body: some View {
        VStack {
            Text(bundle.name)
            List(bundle.levels) { level in
                   LevelEntryView( level: level)
            }
        }
    }
}

struct LevelBundleView_Previews: PreviewProvider {
    static var previews: some View {
        LevelBundleView(bundle: LevelBundleLoader().levelBundles[0])
            .previewLayout(.fixed(width: 500, height: 500))
    }
}
