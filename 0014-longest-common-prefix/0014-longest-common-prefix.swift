class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var common = strs.first!

        for str in strs.dropFirst() {
            while !str.hasPrefix(common) {
                common = String(common.dropLast())

                if common.isEmpty { break }
            }
        }

        return common
    }
}