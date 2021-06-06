//#-hidden-code
import Foundation
import PlaygroundSupport
//#-end-hidden-code
/*:
 # ⭐ Stars ⭐
 
 We're going to learn about stars, enormous balls ☄️ of plasma in space 🪐 that release energy by fusing hydrogen into helium. These ✨sparkly✨ behemoths have been visible to humans for all of history, but only in the past few centuries have we really understood them.
 
 A **star** ⭐️ is just a massive object in space. 🔭 The only reason they glow 🌟 is because their immense size causes very high pressures in their cores, causing nuclear fusion reactions, which produce energy. ✨ If you piled enough *stuff* together, you could make almost *anything* into a star.
 
 Let's define a star ⭐️ object with some essential attributes. Feel free to change them however you want and customize your star.
 */
//#-editable-code
let star = Star(id: 0,
    // 📄 The name of your star.
    name: "My Star",
    // 🌡 Temperature in Kelvin. [1000...35000]
    temp: 13000,
    // ☀️ Luminosity in solar luminosities. [0.000001...1000000]
    luminosity: 11000,
    // ⚖️ Mass in solar masses. [0.025...100]
    mass: 12,
    // 📐 Radius in solar radii. [0.01...2500]
    radius: 14
)
//#-end-editable-code
/*:
 Now run the code to display the star and interact with it. Play with the values of temperature, luminosity, radius, and mass using the sliders to see how the star changes.
 
 Please note that the model is not perfectly to scale in order to fit on the screen; the star's size would change much more in reality.
 */
//#-hidden-code
func getStars() -> [Star] {
    do {
        // Obtain the json data from the file
        let jsonData = try Data(contentsOf: #fileLiteral(resourceName: "stars.json"))
        // Decode the json into a Swift structure
        let data = try? JSONDecoder().decode(StarStructure.self, from: jsonData)
        if data != nil {
            // Return the stars array from the decoded structure
            return data!.stars
        }
    } catch {
        print(error)
    }
    return []
}
let stars = getStars()
let sun = stars.count > 0 ? stars[0] : star
let proxima = stars.count > 0 ? stars[3] : star
let sirius = stars.count > 0 ?  stars[4] : star
let rigel = stars.count > 0 ? stars[13] : star
let betelgeuse = stars.count > 0 ? stars[14] : star
let polaris = stars.count > 0 ? stars[16] : star
let deneb = stars.count > 0 ? stars[29] : star
//#-end-hidden-code
//: You can also replace `star` with the names of one of these real stars: `sun`, `proxima`, `sirius`, `rigel`, `betelgeuse`, `polaris`, or `deneb`.
let view = StarView(star: /*#-editable-code*/star/*#-end-editable-code*/)
/*:
 You might notice that the star's color 🎨 changes based on its temperature. 🌡
 * 🔥Hotter🔥 stars are 🔵bluer🔵.
 * ❄️Cooler❄️ stars are 🔴redder🔴.
 * The ☀️Sun☀️ is in the middle, around 5700 K.
 
 Now let's learn more about star properties with the [H-R Diagram](@next)!
 */
//#-hidden-code
PlaygroundPage.current.setLiveView(view)
//#-end-hidden-code
