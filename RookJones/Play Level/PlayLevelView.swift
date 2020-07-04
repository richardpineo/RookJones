
import SwiftUI

struct PlayLevelView: View {
	@EnvironmentObject var viewRouter: ViewRouter

	var level: Level

	var body: some View {
		ZStack {
			Image("Background")
				.resizable()
				.edgesIgnoringSafeArea(.all)

			VStack {
				ControlsView()
				BoardContainerView(level: self.level)
					.padding()
			}
		}
	}
}

struct PlayLevelView_Previews: PreviewProvider {
	static var previews: some View {
		PlayLevelView(level: levelBundles[0].levels[0].level)
			.environmentObject(ViewRouter())
			.environmentObject(LevelEnvironment())
	}
}
