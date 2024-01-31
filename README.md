# pgvector_set

Sample set distance metrics for Postgres pgvector. Provides:

+ Jaccard/Tanimoto distance for boolean vectors.

## Installation

```shell
git clone https://github.com/CliffordWilmot/pgvector_set
cd pgvector_set
make CC=cc && make install
```

## Usage

### Setup

In order to use the functionality provided by this extension first install and enable the pgvector extension.

```tsql
CREATE EXTENSION vector;
```

Enable the extension (do this once in each database where you want to use it).

```tsql
CREATE EXTENSION vector_chem;
```

### Querying

We define the operator `<^>` for computing the Jaccard distance between two vectors of boolean values represented with 0.0 and 1.0.

```tsql
SELECT '[1., 0., 1.]' <^> '[1., 0., 1.]';
-- ?column?
-- ----------
--       0
-- (1 row)
```

The function `jaccard_distance` is also defined and computes the same result as the `<^>` operator.

```tsql
SELECT jaccard_distance('[1., 0., 1.]', '[1., 0., 0.]');
--  jaccard_distance
-- -------------------
--                0.5
-- (1 row)
```

## FAQ

### Is the provided Jaccard/Tanimoto distance usable for continuous values?

Not at this time.

### Is approximate nearest neighbor search supported?

Not at this time.

