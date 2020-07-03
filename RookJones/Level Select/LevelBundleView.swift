
import SwiftUI

struct SelectLevelBundleView: View {
	var bundle: LevelBundle

	var body: some View {
		VStack {
			Text(bundle.name)
			HStack(alignment: .top, spacing: 0) {
				ForEach(bundle.levels) { level in
					NavigationLink(
						destination: PlayLevelView(
							level: level.level
						)
					) {
						SelectLevelEntryView(level: level)
					}
				}
			}
		}
	}
}

struct LevelBundleView_Previews: PreviewProvider {
	static var previews: some View {
		SelectLevelBundleView(bundle: LevelBundleLoader().levelBundles[0])
			.previewLayout(.fixed(width: 500, height: 100))
	}
}
