//#-hidden-code
import Foundation
import PlaygroundSupport
func getStars() -> [Star] {
    do {
        // Obtain the json data from the file.
        let jsonData = try Data(contentsOf: #fileLiteral(resourceName: "stars.json"))
        // Decode the json into a Swift structure.
        let data = try? JSONDecoder().decode(StarStructure.self, from: jsonData)
        if data != nil {
            // Return the stars array from the decoded structure.
            return data!.stars
        }
    } catch {
        print(error)
    }
    return []
}
//#-end-hidden-code
/*:
 # ⭐ Stellar Evolution ⭐
 
 ### Low Mass Stars
 
 When stars with low masses ⬇️ like the Sun ☀️ run out of hydrogen to fuse, helium fusion begins and the star expands to compensate. It can increase to hundreds of times its prior size. The surface actually cools ❄️ because the surface area increases so much, and the star turns red. It is now a red giant. 🔴
 
 Red giants 🔴 will contract and expand as helium fuses. Eventually, when the helium is depleted, the star blows 🌬 off its outer layers 💨 into a planetary nebula, 🌈 and all that remains is its core: a white dwarf. ⚪️
 */
let stars = getStars()
var star: Star? = nil
/*:
 Let's see what the Sun ☀️ will look like when it turns into a red giant about 5 billion years from now. Call the `sun.expand()` method to see the Sun's evolution. Then set the `star` variable to `sun` to display it, and run the code.
 */
//#-editable-code
let sun = stars[0]
// Make the Sun expand into a red giant.

// Set the star variable to the Sun.

//#-end-editable-code
/*:
 ### High Mass Stars
 
 High mass ⬆️ stars behave much differently. Helium fusion creates carbon, which is able to fuse if the star is more than about 8 times heavier ⚖️ than the Sun. Like a low mass ⬇️ star, helium fusion causes a massive ⬆️ star to expand and cool ❄️ into a giant, but this time, a supergiant.
 
 After the supergiant has fused carbon, it can fuse neon, oxygen, and silicon, but it stops at iron. Iron fusion does not release energy; it builds up in the core until the rest of the fusion stops. The star has nothing to hold it together, and it collapses in a fraction of a second. 🧨 When all of the material comes crashing 🤯 onto the core, it is launched outward in an incredible blast: a **supernova**. 💥
 
 Rigel is a high mass ⬆️ star currently in its blue supergiant 🔵 phase. It's due to explode 💥 in the next couple hundred thousand years. Let's see what will happen: call `rigel.expand()` to see Rigel evolve. Then set `star` to `rigel`, and run the code.
 */
//#-editable-code
let rigel = stars[13]
// Make Rigel expand into a red supergiant and go supernova.

// Set the star variable to Rigel.

//#-end-editable-code
/*:
 The star blows 💥 itself to smithereens, and it leaves behind a ridiculously dense and powerful ball of neutrons: a neutron star. 🧲 If the star was massive enough, the neutron star would collapse even further into a black hole, ⚫️ an object so dense that not even light can escape.
 */
let view = StarView(star: star ?? stars[0])
/*:
 And that's about it for our fun with stars. I hope you enjoyed learning about the lightbulbs 💡 of the universe in this playground. Remember, without stars ⭐️ and without supernovae, 💥 heavy elements wouldn't form, we would never exist, and we wouldn't be able to survive if we did. The stars ⭐️ are so important to us. Thank you very much for playing in Planetaria Star! 🤩
 
 ⭐️⭐️⭐️⭐️⭐️
 */
//#-hidden-code
PlaygroundPage.current.setLiveView(view)
//#-end-hidden-code
