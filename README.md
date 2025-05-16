# Mi Evaluación de MySQL - Explorando los Datos de Sakila 🎬

En esta evaluación, he trabajado con la base de datos Sakila para demostrar mi comprensión de los conceptos fundamentales de MySQL. El objetivo principal ha sido extraer y analizar información relevante sobre películas 🎞️, actores 🎭, clientes 👤 y alquileres 📦.

**Conceptos Clave Aplicados ✨:**

* **Consultas Básicas (`SELECT`):** He utilizado la instrucción `SELECT` para recuperar información específica de diversas tablas como `film`, `actor`, `customer` y `rental`. Esto incluyó la selección de columnas individuales y la creación de columnas calculadas (ej. `nombre_actor`).
* **Filtrado (`WHERE`):** He empleado la cláusula `WHERE` para refinar mis consultas y seleccionar solo las filas que cumplen con criterios específicos. Esto me permitió, por ejemplo, encontrar películas con una cierta clasificación o actores con un apellido particular.
* **Agrupación y Funciones de Agregado (`GROUP BY`, `COUNT`, `AVG`):** He utilizado `GROUP BY` para agrupar filas con valores similares y funciones de agregado como `COUNT()` y `AVG()` para realizar análisis como contar el número de películas por clasificación o calcular la duración promedio por categoría.
* **Combinación de Tablas (`JOIN`):** Para relacionar información que reside en múltiples tablas, he utilizado diferentes tipos de `JOIN` (principalmente `INNER JOIN` y `LEFT JOIN`). Esto fue crucial para responder preguntas que requerían información de tablas como `customer` y `rental` o `actor` y `film`.
* **Combinación de Resultados (`UNION`, `UNION ALL`):** He explorado cómo combinar los resultados de múltiples consultas `SELECT` en un único conjunto de resultados utilizando `UNION ALL`. Esto me permitió, por ejemplo, crear una lista combinada de actores basada en diferentes criterios.
* **Subconsultas 🔍:** He utilizado subconsultas (consultas dentro de otras consultas) para resolver problemas donde necesitaba un conjunto de resultados intermedio para filtrar o seleccionar datos en la consulta principal. Un ejemplo fue encontrar películas alquiladas por más de un cierto número de días.
* **Expresiones de Tabla Comunes (`CTE`s) 🧱:** Para mejorar la legibilidad y organización de consultas más complejas, he comenzado a utilizar CTEs. Estos me permitieron definir conjuntos de resultados temporales con nombre dentro de la consulta, facilitando la comprensión de la lógica paso a paso (ej. al calcular el total de alquileres por categoría).

**Enfoque General 🎯:**

Mi enfoque en esta evaluación se centró en aplicar estos conceptos de MySQL para responder a preguntas específicas sobre los datos de la base de datos Sakila. He buscado construir consultas que fueran no solo correctas sino también claras y, en los casos aplicables, eficientes.

**Próximos Pasos 🚀:**

Sigo en proceso de aprendizaje y mi objetivo es ,además de seguir practicando, profundizar mi conocimiento en áreas como subconsultas correlacionadas y optimización de consultas para escenarios más complejos.
