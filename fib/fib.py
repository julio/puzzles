def fib(n, memo):
    if n == 0 or n == 1:
        return n

    if memo[n] == 0:
        memo[n] = fib(n-1, memo) + fib(n-2, memo)

    return memo[n]

n = 350
print(fib(n, [0] * (n+1)))