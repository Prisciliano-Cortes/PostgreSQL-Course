# Temas de SQL

- DDL
    - Data Definition Language
    - Create, Alter, Drop, Truncate

- DML
    - Data Manipulation Language
    - Insert, Delete, Update

- TCL
    - Transacion Control Language   
    - Commit, Rollback

- DQL
    - Data Query Language
    - Select


# Exposición sobre diseños

### Preguntémonos
- ¿Cuál es el objetivo de la misma?
- ¿Cómo usaremos la base de datos?

### Un buen diseño
- Minimizar la redundancia
- Proteger la presición
- Ser accesible
- Cumplir las expectativas

### Recomendaciones
- Investigar previamente sobre diseños similares
- Traiga las partes interesadas
- Empápate del tema objetivo

### Principios
- Mantenla simple
- Usa estandarización
- Considera futuras modificaciones
- Mantén la deuda técnica a raya
- Normalizar la data
- Diseña a largo plazo
- Crea documentación y diagramas
- Prueba tu diseño
- No uses abreviaturas
- Se recomienda nombres de tablas en singular
- No re-inventes la rueda
- Usa lo que el motor de base de datos te ofrece
- Reglas, checks, llaves, índices, para evitar basura
- Mantén la privacidad como prioridad
- Nombres en inglés y evitar caracteres especiales
- Todo en minúsculas sin espacios
- Mantén la base de datos en su propio servidor
- Mantén un modelado bajo versiones
- Establece el tipo apropiado y precisión adecuada
- No confíes en identificadores de terceros
- Defina las llaves foráneas y relaciones
- Si el esquema es muy grande, particiónalo
- Evita nombres reservados, "user", "table", "create"

### Ideas a tener en mente
- Los nombres de tablas y campos vivirán más que las aplicaciones
- Los nombres son contratados
- La base de datos gobierna sobre los demás

### Relaciones en singular
- Tablas, vistas y cualquier relación en singular
    - Es posible tener una relación uno a uno, ¿seguiría esto siendo plurar?
    - En inglés, hay palabras que no tienen forma plural, "fish", "species", "series"
    - Mucho software trabaja siguiendo esta regla de singular, y se usa mejor de esa forma, (sentido semántico)

### Nombrado explícito
- Evitar redundancia y lectura adicional
    - person_id vs id
    - Las llaves foráneas deben de ser una combinación
        -  Ejemplo:
            Create TABLE team_member (
                team_id bigint NOT NULL REFERENCES team(id)
                person_id bignit NOT NULL REFERENCES person(id)
                CONSTRAINT team_member_pkey PRIMARY KEY (team_id, person_id)
            )
    - Índices deben de ser explícitos
        - person_idx_first_name_last_name
    
### Ideas finales
- Si ya hay una estructura creada que sigue otras reglas, sigamos eas reglas.
- No mezclemos ideologías si no pensamos cambiar todo.
- Estos pasos son útiles para empezar nuevos diseños.