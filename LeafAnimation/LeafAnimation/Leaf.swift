import Foundation
import SwiftUI

struct Leaf: Shape {
    var size: CGFloat = 0
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY - size), control: CGPoint(x: rect.midX + size/4, y: rect.midY - size/2))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY - size), control: CGPoint(x: rect.midX - size/4, y: rect.midY - size/2))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY + size), control: CGPoint(x: rect.midX + size/4, y: rect.midY + size/2))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY + size), control: CGPoint(x: rect.midX - size/4, y: rect.midY + size/2))
        return path
    }
}
