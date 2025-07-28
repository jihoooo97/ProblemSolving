let input = readLine()!.split { $0 == " " }.map { Int($0)! }

var roots = [Int](0..<input[0])
var answer = 0

for i in 1...input[1] {
    let nodes = readLine()!.split { $0 == " " }.map { Int($0)! }
    
    if find(nodes[0]) == find(nodes[1]) {
        answer = i
        break
    }
    
    merge(nodes[0], nodes[1])
}

print(answer)


func find(_ node: Int) -> Int {
    if roots[node] == node {
        return node
    } else {
        roots[node] = find(roots[node])
        return roots[node]
    }
}

func merge(_ node1: Int, _ node2: Int) {
    let root1 = roots[node1]
    let root2 = roots[node2]
    
    if root1 == root2 {
        return
    } else if root2 > root1 {
        roots[root1] = root2
    } else {
        roots[root2] = root1
    }
}