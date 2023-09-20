import sys

N, C = map(int, input().split()) # N은 집의 개수, C는 공유기의 개수
array = [] # 집의 좌표 리스트

for _ in range(N):
    array.append(int(sys.stdin.readline().rstrip()))

array.sort()

start = 1 # 모든 집은 다른 좌표에 있으므로 최소 공유기 거리는 1
end = array[-1] - array[0] # 최대 공유기 거리는 맨 끝 집 - 맨 첫 집
answer = 0

while start <= end:
  mid = (start + end) // 2
  
  count = 1
  cur = array[0]
  
  for i in range(1, len(array)):
      if array[i] - cur >= mid:
          count += 1
          cur = array[i]

  if count >= C:
      answer = mid
      start = mid + 1
  else:
      end = mid - 1


print(answer)

# 이분탐색을 풀 때 min, max값은 출력시켜야할 값의 최소, 최대값을 가지고 풀어주면 될듯 ?