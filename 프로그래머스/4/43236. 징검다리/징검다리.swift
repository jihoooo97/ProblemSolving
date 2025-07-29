import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted()
    var start = 0
    var end = distance
    var result = 0
    
    while start <= end {
        var mid = (start + end) / 2
        
        if removeRocks(rocks, distance, mid) > n {
            end = mid - 1
        } else {
            result = mid
            start = mid + 1
        }
    }
    
    return result
}

func removeRocks(_ rocks: [Int], _ distance: Int, _ mid: Int) -> Int {
    var before = 0
    var count = 0
    
    for rock in rocks {
        if rock - before < mid {
            count += 1
        } else {
            before = rock
        }
    }
    
    if distance - before < mid {
        count += 1
    }
    
    return count
}