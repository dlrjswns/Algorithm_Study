//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/29.
//

import Foundation

var letter = readLine()!
let explosionLetter = readLine()!

var stack: [Character] = []

for ch in letter {
  stack.append(ch)
//  print("뭐야 \(stack.count - 1 - explosionLetter.count)")
  if String(ch) == String(explosionLetter.last!) && stack.count >= explosionLetter.count && String(stack[(stack.count - explosionLetter.count)...]) == explosionLetter {
    stack.removeLast(explosionLetter.count)
  }
}

stack.isEmpty ? print("FRULA") : print(String(stack))


