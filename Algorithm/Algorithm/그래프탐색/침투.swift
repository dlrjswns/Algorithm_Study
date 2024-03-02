//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/25/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = input[0], N = input[1]

var geokja: [[Character]] = []

for _ in 0..<M {
  geokja.append(Array(readLine()!))
}

var visited = Array(repeating: Array(repeating: false, count: N), count: M)

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var queue: [(Int, Int)] = []
var index = 0

func bfs() -> String {
  
  while queue.count > index {
    
    let (x, y) = queue[index]
    
    if x == M-1 {
      return "YES"
    }
    
    for i in 0..<4 {
      let rx = dx[i] + x
      let ry = dy[i] + y
      
      if 0..<M ~= rx && 0..<N ~= ry && geokja[rx][ry] != "1" {
        queue.append((rx, ry))
        geokja[rx][ry] = "1"
      }
    }
    
    index += 1
  }
  return "NO"
}

for n in 0..<N {
  if geokja[0][n] == "0" {
    queue.append((0, n))
  }
}

print(bfs())
