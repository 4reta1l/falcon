//
//  AppView.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 31/08/2025.
//

import SwiftUI

struct AppView: View {
    @StateObject var gameManager = MatchManager()

    var body: some View {
        ZStack {
            GameView(viewModel: gameManager)
        }
        .onAppear {
            gameManager.authenticateUser()
        }
    }
}
