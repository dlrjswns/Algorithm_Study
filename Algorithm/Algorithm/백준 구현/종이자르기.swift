import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let horizontalHeight = input[0], verticalHeight = input[1]

let cutCount = Int(readLine()!)! // 칼로 잘라야하는 점선의 개수

var horizontalInfo: [Int] = []
var verticalInfo: [Int] = []

for _ in 0..<cutCount {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  if input[0] == 1 {
    verticalInfo.append(input[1])
  } else {
    horizontalInfo.append(input[1])
  }
}

/*
 가로로 자르는 점선 번호는 0
 세로로 자르는 점선 번호는 1
 */

var maxWidth = Int.min // 가장 큰 종이 조각의 넓이
var maxHorizontal = Int.min
var maxVertical = Int.min

verticalInfo.sort()
horizontalInfo.sort()


var beforeHorizontal = 0

for horizontal in horizontalInfo {
  maxHorizontal = max(horizontal - beforeHorizontal, maxHorizontal)
  beforeHorizontal = horizontal
}

maxHorizontal = max(verticalHeight - beforeHorizontal, maxHorizontal)

var beforeVertical = 0

for vertical in verticalInfo {
  maxVertical = max(vertical - beforeVertical, maxVertical)
  beforeVertical = vertical
}

maxVertical = max(horizontalHeight - beforeVertical, maxVertical)

//print(maxHorizontal)
//print(maxVertical)
print(maxHorizontal * maxVertical)
