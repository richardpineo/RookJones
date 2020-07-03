
import SwiftUI

struct AppView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var levelEnvironment: LevelEnvironment

	var body: some View {
		VStack {
			if viewRouter.currentMode == .PlayLevel && levelEnvironment.level != nil {
				PlayLevelView(level: levelEnvironment.level!)
			} else {
				SelectLevelView(bundles: levelBundles)
			}
		}
	}
}

struct AppView_Previews: PreviewProvider {
	static var previews: some View {
		AppView()
			.environmentObject(ViewRouter())
			.environmentObject(LevelEnvironment())
	}
}
