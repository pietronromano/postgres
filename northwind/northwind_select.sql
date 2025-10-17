SET search_path TO northwind;

-- Orders shipping to USA or France (SEE _index.sql to see effect of adding index)
EXPLAIN SELECT * FROM orders
WHERE ship_country = 'USA' OR ship_country = 'France'
ORDER BY ship_country;
