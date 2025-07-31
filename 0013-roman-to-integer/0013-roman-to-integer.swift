class Solution {
    func romanToInt(_ s: String) -> Int {
        let roman: [Character: Int] = ["M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1]
        var num = 0
        var beforeValue = 0

        for c in s {
            let currentValue = roman[c]!

            if currentValue > beforeValue {
                num += currentValue - 2 * beforeValue
            } else {
                num += currentValue
            }

            beforeValue = roman[c]!
        }
        
        return num
    }
}