//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/27.
//

import Foundation

let sikList = readLine()!.split(separator: "-") // 입력받은 식
var sumList: [Int] = []

for sik in sikList {
  if sik.count == 1 {
    sumList.append(Int(sik)!)
  } else {
    sumList.append(sik.split(separator: "+").map { Int(String($0))! }.reduce(0, +))
  }
}

var answer = sumList[0]

for i in 1..<sumList.count {
  answer -= sumList[i]
}
print(answer)
