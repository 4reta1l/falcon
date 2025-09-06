//
//  GameOverView.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 14/08/2025.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var viewModel: MatchManager

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Game Over")
                    .foregroundStyle(.black)
                    .font(.largeTitle.bold())
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .scaleEffect(1.3)
            }
            .padding(.vertical, 30)
            Spacer()

            Button {
                // TODO: go back to menu
            } label: {
                Text("Go to menu")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .scaleEffect(1.05)
                    .background(
                        Capsule()
                            .fill(Color.green)
                    )
            }
            .disabled(viewModel.authenticationState != .authenticated)
            .padding(.vertical, 50)
            Text("Your score: \(viewModel.score)")
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

