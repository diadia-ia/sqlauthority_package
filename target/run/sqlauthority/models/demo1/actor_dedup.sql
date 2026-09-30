
  create view `sakila`.`actor_dedup__dbt_tmp`
    
    
  as (
    SELECT *
FROM (
  with row_numbered as (
        select
            _inner.*,
            row_number() over (
                partition by first_name
                order by actor_id desc
            ) as rn
        from `sakila`.`actor_base` as _inner
    )

    select
        distinct data.*
    from `sakila`.`actor_base` as data
    
    natural join row_numbered
    where row_numbered.rn = 1
) AS deduped
  );