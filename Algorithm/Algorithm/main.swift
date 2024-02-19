//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/19/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var space: [[Int]] = []

for _ in 0..<N {
  space.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}


var visited = Array(repeating: Array(repeating: false, count: M), count: N)
let dx = [0, 0, 1, -1, 1, -1, 1, -1]
let dy = [1, -1, 0, 0, 1, -1, -1, 1]

