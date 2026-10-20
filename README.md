# AI and Knowledge Engineering Assignments

[![CI](https://github.com/AbdelrahmanGamal1998/ai-knowledge-engineering-assignments/actions/workflows/ci.yml/badge.svg)](https://github.com/AbdelrahmanGamal1998/ai-knowledge-engineering-assignments/actions/workflows/ci.yml)

Assignments from my Artificial Intelligence and Knowledge Engineering courses (2021): logic programming in
**Prolog**, rule-based programs in **CLIPS**, and semantic web work with **OWL ontologies** and **Apache Jena**.
GitHub Actions loads and runs every program on each push.

## Prolog (`prolog/`)

| File                                                                | Problem                                                                                                                                      |
| ------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| [`path_to_safety.pl`](prolog/path_to_safety.pl)                     | Path to Safety game. On a 4x4 board, go from the start to the finish without stepping on a bomb, collecting stars. `play/3` returns the moves and the number of stars. |
| [`resource_allocation_graph.pl`](prolog/resource_allocation_graph.pl) | Deadlock detection on a resource allocation graph. From the processes, their allocated and requested resources, `completed/1` returns an order in which every process can finish. |
| [`missionaries_cannibals.pl`](prolog/missionaries_cannibals.pl)     | Three missionaries and three cannibals cross a river with a boat without the cannibals ever outnumbering the missionaries. `game/2` searches for the crossing steps. |

```bash
swipl prolog/path_to_safety.pl
?- play(s(1,0,0,_), Path, Stars).
```

## CLIPS (`clips/`)

| File                                           | Topic                                                                       |
| ---------------------------------------------- | --------------------------------------------------------------------------- |
| [`patient_records.clp`](clips/patient_records.clp) | Templates and facts: a rule prints each patient's name, age, weight and height |
| [`family_relations.clp`](clips/family_relations.clp) | Rules that derive parents, grandfathers and grandmothers from facts like "Ahmed is the father of Mohammed" |
| [`factorial.clp`](clips/factorial.clp)         | A function that computes a factorial for a number you type                  |

```bash
clips
CLIPS> (load "clips/family_relations.clp")
CLIPS> (reset)
CLIPS> (run)
```

## Semantic web (OWL and Apache Jena)

| What                                                                              | Topic                                                                                         |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| [`ontologies/lab5-protege-ontology.owl`](ontologies/lab5-protege-ontology.owl)   | An ontology built in Protege (lab 5)                                                          |
| [`Lab7SubjectNames`](src/main/java/semanticweb/Lab7SubjectNames.java)            | Reads an ontology with Jena and lists every subject that has a name (lab 7)                   |
| [`MedicationOverlaps`](src/main/java/semanticweb/MedicationOverlaps.java)        | Reads a patient and medication ontology with Jena and reports medicines whose dates overlap (assignment 2) |

You need JDK 17 or newer and Maven.

```bash
mvn test                                  # runs both programs and checks their output
mvn -q org.codehaus.mojo:exec-maven-plugin:3.5.0:java -Dexec.mainClass=semanticweb.MedicationOverlaps
```

## Notes

- These are course assignments and keep their original style. The files were renamed (they carried student ID
  numbers in their names) and the Jena programs now load their ontology from the classpath instead of the
  working directory.
- The original repositories also held the instructors' assignment descriptions and a third-party headache
  diagnosis expert system. They are not included here.

## License

[MIT](LICENSE)
