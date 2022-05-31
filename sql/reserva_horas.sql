CREATE TABLE cliente (
    rut_cliente            VARCHAR(10) NOT NULL,
    nombres                VARCHAR(50) NOT NULL,
    apellido_pat           VARCHAR(30) NOT NULL,
    apellido_mat           VARCHAR(30) NOT NULL,
    nro_telefono           VARCHAR(40) NOT NULL,
    direccion              VARCHAR(60),
    sexo                   CHAR(1),
    usuario_correo_usuario VARCHAR(100) NOT NULL
);

CREATE UNIQUE INDEX cliente__idx ON
    cliente (
        usuario_correo_usuario
    ASC );

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut_cliente );

CREATE TABLE hora (
    id_hora            VARCHAR(10) NOT NULL,
    fecha              DATE NOT NULL,
    hora_inicio        DATE NOT NULL,
    hora_termino       DATE NOT NULL,
    paquete_id_paquete VARCHAR(10) NOT NULL
);

ALTER TABLE hora ADD CONSTRAINT hora_pk PRIMARY KEY ( id_hora );

CREATE TABLE pago (
    id_pago             VARCHAR(10) NOT NULL,
    metodo              VARCHAR(10) NOT NULL,
    valor               VARCHAR(10) NOT NULL,
    fecha_pago          DATE NOT NULL,
    hora_pago           DATE NOT NULL,
    cliente_rut_cliente VARCHAR(10) NOT NULL,
    paquete_id_paquete  VARCHAR(10) NOT NULL
);

ALTER TABLE pago
    ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pago,
                                         cliente_rut_cliente,
                                         paquete_id_paquete );

CREATE TABLE paquete (
    id_paquete      VARCHAR(10) NOT NULL,
    tipo_paquete    VARCHAR(1) NOT NULL,
    horas_restantes NUMERIC(1) NOT NULL
);

ALTER TABLE paquete ADD CONSTRAINT paquete_pk PRIMARY KEY ( id_paquete );

CREATE TABLE usuario (
    correo_usuario      VARCHAR(100) NOT NULL,
    clave_usuario       VARCHAR(100) NOT NULL,
    cliente_rut_cliente VARCHAR(10) NOT NULL
);

CREATE UNIQUE INDEX usuario__idx ON
    usuario (
        cliente_rut_cliente
    ASC );

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( correo_usuario );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_usuario_fk FOREIGN KEY ( usuario_correo_usuario )
        REFERENCES usuario ( correo_usuario );

ALTER TABLE hora
    ADD CONSTRAINT hora_paquete_fk FOREIGN KEY ( paquete_id_paquete )
        REFERENCES paquete ( id_paquete );

ALTER TABLE pago
    ADD CONSTRAINT pago_cliente_fk FOREIGN KEY ( cliente_rut_cliente )
        REFERENCES cliente ( rut_cliente );

ALTER TABLE pago
    ADD CONSTRAINT pago_paquete_fk FOREIGN KEY ( paquete_id_paquete )
        REFERENCES paquete ( id_paquete );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_cliente_fk FOREIGN KEY ( cliente_rut_cliente )
        REFERENCES cliente ( rut_cliente );