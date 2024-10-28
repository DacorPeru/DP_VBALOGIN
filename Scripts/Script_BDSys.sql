-- Crear la tabla Empresa
CREATE TABLE Empresa (
    id_empresa AUTOINCREMENT PRIMARY KEY,
    cue_empresa TEXT(255),
    ruc_empresa TEXT(255),
    nombre_empresa TEXT(255),
    direc_empresa TEXT(255),
    estadocontrib TEXT (6),
    condicioncontrib TEXT (6),
    ref_empresa TEXT(255),
    obs_empresa TEXT(255),
    membrete_empresa TEXT(255),
    logo_empresa TEXT(255),
    repleg_empresa TEXT(255),
    estado_empresa TEXT(50),
    nombre_base_datos TEXT(100),
    ruta_base_datos TEXT(255)
);

-- Insertar datos predeterminados en la tabla Empresa
INSERT INTO Empresa (cue_empresa, ruc_empresa, nombre_empresa, direc_empresa, ref_empresa, obs_empresa, membrete_empresa, logo_empresa, repleg_empresa, estado_empresa, nombre_base_datos, ruta_base_datos) 
VALUES ('111111', '20610187863', 'Data Consulting Reyes Peru E.I.R.L', 'Distrito de Laredo', 'Av. Pedro Garcia Garcia', 'Registro de empresa de prueba', '', 'LogoDacorP.png', 'Gesmer Reyes', 'Activo', 'BD_Demo', 'C:\\BD_Demo.accdb');

-- Crear la tabla ConfigGeneral
CREATE TABLE ConfigGeneral (
    IDConfig AUTOINCREMENT PRIMARY KEY,
    Clave TEXT(20),
    Valor TEXT(100),
    Descripcion TEXT(100)
);

-- Insertar datos predeterminados en la tabla ConfigGeneral
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('NombreApp', 'Sistema Admin Datos', 'Indica el Nombre de la aplicación');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('NombreAppAbreviatura', 'SIAR', 'Nombre de la app abreviado');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('DescripApp', 'Sistema para la administración de un sistema de inventario de bienes muebles', 'Descripción de la App');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('Version', '1', 'Versión de la App');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('Revision1', '0', 'Revisión de la App Número 1');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('Revision2', '0', 'Revisión de la App Número 2');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('Ruc', '20610187863', 'RUC de la empresa desarrolladora');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('Cel', '915900473', 'Contacto de la empresa');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('Empresa', 'Data Consulting Reyes Peru E.I.R.L', 'Nombre de la Empresa que ha desarrollado el sistema');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('EmpresaAbreviatura', 'Dacor Peru', 'Nombre abreviado de la Empresa que ha desarrollado el sistema');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('PaginaWeb', 'www.dacorperu.com', 'Página web de la empresa');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('email_soporte', 'soporte@miempresa.com', 'Correo de soporte técnico');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('Nombre', 'Gesmer', 'Nombre del creador y representante legal de la empresa');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('S_Nombre', 'Biuler', 'Segundo nombre del creador');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('ApPaterno', 'Reyes', 'Apellido paterno del creador');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('ApMaterno', 'Eustaquio', 'Apellido materno del creador');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('EmailPersonal', 'gesmerbre12@gmail.com', 'Correo personal (Gmail) del creador');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('EmailPersonal1', 'gesmer_re12@hotmail.com', 'Correo personal (Hotmail) del creador');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('modo_desarrollo', 'True', 'Indica si el sistema está en modo desarrollo');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('logo_principal', 'Login.gif', 'Nombre del archivo del logo principal');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('fondo_principal', 'Portada.jpg', 'Nombre del archivo del fondo principal');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('Anio', '2024', 'Año de la aplicación');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('IconAceptar', 'Aceptar.gif', 'Ícono para el botón Aceptar');
INSERT INTO ConfigGeneral (Clave, Valor, Descripcion) 
VALUES ('IconCancelar', 'Cancelar.gif', 'Ícono para el botón Cancelar');

-- Crear la tabla Usuario
CREATE TABLE Usuario (
    id_usuario AUTOINCREMENT PRIMARY KEY,
    dni TEXT (8) UNIQUE,
    nombres TEXT(100),
    apellido_pat TEXT(100),
    apellido_mat TEXT(100),
    email TEXT(150) UNIQUE,
    usuario TEXT(100),
    password_hash TEXT(255),
    salt TEXT(255), 
    id_rol LONG,
    estado TEXT(20)
);


INSERT INTO Usuario (dni, nombres, apellido_pat, apellido_mat, email, usuario, password_hash, salt, id_rol, estado) 
VALUES ('00000000', 'Admin', 'User', 'Predeterminado', 'admin@example.com', 'AdminUser', 'HASH_GENERADO', 'SALT_GENERADO', 1, 'Activo');




-- Crear la tabla Licencia
CREATE TABLE Licencia (
    id_licencia AUTOINCREMENT PRIMARY KEY,
    id_empresa LONG,
    clave_licencia TEXT(255) UNIQUE,
    fecha_activacion DATETIME,
    fecha_expiracion DATETIME,
    estado TEXT(20)
);

-- Insertar datos predeterminados en la tabla Licencia
INSERT INTO Licencia (id_empresa, clave_licencia, fecha_activacion, fecha_expiracion, estado) 
VALUES (1, 'LIC-12345-ABCDE', Now(), '31/12/2024', 'Activa');


-- Crear la tabla Rol
CREATE TABLE Rol (
    id_rol AUTOINCREMENT PRIMARY KEY,
    nombre_rol TEXT(50),
    descripcion_rol TEXT(255),
    estado TEXT(20)
);

-- Crear la tabla Permiso
CREATE TABLE Permiso (
    id_permiso AUTOINCREMENT PRIMARY KEY,
    nombre_permiso TEXT(50),
    descripcion_permiso TEXT(255),
    estado TEXT(20)
);

-- Crear la tabla Usuario_Rol
CREATE TABLE Usuario_Rol (
    id_usuario LONG,
    id_rol LONG,
    PRIMARY KEY (id_usuario, id_rol)
);

-- Crear la tabla Rol_Permiso
CREATE TABLE Rol_Permiso (
    id_rol LONG,
    id_permiso LONG,
    PRIMARY KEY (id_rol, id_permiso)
);

-- Crear la tabla Login
CREATE TABLE Login (
    id_login AUTOINCREMENT PRIMARY KEY,
    id_usuario LONG,
    fecha_hora DATETIME DEFAULT Now(),
    ip_origen TEXT(45),
    estado TEXT(20)
);

-- Crear la tabla Auditoria_Permisos
CREATE TABLE Auditoria_Permisos (
    id_auditoria AUTOINCREMENT PRIMARY KEY,
    id_usuario LONG,
    id_permiso LONG,
    accion TEXT(50),
    fecha DATETIME DEFAULT Now()
);

-- Crear la tabla Sesion_Tokens
CREATE TABLE Sesion_Tokens (
    id_token AUTOINCREMENT PRIMARY KEY,
    id_usuario LONG,
    token TEXT(255),
    expiracion DATETIME,
    estado TEXT(20)
);

-- Crear la tabla Intentos_Login_Fallidos
CREATE TABLE Intentos_Login_Fallidos (
    id_intento AUTOINCREMENT PRIMARY KEY,
    id_usuario LONG,
    fecha_hora DATETIME DEFAULT Now(),
    ip_origen TEXT(45)
);

-- Crear la tabla Empresa_Sesion (tabla adicional mencionada)
CREATE TABLE Empresa_Sesion (
    id_sesion AUTOINCREMENT PRIMARY KEY,
    id_usuario LONG,
    id_empresa LONG,
    fecha_inicio DATETIME DEFAULT Now(),
    fecha_fin DATETIME,
    estado TEXT(20)
);

-- Insertar datos predeterminados en la tabla Empresa_Sesion
INSERT INTO Empresa_Sesion (id_usuario, id_empresa, fecha_inicio, estado)
VALUES (1, 1, Now(), 'Activa');

-- Establecer relaciones de claves foráneas
ALTER TABLE Empresa_Sesion ADD FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario);
ALTER TABLE Empresa_Sesion ADD FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa);
ALTER TABLE Usuario_Rol ADD FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario);
ALTER TABLE Usuario_Rol ADD FOREIGN KEY (id_rol) REFERENCES Rol(id_rol);
ALTER TABLE Rol_Permiso ADD FOREIGN KEY (id_rol) REFERENCES Rol(id_rol);
ALTER TABLE Rol_Permiso ADD FOREIGN KEY (id_permiso) REFERENCES Permiso(id_permiso);
ALTER TABLE Login ADD FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario);
ALTER TABLE Auditoria_Permisos ADD FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario);
ALTER TABLE Auditoria_Permisos ADD FOREIGN KEY (id_permiso) REFERENCES Permiso(id_permiso);
ALTER TABLE Sesion_Tokens ADD FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario);
ALTER TABLE Intentos_Login_Fallidos ADD FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario);
ALTER TABLE Licencia ADD FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa);