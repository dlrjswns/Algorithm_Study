//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/10/08.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = input[0]
let N = input[1]
let K = input[2]

var area: [[Int]] = []
var graph = Array(repeating: Array(repeating: 0, count: N), count: M)
var visited = Array(repeating: Array(repeating: false, count: N), count: M)

for _ in 0..<K {
  area.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for k in 0..<K {
  let area = area[k]
  for i in area[0]..<area[2] {
    for k in area[1]..<area[3] {
      graph[k][i] = 1
    }
  }
}

let dx = [0, 0, -1, 1] // 상 하 좌 우
let dy = [-1, 1, 0, 0]

var countList: [Int] = []
var count = 0

func dfs(x: Int, y: Int) {
  for i in 0..<4 {
    
    let nx = dx[i] + x
    let ny = dy[i] + y
    
    if 0 <= nx && nx < M && 0 <= ny && ny < N && !visited[nx][ny] && graph[nx][ny] == 0 {
      count += 1
      visited[nx][ny] = true
      dfs(x: nx, y: ny)
    }
  }
}

for n in 0..<N {
  for m in 0..<M {
    if !visited[m][n] && graph[m][n] == 0 {
      visited[m][n] = true
      dfs(x: m, y: n)
      countList.append(count)
      count = 0
    }
  }
}

countList.sort()
print(countList.count)
countList.forEach { print($0 + 1, terminator: " ") }
