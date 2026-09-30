
  create view `sakila`.`actor_base__dbt_tmp`
    
    
  as (
    SELECT * 
FROM sakila.actor
WHERE first_name LIKE 'A%'
  );