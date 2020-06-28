//
//  PlayLevelView.swift
//  RookJones
//
//  Created by Richard Pineo on 6/28/20.
//

import SwiftUI

struct PlayLevelView: View {
    var level: Level
    var body: some View {
        Text(level.name)
    }
}

struct PlayLevelView_Previews: PreviewProvider {
    static var previews: some View {
        PlayLevelView(level: levelBundles[0].levels[0].level)
    }
}
