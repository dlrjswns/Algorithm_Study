import Foundation

let n = Int(readLine()!)! // 학생의 수
var birthdayInfo: [(String, Int, Int, Int)] = []

for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map { String($0) }
  birthdayInfo.append((String(input[0]), Int(input[1])!, Int(input[2])!, Int(input[3])!))
}

birthdayInfo.sort(by: {
  return $0.3 == $1.3 ? $0.2 == $1.2 ? $0.1 > $1.1 : $0.2 > $1.2 : $0.3 > $1.3
})

print(birthdayInfo[0].0)
print(birthdayInfo[n-1].0)

//for i in 0..<n {
//  birthdayInfo[i][3]
//}
