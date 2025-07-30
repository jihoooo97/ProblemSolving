class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var water = 0

        while left < right {
            let w = right - left
            let h = min(height[left], height[right])
            water = max(water, w * h)

            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }

        return water
    }
}