{% test not_blank_string(model, column_name) %}
    select *
    from {{ model }}
    where trim({{ column_name }}) = ''
{% endtest %}
