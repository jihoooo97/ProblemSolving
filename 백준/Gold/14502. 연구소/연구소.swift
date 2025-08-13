let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
var map = [[Int]]()
var virusPositions = [(Int, Int)]()

for i in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
    for j in 0..<M {
        if row[j] == 2 {
            virusPositions.append((i, j))
        }
    }
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func spreadVirus(_ tempMap: inout [[Int]]) {
    var queue = virusPositions
    while !queue.isEmpty {
        let (x, y) = queue.removeLast()
        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            if nx >= 0 && nx < N && ny >= 0 && ny < M && tempMap[nx][ny] == 0 {
                tempMap[nx][ny] = 2
                queue.append((nx, ny))
            }
        }
    }
}

func safeArea(_ tempMap: [[Int]]) -> Int {
    var count = 0
    for i in 0..<N {
        for j in 0..<M {
            if tempMap[i][j] == 0 {
                count += 1
            }
        }
    }
    return count
}

var maxSafeArea = 0

func dfs(_ depth: Int, _ start: Int) {
    if depth == 3 {
        var tempMap = map
        spreadVirus(&tempMap)
        maxSafeArea = max(maxSafeArea, safeArea(tempMap))
        return
    }
    
    for idx in start..<(N * M) {
        let x = idx / M
        let y = idx % M
        if map[x][y] == 0 {
            map[x][y] = 1
            dfs(depth + 1, idx + 1)
            map[x][y] = 0
        }
    }
}

dfs(0, 0)
print(maxSafeArea)