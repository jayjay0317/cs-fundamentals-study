# Bellman-Ford

## Simple Shortest Paths

**Claim:** If the shortest-path weight $\delta(s,v)$ is finite, there exists a shortest path from `s` to `v` that is simple.

A simple path does not repeat vertices, so it contains at most $|V|-1$ edges.

**Proof idea:** If a shortest path contains a cycle, that cycle cannot have negative weight. Removing the cycle preserves or reduces the path weight, so a simple shortest path exists.

## K-Edge Distance

The **k-edge distance** $\delta_k(s,v)$ is the minimum weight of a path from `s` to `v` using at most $k$ edges.

If the shortest-path weight is finite, then:

$$
\delta(s,v)=\delta_{|V|-1}(s,v)
$$

## Negative-Cycle Witness

A vertex `v` is a **witness** if:

$$
\delta_{|V|}(s,v)<\delta_{|V|-1}(s,v)
$$

This means that allowing one additional edge produces a shorter path, indicating a reachable negative-weight cycle.

- A witness has shortest-path weight $-\infty$.
- A vertex with shortest-path weight $-\infty$ may not itself be a witness.
- Every vertex with shortest-path weight $-\infty$ is reachable from some witness.

## Bellman-Ford Algorithm

Bellman-Ford solves single-source shortest paths in directed weighted graphs, including graphs with negative edge weights.

### Main Idea: Repeated Relaxation

1. Initialize `d[s] = 0` and all other distances to infinity.
2. Relax every edge repeatedly for $|V|-1$ rounds.
3. Check for further improvements to detect reachable negative-weight cycles.

Why $|V|-1$ rounds?

A finite shortest path can be simple and therefore uses at most $|V|-1$ edges. Repeated relaxation propagates shortest-path information along these edges.

## Graph Duplication (Lecture Approach)

The lecture explains Bellman-Ford by transforming the original graph into a DAG.

- Create $|V|+1$ levels.
- Vertex $v_k$ represents reaching vertex `v` using at most $k$ edges.
- Edges connect consecutive levels, so the new graph is acyclic.
- Include zero-weight edges between copies of the same vertex to allow paths with fewer than $k$ edges.

The new graph contains:

- $|V|(|V|+1)$ vertices
- $|V|(|V|+|E|)$ edges

Run DAG relaxation from $s_0$.

**Correctness claim:**

$$
\delta(s_0,v_k)=\delta_k(s,v)
$$

This follows by induction on $k$.

The algorithm then:

1. Uses level $|V|-1$ to obtain finite shortest-path distances.
2. Compares levels $|V|-1$ and $|V|$ to identify witnesses.
3. Sets the distance of every vertex reachable from a witness to $-\infty$.

## Time Complexity

The graph-duplication approach takes:

$$
O(|V|(|V|+|E|))
$$

After restricting the graph to vertices reachable from the source, the overall bound becomes:

$$
O(|V||E|)
$$

This is slower than DAG shortest paths because general graphs may require repeated relaxation.

## Key Takeaways

- Finite shortest paths can be chosen to be simple, with at most $|V|-1$ edges.
- Bellman-Ford uses repeated relaxation to handle general weighted graphs.
- A witness indicates a reachable negative-weight cycle.
- Vertices reachable from witnesses have shortest-path weight $-\infty$.
- Bellman-Ford runs in $O(|V||E|)$ time after the standard reachability preprocessing.