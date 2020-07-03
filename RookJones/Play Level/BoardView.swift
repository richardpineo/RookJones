
import SwiftUI

struct BoardView: View {
	@EnvironmentObject var levelEnvironment: LevelEnvironment

	var level: Level
	@State var zoomMultiplier = CGFloat(1.0)
	let baseTileDims = CGFloat(50.0)

	@State private var currentPosition: CGSize = .zero
	@State private var newPosition: CGSize = .zero

	var body: some View {
		ZStack {
			Image("Background")
				.resizable()
				.scaledToFill()
				.edgesIgnoringSafeArea(.all)

			VStack(alignment: .leading, spacing: 0) {
				ForEach(-1 ... level.board.numRows, id: \.self) { row in
					HStack(alignment: .top, spacing: 0) {
						ForEach(-1 ... self.level.board.numCols, id: \.self) { col in
							TileView(model: self.tileModel(Location(row, col)))
								.frame(width: self.baseTileDims, height: self.baseTileDims)
						}
					}
				}
			}
			.scaleEffect(zoomMultiplier)
			.offset(x: self.currentPosition.width, y: self.currentPosition.height)
			.gesture(MagnificationGesture()
				.onChanged { value in
					self.zoomMultiplier = value.magnitude
				}
			)
			.gesture(DragGesture()
				.onChanged { value in
					self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
				}
				.onEnded { value in
					self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
					print(self.newPosition.width)
					self.newPosition = self.currentPosition
                      })
		}
	}

	func tileModel(_ loc: Location) -> TileViewModel {
		TileViewModel(
			level.board.isLocationValid(loc) ? level.board.getTileType(loc) : .Wall,
			isWhite: (loc.row + loc.col) % 2 == 0,
			isAttacked: levelEnvironment.isAttacked(loc),
			canMoveTo: levelEnvironment.rookJonesCanMoveto(loc),
			isRookJonesLocation: loc == levelEnvironment.rookJonesLocation
		)
	}
}

struct BoardView_Previews: PreviewProvider {
	static var previews: some View {
		BoardView(level: levelBundles[0].levels[1].level)
			.previewLayout(.fixed(width: 1000, height: 1000))
			.environmentObject(LevelEnvironment())
	}
}
