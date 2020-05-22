create table pais(
    codigo_pais int not null,
    nombre_pais varchar(30),
    primary key (codigo_pais)
);

create table ciudad(
    codigo_ciudad int not null,
    nombre_ciudad varchar(30),
    codigo_pais int,
    primary key (codigo_ciudad),
    foreign key (codigo_pais) references pais
);

create table ocupacion(
    codigo_ocupacion int not null,
    nombre_ocupacion varchar(40),
    primary key (codigo_ocupacion)
);

create table causa_fallecimiento(
    codigo_causa int not null,
    descripcion varchar(40),
    primary key (codigo_causa)
);

create table educacion(
    codigo_educacion int not null,
    institucion varchar(30),
    primary key (codigo_educacion)
);

create table persona(
    codigo_persona int not null,
    nombre_nacimiento varchar(30),
    genero char,
    fecha_nacimiento date,
    lugar_nacimiento int,
    fecha_fallecimiento date,
    lugar_fallecimiento int,
    lugar_sepultura int,
    foto blob,
    primary key (codigo_persona),
    foreign key (lugar_nacimiento) references ciudad (codigo_ciudad),
    foreign key (lugar_fallecimiento) references ciudad (codigo_ciudad),
    foreign key (lugar_sepultura) references ciudad (codigo_ciudad)
);

create table nacionalidad(
    codigo_persona int,
    codigo_pais int,
    foreign key (codigo_persona) references persona,
    foreign key (codigo_pais) references pais
);

create table ocupacionxpersona(
    codigo_persona int,
    codigo_ocupacion int,
    foreign key (codigo_persona) references persona,
    foreign key (codigo_ocupacion) references ocupacion
);

create table causasxpersona(
    codigo_persona int,
    codigo_causa int,
    foreign key (codigo_persona) references persona,
    foreign key (codigo_causa) references causa_fallecimiento
);

create table educacionxpersona(
    codigo_persona int,
    codigo_educacion int,
    foreign key (codigo_persona) references persona,
    foreign key (codigo_educacion) references educacion
);

create table padrexhijo(
    codigo_padre int,
    codigo_hijo int,
    foreign key (codigo_padre) references persona (codigo_persona),
    foreign key (codigo_hijo) references persona (codigo_persona)
);

create table pareja(
    codigo_pareja int,
    persona_1 int,
    persona_2 int,
    inicio_relacion int,
    fin_relacion int,
    estado_relacion char,
    primary key (codigo_pareja),
    foreign key (persona_1) references persona (codigo_persona),
    foreign key (persona_2) references persona (codigo_persona)
);

create table pelicula(
    codigo_pelicula int,
    nombre_pelicula varchar(30),
    fecha_estreno  date,
    temporada int,
    duracion_pelicula int,
    puntaje number(2,1),
    primary key (codigo_pelicula)
);

create table miembro(
    codigo_persona int,
    tipo_ingreso char,
    primary key (codigo_persona),
    foreign key (codigo_persona) references persona
);

create table categoria(
    codigo_categoria int,
    nombre_categoria varchar(30),
    primary key (codigo_categoria)
);

create table equipo_pelicula(
    persona int,
    pelicula int,
    categoria int,
    foreign key (persona) references persona (codigo_persona),
    foreign key (pelicula) references pelicula (codigo_pelicula),
    foreign key (categoria) references categoria (codigo_categoria),
    primary key (persona, pelicula, categoria)
);

create table miembroxcategoria(
    miembro int,
    categoria int,
    temporada int,
    foreign key (miembro) references miembro (codigo_persona),
    foreign key (categoria) references categoria (codigo_categoria)
);