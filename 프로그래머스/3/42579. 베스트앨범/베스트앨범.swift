import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var album: [String: [(Int, Int)]] = [:]
    var sortedAlbum: [Int] = []
    
    for i in genres.indices {
        album[genres[i], default: []].append((i, plays[i]))
    }
    
    // 재생된 수로 genre 정렬
    for a in album.sorted { $0.1.reduce(0) { $0 + $1.1 } > $1.1.reduce(0) { $0 + $1.1 } } {
        if a.value.count == 1 {
            sortedAlbum += a.value.map { $0.0 }
        } else {
            // 같은 plays면 index가 작은 순서로
            sortedAlbum += a.value.sorted { 
                if $0.1 == $1.1 {
                    return $0.0 < $1.0
                } else {
                    return $0.1 > $1.1
                }
            }[...1].map { $0.0 }
        }
    }
    
    return sortedAlbum
}