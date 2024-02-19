//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/19/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var campus: [[Character]] = []

for _ in 0..<N {
  campus.append(Array(readLine()!))
}

var visited = Array(repeating: Array(repeating: false, count: M), count: N)
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var count = 0

func dfs(x: Int, y: Int) {
  
  visited[x][y] = true
  
  for i in 0..<4 {
    let rx = dx[i] + x
    let ry = dy[i] + y
    
    if 0..<N ~= rx && 0..<M ~= ry && !visited[rx][ry] && campus[rx][ry] != "X" {
      if campus[rx][ry] == "P" {
        count += 1
      }
      dfs(x: rx, y: ry)
    }
  }
}

for r in 0..<N {
  for c in 0..<M {
    if !visited[r][c] && campus[r][c] == "I" {
      dfs(x: r, y: c)
      print(count == 0 ? "TT" : count)
    }
  }
}
