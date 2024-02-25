import Foundation

let firstLetter = readLine()!.map { String($0) }
let secondLetter = readLine()!.map { String($0) }

var LCS = Array(repeating: Array(repeating: 0, count: secondLetter.count + 1), count: firstLetter.count + 1)

var result = 0

for i in 1...firstLetter.count {
  for j in 1...secondLetter.count {
    if firstLetter[i-1] == secondLetter[j-1] {
      LCS[i][j] = LCS[i-1][j-1] + 1
      result = max(LCS[i][j], result)
    }
  }
}

print(result)
