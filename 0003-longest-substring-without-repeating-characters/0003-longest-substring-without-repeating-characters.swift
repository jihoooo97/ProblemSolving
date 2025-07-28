class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let sArray = Array(s)
        var substring: Set<Character> = []
        var left = 0
        var length = 0

        for right in sArray.indices {
            while substring.contains(sArray[right]) {
                substring.remove(sArray[left])
                left += 1
            }

            substring.insert(sArray[right])
            length = max(length, right - left + 1)
        }

        return length
    }
}