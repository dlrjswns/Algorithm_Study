from pickle import TRUE


list = list(map(int, input().split()))

if list == sorted(list):
    print("ascending")
elif list == sorted(list, reverse=True):
    print("descending")
else:
    print("mixed")
