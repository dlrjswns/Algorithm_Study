import Foundation

/*
 그림의 개수와 넓이가 가장 넓은 넓이를 출력
 1로 연결된 것을 한 그림
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1] // n은 세로, m은 가로

var paper: [[Int]] = []

for _ in 0..<n {
  paper.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var queue: [(Int, Int)] = []
var index = 0

func bfs(start: (Int, Int)) -> Int {
  queue.append(start)
  visited[start.0][start.1] = true
  
  var width = 1
  
  while queue.count > index {
    
    let (currentX, currentY) = queue[index]
    
    for i in 0..<4 {
      let rx = dx[i] + currentX
      let ry = dy[i] + currentY
      
      if 0..<n ~= rx && 0..<m ~= ry && !visited[rx][ry] && paper[rx][ry] == 1 {
        queue.append((rx, ry))
        visited[rx][ry] = true
        width += 1
      }
    }
    index += 1
  }
  return width
}

var maxWidth = 0
var count = 0

for i in 0..<n {
  for k in 0..<m {
    if paper[i][k] == 1 && !visited[i][k] {
      let width = bfs(start: (i, k))
      maxWidth = max(width, maxWidth)
      count += 1
    }
  }
}

print(count)
print(maxWidth)
