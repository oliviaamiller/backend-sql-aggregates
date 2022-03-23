-- rank of film category by times rented
-- include the name, count, and rank

SELECT
	category.name,
    COUNT(rental_id),
    RANK() OVER (ORDER BY COUNT(rental_id) DESC)
FROM
	rental
INNER JOIN
	inventory
ON
	inventory.inventory_id = rental.inventory_id
INNER JOIN
	film_category
ON
	film_category.film_id = inventory.film_id
INNER JOIN
	category
 ON
 	category.category_id = film_category.category_id
 GROUP BY
 	category.name
 LIMIT
 	16;
 