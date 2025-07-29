import Foundation

func solution(_ arrows:[Int]) -> Int {
    let dx: [Int] = [0, 1, 1, 1, 0, -1, -1, -1]
    let dy: [Int] = [-1, -1, 0, 1, 1, 1, 0, -1]
    var x = 0
    var y = 0
    
    var visited: Set<[Int]> = [[0, 0]]
    var path = Set<String>()
    var count = 0
    
    for arrow in arrows {
        for _ in 0..<2 { 
            let nextX = x + dx[arrow]
            let nextY = y + dy[arrow]
    
            let path1 = "\(x),\(y)-\(nextX),\(nextY)"
            let path2 = "\(nextX),\(nextY)-\(x),\(y)"
        
            if visited.contains([nextX, nextY]) && !path.contains(path1) && !path.contains(path2) {
                count += 1
            }
        
            visited.insert([nextX, nextY])
            path.insert(path1)
            path.insert(path2)
        
            x = nextX
            y = nextY
        }
    }
    
    return count 
}