# Graph Academy › Neo4j Graph Data Science Fundamentals

## Graph Algorithms › Centrality and Importance

[source](https://graphacademy.neo4j.com/courses/graph-data-science-fundamentals/1-graph-algorithms/2-centrality-and-importance/), [related docs](https://neo4j.com/docs/graph-data-science/current/algorithms/centrality/)

Below is an example of applying **PageRank** to find the most influential persons in the `Director` → `Actor` network from movies released on or after 1990 with a revenue of at least 10 Million dollars.

### Create `(Person)-[:DIRECTED_ACTOR]→(Person)` graph projection

First, create the graph projection. We can use a Cypher projection in this case to obtain a graph where we have `(Person)-[:DIRECTED_ACTOR]→(Person)`. This graph can be traversed to understand the influence across directors and actors.

```cypher
CALL gds.graph.drop( 'personDirectedPersonInRecentHighGrossingMovies', false);

CALL gds.graph.project.cypher(
  'personDirectedPersonInRecentHighGrossingMovies',
  'MATCH (a:Person) RETURN id(a) AS id, labels(a) AS labels',
  'MATCH (a1:Person)-[:DIRECTED]->(m:Movie)<-[:ACTED_IN]-(a2)
   WHERE m.year >= 1990 AND m.revenue >= 10000000
   RETURN id(a1) AS source , id(a2) AS target, count(*) AS actedWithCount,
    "DIRECTED_ACTOR" AS type'
);
```

```ascii
╒══════════════════════════════════════════════════════════╤══════════════════════════════════════════════════════════════════════╤════════════════════════════════════════════════╤═══════════╤═══════════════════╤═══════════════╕
│"nodeQuery"                                               │"relationshipQuery"                                                   │"graphName"                                     │"nodeCount"│"relationshipCount"│"projectMillis"│
╞══════════════════════════════════════════════════════════╪══════════════════════════════════════════════════════════════════════╪════════════════════════════════════════════════╪═══════════╪═══════════════════╪═══════════════╡
│"MATCH (a:Person) RETURN id(a) AS id, labels(a) AS labels"│"MATCH (a1:Person)-[:DIRECTED]->(m:Movie)<-[:ACTED_IN]-(a2)\n   WHERE │"personDirectedPersonInRecentHighGrossingMovies"│19047      │11751              │58             │
│                                                          │m.year >= 1990 AND m.revenue >= 10000000
   RETURN id(a1) AS source , │                                                │           │                   │               │
│                                                          │id(a2) AS target, count(*) AS actedWithCount,
    "DIRECTED_ACTOR" AS │                                                │           │                   │               │
│                                                          │type"                                                                 │                                                │           │                   │               │
└──────────────────────────────────────────────────────────┴──────────────────────────────────────────────────────────────────────┴────────────────────────────────────────────────┴───────────┴───────────────────┴───────────────┘
```

### Run the PageRank algorithm

Next stream **PageRank** to find the top 5 most influential people in director-actor network.

```cypher
CALL gds.pageRank.stream( 'personDirectedPersonInRecentHighGrossingMovies')
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).name AS personName, score AS influence
ORDER BY influence DESCENDING, personName LIMIT 5;
```

```ascii
╒════════════════╤══════════════════╕
│"personName"    │"influence"       │
╞════════════════╪══════════════════╡
│"Robert De Niro"│0.6358739386030579│
├────────────────┼──────────────────┤
│"Greg Kinnear"  │0.6100648813587659│
├────────────────┼──────────────────┤
│"Sandra Bullock"│0.6091624705383082│
├────────────────┼──────────────────┤
│"Alec Baldwin"  │0.5716254867353056│
├────────────────┼──────────────────┤
│"Bruce Willis"  │0.5366320764428817│
└────────────────┴──────────────────┘
```