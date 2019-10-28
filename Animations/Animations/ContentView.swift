//
//  ContentView.swift
//  Animations
//
//  Created by Christian Mitteldorf on 27/10/2019.
//  Copyright © 2019 Christian Mitteldorf. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .transition(.pivot)
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

//struct ContentView: View {
//    let letters = Array("Hello SwiftUI")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(self.letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(self.enabled ? Color.blue : Color.red)
//                    .offset(self.dragAmount)
//                    .animation(Animation.default.delay(Double(num) / 20))
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { self.dragAmount = $0.translation }
//                .onEnded { _ in
//                    self.dragAmount = .zero
//                    self.enabled.toggle()
//            }
//        )
//    }
//}

//struct ContentView: View {
//
//    @State private var dragAmount = CGSize.zero
//
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { self.dragAmount = $0.translation }
//                    .onEnded { _ in
//                        withAnimation(.spring()) {
//                            self.dragAmount = .zero
//                        }
//                }
//            )
//    }
//}


//struct ContentView: View {
//    @State private var animationAmount = 0.0
//    @State private var isEnabled = false
//
//    var body: some View {
//        Button("Tap Me") {
//            self.isEnabled.toggle()
////            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
////                self.animationAmount += 360
////            }
//        }
//        .padding(50)
//        .background(isEnabled ? Color.red : Color.blue)
//        .animation(.default)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
//    }
//}

//struct ContentView: View {
//    @State private var animationAmount: CGFloat = 1
//
//    var body: some View {
//        print(animationAmount)
//
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                self.animationAmount += 1
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
//    }
//}

//struct ContentView: View {
//
//    @State private var animationAmount: CGFloat = 1.0
//
//    var body: some View {
//        Button("Tap me!") {
//            self.animationAmount += 1
//        }
//        .padding(50)
////        .background(Color.red)
////        .foregroundColor(.white)
////        .clipShape(Circle())
////        .scaleEffect(animationAmount)
////        .animation(.default)
////        .animation(.easeOut)
////        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
////        .blur(radius: (animationAmount - 1) * 3)
//        .overlay(
//            Circle()
//                .stroke(Color.red)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation.easeOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//            )
//        )
//        .onAppear {
//                self.animationAmount = 2
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
