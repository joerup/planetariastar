//#-hidden-code
import Foundation
import PlaygroundSupport
import SwiftUI
//#-end-hidden-code
/*:
 # ⭐ H-R Diagram ⭐
 
 In 1911 and 1913, astronomers Ejnar Hertzsprung and Henry Norris Russell plotted a group of stars on a graph 📉 with temperature 🌡 on one axis and luminosity ☀️ on the other. They found that there is a strong correlation between the two properties.
 
 This graph became known as a Hertzsprung-Russell (H-R) Diagram. Run the code to see it!
 
 One problem: there are no stars on it! Let's import a bunch of real star data using a `json` file, which can be converted into `Star` objects.
 */
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
/*:
 We can use the `getStars()` function to pass in the star array to the H-R Diagram. To do that, replace the empty `[]` array with the `getStars()` function.
 */
//#-editable-code
// Call the getStars() function to use the stars in the diagram.
let stars: [Star] = []
//#-end-editable-code
/*:
 Now run the program and see the trends!
 
 Astronomers classify 👓 stars in different groups based on trends 📉 on the H-R diagram. You can see groups along with the stars' names by changing these values:
*/
//#-editable-code
// Display the major stellar groups.
let showGroups = false
// Display each star's name.
let showNames = false
//#-end-editable-code
/*:
 * You can clearly see a strong trend 📉 known as the **Main Sequence** where most stars are plotted.
 * In the top right, you can see the **Giant** and **Supergiant** stars. These are stars that have exhausted 🥱 their fuel and are nearing the end of their lives.
 * In the bottom left, you can see the **White Dwarf** stars, the remnants of former low-mass stars whose outer layers have been blown 🌬 off into space.
 */
let view = HRView(stars: stars, size: 800, groups: showGroups, names: showNames)
/*:
 Now let's see how stars work on the inside, and how they produce light: [Nucleosynthesis](@next)
 */
//#-hidden-code
PlaygroundPage.current.setLiveView(view)
//#-end-hidden-code
