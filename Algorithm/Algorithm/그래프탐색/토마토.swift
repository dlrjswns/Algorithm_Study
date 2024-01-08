//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/7/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = input[0], N = input[1] // M은 상자의 가로, N은 상자의 세로

var tomatoRoom: [[Int]] = []

for _ in 0..<N {
  tomatoRoom.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// 1은 익은 토마토, 0은 익지않은 토마토, -1은 토마토없음

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

//var visitedTomato = Array(repeating: Array(repeating: false, count: M), count: N) // 해당 인덱스의 토마토에 방문했는지에 대한 배열

var index = 0
var queue: [(Int, Int)] = []


for row in 0..<N {
  for column in 0..<M {
    if tomatoRoom[row][column] == 1 {
      queue.append((row, column))
    }
  }
}

func bfs() {
  
  while index < queue.count {
    let (x, y) = queue[index]
//    visitedTomato[x][y] = true
    
    for i in 0..<4 {
      let rx = x + dx[i]
      let ry = y + dy[i]
      
      if 0..<N ~= rx && 0..<M ~= ry && tomatoRoom[rx][ry] == 0 { // 토마토농장 범위에 해당한다면
//        if !visitedTomato[rx][ry] { // 방문한적이 없고 익은 토마토에 인접한 곳에 익지않은 토마토가 있을 경우
          tomatoRoom[rx][ry] = tomatoRoom[x][y] + 1 // 토마토 익음 처리
          queue.append((rx, ry)) // 익지않은 토마토인 경우 익히는 처리를 위해 큐에 넣어줌
//        }
      }
    }
    index += 1
  }
}
bfs()
let tomatoRoomInfo = tomatoRoom.flatMap { $0 }
print(tomatoRoomInfo.contains(0) ? -1 : tomatoRoomInfo.max()! - 1)
