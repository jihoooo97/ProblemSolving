class Solution {
    func intToRoman(_ num: Int) -> String {
        let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let values  = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        var num = num
        var roman = ""

        for (i, value) in values.enumerated() {
            while num >= value {
                roman += symbols[i]
                num -= value
            }
        }

        return roman
    }
}