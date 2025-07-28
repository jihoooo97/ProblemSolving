class Solution {
    func longestPalindrome(_ s: String) -> String {
        let sArray = Array(s)
        var start = 0, end = 0

        for i in sArray.indices {
            let length1 = expandFromCenter(sArray, left: i, right: i)
            let length2 = expandFromCenter(sArray, left: i, right: i + 1)
            let length = max(length1, length2)

            if length > end - start {
                start = i - (length - 1) / 2
                end = i + length / 2
            }
        }

        return String(sArray[start...end])
    }

    func expandFromCenter(_ sArray: [Character], left: Int, right: Int) -> Int {
        var l = left, r = right

        while l >= 0 && r < sArray.count && sArray[l] == sArray[r] {
            l -= 1
            r += 1
        }

        return r - l - 1
    }
}