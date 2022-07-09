# Learning Neo4j

[Neo4j Aura](https://console.neo4j.org) | [Sandbox](https://sandbox.neo4j.com/) | [Live editor](https://console.neo4j.org/)

Learning trail, training and reading notes, useful resources discovered while learning the Neo4j graph database.

### My reference sheets

* [Neo4j DBA ops](https://github.com/olange/refcards/blob/main/sheets/Neo4j-DBA-ops.md)
* [Sysadmin 101](https://github.com/olange/refcards/blob/main/sheets/Sysadmin-101.md)

### Essential documentation

* [Neo4j ‹Cypher› Manual](https://neo4j.com/docs/cypher-manual/current/syntax/) | [Refcard](https://neo4j.com/docs/cypher-refcard/current/) | [Cheat Sheet](https://neo4j.com/docs/cypher-cheat-sheet/current/)
* [Neo4j ‹Graph Data Science› Library Manual](https://neo4j.com/docs/graph-data-science/current/introduction/)
* [Neo4j Docs](https://neo4j.com/docs/) _all docs_

### Training & Certifications

* [Neo4j GraphAcademy](https://graphacademy.neo4j.com/courses/)  
  _self-paced online training, with videos, transcripts, quizzes and challenges; carefully redacted, consistent and enjoying_
* [Neo4j Certifications](https://graphacademy.neo4j.com/categories/certification/)

### Curated datasets

* [Neo4j Graph Gists](https://neo4j.com/graphgists/) _use case and industry specific graph examples_
* [Neo4j Graph Examples](https://github.com/neo4j-graph-examples)  
  * [Open Movies Graph](https://github.com/neo4j-graph-examples/recommendations) _movies recommendation_  (sources: [OMDB API](http://www.omdbapi.com), [MovieLens](https://grouplens.org/datasets/movielens/))  
  * [Network Management](https://github.com/neo4j-graph-examples/network-management) _dependency and root cause analysis_
  
---

Earlier notes (<2018)

### Workshops/training

* [Building a recommendation engine with Neo4j](training/neo4j-recommendation-engine-20170510(london).pdf) _GraphConnect Europe 2017, 10.05.2017_ ([personal notes](training/neo4j-recommendation-engine-20170510(personal-notes).pdf), [resources](training/reco/))
* [Neo4j Fundamentals](training/neo4j-fundamentals-20170510(london).pdf) _GraphConnect Europe 2017, 10.05.2017_
* [Intro to Graph modelling](training/neo4j-graph-modeling-20170510(london).pdf) _GraphConnect Europe 2017, 10.05.2017_
* [An operational intro to Neo4j](training/neo4j-production-20170510(london).pdf) _GraphConnect Europe 2017, 10.05.2017_
* [Advanced Cypher](training/neo4j-advanced-cypher-20170510(london).pdf) _GraphConnect Europe 2017, 10.05.2017_

### Books

* [Graph Algorithms — Practical Examples in Apache Spark and Neo4j](https://neo4j.com/graph-algorithms-book/) by Mark Needham & Amy E. Hodler (O'Reilly Media)
* [Learning Neo4j](http://neo4j.com/book-learning-neo4j/) by Rik Van Bruggen (Packt publishing)
* [Graph Databases 2nd Edition](http://neo4j.com/books/graph-databases/) by Ian Robinson, Jim Webber, and Emil Eifrém (O'Reilly Media)

### Courses and Tutorials

* [Course «Getting started with Neo4j»](http://www.neo4j.org/learn/online_course)
* [Webinar «Neo4j Data Import»](https://vimeo.com/90358900)
* [Webinar «Maintaining your Data Lineage in a Graph»](https://www.youtube.com/watch?v=3tWTCbrE5ls) by Lju Lazarevic / Neo4j (vidéo, 19 min.)
* [NeoCons Clojure client library](http://clojureneo4j.info/): [Getting started](http://clojureneo4j.info/articles/getting_started.html), [Populating the graph](http://clojureneo4j.info/articles/populating.html), [Traversing the graph](http://clojureneo4j.info/articles/traversing.html), [The Cypher Query language](http://clojureneo4j.info/articles/cypher.html)

### Channels

* Twitter: [@Neo4j](https://twitter.com/neo4j)

### Articles and videos

* [Importing data into Neo4j](http://www.neo4j.org/develop/import) _selection of resources provided by Neo4j_
* [Importing CSV files with Cypher](http://docs.neo4j.org/chunked/milestone/cypherdoc-importing-csv-files-with-cypher.html) _importing persons and movies they're related to_
* [Fraud Detection: Discovering Connections with Graph Databases](http://info.neotechnology.com/WPUseCaseFraud.html?casetype=Fraud)
* [Building the Neo4j Sandbox: AWS, ECS, Docker, Python, Neo4j and more](http://ptat.ch/neo4j-sandbox-tech-overview) Ryan Boyd, YouTube, 30.03.2017 (live video, 1h) [My reading notes](notes/neo4j-sandbox-20170330-reading-notes.pdf) « _The design decisions made and how the architecture was achieved using Docker, EC2 Container Service, Auth0, EC2, Elastic Load Balancers, EC2 AutoScaling Group, AWS Lambda functions, Python, S3, IAM, CloudWatch, SES, FullContact, MaxMind and more_ »

### Some basic facts

* ACID
* Native graph database
* Can be embedded
* Java based
* CYPER Query language (+ many others, such as Gremlin)
* has a good Clojure wrapper
* has a good Node.js module
