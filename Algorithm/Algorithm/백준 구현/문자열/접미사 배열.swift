//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/22/24.
//

import Foundation

let S = readLine()!.map { String($0) }

var answer: [String] = []

for i in 0..<S.count {
  answer.append(S[i...].joined())
}

answer.sort()

answer.forEach { print($0) }


