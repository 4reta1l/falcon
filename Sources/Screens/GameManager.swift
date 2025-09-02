//
//  StartGameViewModel.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 13/08/2025.
//

import Foundation
import GameKit

class GameManager: ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authenticationState = PlayerAuthState.authenticated

    @Published var score = 0
    @Published var remainingTime: Int = 100

    var match: GKMatch?
    var players: [GKPlayer] = []
    var localPlayer = GKLocalPlayer.local

    init() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            }
        }
    }

    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }

    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { [self] vc, e in
            if let viewController = vc {
                rootViewController?.present(viewController, animated: true)
                return
            }

            if let error = e {
                authenticationState = .error
                print(error.localizedDescription)
                return
            }

            if localPlayer.isAuthenticated {
                if localPlayer.isMultiplayerGamingRestricted {
                    authenticationState = .restricted
                } else {
                    authenticationState = .authenticated
                }
            } else {
                authenticationState = .unauthenticated
            }
        }
    }
}
