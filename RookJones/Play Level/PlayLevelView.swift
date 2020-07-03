
import SwiftUI

struct PlayLevelView: View {
	@EnvironmentObject var viewRouter: ViewRouter

	var level: Level

	var body: some View {
		BoardView(level: level)
			.onTapGesture {
				print("Back to main")
				self.viewRouter.selectLevel()
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
