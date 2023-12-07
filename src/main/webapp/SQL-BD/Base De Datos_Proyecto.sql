
CREATE DATABASE PaginasDoradasBD

USE PaginasDoradasBD

CREATE TABLE Personal
(
	id_personal VARCHAR(15) NOT NULL
		Constraint Personal_id_personal_pk PRIMARY KEY (id_personal),
	nombreP NVARCHAR(20) NOT NULL,
	apellidoP NVARCHAR(20) NOT NULL,
	userNameP NVARCHAR(25) NOT NULL,
	passwordP NVARCHAR(20) NOT NULL,
	rol VARCHAR(15) NOT NULL,
	id_libroPer INT NOT NULL,
);

CREATE TABLE Direccion_Personal
(
    id_direccionP INT IDENTITY(1,1) NOT NULL, -- Agregado IDENTITY
    distritoP NVARCHAR(25) NOT NULL,
    corregimientoP NVARCHAR(25) NOT NULL,
    calleP NVARCHAR(25) NOT NULL,
    casaP NVARCHAR(15) NOT NULL,
    id_personalDirP VARCHAR(15) NOT NULL,
    CONSTRAINT Direccion_Personal_id_direccion_pk PRIMARY KEY (id_direccionP),
    CONSTRAINT Direccion_Personal_id_direccionP_fk FOREIGN KEY (id_personalDirP)
        REFERENCES Personal(id_personal)
);

CREATE TABLE Correo_Personal
(
    id_correoP INT IDENTITY(1,1) NOT NULL, -- Agregado IDENTITY
    correoPer NVARCHAR(30) NOT NULL,
    id_personalCP VARCHAR(15) NOT NULL,
    CONSTRAINT Correo_Personal_id_correo_pk PRIMARY KEY (id_correoP),
    CONSTRAINT Correo_Personal_id_correoP_fk FOREIGN KEY (id_personalCP)
        REFERENCES Personal(id_personal)
);

CREATE TABLE Telefono_Personal
(
    id_telefonoP INT IDENTITY(1,1) NOT NULL, -- Agregado IDENTITY
    numTelefonoP NVARCHAR(13) NOT NULL,
    id_personalT VARCHAR(15) NOT NULL,
    CONSTRAINT Telefono_Personal_id_telefono_pk PRIMARY KEY (id_telefonoP),
    CONSTRAINT Telefono_Personal_id_personalT_fk FOREIGN KEY (id_personalT)
        REFERENCES Personal(id_personal)
);

CREATE TABLE Genero
(
    id_genero INT IDENTITY(1,1) NOT NULL, -- Agregado IDENTITY
    genero VARCHAR(20) NOT NULL,
    CONSTRAINT Genero_id_genero_pk PRIMARY KEY (id_genero)
);
CREATE TABLE Libros
(
    id_libro INT IDENTITY(1,1) NOT NULL, -- Agregado IDENTITY
    titulo VARCHAR(40) NOT NULL,
    ISBN BIGINT,
    editorial VARCHAR(35) NOT NULL,
    dia INT NOT NULL,
    mes INT NOT NULL,
    año INT NOT NULL,
    descripcion VARCHAR(MAX) NOT NULL,
    id_generoL INT NOT NULL,
    CONSTRAINT Libros_id_libro_pk PRIMARY KEY (id_libro),
    CONSTRAINT Libros_id_genero_fk FOREIGN KEY (id_generoL)
        REFERENCES Genero (id_genero)
);

CREATE TABLE Imagenes
(
    id_imagen INT IDENTITY(1,1) NOT NULL, -- Agregado IDENTITY
    nombreImg VARCHAR(20) NOT NULL,
    imagen VARCHAR(MAX) NOT NULL,
    id_libroImg INT NOT NULL,
    CONSTRAINT Imagenes_id_imagen_pk PRIMARY KEY (id_imagen),
    CONSTRAINT Imagenes_id_libroImg_fk FOREIGN KEY (id_libroImg)
        REFERENCES Libros (id_libro)
);

CREATE TABLE Autor
(
	id_autor VARCHAR(10) NOT NULL,
	nombreAct VARCHAR(15) NOT NULL,
	apellidoAct VARCHAR(15) NOT NULL,
		Constraint Autor_id_autor_pk PRIMARY KEY (id_autor)
)
CREATE TABLE Libro_Autor
(
	id_libAct INT NOT NULL,
	id_actorLib VARCHAR(10) NOT NULL,
	descripcionAct VARCHAR(MAX),
		Constraint Libro_Autor_id_libAct_id_actorLib_pk
			PRIMARY KEY (id_libAct,id_actorLib),
		Constraint Libro_Autor_id_libAct_fk
			FOREIGN KEY (id_libAct) REFERENCES Libros (id_libro),
		Constraint Libro_Autor_id_actorLib_fk
			FOREIGN KEY (id_actorLib)REFERENCES Autor (id_autor)
)

CREATE TABLE DireccionU
(
    id_direccion INT IDENTITY(1,1) NOT NULL, -- Agregado IDENTITY
    distrito VARCHAR(25) NOT NULL,
    corregimiento VARCHAR(25) NOT NULL,
    calle VARCHAR(25) NOT NULL,
    casa NVARCHAR(15) NOT NULL,
    CONSTRAINT Direccion_id_direccion_pk PRIMARY KEY (id_direccion),
    CONSTRAINT DireccionU_id_usuario_fk FOREIGN KEY (id_usuario)
        REFERENCES Usuarios (id_usuario)
);

CREATE TABLE Usuarios
(
	id_usuario NVARCHAR(16) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	loginUser NVARCHAR(30) NOT NULL,
	contraseña NVARCHAR(25) NOT NULL,
	id_direccionU INT NOT NULL
		Constraint Usuarios_id_usuario_pk PRIMARY KEY (id_usuario),
)
CREATE TABLE Telefono
(
    id_telefono INT IDENTITY(1,1) NOT NULL, -- Agregado IDENTITY
    numTelefonoP INT NOT NULL,
    id_UsuarioT NVARCHAR(16) NOT NULL,
    CONSTRAINT Telefono_id_telefono_pk PRIMARY KEY (id_telefono),
    CONSTRAINT Telefono_Personal_id_usuarioT_fk FOREIGN KEY (id_usuarioT)
        REFERENCES Usuarios(id_usuario)
);
CREATE TABLE Correo
(
    id_correo INT IDENTITY(1,1) NOT NULL, -- Agregado IDENTITY
    correoUser NVARCHAR(30) NOT NULL,
    id_usuarioC NVARCHAR(16) NOT NULL,
    CONSTRAINT Correo_id_correo_pk PRIMARY KEY (id_correo),
    CONSTRAINT Correo_id_usuarioC_fk FOREIGN KEY (id_usuarioC)
        REFERENCES Usuarios(id_usuario)
);


CREATE TABLE Prestamos
(
	id_prestamos VARCHAR(15) NOT NULL,
	id_usuarioPre NVARCHAR(16) NOT NULL,
	id_libroPre INT NOT NULL,
	fechaPrestamo DATE NOT NULL,
	fechaDevolucion DATE NOT NULL,
	Constraint Prestamos_id_prestamos_pk PRIMARY KEY (id_prestamos),
	Constraint Prestamos_id_usuarioPre_fk FOREIGN KEY (id_usuarioPre)
		REFERENCES Usuarios (id_usuario),
	Constraint Prestamos_id_libroPre_fk FOREIGN KEY (id_libroPre)
		REFERENCES Libros (id_libro)
)

CREATE TABLE Personal_Libro
(
	id_personalReg VARCHAR(15) NOT NULL,
	id_libroReg INT NOT NULL,
	fecha_Registro DATE NOT NULL,
	Constraint Personal_Libro_id_personalReg_id_libroReg_pk
		PRIMARY KEY (id_personalReg,id_libroReg),
	Constraint Personal_Libro_id_personalReg_fk FOREIGN KEY (id_personalReg)
		REFERENCES Personal (id_personal),
	Constraint Personal_Libro_id_libroReg_fk FOREIGN KEY (id_libroReg)
		REFERENCES Libros (id_libro)
)

CREATE TABLE Libros_Usuarios
(
	id_libroU INT NOT NULL,
	id_usuarioL NVARCHAR(16) NOT NULL,
	Constraint Libros_Usuarios_id_libroU_id_usuarioL_pk
		PRIMARY KEY (id_libroU,id_usuarioL),
	Constraint Libros_Usuarios_id_libroU_fk FOREIGN KEY (id_libroU)
		REFERENCES Libros (id_libro),
	Constraint Libros_Usuarios_id_usuarioL_fk FOREIGN KEY (id_usuarioL)
		REFERENCES Usuarios (id_usuario)
)

CREATE TABLE Usuario_Prestamos
(
	id_usuarioP NVARCHAR(16) NOT NULL,
  totalPrestamo int NOT NULL,
	id_prestamoU VARCHAR(15) NOT NULL,
	Constraint Usuario_Prestamos_id_usuarioP_id_prestamoU_pk
		PRIMARY KEY (id_usuarioP,id_prestamoU),
	Constraint Usuario_Prestamos_id_usuarioP_fk FOREIGN KEY (id_usuarioP)
		REFERENCES Usuarios (id_usuario),
	Constraint Usuario_Prestamos_id_prestamosU_fk FOREIGN KEY (id_prestamoU)
		REFERENCES Prestamos (id_prestamos)
)
