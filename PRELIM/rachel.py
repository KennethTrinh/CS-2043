text = "rachel is the best girlfriend ever"

# for i, c in enumerate(text):
# 	print(text[:i])

# for i, c in enumerate(text):
# 	print(text[i:])

n = len(text)
mid = n // 2
for i in range(n):
	print( ' '.join([' ' if abs(mid - i) > j else text[j] for j in range(n)] ))

# for i in range(n):
# 	print(
# 		' '.join([' ' if abs(mid - j) < i and abs(mid -i) % 2 == 0 else text[j] for j in range(n)])
# 	)