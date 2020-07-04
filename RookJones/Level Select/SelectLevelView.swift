
import SwiftUI

struct SelectLevelView: View {
	var bundles: [LevelBundle]

	var body: some View {
		ZStack {
			Image("Background")
				.resizable()
				.edgesIgnoringSafeArea(.all)

			ScrollView {
				VStack {
					ForEach(bundles) {
						bundle in
						SelectLevelBundleView(bundle: bundle)
							.background(Color.clear)
							.padding(.bottom, 44.0)
					}
				}
			}
		}
	}
}

struct SelectLevelView_Previews: PreviewProvider {
	static var previews: some View {
		SelectLevelView(bundles: levelBundles)
	}
}
