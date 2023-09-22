CREATE TABLE Localidad (
    ID_Localidad NUMBER(10) NOT NULL,
    Nombre VARCHAR2(20),
    Poblacion NUMBER(10),
    PRIMARY KEY (ID_Localidad)
);

CREATE TABLE Barrio (
    ID_Barrio NUMBER(10) NOT NULL,
    Nombre VARCHAR2(30),
    ID_Localidad NUMBER(10) NOT NULL,
    ZIP_Code VARCHAR2(10),
    Estrato NUMBER(10),
    ID_Aplicacion NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Barrio),
    FOREIGN KEY (ID_Localidad) REFERENCES Localidad (ID_Localidad),
    FOREIGN KEY (ID_Aplicacion) REFERENCES Aplicacion_Denuncia (ID_Aplicacion)
);

CREATE TABLE Indicador (
    ID_Indicador NUMBER(10) NOT NULL,
    Nombre VARCHAR2(20),
    Descripcion VARCHAR2(100),
    PRIMARY KEY (ID_Indicador)
);

CREATE TABLE Factor_Social (
    ID_Factor NUMBER(10) NOT NULL,
    Nombre VARCHAR2(20),
    Descripcion VARCHAR2(100),
    PRIMARY KEY (ID_Factor)
);

CREATE TABLE Adolescente (
    ID_Adolescente NUMBER(10) NOT NULL,
    Edad NUMBER(5),
    Estrato NUMBER(1),
    ID_Factor NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Adolescente),
    FOREIGN KEY (ID_Factor) REFERENCES Factor_Social (ID_Factor)
);

CREATE TABLE Estructura_Criminal (
    ID_Estructura NUMBER(10) NOT NULL,
    Descripcion VARCHAR2(100),
    PRIMARY KEY (ID_Estructura)
);

CREATE TABLE Victima_Violencia (
    ID_Victima NUMBER(10) NOT NULL,
    Tipo_Delito VARCHAR2(30),
    Descripcion VARCHAR2(100),
    Genero CHAR(1),
    Edad NUMBER(1),
    PRIMARY KEY (ID_Victima)
);

CREATE TABLE Delincuente_Juvenil (
    ID_Delincuente NUMBER(10) NOT NULL,
    Edad NUMBER(5),
    PRIMARY KEY (ID_Delincuente)
);

CREATE TABLE Aplicacion_Denuncia (
    ID_Aplicacion NUMBER(10) NOT NULL,
    Descripcion VARCHAR2(100),
    Entidad_Denunciante VARCHAR2(30),
    PRIMARY KEY (ID_Aplicacion)
);

CREATE TABLE Adolescente_EstructuraCriminal (
    ID_Adolescente NUMBER(10) NOT NULL,
    ID_Estructura NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Adolescente, ID_Estructura),
    FOREIGN KEY (ID_Adolescente) REFERENCES Adolescente (ID_Adolescente),
    FOREIGN KEY (ID_Estructura) REFERENCES Estructura_Criminal (ID_Estructura)
);

CREATE TABLE VictimaViolencia_DelincuenteJuvenil (
    ID_Victima NUMBER(10) NOT NULL,
    ID_Delincuente NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Victima, ID_Delincuente),
    FOREIGN KEY (ID_Victima) REFERENCES Victima_Violencia (ID_Victima),
    FOREIGN KEY (ID_Delincuente) REFERENCES Delincuente_Juvenil (ID_Delincuente)
);

ALTER TABLE Barrio ADD CONSTRAINT FK_Barrio_Localidad FOREIGN KEY (ID_Localidad) REFERENCES Localidad (ID_Localidad);
ALTER TABLE Barrio ADD CONSTRAINT FK_Barrio_Aplicacion_Denuncia FOREIGN KEY (ID_Aplicacion) REFERENCES Aplicacion_Denuncia (ID_Aplicacion);
