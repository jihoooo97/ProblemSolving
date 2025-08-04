import Foundation

typealias Point = (y: Int, x: Int)

func extractShapes(from board: [[Int]], target: Int) -> [[[Int]]] {
    let n = board.count
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var shapes: [[[Int]]] = []
    
    let dy = [-1, 1, 0, 0]
    let dx = [0, 0, -1, 1]
    
    func bfs(start: Point) -> [Point] {
        var queue: [Point] = [start]
        var index = 0
        
        visited[start.y][start.x] = true
        
        while index < queue.count {
            let (y, x) = queue[index]
            index += 1
            
            for d in 0..<4 {
                let ny = y + dy[d]
                let nx = x + dx[d]
                
                if ny >= 0 && ny < n && nx >= 0 && nx < n && !visited[ny][nx] && board[ny][nx] == target {
                    visited[ny][nx] = true
                    queue.append((ny, nx))
                }
            }
        }
        
        return queue
    }

    for y in 0..<n {
        for x in 0..<n {
            if !visited[y][x] && board[y][x] == target {
                let shape = bfs(start: (y, x))
                shapes.append(regularize(shape))
            }
        }
    }

    return shapes
}

    func regularize(_ shape: [Point]) -> [[Int]] {
        let ys = shape.map { $0.y }
        let xs = shape.map { $0.x }
        let minY = ys.min()!
        let minX = xs.min()!
        let maxY = ys.max()!
        let maxX = xs.max()!
        
        var grid = Array(repeating: Array(repeating: 0, count: maxX - minX + 1), count: maxY - minY + 1)
        
        for (y, x) in shape {
            grid[y - minY][x - minX] = 1
        }
        
        return grid
    }

func rotate(_ shape: [[Int]]) -> [[Int]] {
    let row = shape.count
    let col = shape[0].count
    var rotated = Array(repeating: Array(repeating: 0, count: row), count: col)
    
    for y in 0..<row {
        for x in 0..<col {
            rotated[x][row - y - 1] = shape[y][x]
        }
    }
    
    return rotated
}

func isSame(_ a: [[Int]], _ b: [[Int]]) -> Bool {
    if a.count != b.count || a[0].count != b[0].count {
        return false
    }
    
    for y in 0..<a.count {
        for x in 0..<a[0].count {
            if a[y][x] != b[y][x] {
                return false
            }
        }
    }
    
    return true
}

func solution(_ game_board: [[Int]], _ table: [[Int]]) -> Int {
    let blanks = extractShapes(from: game_board, target: 0)
    let pieces = extractShapes(from: table, target: 1)
    var used = Array(repeating: false, count: pieces.count)
    var total = 0

    for blank in blanks {
        var matched = false
        
        for i in 0..<pieces.count {
            if used[i] { continue }
            
            var piece = pieces[i]
            
            for _ in 0..<4 {
                if isSame(blank, piece) {
                    total += piece.flatMap { $0 }.filter { $0 == 1 }.count
                    used[i] = true
                    matched = true
                    break
                }
                
                piece = rotate(piece)
            }
            
            if matched { break }
        }
    }
    
    return total
}