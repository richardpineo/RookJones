//
//  ControlsView.swift
//  RookJones
//
//  Created by Richard Pineo on 7/3/20.
//

import SwiftUI

struct ControlsView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("Delete tapped!")
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
            
            Spacer()
            
            Button(action: {
                print("Delete tapped!")
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
            .previewLayout(.fixed(width: 1024, height: 100))
    }
    
}
