# Graph Academy › Neo4j Graph Data Science Fundamentals

## 1. Graph Algorithms › 3. Challenge: Degree Centrality

[source](https://graphacademy.neo4j.com/courses/graph-data-science-fundamentals/1-graph-algorithms/3-c-centrality-and-importance/), [related docs](https://neo4j.com/docs/graph-data-science/current/algorithms/degree-centrality/)

### Challenge

> **Which actor has directed the most movies?**
>
> Use the Neo4j Browser window to the right of the screen to run GDS calls and enter the answer in the box below.
> 
> ✓ `Woody Allen`

### My take

```cypher
CALL gds.graph.drop( 'actorDirectedMovie', false);
CALL gds.graph.project(
  'actorDirectedMovie',
  ['Actor', 'Movie'],
  'DIRECTED'
);

CALL gds.degree.stream( 'actorDirectedMovie')
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).name AS name, score AS directedCount
ORDER BY directedCount DESC, name DESC LIMIT 5;
```

```ascii
╒═══════════════════╤═══════════════╕
│"name"             │"directedCount"│
╞═══════════════════╪═══════════════╡
│"Woody Allen"      │42.0           │
├───────────────────┼───────────────┤
│"Steven Spielberg" │30.0           │
├───────────────────┼───────────────┤
│"Martin Scorsese"  │30.0           │
├───────────────────┼───────────────┤
│"Clint Eastwood"   │30.0           │
├───────────────────┼───────────────┤
│"Steven Soderbergh"│25.0           │
└───────────────────┴───────────────┘
```