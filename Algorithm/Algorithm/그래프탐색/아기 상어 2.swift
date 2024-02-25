//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/19/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var space: [[Int]] = []

for _ in 0..<N {
  space.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}


var visited = Array(repeating: Array(repeating: false, count: M), count: N)
let dx = [0, 0, 1, -1, 1, -1, 1, -1]
let dy = [1, -1, 0, 0, 1, -1, -1, 1]

var index = 0
var queue: [(Int, Int)] = []

func bfs() {
  
  while queue.count > index {
    
    let (x, y) = queue[index]
    
    for i in 0..<8 {
      let rx = dx[i] + x
      let ry = dy[i] + y
  
      if 0..<N ~= rx && 0..<M ~= ry && !visited[rx][ry] {
        space[rx][ry] = space[x][y] + 1
        queue.append((rx, ry))
        visited[rx][ry] = true
      }
    }
    
    index += 1
  }
}

for r in 0..<N {
  for c in 0..<M {
    if !visited[r][c] && space[r][c] == 1 { // 아기상어가 위치한곳에서부터 탐색
      queue.append((r, c))
      visited[r][c] = true
    }
  }
}

bfs()

print(space.flatMap { $0 }.max()! - 1)
