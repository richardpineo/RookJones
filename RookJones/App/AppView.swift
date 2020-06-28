
import SwiftUI

struct AppView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        VStack {
            if viewRouter.currentMode == .SelectLevel {
                SelectLevelView(bundles: levelBundles)
            } else if viewRouter.currentMode == .PlayLevel {
                PlayLevelView(level: viewRouter.currentLevel!)
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(ViewRouter())
    }
}
