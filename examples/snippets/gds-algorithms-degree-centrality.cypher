// Neo4j Graph Data Science Library › Degree Centrality examples
// Source: https://neo4j.com/docs/graph-data-science/current/algorithms/degree-centrality/

// Projects a graph using a reverse projection
CALL gds.graph.drop( 'userFollowedByUser', false);
CALL gds.graph.project(
  'userFollowedByUser',
  'User',
  {
    FOLLOWED_BY: {
      type: 'FOLLOWS',
      orientation: 'REVERSE',
      properties: [ 'score' ]
    }
  }
);

//
// 4. Degree Centrality examples
//

// 4.1 Memory Estimation
CALL gds.degree.write.estimate( 'userFollowedByUser', { writeProperty: 'degree' })
YIELD nodeCount, relationshipCount, bytesMin, bytesMax, requiredMemory;

// 4.2 Stream mode
CALL gds.degree.stream( 'userFollowedByUser')
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).name AS name, score AS followers
ORDER BY followers DESC, name DESC;

// 4.3 Stats mode
CALL gds.degree.stats( 'userFollowedByUser')
YIELD centralityDistribution
RETURN centralityDistribution.min AS minimumScore, centralityDistribution.mean AS meanScore;

// 4.4 Mutate mode
CALL gds.degree.mutate( 'userFollowedByUser', { mutateProperty: 'degree' })
YIELD centralityDistribution, nodePropertiesWritten
RETURN centralityDistribution.min AS minimumScore, centralityDistribution.mean AS meanScore, nodePropertiesWritten;

// 4.5 Write mode
CALL gds.degree.write( 'userFollowedByUser', { writeProperty: 'degree' })
YIELD centralityDistribution, nodePropertiesWritten
RETURN centralityDistribution.min AS minimumScore, centralityDistribution.mean AS meanScore, nodePropertiesWritten;

// 5. Weighted Degree Centrality example
//
// Variant of the Degree Centrality algorithm, that measures the sum
// of *positive* weights of incoming and outgoing relationships.
//
// Show which users have the highest weighted degree centrality
CALL gds.degree.stream(
   'userFollowedByUser',
   { relationshipWeightProperty: 'score' }
)
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).name AS name, score AS weightedFollowers
ORDER BY weightedFollowers DESC, name DESC;