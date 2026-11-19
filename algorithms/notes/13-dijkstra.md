# Lecture 13: Dijkstra's Algorithm

## Key Observations

1. **Nonnegative Weights:** If all edge weights are nonnegative, shortest-path distances are nondecreasing along any shortest path.
2. **Increasing Distance Order:** If vertices are given in nondecreasing order of their shortest-path distances from source `s`, single-source shortest paths can be computed efficiently by relaxing outgoing edges in that order.

## Dijkstra's Algorithm

Dijkstra's algorithm computes single-source shortest paths in a weighted graph with nonnegative edge weights.

**Main Ideas:**
- Process vertices in increasing order of their current distance estimates.
- Use a changeable priority queue to efficiently select the next vertex.
- Once a vertex is removed from the priority queue, its shortest-path distance is finalized.

### Changeable Priority Queue

A changeable priority queue supports:

- `build(items)`: Initialize the priority queue with a collection of items.
- `delete_min()`: Remove and return the item with the smallest key.
- `decrease_key(id, k)`: Decrease the key of the item identified by `id` to `k`.

Each item contains `(id, key)`, where:
- `id`: Vertex identifier
- `key`: Current distance estimate

A binary heap can implement the priority queue, while a dictionary maps each vertex ID to its current position in the heap. This allows efficient `decrease_key()` operations.

### Algorithm

1. Initialize `d(s, s) = 0` and `d(s, v) = infinity` for all other vertices.
2. Build a changeable priority queue `Q` containing `(v, d(s, v))` for every vertex.
3. While `Q` is not empty:
   - Remove the vertex `u` with the smallest distance estimate using `delete_min()`.
   - Finalize the shortest-path distance to `u`.
   - For each outgoing edge `(u, v)`, if `v` is still in `Q` and:

     `d(s, v) > d(s, u) + w(u, v)`

     then:
     - Relax `(u, v)` by updating `d(s, v)`.
     - Call `decrease_key(v, d(s, v))`.

### Correctness (Proof Idea)

When all edge weights are nonnegative, the unprocessed vertex with the smallest distance estimate cannot have a shorter path through other unprocessed vertices.

Therefore, the distance estimate of each vertex is correct when it is removed from the priority queue.

## Running Time

The general running time is:

$$
O(B + |V|M + |E|D)
$$

where:
- `B`: Time to build the priority queue.
- `M`: Time for one `delete_min()` operation.
- `D`: Time for one `decrease_key()` operation.

Using a **binary heap**:

| Operation | Time Complexity |
|---|---|
| `build()` | `O(V)` |
| `delete_min()` | `O(log V)` |
| `decrease_key()` | `O(log V)` |

Therefore:

$$
O(|V| + |V|\log|V| + |E|\log|V|)
$$

Which simplifies to:

$$
\boxed{O((|V|+|E|)\log|V|)}
$$

## Key Takeaways

- Dijkstra's algorithm uses a greedy strategy to compute shortest paths.
- Nonnegative edge weights guarantee that each selected vertex has its final shortest-path distance.
- A binary heap combined with a dictionary supports efficient minimum extraction and key updates.
- Unlike Bellman-Ford, Dijkstra's algorithm does not support negative edge weights in general.