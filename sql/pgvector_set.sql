-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pgvector_set" to load this file. \quit

-- functions

CREATE FUNCTION jaccard_distance(vector, vector) RETURNS float8
	AS 'MODULE_PATHNAME' LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

-- operators

CREATE OPERATOR <^> (
	LEFTARG = vector, RIGHTARG = vector, PROCEDURE = jaccard_distance,
	COMMUTATOR = '<^>'
);

-- opclasses

CREATE OPERATOR CLASS vector_jaccard_ops
	FOR TYPE vector USING hnsw AS
	OPERATOR 1 <^> (vector, vector) FOR ORDER BY float_ops,
	FUNCTION 1 jaccard_distance(vector, vector);
