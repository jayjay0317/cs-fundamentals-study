# Breadth-First Search (BFS)

## Graph Basics

A graph is defined as $G = (V, E)$, where:

- $V$: set of vertices (nodes)
- $E$: set of edges connecting vertices

A **simple graph** has no self-loops or duplicate edges.

For simple graphs, the maximum number of edges is:

- Undirected: $|E| \leq \binom{|V|}{2}$
- Directed: $|E| \leq 2\binom{|V|}{2}$

Therefore, $|E| = O(|V|^2)$.

## Adjacency and Degree

- `Adj+(u)`: outgoing neighbors of vertex `u`
- `Adj-(u)`: incoming neighbors of vertex `u`
- `deg(u)`: number of neighbors (undirected) or outgoing neighbors (directed)

The sum of degrees is:

- Directed (out-degree): $|E|$
- Undirected: $2|E|$

Each undirected edge contributes to the degree of both endpoints.

## Graph Representation

An **adjacency list** stores the outgoing neighbors of each vertex.

For example:

```python
adj = {
    "A": ["B", "C"],
    "B": ["D"],
    "C": ["D"],
    "D": []
}
```

A direct access array or hash table can map each vertex `u` to `Adj(u)`.

- Accessing `Adj(u)`: $O(1)$ (expected for hash tables)
- Iterating through `Adj(u)`: $O(\deg(u))$
- Total graph storage: $O(|V| + |E|)$

## Shortest Paths

A **path** is a sequence of vertices connected by edges.

In an unweighted graph, the shortest path is the path containing the fewest edges.

- `d(s, v)`: shortest-path distance from source `s` to vertex `v`
- `parent[v]`: predecessor of `v` along a discovered shortest path from `s`

Parent pointers form a **shortest-path tree**, allowing paths to be reconstructed by following parents backward to the source.

## Breadth-First Search (BFS)

BFS explores vertices level by level, starting from a source vertex `s`.

- $L_0 = \{s\}$: source vertex
- $L_1$: vertices at distance 1
- $L_2$: vertices at distance 2
- $L_i$: vertices whose shortest-path distance from `s` is $i$

### Algorithm

1. Initialize $L_0 = \{s\}$ and mark `s` as discovered.
2. For each vertex `u` in the current level, examine every vertex `v` in `Adj(u)`.
3. If `v` has not been discovered:
   - Add `v` to the next level.
   - Set `parent[v] = u`.
   - Set `d(s, v) = i + 1`, where `u` is in level $i$.
4. Continue until no new vertices are discovered.

Each vertex is discovered only once, preventing repeated visits and infinite loops in cyclic graphs.

### Why BFS Finds Shortest Paths

BFS explores vertices in increasing order of distance from the source.

When a vertex is first discovered at level $i$, there cannot be a shorter path to it, because all earlier levels have already been explored.

Therefore, BFS finds shortest paths in **unweighted graphs**.

Vertices unreachable from `s` are never discovered.

## Time Complexity

BFS runs in:

$$
O(|V| + |E|)
$$

Because:

- Each vertex is initialized and processed at most once: $O(|V|)$.
- Each adjacency list is scanned at most once, so the total work across all edges is $O(|E|)$.

This is linear in the size of the graph.

## Key Takeaways

- Adjacency lists represent graphs efficiently using $O(|V| + |E|)$ space.
- BFS explores vertices level by level and avoids revisiting discovered vertices.
- BFS finds shortest paths in unweighted graphs.
- Parent pointers allow shortest paths to be reconstructed.
- BFS takes $O(|V| + |E|)$ time.