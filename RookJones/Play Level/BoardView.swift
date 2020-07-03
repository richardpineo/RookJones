
import SwiftUI

struct BoardView: View {
	@EnvironmentObject var levelEnvironment: LevelEnvironment

	var level: Level

	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			ForEach(-1 ... level.board.numRows, id: \.self) { row in
				HStack(alignment: .top, spacing: 0) {
					ForEach(-1 ... self.level.board.numCols, id: \.self) { col in
						TileView(model: self.tileModel(Location(row, col)))
							.frame(width: 50, height: 50)
					}
				}
			}
		}
	}

	func tileModel(_ loc: Location) -> TileModel {
		let isWhite = (loc.row + loc.col) % 2 == 0

		let isAttacked = levelEnvironment.isAttacked(loc)
        let canMoveTo = levelEnvironment.rookJonesCanMoveto(loc)
      
		let type: TileType = level.board.isLocationValid(loc) ? level.board.getTileType(loc) :
			.Wall

        let isRjLoc = loc == levelEnvironment.rookJonesLocation
        
		return TileModel(type,
						 isWhite: isWhite,
						 isAttacked: isAttacked,
						 canMoveTo: canMoveTo,
                        isRookJonesLocation: isRjLoc)
	}
}

struct BoardView_Previews: PreviewProvider {
	static var previews: some View {
		BoardView(level: levelBundles[0].levels[1].level)
			.previewLayout(.fixed(width: 1000, height: 1000))
			.environmentObject(LevelEnvironment())
	}
}
