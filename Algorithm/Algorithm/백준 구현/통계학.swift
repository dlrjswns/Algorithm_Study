//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/24.
//

import Foundation

// N은 홀수

let N = Int(readLine()!)!
var numList: [Int] = []
var dict: [Int: Int] = [:]

for _ in 0..<N {
  numList.append(Int(readLine()!)!)
}

let sumNum = numList.reduce(0, +) // 배열 요소의 합
var sortNum = numList.sorted(by: <) // 오름차순 정렬

numList.forEach { dict[$0, default: 0] += 1 }
let maxValue = dict.max(by: { $0.value < $1.value })!.value
var mode = dict.filter({ $0.value == maxValue}).keys.sorted()

let max = sortNum.last!
let min = sortNum[0]

print(Int(round(Double(sumNum)/Double(N))))
print(sortNum[Int(exactly: sortNum.count/2)!])

if mode.count > 1 {
    print("\(mode[1])")
}else {
    print("\(mode[0])")
}
print(max - min)

