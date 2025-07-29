class Solution {
    func myAtoi(_ s: String) -> Int {
        let n = s.count
        var sArray = Array(s)
        var sign = 1
        var index = 0

        while index < n && sArray[index] == " " {
            index += 1
        }

        if index == n {
            return 0
        }

        if index < n && sArray[index] == "-" || sArray[index] == "+" {
            sign = sArray[index] == "-" ? -1 : 1
            index += 1
        }

        var result = 0

        while index < n, let digit = sArray[index].wholeNumberValue {
            if result * 10 + digit > Int32.max {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }

            result = result * 10 + digit
            index += 1
        }

        return result * sign
    }
}