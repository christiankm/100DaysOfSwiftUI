//
//  CardView.swift
//  Flashzilla
//
//  Created by Christian Mitteldorf on 22/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let feedback = UIFeedbackGenerator()

    var onRemove: (() -> Void)?

    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled

    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor
                        ? Color.white
                        : Color.white
                            .opacity(1 - Double(abs(offset.width / 50)))

            )
                .background(
                    differentiateWithoutColor
                        ? nil
                        : RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(offset.width > 0 ? Color.green : Color.red)
            )
            .shadow(radius: 10)

            VStack {
                if accessibilityEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)

                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibility(addTraits: .isButton)
    .gesture(
        DragGesture()
            .onChanged{ offset in
                self.offset = offset.translation
                self.feedback.prepare()
            }
            .onEnded { _ in
                if abs(self.offset.width) > 100 {
//                    if self.offset.width > 0 {
//                        self.feedback.notificationOccurred(.success)
//                    } else {
//                        self.feedback.notificationOccuured(.error)
//                    }

                    self.onRemove?()
                } else {
                    self.offset = .zero
                }
            }
        )
        .onTapGesture {
            self.isShowingAnswer = true
        }
        .animation(.spring())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
