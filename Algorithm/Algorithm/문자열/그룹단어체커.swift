//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/24.
//

import Foundation

let N = Int(readLine()!)!
var letterList: [String] = []

for _ in 0..<N {
  letterList.append(readLine()!)
}

var count = 0

for letter in letterList {
  var beforeCH: String = ""
  var visitedList: [Character] = []
  for ch in letter {
    if !visitedList.contains(ch) {
      visitedList.append(ch)
    } else if visitedList.contains(ch) && beforeCH != String(ch) { // 접근하지않았고 이전 문자와 현재 문자가 다르다면 count 증가
      count += 1
      break
    }
    beforeCH = String(ch)
  }
}
print(N - count)
