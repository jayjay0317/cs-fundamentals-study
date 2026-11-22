# Lecture 17: Dynamic Programming III

## 1. All-Pairs Shortest Paths (APSP)

APSP computes the shortest-path distances between every pair of vertices.

### Floyd-Warshall Algorithm

Define `d(u, v, k)` as the shortest-path distance from `u` to `v` using only vertices `1, ..., k` as intermediate vertices.

**SRTBOT:**

- **Subproblems:** `d(u, v, k)` for all `u, v` in `V` and `0 <= k <= n`, where `n` is the number of vertices.
- **Relate:**

$$
d(u,v,k)=\min\left(
d(u,v,k-1),
d(u,k,k-1)+d(k,v,k-1)
\right)
$$

- **Topological Order:** Increasing `k`, computing all vertex pairs at each stage.
- **Base Cases:** `d(u, v, 0)` equals 0 if `u = v`, the direct edge weight if an edge exists, and infinity otherwise.
- **Original Problem:** `d(u, v, n)` for every pair `(u, v)`, assuming no negative-weight cycles.
- **Time:** $\Theta(n^3)$.

**Key Idea:** At each stage, determine whether allowing vertex `k` as an intermediate vertex produces a shorter path.

## 2. Arithmetic Parenthesization

Given an arithmetic expression containing integers, addition, and multiplication, place parentheses to maximize its value.

**Key Idea:** Guess which operator is evaluated last, splitting the expression into two subexpressions.

**SRTBOT:**

- **Subproblems:** `X(i, j, opt)` represents the minimum or maximum value of the subexpression from `a_i` to `a_(j-1)`.
- **Relate:** Try every split position `k` and combine the minimum and maximum values of the left and right subexpressions.
- **Topological Order:** Increasing substring length `j - i`.
- **Base Cases:** `X(i, i+1, opt) = a_i`.
- **Original Problem:** `X(0, n, max)`.
- **Time:** $\Theta(n^3)$.

**Key Idea:** Store both minimum and maximum values because multiplying negative numbers can turn a minimum into a maximum.

## 3. Piano Fingering

Given a sequence of notes and `F` possible fingers, find the fingering assignment that minimizes total playing difficulty.

Let `d(t, f, t', f')` represent the difficulty of transitioning between two notes using fingers `f` and `f'`.

**SRTBOT:**

- **Subproblems:** `X(i, f)` is the minimum total difficulty of playing notes `i` through `n-1`, starting with finger `f` on note `i`.
- **Relate:**

$$
X(i,f)=\min_{1\le f'\le F}
\left(
d(t_i,f,t_{i+1},f')+X(i+1,f')
\right)
$$

- **Topological Order:** Decreasing `i`.
- **Base Cases:** `X(n-1, f) = 0`.
- **Original Problem:** Minimum of `X(0, f)` over all possible starting fingers.
- **Time:** $\Theta(nF^2)$.

**Key Idea:** Include the current finger in the subproblem state because the cost of the next transition depends on it.

## Key Takeaways

- **Floyd-Warshall:** Expand the set of allowed intermediate vertices.
- **Arithmetic Parenthesization:** Use interval DP and track both minimum and maximum values.
- **Piano Fingering:** Expand the subproblem state to account for decisions that affect future costs.