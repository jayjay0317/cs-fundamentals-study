# Lecture 16: Dynamic Programming II

## Subsequence

A subsequence is a sequence obtained by removing zero or more elements from another sequence without changing the relative order of the remaining elements.

Unlike a substring, a subsequence does not need to be contiguous.

## Example 1: Longest Common Subsequence (LCS)

Given two sequences `A` and `B`, find the longest sequence that is a subsequence of both `A` and `B`.

### Subproblem Design

For problems involving multiple input sequences, we can combine the subproblem spaces of the individual sequences.

Let $n = |A|$ and $m = |B|$.

### SRTBOT

**Subproblems:**

Define $L(i,j)$ as the length of the longest common subsequence of `A[i:]` and `B[j:]`, where $0 \le i \le n$ and $0 \le j \le m$.

**Relate:**

$$
L(i,j)=
\begin{cases}
1+L(i+1,j+1) & A[i]=B[j]\\
\max\{L(i+1,j),L(i,j+1)\} & A[i]\ne B[j]
\end{cases}
$$

- If the current elements match, include them in the common subsequence and advance both indices.
- Otherwise, at least one of the current elements must be excluded. Consider skipping either element and take the maximum.

**Topological Order:**

Decreasing `i` and `j`, so that all dependent subproblems are computed first.

**Base Cases:**

$$
L(n,j)=0
$$

$$
L(i,m)=0
$$

An empty sequence has no common elements with another sequence.

**Original Problem:**

$$
L(0,0)
$$

**Time Analysis:**

- Number of subproblems: $\Theta(nm)$
- Work per subproblem: $\Theta(1)$

Therefore:

$$
T(n,m)=\Theta(nm)
$$

## Example 2: Longest Increasing Subsequence (LIS)

Given a sequence `A`, find the longest strictly increasing subsequence.

### Subproblem Design

Simply defining a subproblem as the LIS of a suffix makes it difficult to determine whether a new element can be placed before that subsequence.

Instead, impose a constraint that the increasing subsequence must start with the current element `A[i]`.

Let $n = |A|$.

### SRTBOT

**Subproblems:**

Define $L(i)$ as the length of the longest increasing subsequence of `A[i:]` that starts with `A[i]`, where $0 \le i < n$.

**Relate:**

$$
L(i)=1+\max\left(
\{L(j):i<j<n,\ A[i]<A[j]\}
\cup\{0\}
\right)
$$

Consider all subsequent elements that are strictly greater than the current element.

If no such element exists, the subsequence contains only `A[i]` and has length 1.

**Topological Order:**

Decreasing `i`, from `n-1` to 0.

**Base Case:**

$$
L(n-1)=1
$$

The last element forms an increasing subsequence of length 1.

**Original Problem:**

$$
\max_{0\le i<n} L(i)
$$

The optimal subsequence may start at any position in the input sequence.

For an empty input sequence, return 0.

**Time Analysis:**

- Number of subproblems: $\Theta(n)$
- Work per subproblem: $O(n)$
- Work to find the maximum over all subproblem solutions: $\Theta(n)$

Each subproblem examines the elements to its right.

$$
T(n)=
\Theta\left(\sum_{i=0}^{n-1}(n-i)\right)
+\Theta(n)
$$

Therefore:

$$
T(n)=\Theta(n^2)
$$

## Example 3: Alternating Coin Game

Given a sequence of `n` coins with values $v_0,v_1,\ldots,v_{n-1}$:

- Two players take turns selecting a coin.
- Each player can take either the leftmost or the rightmost remaining coin.
- Both players play optimally to maximize their own total value.

The goal is to maximize the total value obtained by the first player.

### SRTBOT

**Subproblems:**

Define $X(i,j,p)$ as the maximum total value I can obtain from the remaining coins $v_i,\ldots,v_j$ when player `p` takes the next turn.

Here, $0\le i\le j<n$ and `p` is either `me` or `you`.

**Relate:**

When it is my turn:

$$
X(i,j,\text{me})=
\max
\begin{cases}
v_i+X(i+1,j,\text{you})\\
v_j+X(i,j-1,\text{you})
\end{cases}
$$

When it is the opponent's turn:

$$
X(i,j,\text{you})=
\min
\begin{cases}
X(i+1,j,\text{me})\\
X(i,j-1,\text{me})
\end{cases}
$$

Since the total value of the remaining coins is fixed, maximizing the opponent's score is equivalent to minimizing my score.

Both subproblems represent my total obtainable value, regardless of whose turn it is.

**Topological Order:**

Increasing `j-i`, starting with smaller intervals and proceeding to larger intervals.

**Base Cases:**

When only one coin remains:

$$
X(i,i,\text{me})=v_i
$$

$$
X(i,i,\text{you})=0
$$

**Original Problem:**

$$
X(0,n-1,\text{me})
$$

**Time Analysis:**

- Number of intervals: $\Theta(n^2)$
- Number of possible players per interval: 2
- Work per subproblem: $\Theta(1)$

Therefore:

$$
T(n)=\Theta(n^2)
$$

## Subproblem Expansion

Subproblem expansion involves adding information or constraints to a subproblem definition to capture the state necessary for solving the problem recursively.

Examples:

- **LCS:** Track positions in both input sequences.
- **LIS:** Require the subsequence to start with a particular element.
- **Alternating Coin Game:** Include whose turn it is in the subproblem state.

Expanding the subproblem space can make the recurrence easier to formulate, although it may increase the number of subproblems.

## Key Takeaways

- Choosing an appropriate subproblem definition is central to dynamic programming.
- Multiple input sequences may require multiple indices in the subproblem state.
- Adding constraints or state variables can simplify recursive relations.
- Subproblems must be evaluated in an order that respects their dependencies.
- The total running time depends on both the number of subproblems and the work required to solve them.