USE sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT DISTINCT title
FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT *
FROM film;

SELECT title, rating
FROM film
WHERE rating = 'PG-13';

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT *
FROM film;

SELECT title, description
FROM film
WHERE description LIKE '%amazing%';

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT*
FROM film;

SELECT title, length
FROM film
WHERE length >= 120;
-- 5. Encuentra los nombres de todos los actores, muestralos en una sola columna que se llame nombre_actor y contenga nombre y apellido.

SELECT*
FROM actor;

SELECT CONCAT(first_name,' ', last_name) AS nombre_actor
FROM actor;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT CONCAT(first_name,' ', last_name) AS nombre_actor
FROM actor
WHERE last_name LIKE '%Gibson%';

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT first_name, actor_id
FROM actor
WHERE actor_id BETWEEN 10 AND 20
ORDER BY actor_id DESC; 

    -- UNION ALL entre 6 y 7 -- Para unir mismo numero de columnas con condiciones distintas en la misma tabla
SELECT CONCAT(a.first_name, ' ', a.last_name) AS nombre_actor, actor_id
FROM actor a
WHERE last_name LIKE '%Gibson%'
UNION ALL
SELECT CONCAT(a2.first_name, ' ', a2.last_name) AS nombre_actor, a2.actor_id
FROM actor a2
WHERE a2.actor_id BETWEEN 10 AND 20
ORDER BY nombre_actor DESC;
    
-- 8. Encuentra el título de las películas en la tabla film que no tengan clasificacion "R" ni "PG-13".
SELECT*
FROM film;

SELECT title, rating
FROM film
WHERE rating != 'R' AND rating != 'PG-13';

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.

SELECT*
FROM film;

SELECT COUNT(film_id) total_peliculas, rating
FROM film
GROUP BY rating;

/* 10.Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido 
junto con la cantidad de películas alquiladas.*/

SELECT*
FROM rental;

SELECT*
FROM customer;

SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS nombre_cliente, COUNT(r.rental_id) AS total_alquileres
FROM rental r
JOIN customer c ON c.customer_id = r.customer_id
GROUP BY c.customer_id, nombre_cliente;


 /*11.Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto 
 con el recuento de alquileres.*/

SELECT *
FROM rental;
SELECT * 
FROM category;

SELECT c.name AS nombre_categoria, COUNT(r.rental_id) AS total_alquileres
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name;


/*12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y 
-- muestra la clasificación junto con el promedio de duración.*/

SELECT *
FROM film;

SELECT AVG(length) promedio_duracion, rating
FROM film
GROUP BY rating;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

SELECT*
FROM actor;
SELECT *
FROM film_actor;

SELECT a.first_name, a.last_name, f.title
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
WHERE f.title = 'Indian Love';

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.

SELECT title, description
FROM film
WHERE description LIKE '%dog%' OR '%cat%';



-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.

SELECT *
FROM actor;
SELECT *
FROM film_actor;

SELECT a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;


SELECT COUNT(last_name) AS total_actores FROM actor; -- Miro si el total en las dos columnas coinciden para ver si esta correcto.

SELECT COUNT(DISTINCT actor_id) AS actores_con_peliculas -- Cuento los id de la tabla film
FROM film_actor;


-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

SELECT *
FROM film;

SELECT title
FROM film
WHERE release_year BETWEEN 2005 AND 2010; 


/* 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
Opcional: Excluir la película "Family" si existe una con ese título exacto*/

 SELECT*
 FROM film;
 SELECT *
 FROM film_catagory;
 
SELECT DISTINCT f.title, c.name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Family'
AND f.title != 'Family'; 
  
-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
SELECT*
FROM actor;
SELECT *
FROM film_actor;

SELECT CONCAT(a.first_name,' ', a.last_name) nombre_actor, COUNT(fa.film_id) total_peliculas
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
GROUP BY a.actor_id, nombre_actor
HAVING COUNT(fa.film_id) > 10;


-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.

SELECT f.title, f.rating, f.length
FROM film 
WHERE rating = 'R' AND length > 120;

/*20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 
-- minutos y muestra el nombre de la categoría junto con el promedio de duración.*/

SELECT *
FROM film;
SELECT*
FROm film_category;

SELECT AVG(f.length) AS promedio_duracion, c.name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name HAVING promedio_duracion > 120;


/*21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor 
junto con la cantidad de películas en las que han actuado.*/

SELECT CONCAT(a.first_name,' ',a.last_name) nombre_actor, COUNT(fa.film_id) total_peliculas_actor
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
GROUP BY a.actor_id, nombre_actor HAVING total_peliculas_actor >= 5
ORDER BY total_peliculas_actor ASC;

/*22. Encuentra el título de todas las películas que fueron alquiladas durante más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración
 superior a 5 días y luego selecciona las películas correspondientes. Pista: Usamos DATEDIFF para calcular la diferencia entre una fecha y otra,
 ej: DATEDIFF(fecha_inicial, fecha_final)*/


SELECT *
FROM rental;
SELECT *
FROM inventory;
SELECT *
FROM rental;
    
SELECT DISTINCT(f.title)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IN (
    SELECT rental_id
    FROM rental 
    WHERE DATEDIFF(return_date, rental_date) > 5
);


/*23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la 
categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en 
películas de la categoría "Horror" y luego exclúyelos de la lista de actores.*/

SELECT *
FROM film_actor;
SELECT *
FROM film_category;
SELECT *
FROM category;
SELECT *
FROM actor;


SELECT CONCAT(a.first_name, ' ', a.last_name) AS nombre_actor
FROM actor a
WHERE a.actor_id NOT IN (
    SELECT fa.actor_id 
    FROM film_actor fa
    JOIN film_category fc ON fa.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Horror'
);

SELECT DISTINCT CONCAT(a.first_name, ' ', a.last_name) AS nombre_actor, c.name AS categoria  -- Opcion mostrando la categoria
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE a.actor_id NOT IN (
    SELECT fa2.actor_id
    FROM film_actor fa2
    JOIN film_category fc2 ON fa2.film_id = fc2.film_id
    JOIN category c2 ON fc2.category_id = c2.category_id
    WHERE c2.name = 'Horror'
);

/*24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 
minutos en la tabla film con subconsultas.*/

SELECT*
FROM film;
SELECT*
FRoM film_category;
SELECT*
FROM category;

WITH peliculas_comedia AS (
    SELECT
        fc.film_id
    FROM film_category fc
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Comedy'
)
SELECT
    f.title
FROM film f
JOIN peliculas_comedia pc ON f.film_id = pc.film_id
WHERE f.length > 180;

/* 25.  BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. La 
consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que 
han actuado juntos. Pista: Podemos hacer un JOIN de una tabla consigo misma, poniendole un alias diferente*/
SELECT*
FROM film_actor;
SELECT*
FROM actor;

SELECT 
  CONCAT(a1.first_name,' ',a1.last_name) AS nombre_actor1,
  CONCAT(a2.first_name,' ',a2.last_name) AS nombre_actor2,
  COUNT(*) AS peliculas_juntos
FROM film_actor fa1
JOIN film_actor fa2 
  ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
JOIN actor a1 ON fa1.actor_id = a1.actor_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id
GROUP BY fa1.actor_id, fa2.actor_id
HAVING peliculas_juntos >= 1
ORDER BY peliculas_juntos DESC;






