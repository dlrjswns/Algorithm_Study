////
////  main.swift
////  Algorithm
////
////  Created by 이건준 on 2023/10/04.
////
//
//import Foundation
///*
// R(빨강), G(초록), B(파랑) 으로 색칠한 그림
// 적록색약은 빨간색과 초록색의 차이를 느끼지못함
// */
//let N = Int(String(readLine()!))!
//
//var graph: [[String]] = []
//for _ in 0..<N {
//  graph.append(readLine()!.map { String($0) })
//}
//
//let dx = [0, 0, -1, 1] // 상 하 좌 우
//let dy = [-1, 1, 0, 0]
//
//var noDiseaseVisited = Array(repeating: Array(repeating: false, count: N), count: N)
//
//func dfs(x: Int, y: Int, type: String) -> Bool {
//  noDiseaseVisited[x][y] = true
//  let now = type
//  
//  for i in 0..<4 {
//    let rx = dx[i] + x
//    let ry = dy[i] + y
//    
//    if 0 <= rx && rx < N && 0 <= ry && ry < N && !noDiseaseVisited[rx][ry] {
//      if now == graph[rx][ry] {
//        _ = dfs(x: rx, y: ry, type: now)
//        return true
//      }
//    }
//  }
//  return false
//}
//
//let types = ["R", "G", "B"]
//var count = 0
//types.forEach { type in
//  if dfs(x: 0, y: 0, type: type) {
//    count += 1
//  }
//}
//print(count)
//
//
//
//
