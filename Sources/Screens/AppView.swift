//
//  AppView.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 06/08/2025.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var gameManager: GameManager

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Balance scale")
                    .font(.largeTitle.bold())
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(Color.gray.opacity(0.7))
                    .cornerRadius(10)
                    .scaleEffect(1.1)
            }
            .padding(.vertical, 30)
            Spacer()

            Button {
                // TODO: start matchmaking menu
            } label: {
                Text("PLAY")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                    .padding(.vertical, 12)
                    .padding(.horizontal, 50)
                    .scaleEffect(1.05)
                    .background(
                        Capsule()
                            .fill(gameManager.authenticationState == .authenticated
                                  ? .blue
                                  : .gray.opacity(0.8))
                    )
            }
            .disabled(gameManager.authenticationState != .authenticated)
            .padding(.vertical, 50)

            Text(gameManager.authenticationState.rawValue)
                .font(.headline.weight(.semibold))
                .foregroundStyle(.white)
        }
        .background(
            Image("backgroundImage")
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height)
            .clipped()
            .ignoresSafeArea()
        )
    }
}
