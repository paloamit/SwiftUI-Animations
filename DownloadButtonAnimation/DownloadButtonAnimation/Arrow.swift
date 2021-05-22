import Foundation
import SwiftUI

struct Arrow: Shape {
    var left: CGPoint
    var right: CGPoint
    var height: CGFloat

    var animatableData: AnimatablePair<CGFloat, AnimatablePair<CGPoint.AnimatableData, CGPoint.AnimatableData>> {
        get { (AnimatablePair(height, AnimatablePair(left.animatableData, right.animatableData))) }
        set {
            height = newValue.first
            right.animatableData = newValue.second.first
            left.animatableData = newValue.second.second
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: height))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))

        path.move(to: left)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))

        path.addLine(to: right)

        return path
    }
}
