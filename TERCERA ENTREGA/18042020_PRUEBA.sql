select pel.nombre_pelicula as nominada, per.nombre_nacimiento as director, pel.puntaje as imdb_rating
from nominado nom, pelicula pel, persona per
where (nom.categoria = 1) and (nom.pelicula = pel.codigo_pelicula) and (nom.persona = per.codigo_persona);

commit;