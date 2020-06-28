
import SwiftUI

struct LevelSelectView: View {
    var bundles: [LevelBundle]
    
    var body: some View {
        List(bundles) { bundle in
            LevelBundleView(bundle: bundle)

        }
    }
}

struct LevelSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectView(bundles: LevelBundleLoader().levelBundles)
    }
}
