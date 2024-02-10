//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/31/24.
//

import Foundation

/*
 아무 의견이 없으면 난이도 0
 의견이 1개 이상 존재한다면 모든 사람의 난이도 의견의 30% 절사평균으로 결정
 */

let n = Int(readLine()!)!
var opinionList: [Int] = []

for _ in 0..<n {
  opinionList.append(Int(readLine()!)!)
}

opinionList.sort()

if opinionList.isEmpty {
  print(0)
} else {
  let range = Int(round(Double(n) * Double(0.15)))
  
  let minRange = range
  
  let maxRange = n - 1 - range
  
  let remainList = opinionList[minRange...maxRange]
  print(Int(round(Double(Double(remainList.reduce(0, +)) / Double(remainList.count)))))
}
