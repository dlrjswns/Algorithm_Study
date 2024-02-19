import Foundation

func minJumps(_ nums: [Int]) -> Int {
    let n = nums.count
    
    // 방문 여부를 저장하는 배열
    var visited = [Bool](repeating: false, count: n)
    visited[0] = true
    
    // BFS를 위한 큐
    var queue = [(index: Int, jumps: Int)]()
    queue.append((0, 0)) // 시작 인덱스와 점프 횟수
    
    while !queue.isEmpty {
        let (index, jumps) = queue.removeFirst()
        
        // 현재 위치에서 갈 수 있는 모든 다음 위치 계산
        let maxJump = nums[index]
      
        for i in 0...maxJump {
            let nextIndex = index + i
            
            // 배열의 끝에 도달한 경우 점프 횟수 반환
            if nextIndex == n - 1 {
              return maxJump == 0 ? jumps : jumps + 1
            }
            
            // 배열 범위 내에 있고 방문하지 않았다면 큐에 추가
            if nextIndex < n && !visited[nextIndex] {
                visited[nextIndex] = true
                queue.append((nextIndex, jumps + 1))
            }
        }
    }
    
    // 끝에 도달할 수 없는 경우 -1 반환
    return -1
}

// 입력 받기
let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }

// 최소 점프 횟수 계산 및 출력
let result = minJumps(nums)
print(result)
