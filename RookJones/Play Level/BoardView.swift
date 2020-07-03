
import SwiftUI

struct BoardView: View {
	@EnvironmentObject var levelEnvironment: LevelEnvironment

	var level: Level
    @State var zoomMultiplier = CGFloat(1.0)
    
  
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			ForEach(-1 ... level.board.numRows, id: \.self) { row in
				HStack(alignment: .top, spacing: 0) {
					ForEach(-1 ... self.level.board.numCols, id: \.self) { col in
						TileView(model: self.tileModel(Location(row, col)))
                            .frame(width: self.tileDims, height: self.tileDims)
					}
				}
			}
        }.gesture(MagnificationGesture()
            .onChanged { value in
                self.zoomMultiplier = value.magnitude
            }
        )
	}
    
    var tileDims: CGFloat {
        let baseTileDims = CGFloat(50.0)
        return baseTileDims * self.zoomMultiplier
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
