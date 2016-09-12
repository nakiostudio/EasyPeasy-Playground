// The MIT License (MIT) - Copyright (c) 2016 Carlos Vidal
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
// KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
// PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS 
// OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit
import EasyPeasy
import PlaygroundSupport

// Helper function
func delay(_ delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}

// Creating the views
let container = UIView(frame: CGRect(x: 0, y: 0, width: 370.0, height: 370.0))
container.backgroundColor = UIColor.white
container.layer.borderColor = UIColor.darkGray.cgColor
container.layer.borderWidth = 1.0

PlaygroundPage.current.liveView = container

let blueBox = UIView(frame: CGRect.zero)
blueBox.backgroundColor = UIColor(red: 0.0/255.0, green: 105.0/255.0, blue: 167.0/255.0, alpha: 1.0)
container.addSubview(blueBox)

let redBox = UIView(frame: CGRect.zero)
redBox.backgroundColor = UIColor(red: 240.0/255.0, green: 84.0/255.0, blue: 43.0/255.0, alpha: 1.0)
container.addSubview(redBox)

let greenBox = UIView(frame: CGRect.zero)
greenBox.backgroundColor = UIColor(red: 181.0/255.0, green: 206.0/255.0, blue: 61.0/255.0, alpha: 1.0)
container.addSubview(greenBox)

let yellowBox = UIView(frame: CGRect.zero)
yellowBox.backgroundColor = UIColor(red: 224.0/255.0, green: 176.0/255.0, blue: 75.0/255.0, alpha: 1.0)
container.addSubview(yellowBox)

// Adding the constraints
blueBox <- [
    Width(80),
    Height(50).with(.mediumPriority),
    Left(10),
    Bottom(10)
]

redBox <- [
    Width().like(blueBox),
    Height(*0.5).like(blueBox),
    Left(10).to(blueBox),
    Bottom().to(blueBox, .bottom)
]

greenBox <- [
    Width().like(blueBox),
    Height(*0.5).like(redBox),
    Left(10).to(redBox),
    Bottom().to(redBox, .bottom)
]

yellowBox <- [
    Width().like(blueBox),
    Height(*0.5).like(greenBox),
    Left(10).to(greenBox),
    Bottom().to(greenBox, .bottom)
]

// Animating the constraints
delay(2.0) {
    
    UIView.animate(withDuration: 1.5) {
        blueBox <- Top(10)
        container.layoutIfNeeded()
    }
    
}
