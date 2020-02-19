--
-- MULTI_MX_TPCH_QUERY19
--


-- connect to the coordinator
\c - - :real_master_host :master_port

-- Query #19 from the TPC-H decision support benchmark. Note that we modified
-- the query from its original to make it work on smaller data sets.

SELECT
	sum(l_extendedprice* (1 - l_discount)) as revenue
FROM
	lineitem_mx,
	part_mx
WHERE
	(
		p_partkey = l_partkey
		AND (p_brand = 'Brand#12' OR p_brand= 'Brand#14' OR p_brand='Brand#15')
		AND l_quantity >= 10
		AND l_shipmode in ('AIR', 'AIR REG', 'TRUCK')
		AND l_shipinstruct = 'DELIVER IN PERSON'
	)
	OR
	(
		p_partkey = l_partkey
		AND (p_brand = 'Brand#23' OR p_brand='Brand#24')
		AND l_quantity >= 20
		AND l_shipmode in ('AIR', 'AIR REG', 'TRUCK')
		AND l_shipinstruct = 'DELIVER IN PERSON'
	)
	OR
	(
		p_partkey = l_partkey
		AND (p_brand = 'Brand#33' OR p_brand = 'Brand#34' OR p_brand = 'Brand#35')
		AND l_quantity >= 1
		AND l_shipmode in ('AIR', 'AIR REG', 'TRUCK')
		AND l_shipinstruct = 'DELIVER IN PERSON'
	);

-- connect one of the workers
\c - - :real_worker_1_host :worker_1_port

-- Query #19 from the TPC-H decision support benchmark. Note that we modified
-- the query from its original to make it work on smaller data sets.

SELECT
	sum(l_extendedprice* (1 - l_discount)) as revenue
FROM
	lineitem_mx,
	part_mx
WHERE
	(
		p_partkey = l_partkey
		AND (p_brand = 'Brand#12' OR p_brand= 'Brand#14' OR p_brand='Brand#15')
		AND l_quantity >= 10
		AND l_shipmode in ('AIR', 'AIR REG', 'TRUCK')
		AND l_shipinstruct = 'DELIVER IN PERSON'
	)
	OR
	(
		p_partkey = l_partkey
		AND (p_brand = 'Brand#23' OR p_brand='Brand#24')
		AND l_quantity >= 20
		AND l_shipmode in ('AIR', 'AIR REG', 'TRUCK')
		AND l_shipinstruct = 'DELIVER IN PERSON'
	)
	OR
	(
		p_partkey = l_partkey
		AND (p_brand = 'Brand#33' OR p_brand = 'Brand#34' OR p_brand = 'Brand#35')
		AND l_quantity >= 1
		AND l_shipmode in ('AIR', 'AIR REG', 'TRUCK')
		AND l_shipinstruct = 'DELIVER IN PERSON'
	);

-- connect to the other node
\c - - :real_worker_2_host :worker_2_port

-- Query #19 from the TPC-H decision support benchmark. Note that we modified
-- the query from its original to make it work on smaller data sets.

SELECT
	sum(l_extendedprice* (1 - l_discount)) as revenue
FROM
	lineitem_mx,
	part_mx
WHERE
	(
		p_partkey = l_partkey
		AND (p_brand = 'Brand#12' OR p_brand= 'Brand#14' OR p_brand='Brand#15')
		AND l_quantity >= 10
		AND l_shipmode in ('AIR', 'AIR REG', 'TRUCK')
		AND l_shipinstruct = 'DELIVER IN PERSON'
	)
	OR
	(
		p_partkey = l_partkey
		AND (p_brand = 'Brand#23' OR p_brand='Brand#24')
		AND l_quantity >= 20
		AND l_shipmode in ('AIR', 'AIR REG', 'TRUCK')
		AND l_shipinstruct = 'DELIVER IN PERSON'
	)
	OR
	(
		p_partkey = l_partkey
		AND (p_brand = 'Brand#33' OR p_brand = 'Brand#34' OR p_brand = 'Brand#35')
		AND l_quantity >= 1
		AND l_shipmode in ('AIR', 'AIR REG', 'TRUCK')
		AND l_shipinstruct = 'DELIVER IN PERSON'
	);
