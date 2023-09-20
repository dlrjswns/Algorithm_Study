N = int(input())
graph = []
num = []
visited = []

dx = [-1, 1, 0, 0] # 상, 하, 좌, 우
dy = [0, 0, -1, 1]

for _ in range(N):
    graph.append(list(map(int, input())))

def dfs(x, y):
    if 0 > x or x >= N or y < 0 or y >= N:
        return False
    
    if graph[x][y] == 1:
        visited.append((x, y))
        global count 
        count += 1
        for i in range(4):
            rx = x + dx[i]
            ry = y + dy[i]
        
            if (rx, ry) not in visited:
                dfs(rx, ry)

        return True
    
count = 0
result = 0

for x in range(N):
    for y in range(N):
        if (x, y) not in visited and dfs(x, y) == True: # 만약에 (x, y) not in visited 해당 조건문이 존재하지않을 경우, dfs함수내부에서는 방문여부를 가지고 처리해주었지만 밖에서는 이미 방문한 1에 접근하더라도 방문했는지에 대한 여부를 모르기에 1이 num에 들어가고 이미 방문했기에 더는 스택호출로 이어지지않는것
            num.append(count)
            count = 0
            result +=1
         
num.sort()

print(result)
for n in num:
    print(n)
