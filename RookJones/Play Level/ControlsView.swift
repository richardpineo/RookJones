//
//  ControlsView.swift
//  RookJones
//
//  Created by Richard Pineo on 7/3/20.
//

import SwiftUI

struct ControlsView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var levelEnvironment: LevelEnvironment

	var body: some View {
		HStack {
			Button(action: {
				self.viewRouter.selectLevel()
            }) {
				HStack {
					Image(systemName: "square.grid.3x2")
						.font(.title)
					Text("Level Select")
						.font(.title)
				}
			}
			.padding()
			.buttonStyle(ControlButtonStyle())

			Toggle("Attacks", isOn: $levelEnvironment.showAttacks)
				.labelsHidden()
			Text("Show Attacks")
				.foregroundColor(.white)

			Toggle("Moves", isOn: $levelEnvironment.showMoves)
				.labelsHidden()
			Text("Show Moves")
				.foregroundColor(.white)

			Spacer()

			Button(action: {
				self.levelEnvironment.level = self.levelEnvironment.level
				self.viewRouter.playLevel()
            }) {
				HStack {
					Image(systemName: "repeat")
						.font(.title)
					Text("Restart")
						.font(.title)
				}
			}
			.padding()
			.buttonStyle(ControlButtonStyle())
		}
	}
}

struct ControlsView_Previews: PreviewProvider {
	static var previews: some View {
		ControlsView()
			.background(Color.black)
			.previewLayout(.fixed(width: 1024, height: 100))
			.environmentObject(ViewRouter())
			.environmentObject(LevelEnvironment())
	}
}
