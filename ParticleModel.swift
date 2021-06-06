
import SwiftUI

public struct ParticleModel: View {
    var particle: Particle
    var standard: CGFloat
    
    public init(particle: Particle, standard: CGFloat) {
        self.particle = particle
        self.standard = standard
    }
    
    public var body: some View {
        ZStack {
            if particle.name == "explosion" {
                Image(uiImage: #imageLiteral(resourceName: "explosion.png"))
                    .resizable()
                    .frame(width: standard*2, height: standard*2)
                    .animation(.spring())
            }
            else if particle.name != "removed" {
                Circle()
                    .frame(width: size(), height: size())
                    .foregroundColor(color())
                    .shadow(color: color(), radius: particle.name == "γ" ? size()/3 : size()/6, x: 0, y: 0)
                if particle.name != "n" && !particle.name.contains("p") {
                    VStack(spacing:0) {
                        Spacer()
                            .frame(height: particle.name.contains("³") || particle.name.contains("⁴") ? 50 : 0)
                        HStack(spacing:0) {
                            Spacer()
                                .frame(width: particle.name.contains("²") || particle.name.contains("³") || particle.name.contains("⁴") ? 50 : 0)
                            Text(particle.name)
                                .foregroundColor(.black)
                                .font(.system(size: size()/2.5))
                        }
                    }
                }
            }
        }
    }
    
    func size() -> CGFloat {
        switch particle.name {
        case "e+": return standard/2.5
        case "v": return standard/3
        case "γ": return standard/2
        default: return standard
        }
    }
    
    func color() -> Color {
        switch particle.name {
        case "¹H": return Color.init(red: 0.9, green: 0.3, blue: 0.2)
        case "²H": return Color.init(red: 1, green: 0.3, blue: 0.2)
        case "³He": return Color.init(red: 1, green: 0.3, blue: 0.4)
        case "p³He": return Color.init(red: 1, green: 0.3, blue: 0.4)
        case "⁴He": return Color.init(red: 1, green: 0.3, blue: 0.5)
        case "p⁴He": return Color.init(red: 1, green: 0.3, blue: 0.5)
        case "n": return Color.init(white: 0.6)
        case "e+": return Color.init(red: 0, green: 1, blue: 0)
        case "v": return Color.init(red: 0, green: 1, blue: 1)
        case "γ": return Color.init(red: 1, green: 0.8, blue: 1)
        default: return Color.white
        }
    }
}
