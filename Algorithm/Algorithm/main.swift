//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/10/05.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let w = input[0] // 지도의 너비
let h = input[1] // 지도의 높이
var graph: [[Int]] = []

for _ in 0..<h {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
// 1은 땅, 0은 바다

let dx = [0, 0, -1, 1] // 상 하 좌 우
let dy = [-1, 1, 0, 0]
var visited = Array(repeating: Array(repeating: false, count: w), count: h)

var count = 0

func dfs(x: Int, y: Int) {
  visited[x][y] = true
  
  for i in 0..<4 {
    let rx = dx[i] + x
    let ry = dy[i] + y

    if 0 <= rx && rx < w && 0 <= ry && ry < h && !visited[ry][rx] {
      count += 1
      dfs(x: rx, y: ry)
    }
  }
}

print(count)

//var count = 0
//
//if dfs(x: 0, y: 0) {
//  count += 1
//}
//
//print(count)
