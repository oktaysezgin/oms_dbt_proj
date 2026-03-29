{% snapshot customers_history %}
    {{
        config(
            target_schema = 'L3_CONSUMPTION'
            , unique_key = "CustomerId"
            , strategy = 'timestamp'
            , updated_at = "updated_at"
            , invalidate_hard_deletes = true
        )
    }}

    SELECT * FROM {{ source('landing', 'customers') }}
{% endsnapshot %}