# Graph Academy › Introduction to Neo4j Graph Data Science

## Graph Management › Challenge: Native Projection

[source](https://graphacademy.neo4j.com/courses/gds-product-introduction/2-graph-management/3-c-native-projection/), [related docs](https://neo4j.com/docs/graph-data-science/current/graph-project/#_relationship_orientation)

### Challenge

> **Create a native graph projection**
> 
> Create a native graph projection representing `Users` rating `Movies` and ensure the `RATED` relationship is undirected.

> What is the relationship count of the native projection?  
> ✓ `200008`

### My take

```cypher
CALL gds.graph.drop( 'userRatedMovies');

CALL gds.graph.project(
  'userRatedMovies',
  ['User', 'Movie'],
  { RATED: { orientation: 'UNDIRECTED' } }
);
```

```ascii
╒══════════════════════════════════════════════════════════════════════╤══════════════════════════════════════════════════════════════════════╤═════════════════╤═══════════╤═══════════════════╤═══════════════╕
│"nodeProjection"                                                      │"relationshipProjection"                                              │"graphName"      │"nodeCount"│"relationshipCount"│"projectMillis"│
╞══════════════════════════════════════════════════════════════════════╪══════════════════════════════════════════════════════════════════════╪═════════════════╪═══════════╪═══════════════════╪═══════════════╡
│{"Movie":{"label":"Movie","properties":{}},"User":{"label":"User","pro│{"RATED":{"orientation":"UNDIRECTED","aggregation":"DEFAULT","type":"R│"userRatedMovies"│9796       │200008             │13             │
│perties":{}}}                                                         │ATED","properties":{}}}                                               │                 │           │                   │               │
└──────────────────────────────────────────────────────────────────────┴──────────────────────────────────────────────────────────────────────┴─────────────────┴───────────┴───────────────────┴───────────────┘
```

### Solution

You can run the following Cypher statement to create the graph projection.

The statement returns a single value from the procedure call, `relationshipCount`, which can be copied and pasted into the textbox above.

```cypher
CALL gds.graph.project(
  // Name of the projection
  'user-rated-movie',
  // Labels of nodes to include in the projection
  ['User', 'Movie'],
  // Relationship types to include in the projection
  {
    RATED: {
        type: 'RATED',
        orientation: 'UNDIRECTED'
    }
  }
)
YIELD relationshipCount;
```

```ascii
╒═══════════════════╕
│"relationshipCount"│
╞═══════════════════╡
│200008             │
└───────────────────┘
```
