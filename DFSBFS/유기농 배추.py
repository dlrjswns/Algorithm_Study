import sys
sys.setrecursionlimit(10000) # 재귀 깊이 설정

T = int(input()) # 테스트 케이스의 개수 

dx = [0, 0, -1, 1] # 상 하 좌 우
dy = [-1, 1, 0, 0]

def dfs(x, y):
    if x < 0 or y < 0 or x >= N or y >= M:
        return False

    if graph[x][y] == 1:
        graph[x][y] = 0
        
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            dfs(nx, ny)

        return True
    return False

for _ in range(T):
    M, N, K = map(int, input().split()) # 배추밭의 가로길이 M, 세로길이 N, 배추심어져있는위치개수 K

    graph = [[0]*M for _ in range(N)]

    for _ in range(K):
        x, y = map(int, input().split())
        graph[y][x] = 1
    
    count = 0

    for n in range(N):
        for m in range(M):
            if dfs(n, m) == True:
                count += 1

    print(count)
                
