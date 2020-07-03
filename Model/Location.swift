
import Foundation

class Location: Hashable {
	init(_ row: Int, _ col: Int) {
		self.row = row
		self.col = col
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(row)
		hasher.combine(col)
	}

	public static func == (lhs: Location, rhs: Location) -> Bool {
		lhs.row == rhs.row && lhs.col == rhs.col
	}

	// Returns the location that is offset by the values in the row and col
	// of the offset. The return location may be not be valid for your board.
	public func offset(_ offset: Location) -> Location {
		Location(row + offset.row, col + offset.col)
	}
    
    static var invalid: Location = Location(-666,-666)

	let row: Int
	let col: Int
}
