# Weighted Shortest Paths

## Weighted Graphs

A **weighted graph** assigns a weight to each edge.

Edge weights can be stored:
- Alongside neighbors in an adjacency list.
- In a separate data structure mapping edges to weights.

## Weighted Shortest Paths

The weight of a path is the sum of its edge weights.

The **shortest-path weight** from `s` to `v` is:

$$
\delta(s,v) = \inf_{\pi:s\to v} w(\pi)
$$

Three possible cases:

- **Finite:** A minimum-weight path exists.
- **Positive infinity:** No path exists from `s` to `v`.
- **Negative infinity:** A reachable negative-weight cycle can be used on a path from `s` to `v`.

### Negative-Weight Cycles

A **negative-weight cycle** is a directed cycle whose total weight is negative.

Repeating the cycle indefinitely reduces the path weight without bound.

A subpath of a shortest path is also a shortest path between its endpoints.

## Shortest-Path Trees

Parent pointers represent shortest paths from the source.

For a vertex `v` with finite shortest-path weight, a predecessor `u` on a shortest path satisfies:

$$
\delta(s,v) = \delta(s,u) + w(u,v)
$$

A shortest-path tree can be constructed by selecting appropriate predecessor edges while avoiding cycles in the parent pointers.

## Edge Relaxation

**Relaxation** improves a distance estimate when a shorter path is discovered.

Maintain `d[v]`, an upper bound on the true shortest-path weight:

$$
d[v] \geq \delta(s,v)
$$

Initially:
- `d[s] = 0`
- `d[v] = infinity` for all other vertices

### Triangle Inequality

For shortest-path weights:

$$
\delta(u,v) \leq \delta(u,x) + \delta(x,v)
$$

For an edge `(u, v)`, if:

`d[v] > d[u] + w(u, v)`

then relax the edge:

`d[v] = d[u] + w(u, v)`

Optionally, update `parent[v] = u` to record the improved path.

### Why Relaxation Is Safe

Every finite distance estimate represents the weight of some path from the source.

Relaxing an edge extends a known path by one edge, so the new estimate still corresponds to a valid path.

Therefore, relaxation never underestimates the true shortest-path weight.

## DAG Shortest Paths

In a **Directed Acyclic Graph (DAG)**, shortest paths can be computed by relaxing edges in topological order.

### Algorithm

1. Initialize `d[s] = 0` and all other distances to infinity.
2. Compute a topological ordering.
3. Process each vertex `u` in topological order.
4. Relax every outgoing edge `(u, v)`.

### Why Topological Order Works

Every predecessor of a vertex appears before it in topological order.

**Correctness (induction idea):**

- Assume earlier vertices have correct shortest-path distances.
- Each vertex receives distance updates from all its predecessors before being processed.
- Relaxation guarantees that these updates never underestimate the true distance.
- Therefore, each reachable vertex obtains its correct shortest-path distance.

At the end:

$$
d[v] = \delta(s,v)
$$

### Time Complexity

- Initialization: $O(|V|)$
- Topological sorting: $O(|V|+|E|)$
- Edge relaxation: $O(|E|)$

Total:

$$
O(|V|+|E|)
$$

## Key Takeaways

- Weighted shortest paths minimize total edge weight rather than edge count.
- Negative-weight cycles can make shortest-path weights negative infinity.
- Relaxation improves distance estimates while maintaining valid upper bounds.
- Topological order allows each edge in a DAG to be relaxed once.
- DAG shortest paths run in $O(|V|+|E|)$, even with negative edge weights.