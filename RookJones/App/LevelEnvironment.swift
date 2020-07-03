
import Combine
import Foundation

final class LevelEnvironment: ObservableObject {
	@Published var hasAllies = true

	@Published var showAttacks = true

	@Published var hasKey = false

	var level: Level? {
		didSet {
			updateLocations()
		}
	}

	private func updateLocations() {
		attackedLocations = nil
		rookJonesMovement = nil
		rookJonesLocation = nil

		if let validBoard = level?.board {
			rookJonesLocation = validBoard.locations().first(where: { validBoard.getTileType($0) == TileType.RookJones })
			attackedLocations = BoardLogic.attackedLocations(validBoard)
		}
	}

	@Published var attackedLocations: [Location]?
	@Published var rookJonesMovement: [Location]?

	@Published var rookJonesLocation: Location? {
		didSet {
			if let rjLoc = rookJonesLocation, let validBoard = level?.board {
				let rookJones = RookJonesPiece(hasKey: hasKey, hasAllies: hasAllies)
				rookJonesMovement = rookJones.getAttackLocations(board: validBoard, pieceLocation: rjLoc)
			}
		}
	}

	func isAttacked(_ loc: Location) -> Bool {
		attackedLocations?.contains(loc) ?? false
	}

	func rookJonesCanMoveto(_ loc: Location) -> Bool {
		rookJonesMovement?.contains(loc) ?? false
	}

	static var withAllies: LevelEnvironment {
		let env = LevelEnvironment()
		env.hasAllies = true
		return env
	}

	static var withoutAllies: LevelEnvironment {
		let env = LevelEnvironment()
		env.hasAllies = false
		return env
	}
}
