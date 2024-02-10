//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/13/24.
//

import Foundation

let n = Int(readLine()!)! // n개의 정수로 이루어진 임의의 수열
var numList: [Int] = []

var dpTable = Array(repeating: -1001, count: 100001)

/*
 D[i] = i번째까지 왔을 때 얻을 수 있는 최댓값
 */

numList = readLine()!.split(separator: " ").map { Int(String($0))! }

dpTable[1] = numList[0]

for i in 2..<n+1 {
  dpTable[i] = max(dpTable[i - 1] + numList[i - 1], numList[i - 1])
}
print(dpTable.max()!)



