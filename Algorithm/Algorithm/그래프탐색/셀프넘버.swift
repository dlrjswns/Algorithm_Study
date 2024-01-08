var checkSelfNumber = Array(repeating: false, count: 10000)

func constructor(_ num: Int) -> Int {
  let strNum = String(num)
  var sum = num
  for ch in strNum {
    sum += Int(String(ch))!
  }
  return sum
}

for num in 1...10000 {
  if constructor(num) <= 10000 {
    checkSelfNumber[constructor(num) - 1] = true
  }
}

for i in 0..<checkSelfNumber.count {
  if checkSelfNumber[i] == false {
    print(i + 1)
  }
}
