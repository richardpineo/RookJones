
import SwiftUI

struct SelectLevelView: View {
	var bundles: [LevelBundle]

	var body: some View {
		List(bundles) { bundle in
			SelectLevelBundleView(bundle: bundle)
		}
	}
}

struct SelectLevelView_Previews: PreviewProvider {
	static var previews: some View {
		SelectLevelView(bundles: levelBundles)
	}
}
