//
//  PlayerAuthState.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 13/08/2025.
//

import Foundation

enum PlayerAuthState: String {
    case authenticating = "Logging in to Game Center..."
    case unauthenticated = "Please sign in to Game Center to play."
    case authenticated = ""

    case error = "Error logging in to Game Center."
    case restricted = "You are not allowed to play multiplayer games"
}
