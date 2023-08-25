## 문제 설명

두 개의 단어 begin, target과 단어의 집합 words가 있습니다. 아래와 같은 규칙을 이용하여 begin에서 target으로 변환하는 가장 짧은 변환 과정을 찾으려고 합니다.  
1. 한 번에 한 개의 알파벳만 바꿀 수 있습니다.
2. words에 있는 단어로만 변환할 수 있습니다.

예를 들어 begin이 "hit", target가 "cog", words가 ["hot","dot","dog","lot","log","cog"]라면 "hit" -> "hot" -> "dot" -> "dog" -> "cog"와 같이 4단계를 거쳐 변환할 수 있습니다.  
두 개의 단어 begin, target과 단어의 집합 words가 매개변수로 주어질 때, 최소 몇 단계의 과정을 거쳐 begin을 target으로 변환할 수 있는지 return 하도록 solution 함수를 작성해주세요.  

## 제한사항
- 각 단어는 알파벳 소문자로만 이루어져 있습니다.
- 각 단어의 길이는 3 이상 10 이하이며 모든 단어의 길이는 같습니다.
- words에는 3개 이상 50개 이하의 단어가 있으며 중복되는 단어는 없습니다.
- begin과 target은 같지 않습니다.
- 변환할 수 없는 경우에는 0를 return 합니다.

## 입출력 예
| begin | target | words | return |
|:-:|:-:|:-:|:-:|
| "hit"	| "cog"	| ["hot", "dot", "dog", "lot", "log", "cog"] | 4 |
| "hit" | "cog"	| ["hot", "dot", "dog", "lot", "log"] | 0 |

<br>

## 풀이

1. (현재 단어, 시행 횟수) 튜플을 원소로 갖는 queue를 만든다
2. 방문 여부를 확인할 수 있는 visited 배열을 만든다
3. queue에 초깃값을 넣어준다
4. dequeue하면서 각 단어를 비교해 1개의 알파벳만 다른 단어를 찾아 queue에 넣어준다
5. 위 과정을 반복해 target과 단어가 같아지면 시행 횟수를 반환한다

```swift
import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var queue: [(String, Int)] = []
    var visited = [Bool](repeating: false, count: words.count)
    
    if !words.contains(target) {
        return 0
    }
    
    queue.append((begin, 0))
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        if current.0 == target {
            return current.1
        }
        
        for i in 0..<words.count {
            if visited[i] {
                continue
            }
            
            if checkChange(current.0, words[i]) {
                queue.append((words[i], current.1 + 1))
                visited[i] = true
            }
        }
    }
    
    return 0
}

func checkChange(_ word1: String, _ word2: String) -> Bool {
    let word1 = Array(word1)
    let word2 = Array(word2)
    var count = 0
    
    for i in 0..<word1.count {
        if word1[i] != word2[i] {
            count += 1
        }
    }
    
    return count == 1
}
```