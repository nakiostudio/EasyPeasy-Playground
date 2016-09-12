// The MIT License (MIT) - Copyright (c) 2016 Carlos Vidal
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

/**
    An enum representation of the different attribute
    classes available
 */
public enum ReferenceAttribute {
    
    // Dimesion attributes
    case width
    case height
    
    // Position attributes
    case left
    case right
    case top
    case bottom
    case leading
    case trailing
    case centerX
    case centerY
    case firstBaseline
    case lastBaseline
    case leftMargin
    case rightMargin
    case topMargin
    case bottomMargin
    case leadingMargin
    case trailingMargin
    case centerXWithinMargins
    case centerYWithinMargins
    
    // Default
    case notAnAttribute
    
    /// Reference attribute opposite to the current one
    internal var opposite: ReferenceAttribute {
        switch self {
        case .width: return .width
        case .height: return .height
        case .left: return .right
        case .right: return .left
        case .top: return .bottom
        case .bottom:return .top
        case .leading: return .trailing
        case .trailing: return .leading
        case .centerX: return .centerX
        case .centerY: return .centerY
        case .lastBaseline: return .lastBaseline
        case .firstBaseline: return .firstBaseline
        case .leftMargin: return .rightMargin
        case .rightMargin: return .leftMargin
        case .topMargin: return .bottomMargin
        case .bottomMargin: return .topMargin
        case .leadingMargin: return .trailingMargin
        case .trailingMargin: return .leadingMargin
        case .centerXWithinMargins: return .centerXWithinMargins
        case .centerYWithinMargins: return .centerYWithinMargins
        case .notAnAttribute: return .notAnAttribute
        }
    }
    
    /// AutoLayout attribute equivalent of the current reference
    /// attribute
    internal var layoutAttribute: NSLayoutAttribute {
        switch self {
        case .width: return .width
        case .height: return .height
        case .left: return .left
        case .right: return .right
        case .top: return .top
        case .bottom:return .bottom
        case .leading: return .leading
        case .trailing: return .trailing
        case .centerX: return .centerX
        case .centerY: return .centerY
        case .lastBaseline: return .lastBaseline
        case .firstBaseline: return .firstBaseline
        case .leftMargin: return .leftMargin
        case .rightMargin: return .rightMargin
        case .topMargin: return .topMargin
        case .bottomMargin: return .bottomMargin
        case .leadingMargin: return .leadingMargin
        case .trailingMargin: return .trailingMargin
        case .centerXWithinMargins: return .centerXWithinMargins
        case .centerYWithinMargins: return .centerYWithinMargins
        case .notAnAttribute: return .notAnAttribute
        }
    }
    
    /// Reference attributes that may conflict with the current one
    internal var conflictingAttributes: [ReferenceAttribute] {
        let left: [ReferenceAttribute] = [.left, .centerX, .leading, .leftMargin, .centerXWithinMargins, .leadingMargin]
        let right: [ReferenceAttribute] = [.right, .centerX, .trailing, .rightMargin, .centerXWithinMargins, .trailingMargin]
        let top: [ReferenceAttribute] = [.top, .centerY, .firstBaseline, .topMargin, .centerYWithinMargins]
        let bottom: [ReferenceAttribute] = [.bottom, .centerY, .lastBaseline, .bottomMargin, .centerYWithinMargins]
        let firstBaseLine: [ReferenceAttribute] = [.top, .centerY, .firstBaseline, .topMargin, .centerYWithinMargins]
        let lastBaseLine: [ReferenceAttribute] = [.lastBaseline, .bottom, .centerY, .bottomMargin, .centerYWithinMargins]
        let centerX: [ReferenceAttribute] = [.centerX, .left, .right, .leading, .trailing, .leftMargin, .rightMargin, .centerXWithinMargins, .leadingMargin, .trailingMargin]
        let centerY: [ReferenceAttribute] = [.centerY, .top, .bottom, .lastBaseline, .firstBaseline, .topMargin, .bottomMargin, .centerYWithinMargins]
        
        switch self {
        case .width: return [.width]
        case .height: return [.height]
        case .left: return left
        case .right: return right
        case .top: return top
        case .bottom: return bottom
        case .leading: return left
        case .trailing: return right
        case .centerX: return centerX
        case .centerY: return centerY
        case .firstBaseline: return firstBaseLine
        case .lastBaseline: return lastBaseLine
        case .leftMargin: return left
        case .rightMargin: return right
        case .topMargin: return top
        case .bottomMargin: return bottom
        case .leadingMargin: return left
        case .trailingMargin: return right
        case .centerXWithinMargins: return centerX
        case .centerYWithinMargins: return centerY
        case .notAnAttribute: return []
        }
    }
    
    /// Property that determines whether the constant of 
    /// the `Attribute` should be multiplied by `-1`. This
    /// is usually done for right hand `PositionAttribute`
    /// objects
    internal var shouldInvertConstant: Bool {
        switch self {
        case .width: return false
        case .height: return false
        case .left: return false
        case .right: return true
        case .top: return false
        case .bottom:return true
        case .leading: return false
        case .trailing: return true
        case .centerX: return false
        case .centerY: return false
        case .firstBaseline: return false
        case .lastBaseline: return true
        case .leftMargin: return false
        case .rightMargin: return true
        case .topMargin: return false
        case .bottomMargin: return true
        case .leadingMargin: return false
        case .trailingMargin: return true
        case .centerXWithinMargins: return false
        case .centerYWithinMargins: return false
        case .notAnAttribute: return false
        }
    }
    
}
