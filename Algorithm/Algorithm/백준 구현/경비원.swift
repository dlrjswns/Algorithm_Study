//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 6/3/24.
//

import Foundation

let heightInfo = readLine()!.split(separator: " ").map { Int(String($0))! }
let rowHeight = heightInfo[0], columnHeight = heightInfo[1]

/// 상점의 개수
let storeCount = Int(readLine()!)!

/*
 1이 북
 2가 남
 3이 서
 4가 동
 
 점부터 점까지의 거리를 구할때 기준점을 정하고 거리구함
 */

var result = 0
var storeInfo: [Int] = []

private func getDistance(dir: Int, distance: Int) -> Int {
    
    switch dir {
        case 1:
        return distance
        case 2:
        return rowHeight + columnHeight + rowHeight - distance
        case 3:
        return 2 * rowHeight + columnHeight + columnHeight - distance
        case 4:
        return rowHeight + distance
        default:
            break
    }
    
    return 0
}

for _ in 0..<storeCount {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    /// 상점 방향, 맨 왼쪽 기준으로 거리
    let storeDirection = info[0], storeDistance = info[1]
    storeInfo.append(getDistance(dir: storeDirection, distance: storeDistance))
}

let dongGeunInfo = readLine()!.split(separator: " ").map { Int(String($0))! }

/// 상점 방향, 맨 왼쪽 기준으로 거리
let dongGeunDirection = dongGeunInfo[0], dongGeunDistance = dongGeunInfo[1]
let d = getDistance(dir: dongGeunDirection, distance: dongGeunDistance)

var answer = 0

for store in storeInfo {
    answer += min(abs(d - store), 2 * (rowHeight + columnHeight) - abs(d - store))
}
print(answer)
