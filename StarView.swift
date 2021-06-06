

import Foundation
import UIKit
import SwiftUI

public struct StarView: View {
    var star: Star
    @State public var name: String? = nil
    @State public var temp: Double
    @State public var luminosity: Double
    @State public var size: CGFloat
    @State public var mass: CGFloat
    @State public var nebula: Bool = false
    @State public var supernova: Bool = false
    
    public init(star: Star) {
        self.star = star
        self._name = State(initialValue: star.name)
        self._temp = State(initialValue: Double(star.temp))
        self._luminosity = State(initialValue: log10(star.luminosity))
        self._size = State(initialValue: log10(CGFloat(star.radius)))
        self._mass = State(initialValue: log10(CGFloat(star.mass)))
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                    ZStack {
                        Nebula(display: nebula)
                        StarModel(temp: temp, luminosity: luminosity, size: size, mass: mass)
                        Supernova(display: supernova)
                    }
                .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.9, alignment: .center)
                VStack {
                    Text("\(name ?? "Star")")
                        .font(.system(size: 60))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .lineLimit(0)
                        .minimumScaleFactor(0.5)
                        .padding(20)
                    Spacer()
                    HStack {
                        Text("Temperature")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                        Slider(value: $temp, in: 1000...35000, step: 100)
                        Text("\(temperature(self.temp)) K")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    HStack {
                        Text("Luminosity")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                        Slider(value: $luminosity, in: -6.0...6.0, step: 0.01)
                        Text("\(solarLuminosities(luminosity)) x Sun")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    HStack {
                        Text("Mass")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                        Slider(value: self.$mass, in: -1.6...2.0, step: 0.01)
                        Text("\(solarMasses(mass)) x Sun")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    HStack {
                        Text("Radius")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                        Slider(value: self.$size, in: -2.0...3.4, step: 0.01)
                        Text("\(solarRadii(size)) x Sun")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                    }
                }
                .padding(.horizontal, geometry.size.width*0.05)
                .padding(.bottom, 10)
            }
            .background(Image(uiImage: #imageLiteral(resourceName: "StarrySky.png")))
            .onAppear { 
                if star.expanding {
                    clock(step: mass < log10(8.5) ? 0 : 6, run: 0)
                }
            }
        }
    }
    
    func clock(step: Int, run: Int) {
        if (step == 0 && run < 500) 
            || (step == 1 && run < 250)
            || (step == 2 && run < 100)
            || (step == 3 && run < 300) 
            || (step == 4 && run < 800) {
            if step == 4 {
                nebula = true
            }
            self.sunExpansion(phase: step)
            DispatchQueue.main.asyncAfter(deadline: .now() + (step == 1 || step == 3 ? 0.0003 : step == 2 ? 0.00005 : 0.001)) {
                self.clock(step: step, run: run+1)
            }
        }
        else if step < 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (step == 0 ? 0.2 : step == 3 ? 0.8 : 0.1)) {
                self.clock(step: step+1, run: 0)
            }
        }
        else if (step == 6 && run < 500)
                    || (step == 7 && run < 250)
                    || (step == 8 && run < 300) 
                    || (step == 9 && run < 20) {
            if step == 9 {
                nebula = true
            }
            self.supernova(phase: step-6)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.00005) {
                self.clock(step: step, run: run+1)
            }
        }
        else if step < 10 && step >= 6 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (step == 9 ? 0.8 : 0.1)) {
                self.clock(step: step+1, run: 0)
            }
        }
    }
    
    func sunExpansion(phase: Int) {
        if phase == 0 {
            temp += (3000-5700)/500.0
            luminosity += (log10(2350)-log10(1))/500.0
            size += (log10(166)-log10(1))/500.0
            mass += (log10(0.78)-log10(1))/500.0
        }
        else if phase == 1 {
            temp += (4700-3000)/250.0
            luminosity += (log10(41)-log10(2350))/250.0
            size += (log10(9.5)-log10(166))/250.0
            mass += (log10(0.77)-log10(0.78))/250.0
        }
        else if phase == 2 {
            temp += (4500-4700)/100.0
            luminosity += (log10(110)-log10(41))/100.0
            size += (log10(18)-log10(9.5))/100.0
            mass += (log10(0.72)-log10(0.77))/100.0
        }
        else if phase == 3 {
            temp += (3000-4500)/300.0
            luminosity += (log10(3000)-log10(110))/300.0
            size += (log10(180)-log10(18))/300.0
            mass += (log10(0.6)-log10(0.72))/300.0
        }
        else if phase == 4 {
            temp = pow(temp,1.00047)
            luminosity += (log10(3500)-log10(3000))/800.0
            size += (log10(0.02)-log10(180))/800.0
            mass += (log10(0.54)-log10(0.72))/800.0
        }
    }
    
    func supernova(phase: Int) {
        if phase == 0 {
            temp += (3450-12000)/500.0
            luminosity += (log10(140000)-log10(120000))/500.0
            size += (log10(800)-log10(79))/500.0
            mass += (log10(18)-log10(21))/500.0
        }
        else if phase == 1 {
            temp += (8900-3450)/250.0
            luminosity += (log10(140000)-log10(140000))/250.0
            size += (log10(100)-log10(800))/250.0
            mass += (log10(18)-log10(18))/250.0
        }
        else if phase == 2 {
            temp += (3400-8900)/300.0
            luminosity += (log10(140000)-log10(140000))/300.0
            size += (log10(1000)-log10(100))/300.0
            mass += (log10(17)-log10(18))/300.0
        }
        else if phase == 3 {
            supernova = true
            temp += (10e11-3400)/20.0
            luminosity += (12-log10(140000))/20.0
            size += (log10(1.4e-5)-log10(1000))/20.0
            mass += (log10(1.4)-log10(17))/20.0
        }
    }
    
    func temperature(_ temp: Double) -> String {
        let tempPower = 2-ceil(log10(temp))
        let roundValue = pow(10,tempPower)
        let rounded = Double(round(temp*roundValue)/roundValue)
        return fixDecimal(String(rounded))
    }
    
    func solarRadii(_ size: CGFloat) -> String {
        let solarRadii = pow(10,size)
        let roundPower = 2-ceil(log10(solarRadii))
        let roundValue = pow(10,roundPower)
        let rounded = Double(round(solarRadii*roundValue)/roundValue)
        return fixDecimal(String(rounded))
    }
    
    func solarMasses(_ mass: CGFloat) -> String {
        let solarMasses = pow(10,mass)
        let roundPower = 2-ceil(log10(solarMasses))
        let roundValue = pow(10,roundPower)
        let rounded = Double(round(solarMasses*roundValue)/roundValue)
        return fixDecimal(String(rounded))
    }
    
    func solarLuminosities(_ luminosity: Double) -> String {
        let solarLuminosities = pow(10,luminosity)
        let roundPower = 2-ceil(log10(solarLuminosities))
        let roundValue = pow(10,roundPower)
        let rounded = Double(round(solarLuminosities*roundValue)/roundValue)
        return fixDecimal(String(rounded))
    }
    
    func fixDecimal(_ str: String) -> String {
        var string = str
        if string.contains(".") && string.last == "0" && !string.contains("e") {
            string.removeLast()
            if string.last == "." {
                string.removeLast()
            }
        }
        return string
    }
}



