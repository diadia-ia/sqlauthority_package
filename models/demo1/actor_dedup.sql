SELECT *
FROM (
  {{ dbt_utils.deduplicate(
    relation=ref('actor_base'),
    partition_by='first_name',
    order_by='actor_id desc'
  ) }}
) AS deduped
