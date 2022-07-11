# Graph Academy › Introduction to Neo4j Graph Data Science

## Graph Management › Challenge: Cypher Projection

[source](https://graphacademy.neo4j.com/courses/gds-product-introduction/2-graph-management/5-c-cypher-projection/), [related docs](https://neo4j.com/docs/graph-data-science/current/graph-project-cypher/#_multi_graph)

### Challenge

> **Create a Cypher Projection**
>
> Create a cypher projection representing all `User` nodes that have rated a `Movie` with a release year greater than 2014.  
>
> Only include `RATED` relationships with ratings greater than or equal to 4 stars.

> What is the relationship count of the projection?  
> ✓ `282`

### My take

```cypher
CALL gds.graph.drop( 'recentMoviesWithGoodUserRatings', false);

CALL gds.graph.project.cypher(
  'recentMoviesWithGoodUserRatings',
  'MATCH (n) WHERE n:User OR n:Movie RETURN id(n) AS id, labels(n) AS labels',
  'MATCH (u:User)-[r:RATED]->(m:Movie) WHERE r.rating >= 4.0 AND m.year > 2014 RETURN id(u) AS source, id(m) AS target, "RATED" AS type, r.rating AS rating'
);
```

```ascii
╒══════════════════════════════════════════════════════════════════════╤══════════════════════════════════════════════════════════════════════╤═════════════════════════════════╤═══════════╤═══════════════════╤═══════════════╕
│"nodeQuery"                                                           │"relationshipQuery"                                                   │"graphName"                      │"nodeCount"│"relationshipCount"│"projectMillis"│
╞══════════════════════════════════════════════════════════════════════╪══════════════════════════════════════════════════════════════════════╪═════════════════════════════════╪═══════════╪═══════════════════╪═══════════════╡
│"MATCH (n) WHERE n:User OR n:Movie RETURN id(n) AS id, labels(n) AS la│"MATCH (u:User)-[r:RATED]->(m:Movie) WHERE r.rating >= 4.0 AND m.year │"recentMoviesWithGoodUserRatings"│9796       │282                │36             │
│bels"                                                                 │> 2014 RETURN id(u) AS source, id(m) AS target, "RATED" AS type, r.rat│                                 │           │                   │               │
│                                                                      │ing AS rating"                                                        │                                 │           │                   │               │
└──────────────────────────────────────────────────────────────────────┴──────────────────────────────────────────────────────────────────────┴─────────────────────────────────┴───────────┴───────────────────┴───────────────┘
```

### Solution

Here is the correct query to create the cypher projection:

```cypher
CALL gds.graph.project.cypher(
  // Projection name
  'movie-ratings-after-2014',
  // Cypher statement to find all nodes in projection
  '
    MATCH (u:User) RETURN id(u) AS id, labels(u) AS labels
    UNION MATCH (m:Movie) WHERE m.year > 2014 RETURN id(m) AS id, labels(m) AS labels
  ',
  // Cypher statement to find every User that rated a Movie
  // where the rating property is greater than or equal to 4
  // and the movie was released after 2014 (year > 2014)
  '
    MATCH (u:User)-[r:RATED]->(m:Movie)
    WHERE r.rating >= 4 AND m.year > 2014
    RETURN id(u) AS source,
        id(m) AS target,
        r.rating AS rating,
        "RATED" AS type
  '
);
```

```ascii
╒══════════════════════════════════════════════════════════════════════╤══════════════════════════════════════════════════════════════════════╤══════════════════════════╤═══════════╤═══════════════════╤═══════════════╕
│"nodeQuery"                                                           │"relationshipQuery"                                                   │"graphName"               │"nodeCount"│"relationshipCount"│"projectMillis"│
╞══════════════════════════════════════════════════════════════════════╪══════════════════════════════════════════════════════════════════════╪══════════════════════════╪═══════════╪═══════════════════╪═══════════════╡
│"MATCH (u:User) RETURN id(u) AS id, labels(u) AS labels\n    UNION MAT│"MATCH (u:User)-[r:RATED]->(m:Movie)\n    WHERE r.rating >= 4 AND m.ye│"movie-ratings-after-2014"│910        │282                │113            │
│CH (m:Movie) WHERE m.year > 2014 RETURN id(m) AS id, labels(m) AS labe│ar > 2014
    RETURN id(u) AS source,
        id(m) AS target,
       │                          │           │                   │               │
│ls"                                                                   │ r.rating AS rating,
        "RATED" AS type"                         │                          │           │                   │               │
└──────────────────────────────────────────────────────────────────────┴──────────────────────────────────────────────────────────────────────┴──────────────────────────┴───────────┴───────────────────┴───────────────┘
```