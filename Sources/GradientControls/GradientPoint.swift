
import Foundation

public enum GradientPoint {
   case topRight, topLeft
   case bottomRight, bottomLeft
   case custom(point: CGPoint)

   var point: CGPoint {
       switch self {
           case .topRight: return CGPoint(x: 1, y: 0)
           case .topLeft: return CGPoint(x: 0, y: 0)
           case .bottomRight: return CGPoint(x: 1, y: 1)
           case .bottomLeft: return CGPoint(x: 0, y: 1)
           case .custom(let point): return point
       }
   }
}
