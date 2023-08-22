import Foundation

func solution(_ numbers: [Int], _ target: Int) -> Int {
    func dfs(_ index: Int, _ sum: Int) -> Int {
        if index == numbers.count {
            return sum == target ? 1 : 0
        }

        let num = numbers[index]
        var count = 0

        count += dfs(index + 1, sum + num) + dfs(index + 1, sum - num)

        return count
    }

    return dfs(0, 0)
}