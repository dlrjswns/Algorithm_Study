import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var people = n - lost.count - reserve.count
    var borrowArr = [Int]()

    reserve.forEach { reserveNum in
        borrowArr.append(reserveNum - 1)
        borrowArr.append(reserveNum + 1)
    }
    
    var addPeople = lost.filter { borrowArr.contains($0) }
    var setAddPeople = Set(addPeople)
    
    people += addPeople.count
    
    return people
}
