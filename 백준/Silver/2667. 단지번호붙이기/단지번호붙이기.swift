let n = Int(readLine()!)!
var home: [[Int]] = []
var visited = Array(repeating: [Bool](repeating: false, count: n), count: n)
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var result: [Int] = []

for _ in 0..<n {
    home.append(readLine()!.map { Int("\($0)")! })
}

for i in 0..<n {
    for j in 0..<n {
        if !visited[i][j] && home[i][j] == 1 {
            result.append(bfs(i, j))
        }
    }
}

print(result.count)

for r in result.sorted() {
    print(r)
}

func bfs(_ i: Int, _ j: Int) -> Int {
    var queue = [[i, j]]
    var count = 1
    
    visited[i][j] = true
    
    while !queue.isEmpty {
        let current = queue.removeLast()
        
        for d in 0..<4 {
            let nextX = current[0] + dx[d]
            let nextY = current[1] + dy[d]
            
            if nextX >= 0 && nextX < n && nextY >= 0 && nextY < n {
                if home[nextX][nextY] == 1 && !visited[nextX][nextY] {
                    visited[nextX][nextY] = true
                    queue.append([nextX, nextY])
                    count += 1
                }
            }
        }
    }
    
    return count
}