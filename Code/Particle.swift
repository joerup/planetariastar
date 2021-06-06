
import Foundation
import SwiftUI

public struct Particle: Identifiable {
    public var id: Int
    public var name: String
    public var x: CGFloat
    public var y: CGFloat
    public var annihilating: Bool
    
    public init(id: Int, name: String, x: CGFloat, y: CGFloat) {
        self.id = id
        self.name = name
        self.x = x
        self.y = y
        self.annihilating = id > 5
    }
    
    public mutating func annihilate() {
        self.annihilating = true
    }
    
    public mutating func move(toX: CGFloat? = nil, toY: CGFloat? = nil, byX: CGFloat? = nil, byY: CGFloat? = nil) {
        if annihilating {
            self.x = toX ?? self.x
            self.y = toY ?? self.y
            self.x += byX ?? 0
            self.y += byY ?? 0
        }
    }
    
    public mutating func remove() {
        self.annihilating = false
        self.name = "removed"
    }
}
