import Foundation

func solution(_ input_array:[String]) -> Int {
    let n = (input_array.count + 1) / 2
    var numbers: [Int] = []
    var operators: [String] = []
    
    var maxDP = [[Int]](repeating: [Int](repeating: Int.min, count: n), count: n)
    var minDP = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)

    for (i, c) in input_array.enumerated() {
        if i % 2 == 0 {
            numbers.append(Int(c)!)
        } else {
            operators.append(c)
        }
    }
    
    for step in 0..<n {
        for i in 0..<n - step {
            let j = i + step
            
            if step == 0 {
                maxDP[i][i] = numbers[i]
                minDP[i][i] = numbers[i]
            } else {
                for k in i..<j {
                    if operators[k] == "+" {
                        maxDP[i][j] = max(maxDP[i][j], maxDP[i][k] + maxDP[k + 1][j])
                        minDP[i][j] = min(minDP[i][j], minDP[i][k] + minDP[k + 1][j])
                    } else {
                        maxDP[i][j] = max(maxDP[i][j], maxDP[i][k] - minDP[k + 1][j])
                        minDP[i][j] = min(minDP[i][j], minDP[i][k] - maxDP[k + 1][j])
                    }
                }
            }
        }
    }
    
    return maxDP[0][n - 1]
}