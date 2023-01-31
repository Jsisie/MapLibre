create table carpop as select ST_GeomFromText('Polygon(('||(j*200)::text||' '||(i*200)::text||','||(j*200)::text||' '||((i-1)*200)::text||','||((j+1)*200)::text||' '||((i-1)*200)::text||','||((j+1)*200)::text||' '||(i*200)::text||','||(j*200)::text||' '||(i*200)::text||'))',3035) as wkb_geometry, * from (select (regexp_replace(regexp_replace(cg.id, 'LAEA200M_N', ''),'E.*',''))::integer as i, (regexp_replace(regexp_replace(cg.id, 'LAEA200M_N', ''),'.*E',''))::integer as j, * from carreaux as cg) as tc;

create table car_data as select id, i, j, wkb_geometry, ind_c as pop,ind_srf*ind_c/ind_r as rev, (ind_r-ind_age6)*ind_c/ind_r as m25ans, ind_age7*ind_c/ind_r as p65ans, Men_basr*ind_c/ind_r as Men_basr, Men*ind_c/ind_r as Men , Men_coll*ind_c/ind_r as Men_coll, Men_prop*ind_c/ind_r as Men_prop from carpop as c, rect_m as r where c.idk=r.idk;

