CREATE TABLE `Red_social` (
    `id` int  NOT NULL ,
    `nombre` varchar(200)  NOT NULL ,
    `enlace` varchar(200)  NOT NULL ,
    `id_persona` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE `Persona` (
    `id` int  NOT NULL ,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    `nombre` varchar(200)  NOT NULL ,
    `especialidad` varchar(200)  NOT NULL ,
    `presentacion` TEXT  NOT NULL ,
    `imagen` varchar(200)  NOT NULL ,
    `telefono` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `id`
    ),
    CONSTRAINT `uc_Persona_nombre` UNIQUE (
        `nombre`
    )
);

CREATE TABLE `personas_has_skills` (
    `id_persona` int  NOT NULL ,
    `id_skill` int  NOT NULL 
);

CREATE TABLE `Skill` (
    `id` int  NOT NULL ,
    `nombre` string  NOT NULL ,
    PRIMARY KEY (
        `id`
    ),
    CONSTRAINT `uc_Skill_nombre` UNIQUE (
        `nombre`
    )
);

CREATE TABLE `Proyecto` (
    `id` int  NOT NULL ,
    `nombre` varchar(200)  NOT NULL ,
    `enlace_deploy` varchar(200)  NOT NULL ,
    `enlace_repo` varchar(200)  NOT NULL ,
    `id_persona` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `Imagen_proyecto` (
    `id` int  NOT NULL ,
    `nombre_imagen` varchar(200)  NOT NULL ,
    `fecha` DATE  NOT NULL ,
    `id_proyecto` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `Curso` (
    `id` int  NOT NULL ,
    `nombre_curso` varchar(200)  NOT NULL ,
    `id_persona` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `Imagen_aux_portfolio` (
    `id` int  NOT NULL ,
    `nombre` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

ALTER TABLE `Red_social` ADD CONSTRAINT `fk_Red_social_id_persona` FOREIGN KEY(`id_persona`)
REFERENCES `Persona` (`id`);

ALTER TABLE `personas_has_skills` ADD CONSTRAINT `fk_personas_has_skills_id_persona` FOREIGN KEY(`id_persona`)
REFERENCES `Persona` (`id`);

ALTER TABLE `personas_has_skills` ADD CONSTRAINT `fk_personas_has_skills_id_skill` FOREIGN KEY(`id_skill`)
REFERENCES `Skill` (`id`);

ALTER TABLE `Proyecto` ADD CONSTRAINT `fk_Proyecto_id_persona` FOREIGN KEY(`id_persona`)
REFERENCES `Persona` (`id`);

ALTER TABLE `Imagen_proyecto` ADD CONSTRAINT `fk_Imagen_proyecto_id_proyecto` FOREIGN KEY(`id_proyecto`)
REFERENCES `Proyecto` (`id`);

ALTER TABLE `Curso` ADD CONSTRAINT `fk_Curso_id_persona` FOREIGN KEY(`id_persona`)
REFERENCES `Persona` (`id`);

