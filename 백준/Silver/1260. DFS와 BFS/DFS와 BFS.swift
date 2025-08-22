let input = readLine()!.split { $0 == " " }.map { Int($0)! }
var graph = Array(repeating: [Int](), count: input[0] + 1)
var visitedDFS = [Bool](repeating: false, count: input[0] + 1)
var visitedBFS = [Bool](repeating: false, count: input[0] + 1)
var resultDFS: [Int] = []
var resultBFS: [Int] = []

for _ in 0..<input[1] {
    let node = readLine()!.split(separator: " ").map { Int($0)! }
    graph[node[0]].append(node[1])
    graph[node[1]].append(node[0])
}

for i in 1...input[0] {
    graph[i].sort()
}

dfs(input[2])
bfs(input[2])

print(resultDFS.map { "\($0)" }.joined(separator: " "))
print(resultBFS.map { "\($0)" }.joined(separator: " "))

func dfs(_ node: Int) {
    visitedDFS[node] = true
    resultDFS.append(node)
    
    for next in graph[node] {
        if !visitedDFS[next] {
            dfs(next)
        }
    }
}

func bfs(_ start: Int) {
    var queue = [start]
    visitedBFS[start] = true
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        resultBFS.append(current)
        
        for next in graph[current] {
            if !visitedBFS[next] {
                visitedBFS[next] = true
                queue.append(next)
            }
        }
    }
}
