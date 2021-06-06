

import Foundation

public class Star: Codable {
    var id: Int
    var name: String
    var temp: Int
    var luminosity: Double
    var mass: Double
    var radius: Double
    var expanding: Bool
    
    public init(id: Int, name: String, temp: Int, luminosity: Double, mass: Double, radius: Double ) {
        self.id = id
        self.name = name
        self.temp = temp
        self.luminosity = luminosity
        self.mass = mass
        self.radius = radius
        self.expanding = false
    }
    
    public func expand() {
        self.expanding = true
    }
}

public struct StarStructure: Codable {
    public let stars: [Star]
}



