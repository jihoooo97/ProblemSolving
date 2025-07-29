class Solution {
    func reverse(_ x: Int) -> Int {
        let sign = x > 0 ? 1 : -1
        var temp = x * sign
        var result = 0

        while temp > 0 {
            result = result * 10 + temp % 10
            temp /= 10
        }

        if result >= Int32.min && result <= Int32.max {
            return result * sign
        } else {
            return 0
        }
    }
}