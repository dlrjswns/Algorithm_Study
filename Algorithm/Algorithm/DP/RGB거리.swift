//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/12/24.
//

import Foundation

/*
 RGB거리에 N개의 집이 존재 (1~N번 집이 순서대로 있음)
 집은 빨강, 초록, 파랑 색으로 칠해야함
 
 1. 1번집 색은 2번 집색과 같지않아야함
 2. N번집 색은 N-1번 색과 같지않아야함
 3. i번집 색은 i-1번, i+1번 집의 색과 같지않아야함
 
 dp[i][0]: i번째까지 색칠됨, i번째 색상은 빨강
 dp[i][1]: i번째까지 색칠됨, i번째 색상은 초록
 dp[i][2]: i번째까지 색칠됨, i번째 색상은 파랑
 */

let N = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: -1, count: 3), count: N + 1)
var score = Array(repeating: Array(repeating: -1, count: 3), count: N + 1)

for i in 1..<N + 1 {
  score[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

dp[1][0] = score[1][0]
dp[1][1] = score[1][1]
dp[1][2] = score[1][2]

for i in 2..<N+1 {
  dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + score[i][0]
  dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + score[i][1]
  dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + score[i][2]
}

print(min(dp[N][0], dp[N][1], dp[N][2]))
