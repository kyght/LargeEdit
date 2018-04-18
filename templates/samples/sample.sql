select
   s.name,
   s.type,
   d.value
from
   sample s, data d
where
   s.id = d.id
order by
   s.name