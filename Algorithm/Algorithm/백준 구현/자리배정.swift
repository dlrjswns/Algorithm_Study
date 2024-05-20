//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 5/4/24.
//

import Foundation

let cr = readLine()!.split(separator: " ").map { Int(String($0))! }
let c = cr[0], r = cr[1]
var k = Int(readLine()!)!

// 상우하좌
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var currentDirection = 0
var currentPosition = (1, 1)
var visited = Array(repeating: Array(repeating: false, count: c+1), count: r+1)
visited[1][1] = true

if r * c < k {
  print(0)
} else {
  while k != 1 {
    
    var moveX = currentPosition.0 + dx[currentDirection % 4]
    var moveY = currentPosition.1 + dy[currentDirection % 4]

    if !(1...c ~= moveX && 1...r ~= moveY) || visited[moveY][moveX] { // 이동한곳이 이미 방문했거나 범위를 벗어났다면 방향전환
      currentDirection += 1
      moveX = currentPosition.0 + dx[currentDirection % 4]
      moveY = currentPosition.1 + dy[currentDirection % 4]
    }
    
    currentPosition.0 = moveX
    currentPosition.1 = moveY
    visited[currentPosition.1][currentPosition.0] = true
    
    k -= 1
  }

  print(currentPosition.0, currentPosition.1)

}
