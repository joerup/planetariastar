

import SwiftUI

public struct HRDiagram: View {
    var stars: [Star] = []
    var s: CGFloat = 600
    var groups: Bool = false
    var names: Bool = false
    
    public var body: some View {
        ZStack {
            ForEach(self.stars.reversed(), id: \.id) { star in
                StarModel(star: star, scale: 25, name: names)
                    .position(x: x(star.temp), y: y(star.luminosity))
            }
            if groups {
                Text("Main Sequence")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .position(x: x(9000), y: y(600))
                    .rotationEffect(.degrees(30))
                Text("Giants")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .position(x: x(7000), y: y(300))
                Text("Supergiants")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .position(x: x(8500), y: y(45000))
                Text("White Dwarfs")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .position(x: x(22000), y: y(0.005))
            }
        }
        .frame(width: s, height: s)
    }
    
    func x(_ temp: Int) -> CGFloat {
        return s-(s*(CGFloat(temp)/30000))
    }
    func y(_ luminosity: Double) -> CGFloat {
        return s-(log10(CGFloat(luminosity)) * s/12)
    }
}
