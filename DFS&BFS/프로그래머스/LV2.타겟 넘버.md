## 문제 설명

> n개의 음이 아닌 정수들이 있습니다. 이 정수들을 순서를 바꾸지 않고 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다.  
> 예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.  
-1+1+1+1+1 = 3  
+1-1+1+1+1 = 3  
+1+1-1+1+1 = 3  
+1+1+1-1+1 = 3  
+1+1+1+1-1 = 3  
> 사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.

## 제한사항
- 주어지는 숫자의 개수는 2개 이상 20개 이하입니다.
- 각 숫자는 1 이상 50 이하인 자연수입니다.
- 타겟 넘버는 1 이상 1000 이하인 자연수입니다.

## 입출력 예
| numbers |	target | return |
|:-:|:-:|:-:|
| [1, 1, 1, 1, 1] | 3 |	5 |
| [4, 1, 2, 1] | 4 | 2 |

<br>

## 풀이

1. 배열을 완전 탐색하면서 더하거나 뺏을 때를 모두 탐색
2. 마지막 index일 때, 총 합이 target과 같다면 1을 아니라면 0을 반환
3. 누적된 count를 반환

```swift
import Foundation

func solution(_ numbers: [Int], _ target: Int) -> Int {
    func dfs(_ index: Int, _ sum: Int) -> Int {
        if index == numbers.count {
            return sum == target ? 1 : 0
        }

        let num = numbers[index]
        var count = 0

        // 숫자를 더하거나 빼는 경우를 모두 탐색
        count += dfs(index + 1, sum + num) + dfs(index + 1, sum - num)

        return count
    }

    return dfs(0, 0)
}
```