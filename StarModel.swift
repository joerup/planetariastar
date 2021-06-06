

import Foundation
import SwiftUI

public struct StarModel: View {
    var star: Star? = nil
    var temp: Double
    var luminosity: Double
    var size: CGFloat
    var mass: CGFloat
    var scale: CGFloat 
    var scale2: CGFloat
    var name: Bool = false
    
    public init(star: Star, scale: CGFloat = 200, scale2: CGFloat = 1.5, name: Bool = false) {
        self.star = star
        self.temp = Double(star.temp)
        self.luminosity = log10(star.luminosity)
        self.size = CGFloat(log10(star.radius))
        self.mass = CGFloat(log10(star.mass))
        self.scale = scale
        self.scale2 = scale2
        self.name = name
    }
    public init(temp: Double, luminosity: Double, size: CGFloat, mass: CGFloat, scale: CGFloat = 200, scale2: CGFloat = 1.5) {
        self.temp = temp
        self.luminosity = luminosity
        self.size = size
        self.mass = mass
        self.scale = scale
        self.scale2 = scale2
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .frame(width: pow(1.5,self.size)*scale, height: pow(1.5,self.size)*scale)
                .shadow(color: color(opacity: 0.7), radius: CGFloat(pow(1.5,luminosity))*scale/5, x: 0, y: 0)
            Circle()
                .fill(
                    RadialGradient(gradient: Gradient(colors: [color(), .white]), center: .center, startRadius: pow(10,mass)/volume(radius: pow(scale2,size)) >= 10 ? pow(scale2,size)*scale-1 : (((pow(10,mass)/volume(radius: pow(scale2,size)))/10)*pow(scale2,size)*scale), endRadius: pow(scale2,size)*scale)
                )
                .frame(width: pow(scale2,self.size)*scale, height: pow(scale2,self.size)*scale)
            Text(name ? star!.name : "")
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3)
        }
    }
    
    public func volume(radius: CGFloat) -> CGFloat {
        let pi = CGFloat(Double.pi)
        return 4/3 * pi * pow(radius,3)
    }
    
    public func color(opacity: Double = 1) -> Color {
        var colors: [Double] = [0,0,0]
        if temp < 3500 {
            colors = [250*(temp/3500),120,80]
        }
        else if temp < 5000 {
            colors = [255,180*(temp/5000),80]
        }
        else if temp < 6500 {
            colors = [255,255*(temp/6500),100]
        }
        else if temp < 8000 {
            colors = [255*(8000/temp),245*(10000/temp),170*(temp/8000)]
        }
        else if temp < 10000 {
            colors = [200*(10000/temp),245*(15000/temp),255*(temp/10000)]
        }
        else if temp < 50000 {
            colors = [200*(10000/temp),245*(15000/temp),255]
        }
        else {
            colors = [40*pow((temp/50000),2),73.5*pow((temp/50000),2),255]
            for c in 0...2 {
                if colors[c] > 150 {
                    colors[c] = 150
                }
            }
        }
        return Color.init(red: colors[0]/255, green: colors[1]/255, blue: colors[2]/255, opacity: opacity)
    }
}
