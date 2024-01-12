//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/12/24.
//

import Foundation

let n = Int(readLine()!)!
/*
 2 x n크기의 직사각형을 채우는 방법의 수를 10,007로 나눈 나머지를 출력
 D[i] = 2 x i 크기의 직사각형을 채우는 방법의 수를 10,007로 나눈 나머지
 */

var dp = Array(repeating: -1, count: 1001) // 1 <= n <= 1000

if n == 1 {
    print(1)
} else if n == 2 {
    print(2)
} else {
    dp[1] = 1
    dp[2] = 2
    for i in 3..<n+1 {
        dp[i] = (dp[i-1] + dp[i-2]) % 10007
    }
    print(dp[n])
}

