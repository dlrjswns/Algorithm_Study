//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/20/24.
//

import Foundation

let N = Int(readLine()!)!

var titleList: [String: Int] = [:]

for _ in 0..<N {
  titleList[readLine()!, default: 0] += 1
}

let maxValue = titleList.values.max()!
let maxList = titleList.filter { $0.value == maxValue }.keys.sorted(by: { $0 < $1 })

print(maxList.first!)


