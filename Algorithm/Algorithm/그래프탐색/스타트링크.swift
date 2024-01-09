//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/8/24.
//

import Foundation

/*
 스타트링크는 F층으로 이루어진 건물에 사무실이 있음
 F층 중 G층에 해당하는곳이 스타트링크 사무실이 있는 곳
 강호가 있는 곳은 S층
 강호가 S -> G 층으로 이동해야함
 엘리베이터 버튼: U, D -> 각각 갈 층이 없을대는 움직이지않음
 버튼 적어도 몇번 눌러야하는지 ?
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let F = input[0], S = input[1], G = input[2], U = input[3], D = input[4]

var visited = Array(repeating: false, count: Int(1e6) + 1)
var queue: [(Int, Int)] = [] // 현재 층, 버튼 눌린 수
var index = 0

func bfs(start: (Int, Int)) {
  
  queue.append(start)
  visited[start.0] = true
  
  while queue.count > index {
    let (currentStair, buttonCount) = queue[index]
    
    if currentStair == G {
      print(buttonCount)
      return
    }
    
    if currentStair + U <= F && !visited[currentStair + U] {
      queue.append((currentStair + U, buttonCount + 1))
      visited[currentStair + U] = true
    }
    
    if 0 < currentStair - D && !visited[currentStair - D] {
      queue.append((currentStair - D, buttonCount + 1))
      visited[currentStair - D] = true
    }
    
    index += 1
  }
  print("use the stairs")
}

bfs(start: (S, 0))
