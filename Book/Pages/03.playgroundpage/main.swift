//#-hidden-code
import Foundation
import PlaygroundSupport
//#-end-hidden-code
/*:
 # ⭐ Nucleosynthesis ⭐
 
 Stars create an enormous amount of energy ⚡️ in their cores which is emitted into space as light 🌈 and heat. 🔥 This energy comes from **nucleosynthesis**, ⚛️ where the hydrogen contained in a star is fused into helium.
 
 Only a very small amount of energy ⚡️ is released in fusion, but an unfathomable amount of hydrogen atoms ⚛️ fuse every second, adding up to a *lot* of energy.
 
 Let's set some particles 🔴 to start with. First we'll instantiate some protons as `Particle` objects.
 */
//#-editable-code
// Instantiate protons and set their positions.
let proton0 = Particle(id: 0, name: "¹H", x: 150, y: 100)
let proton1 = Particle(id: 1, name: "¹H", x: 150, y: 600)
let proton2 = Particle(id: 2, name: "¹H", x: 550, y: 100)
let proton3 = Particle(id: 3, name: "¹H", x: 550, y: 600)
let proton4 = Particle(id: 4, name: "¹H", x: 100, y: 350)
let proton5 = Particle(id: 5, name: "¹H", x: 600, y: 350)
// Add the protons to the particles array.
var particles = [proton0,proton1,proton2,proton3,proton4,proton5]
//#-end-editable-code
/*:
 Now we need to get the particles 🔴 to fuse by calling `.annihilate()`, a method of a `Particle` object. Use a loop to access integers 0...5 and call `particles[i].annihilate()`.
 */
//#-editable-code
// Make everything in the particles array annihilate.

//#-end-editable-code
/*:
 You can also change the fusion speed. 🏃‍♂️ This will be passed into the view.
 
 Run the program to see what happens when these particles 🔴 interact in stellar ⭐️ cores at millions of degrees.
 
 *Credit: Particle annihilation image from flaticon.com.*
 */
//#-editable-code
let speed: Double = 2
let view = ParticleView(particles: particles, speed: speed, size: 800)
//#-end-editable-code
/*:
 The gamma ray 🔆 photons (γ) emitted from fusion travel through the star and decrease in frequency. They emerge as visible, ultraviolet, or infrared photons that are released from the star.
 
 Since light travels ✈️ at about 300,000 km/s, it can take years for it to reach the Earth. 🌎 It takes about 8 minutes for light from the Sun to reach Earth. For Sirius, the light takes 8 years. For Deneb, it's over 2600 years.
 
 Now that we've seen how stars create their energy, you might be wondering what happens when the star runs out 😦 of hydrogen. At higher temperatures and pressures, more elements can fuse just like hydrogen does. Let's check out these processes in [Stellar Evolution](@next).
 */
//#-hidden-code
PlaygroundPage.current.setLiveView(view)
//#-end-hidden-code

