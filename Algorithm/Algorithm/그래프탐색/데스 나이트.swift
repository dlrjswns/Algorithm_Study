//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/22/24.
//

import Foundation

let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let r1 = input[0], c1 = input[1], r2 = input[2], c2 = input[3]

var visited = Array(repeating: Array(repeating: false, count: N), count: N)

let dx = [-2, -2, 0, 0, 2, 2]
let dy = [-1, 1, -2, 2, -1, 1]

func bfs() -> Int {
  
  var queue: [(Int, Int, Int)] = [(r1, c1, 0)]
  visited[r1][c1] = true
  
  var index = 0
  
  while queue.count > index {
    
    let (x, y, count) = queue[index]
    
    if x == r2 && y == c2 {
      return count
    }
    
    for i in 0..<6 {
      let rx = x + dx[i]
      let ry = y + dy[i]
      
      if 0..<N ~= rx && 0..<N ~= ry && !visited[rx][ry] {
        queue.append((rx, ry, count + 1))
        visited[rx][ry] = true
      }
    }
    
    index += 1
  }
  return -1
}

print(bfs())
