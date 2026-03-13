{% macro multiply(col1, col2, precision=18, scale=2) %}
    CAST(({{ col1 }} * {{ col2 }}) AS NUMERIC({{ precision }}, {{ scale }}))
{% endmacro %}