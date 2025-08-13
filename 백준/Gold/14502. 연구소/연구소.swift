let input = readLine()!.split { $0 == " " }.map { Int("\($0)")! }
let (n, m) = (input[0], input[1])
var lab = [[Int]]()
var empty = [(Int, Int)]()
var virus = [(Int, Int)]()

for i in 0..<n {
    let row = readLine()!.split { $0 == " " }.map { Int("\($0)")! }
    lab.append(row)
    
    for j in 0..<m {
        if row[j] == 0 {
            empty.append((i, j))
        }
        
        if row[j] == 2 {
            virus.append((i, j))
        }
    }
}


let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let emptyCount = empty.count
var maxSafe = 0

for i in 0..<emptyCount - 2 {
    for j in i + 1..<emptyCount - 1 {
        for k in j + 1..<emptyCount {
            var copyLab = lab
            let walls = [empty[i], empty[j], empty[k]]
            
            for (x, y) in walls {
                copyLab[x][y] = 1
            }
            
            bfs(&copyLab)
            maxSafe = max(maxSafe, countSafe(copyLab))
        }
    }
}

func bfs(_ map: inout [[Int]]) {
    var queue = virus
    var index = 0
    
    while index < queue.count {
        let (x, y) = queue[index]
        index += 1
        
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            
            if (nx >= 0 && nx < n) && (ny >= 0 && ny < m) && map[nx][ny] == 0 {
                map[nx][ny] = 2
                queue.append((nx, ny))
            }
        }
    }
}

func countSafe(_ map: [[Int]]) -> Int {
    return map.flatMap { $0 }.filter { $0 == 0 }.count
}

print(maxSafe)