//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/10/06.
//

import Foundation

let N = Int(String(readLine()!))! // 2차원 배열의 행과 열의 개수
var graph: [[Int]] = []

for _ in 0..<N {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var visited: [[Bool]] = []
let dx = [0, 0, -1, 1] // 상 하 좌 우
let dy = [-1, 1, 0, 0]

func dfs(x: Int, y: Int, target: Int) {
  
  for i in 0..<4 {
    let nx = dx[i] + x
    let ny = dy[i] + y
    
    if 0 <= nx && nx < N && 0 <= ny && ny < N && !visited[nx][ny] && target < graph[nx][ny] {
      visited[nx][ny] = true
      dfs(x: nx, y: ny, target: target)
    }
  }
  
}

var maxCount = 0

for target in 0...100 {
  var count = 0
  visited = Array(repeating: Array(repeating: false, count: N), count: N)
  for i in 0..<N {
    for k in 0..<N {
      if !visited[i][k] && target < graph[i][k] {
        visited[i][k] = true
        dfs(x: i, y: k, target: target)
        count += 1
      }
    }
  }
  if count > maxCount {
    maxCount = count
  }
}
print(maxCount)
