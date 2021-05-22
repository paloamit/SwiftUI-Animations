import Foundation
import SwiftUI

struct FillCircle: Shape {
    var endAngle: Double

    var animatableData: Double {
        get { endAngle }
        set { endAngle = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.height/2, startAngle: .degrees(endAngle - 90), endAngle: .degrees(-90), clockwise: true)

        return path
    }
}
