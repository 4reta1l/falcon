//
//  AppView.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 31/08/2025.
//

import SwiftUI

struct AppView: View {
    @StateObject var gameManager = GameManager()

    var body: some View {
        ZStack {
            if gameManager.isGameOver {
                GameOverView(viewModel: gameManager)
            } else if gameManager.inGame {
                GameView(viewModel: gameManager)
            } else {
                StartGameView(viewModel: gameManager)
            }
        }
        .onAppear {
            gameManager.authenticateUser()
        }
    }
}
