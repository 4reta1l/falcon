//
//  GameManager.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 13/08/2025.
//

import Foundation

class GameManager: ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authenticationState = PlayerAuthState.authenticating

    @Published var score = 0
    @Published var remainingTime = 100
}
