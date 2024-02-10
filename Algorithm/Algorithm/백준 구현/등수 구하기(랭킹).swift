//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/10/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

// N -> 랭킹리스트에 있는 점수가 몇개인지,
// 태수의 새로운 점수,
// P -> 랭킹 리스트에 올라갈 수 있는 점수의 개수
let N = input[0], taesuNewScore = input[1], P = input[2]
var rankList: [Int] = []

// 현재 랭킹 리스트
if N > 0 { // 랭크 리스트는 N이 0보다 큰 경우에만 주어짐
  rankList = readLine()!.split(separator: " ").map({ Int(String($0))! })
  rankList.append(taesuNewScore)
  rankList.sort(by: >)
  
  if rankList.lastIndex(of: taesuNewScore)! + 1 > P {
    print(-1)
  } else {
    print(rankList.firstIndex(of: taesuNewScore)! + 1)
  }

} else {
  print(1)
}


