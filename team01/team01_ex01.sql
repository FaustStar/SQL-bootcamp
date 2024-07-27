insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

select
	distinct 
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname,'not defined') as lastname,
    c.name as currency_name,
	b.money * coalesce(
        (select cr1.rate_to_usd
         from currency cr1
         where cr1.id = b.currency_id
           and cr1.updated <= b.updated
         order by cr1.updated desc
         limit 1),
        (select cr2.rate_to_usd
         from currency cr2
         where cr2.id = b.currency_id
           and cr2.updated > b.updated
         order by cr2.updated
         limit 1)
    ) as currency_in_usd
from balance b
join currency c on b.currency_id = c.id
left join "user" u on b.user_id = u.id
order by 1 desc, 2, 3;

