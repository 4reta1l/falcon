//
//  GameView.swift
//  falcon
//
//  Created by Maksym Pyvovarov on 16/08/2025.
//

import SwiftUI

struct GameView: View {

    @ObservedObject var viewModel: MatchManager
    @State private var selectedNumber: Int?

    let columns = Array(repeating: GridItem(.flexible()), count: 10)

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(selectedNumber == nil ? "Select number" : "Selected number:")
                    .font(.system(size: 24, weight: .medium))
                    .bold()
                Spacer()
                Text(selectedNumber != nil ? "\(selectedNumber!)" : "")
                    .frame(width: 300, height: 15)
                    .font(.system(size: 128, weight: .medium))
                    .bold()
                Spacer()
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(1...100, id: \.self) { number in
                        Button(action: {
                            selectedNumber = number
                        }) {
                            Text("\(number)")
                                .frame(width: 32, height: 32)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(selectedNumber == number ? .white : .primary)
                                .background(
                                    selectedNumber == number ? Color.blue : Color(.systemGray5)
                                )
                                .cornerRadius(6)
                        }
                    }
                }
                .padding()
            }
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
