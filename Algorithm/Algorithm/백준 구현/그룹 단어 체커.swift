//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/23.
//

import Foundation

let N = Int(readLine()!)!
var list: [String] = [] // 입력받은 문자리스트

for _ in 0..<N {
  list.append(readLine()!)
}

func isGroupedLetter(_ letter: String) -> Bool {
  var existLetter: [Character] = []
  for ch in letter {
    if !existLetter.contains(ch) {
      existLetter.append(ch)
    }
    else if existLetter.last != ch && existLetter.contains(ch) {
      return false
    }
  }
  return true
}

var count = 0

for li in list {
  if isGroupedLetter(li) == true {
    count += 1
  }
}
print(count)


