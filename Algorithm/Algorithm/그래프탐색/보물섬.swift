import Foundation

let size = readLine()!.split(separator: " ").map { Int(String($0))! }
let height = size[0], width = size[1]

/// 상하좌우
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

var map: [[Character]] = []

for _ in 0..<height {
    map.append(Array(readLine()!))
}

func bfs(x: Int, y: Int) -> Int {
    
    var visited = Array(repeating: Array(repeating: false, count: width), count: height)
    var queue: [(Int, Int, Int)] = [(x, y, 0)]
    var index = 0
    var distance = 0
    visited[x][y] = true
//    var tempMap = map
    
    while queue.count > index {
        
        let (dirX, dirY, length) = queue[index]
        
        for i in 0..<4 {
            let rx = dx[i] + dirX
            let ry = dy[i] + dirY
            
            if 0..<height ~= rx && 0..<width ~= ry && !visited[rx][ry] && map[rx][ry] == "L" {
                queue.append((rx, ry, length + 1))
                visited[rx][ry] = true
                distance = max(distance, length + 1)
            }
        }
        
        index += 1
    }
    return distance
}

var answer = Int.min

for r in 0..<height {
    for c in 0..<width {
        if map[r][c] == "L" {
            answer = max(answer, bfs(x: r, y: c))
        }
    }
}

print(answer)
