{% set base_model = ref('actor_base') %}

SELECT 
  {{ dbt_utils.star(from=base_model, except=["last_update"]) }}
FROM {{ base_model }}
