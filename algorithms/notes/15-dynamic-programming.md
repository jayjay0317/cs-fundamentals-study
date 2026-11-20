# Lecture 15: Dynamic Programming

## Dynamic Programming

Dynamic programming (DP) is an algorithm design technique that solves problems by breaking them into smaller, overlapping subproblems and reusing their solutions.

**DP = Recursion + Memoization**

### SRTBOT: Recursive Algorithm Paradigm

1. **Subproblems:** Define smaller problems that help solve the original problem.
2. **Relate:** Express each subproblem's solution in terms of smaller subproblems using a recurrence.
3. **Topological Order:** Determine an evaluation order that ensures dependencies are solved first and avoids cyclic dependencies.
4. **Base Cases:** Define the solutions to the smallest subproblems.
5. **Original Problem:** Determine how to obtain the original answer from the subproblem solutions.
6. **Time Analysis:** Analyze the total computation required.

The dependencies between subproblems form a **subproblem DAG**, also called a call DAG.

## Memoization

Memoization stores previously computed subproblem solutions so they can be reused without redundant computation.

- Maintain a dictionary `memo` mapping subproblems to their solutions.
- If a subproblem has already been solved, return its stored result.
- Otherwise, compute its solution recursively and store the result.

```python
memo = {}

def solve(subproblem):
    if subproblem in memo:
        return memo[subproblem]

    if is_base_case(subproblem):
        result = base_value(subproblem)
    else:
        result = solve_recursively(subproblem)

    memo[subproblem] = result
    return result
```

With memoization, each distinct subproblem needs to be fully solved only once.

A useful time analysis is:

$$
\text{Time} =
\sum_{\text{subproblems}} \text{work per subproblem}
$$

If each subproblem requires the same amount of work, this simplifies to:

$$
\text{Time} =
(\text{number of subproblems})
\times
(\text{work per subproblem})
$$

## Example 1: Fibonacci Numbers

Given `n`, compute the nth Fibonacci number.

$$
F_n = F_{n-1} + F_{n-2}
$$

where $F_1 = F_2 = 1$.

### SRTBOT

- **Subproblems:** $F(i) = F_i$, for $1 \le i \le n$.
- **Relate:** $F(i) = F(i-1) + F(i-2)$, for $i \ge 3$.
- **Topological Order:** Increasing `i`, from 1 to `n`.
- **Base Cases:** $F(1) = F(2) = 1$.
- **Original Problem:** $F(n)$.

### Time Analysis

Without memoization:

$$
T(n) = T(n-1) + T(n-2) + \Theta(1)
$$

The running time grows exponentially because the same subproblems are repeatedly solved.

With memoization:

- Number of subproblems: $\Theta(n)$
- Work per subproblem: $\Theta(1)$

Therefore:

$$
\boxed{T(n) = \Theta(n)}
$$

Memoization reduces the running time from exponential to linear.

## Example 2: DAG Shortest Paths

Given a DAG `G` and a source vertex `s`, compute the shortest-path distance from `s` to every vertex.

### SRTBOT

- **Subproblems:** Compute $\delta(s,v)$ for every vertex $v \in V$.
- **Relate:** For $v \ne s$,

$$
\delta(s,v) =
\min\left(
\{\delta(s,u) + w(u,v) : u \in Adj^-(v)\}
\cup \{\infty\}
\right)
$$

- **Topological Order:** Topological order of the DAG.
- **Base Case:** $\delta(s,s) = 0$.
- **Original Problem:** Solutions to all subproblems.

### Time Analysis

- Number of subproblems: $|V|$
- Work for vertex `v`: $O(1 + |Adj^-(v)|)$

Summing over all vertices:

$$
\boxed{T = O(|V| + |E|)}
$$

This includes computing a topological ordering.

## Example 3: Bowling

Given `n` pins with values $v_0, v_1, \ldots, v_{n-1}$, maximize the total score.

At each position, we can:

- Skip pin `i` and receive 0 points.
- Hit pin `i` alone and receive $v_i$ points.
- Hit adjacent pins `i` and `i+1` together and receive $v_i v_{i+1}$ points.

Each pin can be used at most once.

### Subproblem Design

For sequence-based problems, useful subproblem definitions often involve:

- **Prefixes:** `x[:i]`
- **Suffixes:** `x[i:]`
- **Substrings:** `x[i:j]`

### SRTBOT

**Subproblems:**

Define $B(i)$ as the maximum possible score using pins `i` through `n-1`.

**Relate:**

For $0 \le i < n-1$:

$$
B(i) =
\max
\begin{cases}
B(i+1) & \text{Skip pin } i\\
v_i + B(i+1) & \text{Hit one pin}\\
v_i v_{i+1} + B(i+2) & \text{Hit two pins}
\end{cases}
$$

**Topological Order:**

Decreasing `i`, solving smaller suffixes before larger suffixes.

**Base Cases:**

$$
B(n)=0
$$

$$
B(n-1)=\max(0,v_{n-1})
$$

**Original Problem:**

$$
B(0)
$$

### Bottom-Up Implementation

```python
def bowling(values):
    n = len(values)
    dp = [0] * (n + 2)

    for i in range(n - 1, -1, -1):
        skip = dp[i + 1]
        single = values[i] + dp[i + 1]

        best = max(skip, single)

        if i + 1 < n:
            double = values[i] * values[i + 1] + dp[i + 2]
            best = max(best, double)

        dp[i] = best

    return dp[0]
```

### Time Analysis

- Number of subproblems: $\Theta(n)$
- Work per subproblem: $\Theta(1)$

Therefore:

$$
\boxed{T(n)=\Theta(n)}
$$

## Key Takeaways

- DP avoids redundant computation by storing and reusing subproblem solutions.
- SRTBOT provides a systematic framework for designing recursive and DP algorithms.
- Subproblem definitions and recurrences are central to solving DP problems.
- Memoization uses a top-down approach, while bottom-up DP evaluates subproblems in dependency order.
- The subproblem DAG determines the valid computation order.
- DP can reduce exponential-time recursion to polynomial time, but not every DP algorithm is polynomial-time.