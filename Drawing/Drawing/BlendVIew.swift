//
//  BlendVIew.swift
//  Drawing
//
//  Created by Christian Mitteldorf on 07/11/2019.
//  Copyright © 2019 Christian Mitteldorf. All rights reserved.
//

import SwiftUI

//struct BlendView: View {
//    @State private var insetAmount: CGFloat = 50
//
//    var body: some View {
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 100)
//            .onTapGesture {
//                withAnimation {
//                    self.insetAmount = CGFloat.random(in: 10...90)
//                }
//        }
//    }
//}

struct BlendView: View {
    @State private var rows = 4
    @State private var columns = 4

    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    self.rows = 8
                    self.columns = 16
                }
        }
    }
}

//struct BlendView: View {
//
//    @State private var amount: CGFloat = 0.0
//
//    var body: some View {
////        Image("avatar")
////            .colorMultiply(.red)
//
//        Image("avatar")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//            .saturation(Double(amount))
//            .blur(radius: (1 - amount) * 20)
//
////        VStack {
////            ZStack {
////                Circle()
////                    .fill(Color.red)
////                    .frame(width: 200 * amount)
////                    .offset(x: -50, y: -80)
////                    .blendMode(.screen)
////
////                Circle()
////                    .fill(Color.green)
////                    .frame(width: 200 * amount)
////                    .offset(x: 50, y: -80)
////                    .blendMode(.screen)
////
////                Circle()
////                    .fill(Color.blue)
////                    .frame(width: 200 * amount)
////                    .blendMode(.screen)
////            }
////            .frame(width: 300, height: 300)
////
////            Slider(value: $amount)
////                .padding()
////        }
////        .frame(maxWidth: .infinity, maxHeight: .infinity)
////        .background(Color.black)
////        .edgesIgnoringSafeArea(.all)
//    }
//}

struct Trapezoid: Shape {
    var insetAmount: CGFloat

    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
    }
}

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int

    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }

        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

struct BlendView_Previews: PreviewProvider {
    static var previews: some View {
        BlendView()
    }
}
