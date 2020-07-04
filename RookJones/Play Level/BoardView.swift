
import SwiftUI

struct BoardView: View {
	@EnvironmentObject var levelEnvironment: LevelEnvironment

	var level: Level
	let baseTileDims = CGFloat(50.0)
	@State var dead = false

	var body: some View {
		ZStack {
			VStack(alignment: .leading, spacing: 0) {
				ForEach(-1 ... level.board.numRows, id: \.self) { row in
					HStack(alignment: .top, spacing: 0) {
						ForEach(-1 ... self.level.board.numCols, id: \.self) { col in
							TileView(model: self.tileModel(Location(row, col)))
								.frame(width: self.baseTileDims, height: self.baseTileDims)
								.onTapGesture {
									let loc = Location(row, col)
									if self.levelEnvironment.isAttacked(loc) {
										self.dead = true
										return
									}
									if self.levelEnvironment.rookJonesCanMoveto(loc) {
										self.levelEnvironment.rookJonesLocation = loc
									}
								}
						}
					}
				}
			}
			if dead {
				RookJonesIsDeadView()
			}
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
