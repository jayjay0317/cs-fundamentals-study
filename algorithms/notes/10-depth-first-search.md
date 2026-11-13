# Depth-First Search (DFS)

## Depth-First Search

**DFS** explores a graph by following a path as deeply as possible before backtracking.

Unlike BFS, DFS solves **single-source reachability**, but does not guarantee shortest paths.

DFS recursively explores unvisited neighbors and stores parent pointers to construct a **DFS tree**.

### Algorithm

```python
def visit(u):
    visited.add(u)

    for v in adj[u]:
        if v not in visited:
            parent[v] = u
            visit(v)
```

Initialize `parent[s] = None` before starting DFS from source `s`.

- Each vertex is visited only once.
- `parent[v]` records the vertex from which `v` was first discovered.
- When `visit(v)` finishes, execution returns to the calling function (**backtracking**).
- Parent pointers represent DFS tree edges, not every edge in the original graph.

### Correctness

**Claim:** DFS visits every vertex reachable from `s` and correctly assigns parent pointers.

**Proof idea (induction on shortest-path distance):**

- **Base case:** The source `s` is visited with `parent[s] = None`.
- **Inductive step:** Consider a vertex `v` at distance $k+1$ from `s`.
- Let `u` be the previous vertex on a shortest path to `v`, so its distance is $k$.
- By induction, DFS visits `u` and examines its outgoing edge to `v`.
- If `v` is unvisited, DFS discovers it and sets `parent[v] = u`. Otherwise, `v` has already been discovered with a valid parent.

Therefore, all reachable vertices are visited with valid parent pointers.

Note that DFS parent pointers do not necessarily represent shortest paths.

## Full DFS

A DFS started from one source only visits vertices reachable from that source.

**Full DFS** explores the entire graph by starting a new DFS from each remaining unvisited vertex.

```python
for u in vertices:
    if u not in visited:
        parent[u] = None
        visit(u)
```

Multiple DFS trees form a **DFS forest**.

### Connected Components

In an undirected graph, a connected component is a maximal group of mutually reachable vertices.

Full DFS can identify connected components: each new DFS tree corresponds to one connected component.

### Time Complexity

Each vertex is visited once, and its adjacency list is scanned once.

- Vertex processing: $O(|V|)$
- Edge examination: $O(|E|)$

Therefore, full DFS runs in:

$$
O(|V|+|E|)
$$

## Directed Acyclic Graphs (DAGs)

A **DAG** is a directed graph containing no directed cycles.

### Topological Ordering

A topological order is an ordering of vertices such that, for every directed edge $(u,v)$, `u` appears before `v`.

If `order(u)` represents the position of `u`, then:

$$
order(u) < order(v)
$$

A graph has a topological ordering if and only if it is a DAG.

### Finishing Order

A vertex finishes when its DFS call completes after exploring all its outgoing neighbors.

The **finishing order** is the order in which vertices finish during full DFS.

**Claim:** For a DAG, the reverse of DFS finishing order is a topological order.

**Proof idea:** Consider any directed edge $(u,v)$.

- **Case 1: `u` is visited before `v`.** DFS discovers and completes `v` before completing `u`.
- **Case 2: `v` is visited before `u`.** Since the graph is acyclic, `v` cannot reach `u`. Therefore, `v` must finish before `u` is visited.

In both cases, `v` finishes before `u`.

Therefore, reversing the finishing order places `u` before `v`, satisfying the topological ordering property.

## Cycle Detection

DFS can detect cycles in directed graphs by identifying **back edges**.

A back edge connects a vertex to one of its ancestors in the current DFS tree.

If DFS encounters an edge to an ancestor that is still being explored, a directed cycle exists.

### Detecting Back Edges

Vertices can be classified into three states:

- **Unvisited:** Not yet discovered.
- **Active:** Currently being explored (on the recursion stack).
- **Finished:** All outgoing edges have been examined.

An edge to an **active ancestor** indicates a cycle.

An edge to an already finished vertex does not necessarily indicate a cycle.

### Correctness

**Claim:** If a directed graph contains a cycle, full DFS encounters a back edge.

**Proof idea:**

- Consider a directed cycle $(v_0,v_1,\ldots,v_k,v_0)$.
- Let $v_0$ be the first vertex on this cycle discovered by DFS.
- Before `visit(v_0)` finishes, DFS explores the vertices reachable along the cycle, including $v_k$.
- When DFS examines the edge $(v_k,v_0)$, $v_0$ is still an active ancestor.

Therefore, DFS detects a back edge, proving that the graph contains a cycle.

Cycle detection using full DFS takes $O(|V|+|E|)$ time.

## Key Takeaways

- DFS explores deeply before backtracking and constructs a DFS tree.
- Full DFS explores the entire graph and produces a DFS forest.
- DFS identifies connected components in undirected graphs.
- Reversing DFS finishing order produces a topological order for DAGs.
- A back edge to an active ancestor indicates a directed cycle.
- Full DFS runs in $O(|V|+|E|)$ time.