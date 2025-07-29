let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = input[0]
let k = input[1]

var values: [(Int, Int)] = []

for _ in 0..<n {
    let item = readLine()!.split { $0 == " " }.map { Int($0)! }
    values.append((item[0], item[1]))
}

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: n)

for i in 0..<n {
    for j in 1...k {
        if i == 0 {
            if j >= values[i].0 {
                dp[i][j] = values[i].1
            }
        } else {
            if j < values[i].0 {
                dp[i][j] = dp[i - 1][j]
            } else {
                dp[i][j] = max(dp[i - 1][j], values[i].1 + dp[i - 1][j - values[i].0])
            }
        }
    }
}

print(dp[n - 1][k])