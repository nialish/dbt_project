{% macro convert_date_to_id_from_dim_date(date_column) %}
    (
        SELECT Id 
        FROM mart.DimDate dd 
        WHERE strftime('%Y-%m-%d', dd.Date) = strftime('%Y-%m-%d', {{ date_column }} )
    )
{% endmacro %}