//
//  StartGameView.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 06/08/2025.
//

import SwiftUI

struct StartGameView: View {
    @ObservedObject var viewModel: MatchManager

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Balance scale")
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
                viewModel.startMatchmaking()
            } label: {
                Text("PLAY")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                    .padding(.vertical, 12)
                    .padding(.horizontal, 50)
                    .scaleEffect(1.05)
                    .background(
                        Capsule()
                            .fill(viewModel.authenticationState == .authenticated
                                  ? .green
                                  : .gray.opacity(0.8))
                    )
            }
            .disabled(viewModel.authenticationState != .authenticated)
            .padding(.vertical, 50)

            Text(viewModel.authenticationState.rawValue)
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
