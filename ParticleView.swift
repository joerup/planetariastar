
import SwiftUI

public struct ParticleView: View {
    @State var particles = [Particle]()
    var size: CGFloat = 600
    @State var delay = 3.0
    
    public init(particles: [Particle], speed: Double = 1, size: CGFloat = 600) {
        self._particles = State(initialValue: particles)
        self._delay = State(initialValue: 3/speed)
        self.size = size
    }
    
    public var body: some View {
        VStack {
            ZStack {
                ForEach(self.particles, id: \.id) { particle in
                    ParticleModel(particle: particle, standard: 100)
                        .position(x: particle.x, y: particle.y)
                        .animation(.easeInOut(duration: delay))
                }
            }
            .frame(width: 700, height: 700)
        }
        .frame(width: size+100, height: size+150)
        .background(RadialGradient(gradient: Gradient(colors: [Color.init(red: 0.9, green: 0.9, blue: 0.7), .orange]), center: .center, startRadius: 50, endRadius: size))
        .onAppear {
            fusion(step: 0)
        }
    }
    
    func fusion(step: Int) {
        if step <= 6 {
            next(step: step)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                fusion(step: step+1)
            }
        }
    }
    
    func next(step: Int) {
        if step == 1 {
            particles[0].move(toX: 350, byY: 50)
            particles[1].move(toX: 350, byY: -50)
            particles[2].move(toX: 350, byY: 50)
            particles[3].move(toX: 350, byY: -50)
        }
        else if step == 2 && particles.count > 0 && particles[0].annihilating {
            for i in 0...3 {
                particles[i].name = "removed"
            }
            let neutron0 = Particle(id: 6, name: "n", x: 380, y: 150)
            let neutron1 = Particle(id: 7, name: "n", x: 380, y: 550)
            let proton4 = Particle(id: 8, name: "²H", x: 320, y: 150)
            let proton5 = Particle(id: 9, name: "²H", x: 320, y: 550)
            let positron0 = Particle(id: 10, name: "e+", x: 325, y: 150)
            let positron1 = Particle(id: 11, name: "e+", x: 325, y: 550)
            let neutrino0 = Particle(id: 12, name: "v", x: 375, y: 150)
            let neutrino1 = Particle(id: 13, name: "v", x: 375, y: 550)
            let explosion0 = Particle(id: 14, name: "explosion", x: 350, y: 150)
            let explosion1 = Particle(id: 15, name: "explosion", x: 350, y: 550)
            particles += [neutron0,neutron1,proton4,proton5,positron0,positron1,neutrino0,neutrino1,explosion0,explosion1]
            DispatchQueue.main.asyncAfter(deadline: .now() + delay/20) {
                particles[10].move(toX: 100, byY: -100)
                particles[11].move(toX: 600, byY: 100)
                particles[12].move(toX: 600, byY: -100)
                particles[13].move(toX: 100, byY: 100)
                for i in 14...15 {
                    particles[i].remove()
                }
            }
        }
        else if step == 3 && particles.count > 4 && particles[4].annihilating {
            particles[4].move(toX: 350, toY: 600)
            particles[5].move(toX: 350, toY: 200)
        }
        else if step == 4 && particles.count > 8 && particles[8].annihilating {
            for i in 8...9 {
                particles[i].remove()
            }
            for i in 4...5 {
                particles[i].remove()
            }
            let proton8 = Particle(id: 16, name: "p³He", x: 350, y: 600)
            let proton9 = Particle(id: 17, name: "p³He", x: 350, y: 200)
            let proton10 = Particle(id: 18, name: "³He", x: 320, y: 550)
            let proton11 = Particle(id: 19, name: "³He", x: 320, y: 150)
            let gamma0 = Particle(id: 20, name: "γ", x: 350, y: 150)
            let gamma1 = Particle(id: 21, name: "γ", x: 350, y: 550)
            let explosion2 = Particle(id: 22, name: "explosion", x: 350, y: 150)
            let explosion3 = Particle(id: 23, name: "explosion", x: 350, y: 550)
            particles += [proton8,proton9,proton10,proton11,gamma0,gamma1,explosion2,explosion3]
            DispatchQueue.main.asyncAfter(deadline: .now() + delay/20) {
                particles[20].move(byY: -200)
                particles[21].move(byY: 200)
                for i in 22...23 {
                    particles[i].remove()
                }
            }
        }
        else if step == 5 && particles.count > 6 && particles[6].annihilating {
            particles[6].move(toY: 300)
            particles[7].move(toY: 350)
            particles[16].move(toY: 400)
            particles[17].move(toY: 350)
            particles[18].move(toY: 350)
            particles[19].move(toY: 300)
        }
        else if step == 6 && particles.count > 16 && particles[16].annihilating {
            for i in 16...19 {
                particles[i].remove()
            }
            for i in 6...7 {
                particles[i].remove()
            }
            let proton12 = Particle(id: 24, name: "¹H", x: 350, y: 350)
            let proton13 = Particle(id: 25, name: "¹H", x: 350, y: 350)
            let neutron2 = Particle(id: 26, name: "n", x: 320, y: 380)
            let neutron3 = Particle(id: 27, name: "n", x: 380, y: 320)
            let proton14 = Particle(id: 28, name: "p⁴He", x: 380, y: 380)
            let proton15 = Particle(id: 29, name: "⁴He", x: 320, y: 320)
            let explosion4 = Particle(id: 30, name: "explosion", x: 350, y: 320)
            let explosion5 = Particle(id: 31, name: "explosion", x: 350, y: 380)
            particles += [proton12,proton13,neutron2,neutron3,proton14,proton15,explosion4,explosion5]
            DispatchQueue.main.asyncAfter(deadline: .now() + delay/20) {
                for i in 30...31 {
                    particles[i].remove()
                }
                particles[24].move(toX: 100)
                particles[25].move(toX: 600)
            }
        }
    }
}
