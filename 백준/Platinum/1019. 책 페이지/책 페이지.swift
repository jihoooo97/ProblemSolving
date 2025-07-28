var count = [Int](repeating: 0, count: 10)
let n = Int(readLine()!)!
var start = 1
var end = n
var ten = 1

while start <= end {
    while start % 10 != 0 && start <= end {
        subCount(start, ten)
        start += 1
    }
    
    if end < start {
        break
    }
    
    while end % 10 != 9 && start <= end {
        subCount(end, ten)
        end -= 1
    }
    
    start /= 10
    end /= 10
    
    for i in 0..<10 {
        count[i] += (end - start + 1) * ten
    }
    
    ten *= 10
}

print(count.map { "\($0)" }.joined(separator: " "))


func subCount(_ num: Int, _ ten: Int) {
    var num = num
    
    while num > 0 {
        count[num % 10] += ten
        num /= 10
    }
}
