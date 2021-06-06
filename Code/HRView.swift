

import Foundation
import SwiftUI

public struct HRView: View {
    var stars: [Star] 
    var size: CGFloat
    var groups: Bool
    var names: Bool
    
    public init(stars: [Star] = [], size: CGFloat = 600, groups: Bool = false, names: Bool = false) {
        self.stars = stars
        self.size = size
        self.groups = groups
        self.names = names
    }
    
    public var body: some View {
        
        ZStack {
            VStack(spacing:0) {
                Text("Hertzsprung-Russell Diagram")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(20)
                Spacer()
            }
            ZStack {
                HStack(spacing:0) {
                    VStack(spacing:0) {
                        Text("Luminosity")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                            .lineLimit(0)
                            .rotationEffect(.degrees(-90))
                            .frame(width: size, height: 49)
                    }
                    .frame(width: 48, height: size)
                    .padding(.top, 100)
                    .padding(.bottom, 50)
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 2, height: size)
                        .padding(.top, 100)
                        .padding(.bottom, 50)
                    
                    VStack(spacing:0) {
                        Spacer()
                            .frame(width: size, height: 100)
                        HRDiagram(stars: stars, s: size, groups: groups, names: names)
                            .padding(.bottom, size)
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: size, height: 2)
                            .padding(.top, -size/2)
                        VStack(spacing:0) {
                            Text("Temperature")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title)
                                .padding(.top, -size/2)
                        }
                        .frame(width: size, height: 49)
                    }
                    .frame(width: size, height: size+150)
                    Spacer()
                        .frame(width: 50, height: size+150)
                }
            }
        }
        .background(Image(uiImage: #imageLiteral(resourceName: "StarrySky.png")))
    }
}


