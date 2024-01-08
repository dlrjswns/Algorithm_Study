croatiaList = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

letter = input()

for croatia in croatiaList:
    letter = letter.replace(croatia, "a")

print(len(letter))