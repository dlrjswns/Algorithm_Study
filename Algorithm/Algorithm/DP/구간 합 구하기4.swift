//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/13/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1] // N은 수의 개수, M은 구해야 하는 횟수
let max = Int(1e5 + 1)

var dpTable = Array(repeating: -1, count: N + 1)
//var numberList = Array(repeating: -1, count: N + 1)

/*
 D[i][j] = i부터 j까지의 합
 D[1][1] = number
 */

var numberList: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

dpTable[1] = numberList[0]

for i in 2..<N+1 {
  dpTable[i] = dpTable[i - 1] + numberList[i-1]
}

var answer: [Int] = []

for _ in 0..<M {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let i = input[0], j = input[1]
  if i == 1 {
    answer.append(dpTable[j])
    continue
  }
  answer.append(dpTable[j] - dpTable[i - 1])
}

answer.forEach {
  print($0)
}
