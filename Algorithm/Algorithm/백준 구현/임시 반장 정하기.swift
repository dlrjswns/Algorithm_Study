//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 6/4/24.
//

import Foundation

/// 반의 학생 수
let studentNum = Int(readLine()!)!

/// 반에 대한 정보
var lectureInfo: [[Int]] = []

for _ in 0..<studentNum {
    let numList = readLine()!.split(separator: " ").map { Int(String($0))! }
    lectureInfo.append(numList)
}

var countInfo: [Int] = Array(repeating: 0, count: studentNum)

for i in 0..<studentNum {
    for j in i+1..<studentNum {
        for k in 0..<5 {
            if lectureInfo[i][k] == lectureInfo[j][k] {
                countInfo[i] += 1
                countInfo[j] += 1
                break
            }
        }
    }
}

var maxNum = Int.min
var answer = 0

for num in 0..<studentNum {
    if countInfo[num] > maxNum {
        maxNum = countInfo[num]
        answer = num
    }
}

print(answer + 1)
