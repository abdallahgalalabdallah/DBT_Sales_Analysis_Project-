{% macro calculate_net_sales(quantity,UnitPrice,Discount) %} 
    ( ( {{quantity}} * {{UnitPrice}} ) - ( ( {{quantity}} * {{UnitPrice}} ) * {{Discount}} ) )
{% endmacro %}