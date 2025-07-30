class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { 
            return false
        } else if x < 10 {
            return true
        } else {
            return "\(x)" == String("\(x)".reversed())
        }
    }
}