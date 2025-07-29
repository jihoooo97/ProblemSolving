let input = readLine()!.split { $0 == " " }.map { Int("\($0)")! }
let (n, m) = (input[0], input[1])

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var visited = Array(repeating: [Bool](repeating: false, count: m), count: n)
var graph: [[Int]] = []

for _ in 0..<n {
    graph.append(readLine()!.map { Int("\($0)")! })
}

bfs(0, 0)

print(graph[n - 1][m - 1])

func bfs(_ x: Int, _ y: Int) {
    var queue = [(x, y)]
    visited[x][y] = true
    
    while !queue.isEmpty {
        let (currentX, currentY) = queue.removeFirst()
        
        for i in 0..<4 {
            let nextX = currentX + dx[i]
            let nextY = currentY + dy[i]
            
            if nextX >= 0 && nextX < n && nextY >= 0 && nextY < m {
                if graph[nextX][nextY] == 1 && !visited[nextX][nextY] {
                    visited[nextX][nextY] = true
                    graph[nextX][nextY] = graph[currentX][currentY] + 1
                    queue.append((nextX, nextY))
                }
            }
        }
    }
}