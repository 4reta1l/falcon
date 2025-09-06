//
//  MatchManager+GKMatchDelegate.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 02/09/2025.
//

import Foundation
import GameKit

extension MatchManager: GKMatchDelegate {
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {

    }

    func sendString(_ message: String) {
        
    }

    func sendData(_ data: Data, mode: GKMatch.SendDataMode) {
        do {
            try match?.sendData(toAllPlayers: data, with: mode)
        } catch {
            print("error sending data: \(error)")
        }
    }

    func match(_ match: GKMatch, player: GKPlayer, didChange state: GKPlayerConnectionState) {
        
    }
}
