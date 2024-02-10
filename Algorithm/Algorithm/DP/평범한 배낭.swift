////
////  main.swift
////  Algorithm
////
////  Created by 이건준 on 1/13/24.
////
//
//import Foundation
//
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let N = input[0], K = input[1] // N은 물품의 수, K는 준서가 버틸 수 있는 무게
//let max = Int(1e5) + 1
//
//var dpTable = Array(repeating: -1, count: max)
//var thingList: [(Int, Int)] = []
//
//for _ in 0..<N {
//  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//  thingList.append((input[0], input[1])) // 물건의 무게, 물건의 가치
//}
//
///*
// D[i]: i번째 물건까지 넣었을 때 가치합의 최댓값
// */
//
//
//if thingList[0].0 <= K {
//  dpTable[1] = thingList[0].1
//}
//
//for i in 2..<N {
//  if thingList[i - 1].0 + dpTable[i - 1] <= K {
//    dpTable[i] = thingList[i - 1].1 + dpTable[i - 1]
//  }
//}
//
//print(dpTable)
//print(dpTable.max()!)
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,k) = (t[0],t[1])

var cost = [0]
var weight = [0]

var dp = Array(repeating: 0, count: k+1)

for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (w,v) = (t[0],t[1])
    cost.append(v)
    weight.append(w)
}

for i in 1...n {
  for j in 1...k {
        if j >= weight[i] {
            dp[j] = max(dp[j], dp[j-weight[i]] + cost[i])
        }
    }
}

print(dp[k])
