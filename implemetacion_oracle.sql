CREATE TABLE "Localidad" (
    "ID_Localidad" INTEGER NOT NULL,
    "Nombre" VARCHAR2(20),
    "Poblacion" INTEGER,
    PRIMARY KEY ("ID_Localidad")
);

CREATE TABLE "Barrio" (
    "ID_Barrio" INTEGER NOT NULL,
    "Nombre" VARCHAR2(30),
    "ID_Localidad" INTEGER NOT NULL,
    "ZIP_Code" VARCHAR2(10),
    "Estrato" INTEGER,
    "ID_Aplicacion" INTEGER NOT NULL,
    PRIMARY KEY ("ID_Barrio"),
    FOREIGN KEY ("ID_Localidad") REFERENCES "Localidad" ("ID_Localidad"),
    FOREIGN KEY ("ID_Aplicacion") REFERENCES "Aplicacion_Denuncia" ("ID_Aplicacion")
);

CREATE TABLE "Indicador" (
    "ID_Indicador" INTEGER NOT NULL,
    "Nombre" VARCHAR2(20),
    "Descripcion" VARCHAR2(100),
    PRIMARY KEY ("ID_Indicador")
);

CREATE TABLE "Factor_Social" (
    "ID_Factor" INTEGER NOT NULL,
    "Nombre" VARCHAR2(20),
    "Descripcion" VARCHAR2(100),
    PRIMARY KEY ("ID_Factor")
);

CREATE TABLE "Adolescente" (
    "ID_Adolescente" INTEGER NOT NULL,
    "Edad" SMALLINT,
    "Estrato" NUMBER(1),
    "ID_Factor" INTEGER NOT NULL,
    PRIMARY KEY ("ID_Adolescente"),
    FOREIGN KEY ("ID_Factor") REFERENCES "Factor_Social" ("ID_Factor")
);

CREATE TABLE "Estructura_Criminal" (
    "ID_Estructura" INTEGER NOT NULL,
    "Descripcion" VARCHAR2(100),
    PRIMARY KEY ("ID_Estructura")
);

CREATE TABLE "Victima_Violencia" (
    "ID_Victima" INTEGER NOT NULL,
    "Tipo_Delito" VARCHAR2(30),
    "Descripcion" VARCHAR2(100),
    "Genero" CHAR(1),
    "Edad" NUMBER(1),
    PRIMARY KEY ("ID_Victima")
);

CREATE TABLE "Delincuente_Juvenil" (
    "ID_Delincuente" INTEGER NOT NULL,
    "Edad" SMALLINT,
    PRIMARY KEY ("ID_Delincuente")
);

CREATE TABLE "Aplicacion_Denuncia" (
    "ID_Aplicacion" INTEGER NOT NULL,
    "Descripcion" VARCHAR2(100),
    "Entidad_Denunciante" VARCHAR2(30),
    PRIMARY KEY ("ID_Aplicacion")
);

CREATE TABLE "Adolescente_EstructuraCriminal" (
    "ID_Adolescente" INTEGER NOT NULL,
    "ID_Estructura" INTEGER NOT NULL,
    PRIMARY KEY ("ID_Adolescente", "ID_Estructura"),
    FOREIGN KEY ("ID_Adolescente") REFERENCES "Adolescente" ("ID_Adolescente"),
    FOREIGN KEY ("ID_Estructura") REFERENCES "Estructura_Criminal" ("ID_Estructura")
);

CREATE TABLE "VictimaViolencia_DelincuenteJuvenil" (
    "ID_Victima" INTEGER NOT NULL,
    "ID_Delincuente" INTEGER NOT NULL,
    PRIMARY KEY ("ID_Victima", "ID_Delincuente"),
    FOREIGN KEY ("ID_Victima") REFERENCES "Victima_Violencia" ("ID_Victima"),
    FOREIGN KEY ("ID_Delincuente") REFERENCES "Delincuente_Juvenil" ("ID_Delincuente")
);

ALTER TABLE "Barrio" ADD CONSTRAINT "FK_Barrio_Localidad" FOREIGN KEY ("ID_Localidad") REFERENCES "Localidad" ("ID_Localidad");
ALTER TABLE "Barrio" ADD CONSTRAINT "FK_Barrio_Aplicacion_Denuncia" FOREIGN KEY ("ID_Aplicacion") REFERENCES "Aplicacion_Denuncia" ("ID_Aplicacion");
