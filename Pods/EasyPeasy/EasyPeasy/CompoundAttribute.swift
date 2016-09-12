// The MIT License (MIT) - Copyright (c) 2016 Carlos Vidal
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

/**
    `Attribute` that leads on the application of multiple
    `Attribute` objects
 */
open class CompoundAttribute: Attribute {
    
    /// Array of attributes that shape the `CompoundAttribute`
    open internal(set) var attributes: [Attribute] = []
    
    // MARK: Public methods
    
    /**
         Sets the `priority` of the constraint and subconstraints
         - parameter priority: `Priority` enum specifying the
         priority of the constraint
         - returns: the `Attribute` instance
     */
    open override func with(_ priority: Priority) -> Self {
        super.with(priority)
        for attribute in self.attributes {
            attribute.with(priority)
        }
        return self
    }
    
    /**
        Sets the `when` closure of the `Attribute` and each one
        of the `Attribute` objects shaping the `CompoundAttribute`
         - parameter closure: `Closure` to be called before
         installing a constraint
         - returns: the `Attribute` instance
     */
    open override func when(_ closure: Condition?) -> Self {
        super.when(closure)
        for attribute in self.attributes {
            attribute.when(closure)
        }
        return self
    }
    
    // MARK: Internal methods
    
    /**
        This method evaluates whether an `Attribute` should be
        applied, resolves any conflicts with the `Attributes`
        already applied and it also generates the `NSLayoutConstraint`
        added to `view` for each one of the `Attribute` objects
        shaping the `CompoundAttribute`
        - parameter view: `UIView` in which the generated
        `NSLayoutConstraint` will be added
        - returns an `Array` of `NSLayoutConstraint` objects that will
        be installed on the `UIView` passed as parameter
     */
    override func createConstraintForView(_ view: UIView) -> [NSLayoutConstraint] {
        // Reference to the target view
        self.createView = view
        
        // Create the constraints that will be installed in
        // the `UIView` given composing the `CompoundAttribute`
        var constraints: [NSLayoutConstraint] = []
        for attribute in self.attributes {
            let newConstraints = attribute.createConstraintForView(view)
            constraints.append(contentsOf: newConstraints)
        }
        
        return constraints
    }
    
}
