## 문제 설명

> 네트워크란 컴퓨터 상호 간에 정보를 교환할 수 있도록 연결된 형태를 의미합니다.  
> 예를 들어, 컴퓨터 A와 컴퓨터 B가 직접적으로 연결되어있고, 컴퓨터 B와 컴퓨터 C가 직접적으로 연결되어 있을 때 컴퓨터 A와 컴퓨터 C도 간접적으로 연결되어 정보를 교환할 수 있습니다. 따라서 컴퓨터 A, B, C는 모두 같은 네트워크 상에 있다고 할 수 있습니다.  
컴퓨터의 개수 n, 연결에 대한 정보가 담긴 2차원 배열 computers가 매개변수로 주어질 때, 네트워크의 개수를 return 하도록 solution 함수를 작성하시오.  

## 제한사항
- 컴퓨터의 개수 n은 1 이상 200 이하인 자연수입니다.  
- 각 컴퓨터는 0부터 n-1인 정수로 표현합니다.  
- i번 컴퓨터와 j번 컴퓨터가 연결되어 있으면 computers[i][j]를 1로 표현합니다.
- computer[i][i]는 항상 1입니다.

## 입출력 예
| n	| computers | return |
|:-:|:-:|:-:|
| 3	| [[1, 1, 0], [1, 1, 0], [0, 0, 1]] | 2 |
| 3	| [[1, 1, 0], [1, 1, 1], [0, 1, 1]] | 1 |

<br>

## 풀이

1. 탐색한 컴퓨터인지 확인하기 위한 배열 visited를 생성한다  
2. computers 배열을 완전 탐색하면서 방문하지 않은 컴퓨터를 Stack에 넣어주고 네트워크 개수를 증가시킨다  
3. 컴퓨터와 연결된 컴퓨터들을 DFS 알고리즘을 사용하면서 연결되어 있는 컴퓨터를 찾아 visited에 체크해준다


```swift
import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = [Bool](repeating: false, count: n)
    var stack: [Int] = []
    var result = 0
    
    for i in 0..<n {
        if visited[i] {
            continue
        }
        
        stack.append(i)
        result += 1
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            
            if visited[current] {
                continue
            }
            
            visited[current] = true
            
            let computer = computers[current]
            
            for j in 0..<n {
                if visited[j] || computer[j] == 0 {
                    continue
                }
                
                stack.append(j)
            }
        }
    }
    
    return result
}
```

<br>