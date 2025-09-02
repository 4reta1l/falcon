//
//  GameView.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 16/08/2025.
//

import SwiftUI

struct GameView: View {

    @ObservedObject var viewModel: GameManager

    var body: some View {
        NavigationStack {
            Text("yo")
                .toolbar {
                    toolbarView
                }
        }
    }

    private var toolbarView: some ToolbarContent {
        Group {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Image(systemName: "clock.fill")
                    Text("\(viewModel.remainingTime)")
                        .bold()
                        .font(.title2)
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                        // TODO: go to menu (if in game ask for confirmation)
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .scaleEffect(0.9)
                            .bold()
                        Text("Back")
                    }
                }
            }
        }
    }

}
