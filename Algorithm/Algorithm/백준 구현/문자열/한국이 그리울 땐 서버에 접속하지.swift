//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/21/24.
//

import Foundation

let N = Int(readLine()!)! // 파일의 개수
let pattern = readLine()!.split(separator: "*").map { String($0) }
let firstLetter = pattern[0]
let lastLetter = pattern[1]

var alphabetList: [String] = []

for _ in 0..<N {
  alphabetList.append(String(readLine()!))
}

for alpha in alphabetList {
  if firstLetter.count + lastLetter.count > alpha.count {
    print("NE")
  } else if alpha.hasPrefix(firstLetter) && alpha.hasSuffix(lastLetter) {
    print("DA")
  }
  else {
    print("NE")
  }
}
