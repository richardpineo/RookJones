
import Foundation

class TileViewModel {
	init(_ type: TileType, isWhite: Bool = true, isAttacked: Bool = false, canMoveTo: Bool = false, isRookJonesLocation: Bool = false) {
		self.type = type
		self.isWhite = isWhite
		self.isAttacked = isAttacked
		self.canMoveTo = canMoveTo
		self.isRookJonesLocation = isRookJonesLocation
	}

	var type: TileType
	var isWhite: Bool
	var isAttacked: Bool
	var canMoveTo: Bool
	var isRookJonesLocation: Bool
}
