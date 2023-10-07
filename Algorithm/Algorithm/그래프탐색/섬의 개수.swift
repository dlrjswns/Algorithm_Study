//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/10/05.
//

import Foundation

let dx = [0, 0, -1, 1, 1, -1, 1, -1] // 상 하 좌 우
let dy = [-1, 1, 0, 0, -1, 1, 1, -1]

while true {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let w = input[0] // 지도의 너비
  let h = input[1] // 지도의 높이
  
  if w == 0 && h == 0 { break }
  
  var graph: [[Int]] = []

  for _ in 0..<h {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
  }
  // 1은 땅, 0은 바다

  var visited = Array(repeating: Array(repeating: false, count: w), count: h)

  var count = 0

  func dfs(x: Int, y: Int) {
    
    for i in 0..<8 {
      let rx = dx[i] + x
      let ry = dy[i] + y

      if 0 <= rx && rx < w && 0 <= ry && ry < h && graph[ry][rx] == 1 && !visited[ry][rx] {
        visited[ry][rx] = true
        dfs(x: rx, y: ry)
      }
    }
  }

  for i in 0..<h {
    for k in 0..<w {
      if !visited[i][k] && graph[i][k] == 1 {
        visited[i][k] = true
        dfs(x: k, y: i)
        count += 1
      }
    }
  }

  print(count)
}

