
import SwiftUI

struct TileView: View {
	var model: TileViewModel

	@EnvironmentObject var levelEnvironment: LevelEnvironment

	var body: some View {
		ZStack {
			Image(tileName())
				.resizable()
				.aspectRatio(contentMode: .fit)
			if model.isAttacked {
				Image("Attacked")
					.resizable()
					.aspectRatio(contentMode: .fit)
			} else if model.canMoveTo {
				Image("Possible")
					.resizable()
					.aspectRatio(contentMode: .fit)
			}
			if model.isRookJonesLocation {
				Image("Rook Jones")
					.resizable()
					.aspectRatio(contentMode: .fit)
			}
			if hasPieceImage() {
				Image(pieceTileNameForType()!)
					.resizable()
					.aspectRatio(contentMode: .fit)
			}
		}
	}

	private func tileName() -> String {
		model.isWhite ? "White Cell" : "Black Cell"
	}

	private func hasPieceImage() -> Bool {
		pieceTileNameForType() != nil
	}

	private func pieceTileNameForType() -> String? {
		switch model.type {
		// case TileType.RookJones: We use an empty tile for this
		// the RookJones tile type is the starting loc, not the current one
		case TileType.Key:
			return "Key"
		case TileType.WhiteRook:
			return "White Rook"
		case TileType.WhiteKnight:
			return "White Knight"
		case TileType.WhiteBishop:
			return "White Bishop"
		case TileType.WhiteQueen:
			return "White Queen"
		case TileType.BlackRook:
			return "Black Rook"
		case TileType.Treasure:
			return "Diamond"
		case TileType.Exit:
			return levelEnvironment.hasAllies ? "Closed Door" : "Open Door"
		case TileType.LockedDoor:
			return "Locked"
		case TileType.Wall:
			return "Wall"
		default:
			return nil
		}
	}
}

struct CellView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			Group {
				TileView(model: TileViewModel(.BlackRook))
					.previewDisplayName("Rook")
				TileView(model: TileViewModel(.Exit))
					.previewDisplayName("Open")
				TileView(model: TileViewModel(.WhiteQueen))
					.previewDisplayName("Queen")
			}
			.previewLayout(.fixed(width: 50, height: 50))
			.environmentObject(LevelEnvironment.withoutAllies)
			Group {
				TileView(model: TileViewModel(.Exit))
					.previewDisplayName("Closed")
				TileView(model: TileViewModel(.RookJones))
					.previewDisplayName("Rook Jones")
			}
			.previewLayout(.fixed(width: 100, height: 100))
			.environmentObject(LevelEnvironment.withAllies)
		}
	}
}
