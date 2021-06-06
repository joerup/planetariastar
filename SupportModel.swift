
import Foundation
import SwiftUI

public struct Nebula: View {
    var display: Bool
    @State var size: CGFloat = 1
    public var body: some View {
        if display {
            ZStack {
                ZStack {
                    Circle()
                        .stroke(Color.white, lineWidth: size*0.1)
                        .frame(width: size*3.3, height: size*3.3)
                        .opacity(0.3)
                        .shadow(color: Color.white, radius: size/6, x: 0, y: 0)
                    Circle()
                        .stroke(Color.white, lineWidth: size*0.15)
                        .frame(width: size*3.5, height: size*3.5)
                        .opacity(0.2)
                        .shadow(color: Color.white, radius: size/7, x: 0, y: 0)
                    Circle()
                        .stroke(Color.white, lineWidth: size*0.15)
                        .frame(width: size*3.8, height: size*3.8)
                        .opacity(0.1)
                        .shadow(color: Color.white, radius: size/8, x: 0, y: 0)
                }
                Circle()
                    .stroke(Color.red, lineWidth: size*0.06)
                    .frame(width: size*3, height: size*3)
                    .opacity(0.6)
                    .shadow(color: Color.red, radius: size/8, x: 0, y: 0)
                Circle()
                    .stroke(Color.orange, lineWidth: size*0.12)
                    .frame(width: size*2.8, height: size*2.8)
                    .opacity(0.3)
                    .shadow(color: Color.orange, radius: size/9, x: 0, y: 0)
                Circle()
                    .stroke(Color.yellow, lineWidth: size*0.12)
                    .frame(width: size*2.55, height: size*2.55)
                    .opacity(0.2)
                    .shadow(color: Color.yellow, radius: size/10, x: 0, y: 0)
                Circle()
                    .stroke(Color.init(red: 0.8, green: 0.8, blue: 0.4), lineWidth: size*0.25)
                    .frame(width: size*2.4, height: size*2.4)
                    .opacity(0.18)
                    .shadow(color: Color.init(red: 0.8, green: 0.8, blue: 0.4), radius: size/6, x: 0, y: 0)
                Circle()
                    .stroke(Color.init(white: 0.9), lineWidth: size*0.14)
                    .frame(width: size*2.1, height: size*2.1)
                    .opacity(0.15)
                    .shadow(color: Color.init(white: 0.9), radius: size/10, x: 0, y: 0)
                Circle()
                    .stroke(Color.init(red: 0.4, green: 0.8, blue: 0.8), lineWidth: size*0.15)
                    .frame(width: size*1.8, height: size*1.8)
                    .opacity(0.15)
                    .shadow(color: Color.init(red: 0.4, green: 0.8, blue: 0.8), radius: size/8, x: 0, y: 0)
                Circle()
                    .stroke(Color.blue, lineWidth: size*0.14)
                    .frame(width: size*1.5, height: size*1.5)
                    .opacity(0.1)
                    .shadow(color: Color.blue, radius: size/6, x: 0, y: 0)
                Circle()
                    .stroke(Color.init(red: 0, green: 0.1, blue: 0.3), lineWidth: size*0.15)
                    .frame(width: size*1.2, height: size*1.2)
                    .opacity(0.05)
                    .shadow(color: Color.init(red: 0, green: 0.1, blue: 0.3), radius: size/5, x: 0, y: 0)
            }
            .onAppear {
                nebula(step: 0, speed: 0.01, limit: 350)
            }
        }
    }
    func nebula(step: Int, speed: Double, limit: Int) {
        if Int(size) >= limit {
            return
        }
        size += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + speed*pow(2,Double(size/100))) {
            nebula(step: step+1, speed: speed, limit: limit)
        }
    }
}

public struct Supernova: View {
    var display: Bool
    @State var size: CGFloat = 1
    @State var fade: Double = 1
    public var body: some View {
        if display {
            ZStack {
                ZStack {
                    Circle()
                        .stroke(Color.white, lineWidth: size*0.22)
                        .frame(width: pow(1.025,size), height: pow(1.025,size))
                        .opacity(0.3/fade)
                        .shadow(color: Color.white, radius: size/4, x: 0, y: 0)
                    Circle()
                        .stroke(Color.init(red: 0.7, green: 0.7, blue: 0.9), lineWidth: size*0.17)
                        .frame(width: pow(1.022,size), height: pow(1.022,size))
                        .opacity(0.35/fade)
                        .shadow(color: Color.init(red: 0.7, green: 0.65, blue: 0.9), radius: size/3, x: 0, y: 0)
                    Circle()
                        .stroke(Color.white, lineWidth: size*0.14)
                        .frame(width: pow(1.02,size), height: pow(1.02,size))
                        .opacity(0.45/fade)
                        .shadow(color: Color.white, radius: size/8, x: 0, y: 0)
                    Circle()
                        .stroke(Color.init(red: 0.5, green: 0.5, blue: 0.9), lineWidth: size*0.1)
                        .frame(width: pow(1.016,size), height: pow(1.016,size))
                        .opacity(0.35/fade)
                        .shadow(color: Color.init(red: 0.5, green: 0.5, blue: 0.9), radius: size/7, x: 0, y: 0)
                    Circle()
                        .stroke(Color.init(red: 0.5, green: 0.5, blue: 0.6), lineWidth: size*0.12)
                        .frame(width: pow(1.018,size), height: pow(1.018,size))
                        .opacity(0.5/fade)
                        .shadow(color: Color.init(red: 0.5, green: 0.5, blue: 0.6), radius: size/4, x: 0, y: 0)
                    Circle()
                        .stroke(Color.white, lineWidth: size*0.1)
                        .frame(width: pow(1.014,size), height: pow(1.014,size))
                        .opacity(0.4/fade)
                        .shadow(color: Color.white, radius: size/4, x: 0, y: 0)
                    Circle()
                        .stroke(Color.white, lineWidth: size*0.17)
                        .frame(width: pow(1.012,size), height: pow(1.012,size))
                        .opacity(0.45/fade)
                        .shadow(color: Color.white, radius: size/5, x: 0, y: 0)
                    Circle()
                        .stroke(Color.init(red: 0.8, green: 0.8, blue: 0.9), lineWidth: size*0.15)
                        .frame(width: pow(1.0135,size), height: pow(1.0135,size))
                        .opacity(0.55/fade)
                        .shadow(color: Color.init(red: 0.8, green: 0.8, blue: 0.9), radius: size/6, x: 0, y: 0)
                }
                Circle()
                    .stroke(Color.white, lineWidth: size*0.15)
                    .frame(width: size*2, height: size*2)
                    .opacity(0.5/fade)
                    .shadow(color: Color.init(red: 0, green: 0.1, blue: 0.3), radius: size/5, x: 0, y: 0)
                Circle()
                    .frame(width: size*1.1, height: size*1.1)
                    .opacity(0.95/fade)
                    .shadow(color: Color.white, radius: size/2, x: 0, y: 0)
                Circle()
                    .stroke(Color.init(red: 0.9, green: 0.93, blue: 1), lineWidth: size*0.5)
                    .frame(width: size*0.8, height: size*0.8)
                    .opacity(0.7/fade)
                    .shadow(color: Color.init(red: 0.9, green: 0.93, blue: 1), radius: size/3, x: 0, y: 0)
                Rectangle()
                    .frame(width: size*2.5, height: size*0.2)
                    .opacity(0.6/fade)
                    .cornerRadius(size)
                    .shadow(color: Color.white, radius: size/6, x: 0, y: 0)
                Rectangle()
                    .frame(width: size*1.7, height: size*0.3)
                    .opacity(0.55/fade)
                    .cornerRadius(size)
                    .shadow(color: Color.white, radius: size/6, x: 0, y: 0)
                Rectangle()
                    .frame(width: size*1.2, height: size*0.5)
                    .opacity(0.4/fade)
                    .cornerRadius(size)
                    .shadow(color: Color.white, radius: size/4, x: 0, y: 0)
                Rectangle()
                    .frame(width: size*0.8, height: size*0.8)
                    .opacity(0.85/fade)
                    .cornerRadius(size)
                    .shadow(color: Color.white, radius: size/3, x: 0, y: 0)
            }
            .onAppear {
                supernova(step: 0, speed: 0.001, limit: 600)
            }
        }
    }
    func supernova(step: Int, speed: Double, limit: Int) {
        if Int(size) >= limit {
            return
        }
        size += 1
        fade *= 1.003
        DispatchQueue.main.asyncAfter(deadline: .now() + speed*pow(2,Double(size/100))) {
            supernova(step: step+1, speed: speed, limit: limit)
        }
    }
}
