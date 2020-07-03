
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
                ScrollView {
                    BoardView(level: level)
                        .clipped()
                        .border(Color(red: 0.4, green: 0.0, blue: 0.0, opacity: 1.0), width: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)

                }
//                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
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
