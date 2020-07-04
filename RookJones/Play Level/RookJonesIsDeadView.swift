//
//  RookJonesIsDeadView.swift
//  RookJones
//
//  Created by Richard Pineo on 7/3/20.
//

import SwiftUI

struct RookJonesIsDeadView: View {
	var body: some View {
		Text("You is dead, bub")
			.font(.title)
			.padding()
			.background(Color.red)
			.border(Color.gray, width: 2)
	}
}

struct RookJonesIsDeadView_Previews: PreviewProvider {
	static var previews: some View {
		RookJonesIsDeadView()
	}
}
