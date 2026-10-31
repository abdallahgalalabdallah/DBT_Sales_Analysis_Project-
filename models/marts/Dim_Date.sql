{% set date_parts = ['year', 'quarter', 'month', 'day'] %}

with date_spine as (
    select 
        cast(dateadd(day, row_number() over (order by (select null)) - 1, '2000-01-01') as date) as full_date
    from master..spt_values
),

filtered_dates as (
    select full_date
    from date_spine
    where full_date <= '2030-12-31'
)

select
    cast(format(full_date, 'yyyyMMdd') as int) as date_key,
    full_date,
    {% for part in date_parts %}
    datepart({{ part }}, full_date) as {{ part }},
    {% endfor %}
    datename(month, full_date) as month_name,
    datename(weekday, full_date) as day_name
from filtered_dates