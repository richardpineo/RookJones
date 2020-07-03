
import SwiftUI

struct BoardView: View {
	@EnvironmentObject var levelEnvironment: LevelEnvironment

	var level: Level
	@State var scale = CGFloat(1.0)
	let baseTileDims = CGFloat(50.0)

    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
	var body: some View {
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
		.scaleEffect(scale)
		.offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
		.gesture(MagnificationGesture()
			.onChanged { value in
				self.scale = value.magnitude
			}
		)
		.gesture(
                   DragGesture()
                       .updating($dragOffset, body: { (value, state, transaction) in
        
                           state = value.translation
                       })
                       .onEnded({ (value) in
                           self.position.height += value.translation.height
                           self.position.width += value.translation.width
                       })
               )
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
