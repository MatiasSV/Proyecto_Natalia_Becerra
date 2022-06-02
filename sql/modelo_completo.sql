-- Generado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   en:        2022-06-01 22:47:12 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    rut_cliente  VARCHAR(10) NOT NULL,
    nombres      VARCHAR(50) NOT NULL,
    apellido_pat VARCHAR(30) NOT NULL,
    apellido_mat VARCHAR(30) NOT NULL,
    nro_telefono VARCHAR(40) NOT NULL,
    direccion    VARCHAR(60),
    sexo         CHAR(1)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut_cliente );

CREATE TABLE comm (
    id_comm             VARCHAR(10) NOT NULL,
    comm_cont           VARCHAR(500) NOT NULL,
    post_id_post        INTEGER,
    cliente_rut_cliente VARCHAR(10)
);

ALTER TABLE comm ADD CONSTRAINT comm_pk PRIMARY KEY ( id_comm );

CREATE TABLE curso (
    valor_curso       INTEGER NOT NULL,
    nombre_curso      VARCHAR(30) NOT NULL,
    duracion_curso    VARCHAR(30) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    id_curso          VARCHAR(10) NOT NULL,
    descripcion_curso VARCHAR(500) NOT NULL,
    item_detalle_item INTEGER
);

CREATE UNIQUE INDEX curso__idx ON
    curso (
        item_detalle_item
    ASC );

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE detalle (
    id_compra           VARCHAR(10) NOT NULL,
    metodo              VARCHAR(10) NOT NULL,
    total               VARCHAR(10) NOT NULL,
    fecha_compra        DATE NOT NULL,
    hora_compra         DATE NOT NULL,
    cliente_rut_cliente VARCHAR(10) NOT NULL,
    paquete_id_paquete  VARCHAR(10) NOT NULL,
    pago_id_pago1       VARCHAR(10) NOT NULL
);

CREATE UNIQUE INDEX detalle__idx ON
    detalle (
        pago_id_pago1
    ASC );

ALTER TABLE detalle ADD CONSTRAINT pago_pk PRIMARY KEY ( id_compra,
                                                         cliente_rut_cliente );

CREATE TABLE hist_sesiones (
    cliente_rut_cliente VARCHAR(10) NOT NULL,
    hora_id_hora        VARCHAR(10) NOT NULL
);

ALTER TABLE hist_sesiones ADD CONSTRAINT hist_sesiones_pk PRIMARY KEY ( cliente_rut_cliente,
                                                                        hora_id_hora );

CREATE TABLE hora (
    id_hora            VARCHAR(10) NOT NULL,
    fecha              DATE NOT NULL,
    hora_inicio        DATE NOT NULL,
    hora_termino       DATE NOT NULL,
    paquete_id_paquete VARCHAR(10) NOT NULL,
    reservada          CHAR(1) NOT NULL
);

ALTER TABLE hora ADD CONSTRAINT hora_pk PRIMARY KEY ( id_hora );

CREATE TABLE item_detalle (
    item                        INTEGER NOT NULL,
    cantidad                    INTEGER NOT NULL,
    paquete_id_paquete          VARCHAR(10),
    curso_id_curso              VARCHAR(10),
    valor_item                  VARCHAR(10),
    detalle_id_compra           VARCHAR(10) NOT NULL,
    detalle_cliente_rut_cliente VARCHAR(10) NOT NULL
);

ALTER TABLE item_detalle
    ADD CONSTRAINT arc_2 CHECK ( ( ( paquete_id_paquete IS NOT NULL )
                                   AND ( curso_id_curso IS NULL ) )
                                 OR ( ( curso_id_curso IS NOT NULL )
                                      AND ( paquete_id_paquete IS NULL ) )
                                 OR ( ( paquete_id_paquete IS NULL )
                                      AND ( curso_id_curso IS NULL ) ) );

CREATE UNIQUE INDEX item_detalle__idx ON
    item_detalle (
        paquete_id_paquete
    ASC );

CREATE UNIQUE INDEX item_detalle__idxv1 ON
    item_detalle (
        curso_id_curso
    ASC );

ALTER TABLE item_detalle ADD CONSTRAINT item_detalle_pk PRIMARY KEY ( item );

CREATE TABLE met_pago (
    id_metodo  INTEGER NOT NULL,
    nom_metodo VARCHAR(30) NOT NULL,
    banco      VARCHAR(100)
);

ALTER TABLE met_pago ADD CONSTRAINT met_pago_pk PRIMARY KEY ( id_metodo );

CREATE TABLE new (
    id_new     VARCHAR(10) NOT NULL,
    asunto_new VARCHAR(150) NOT NULL,
    cont_new  TEXT NOT NULL
);

ALTER TABLE new ADD CONSTRAINT new_pk PRIMARY KEY ( id_new );

CREATE TABLE pago (
    id_pago1                    VARCHAR(10) NOT NULL,
    met_pago_id_metodo          INTEGER,
    detalle_id_compra           VARCHAR(10) NOT NULL,
    detalle_cliente_rut_cliente VARCHAR(10) NOT NULL
);

CREATE UNIQUE INDEX pago__idx ON
    pago (
        detalle_id_compra
    ASC,
        detalle_cliente_rut_cliente
    ASC );

ALTER TABLE pago ADD CONSTRAINT pago_pkv1 PRIMARY KEY ( id_pago1 );

CREATE TABLE paquete (
    id_paquete        VARCHAR(10) NOT NULL,
    descripcion       VARCHAR(500),
    ctd_sesiones      INTEGER NOT NULL,
    tipo_paquete1     VARCHAR(1) NOT NULL,
    valor_paquete     INTEGER NOT NULL,
    item_detalle_item INTEGER
);

CREATE UNIQUE INDEX paquete__idx ON
    paquete (
        item_detalle_item
    ASC );

ALTER TABLE paquete ADD CONSTRAINT paquete_pk PRIMARY KEY ( id_paquete );

CREATE TABLE post (
    id_post     INTEGER NOT NULL,
    titulo_post VARCHAR(100) NOT NULL,
    cont_post   TEXT NOT NULL,
    fecha_post  DATE NOT NULL,
    hora_post   DATE NOT NULL
);

ALTER TABLE post ADD CONSTRAINT post_pk PRIMARY KEY ( id_post );

CREATE TABLE relation_19 (
    post_id_post INTEGER NOT NULL,
    tag_id_tag   VARCHAR(10) NOT NULL
);

ALTER TABLE relation_19 ADD CONSTRAINT relation_19_pk PRIMARY KEY ( post_id_post,
                                                                    tag_id_tag );

CREATE TABLE relation_22 (
    new_id_new          VARCHAR(10) NOT NULL,
    suscripcion_id_susc VARCHAR(10) NOT NULL
);

ALTER TABLE relation_22 ADD CONSTRAINT relation_22_pk PRIMARY KEY ( new_id_new,
                                                                    suscripcion_id_susc );

CREATE TABLE sesiones (
    cliente_rut_cliente VARCHAR(10) NOT NULL,
    paquete_id_paquete  VARCHAR(10) NOT NULL,
    hrs_restantes       VARCHAR(10) NOT NULL
);

ALTER TABLE sesiones ADD CONSTRAINT sesiones_pk PRIMARY KEY ( cliente_rut_cliente,
                                                              paquete_id_paquete );

CREATE TABLE suscripcion (
    id_susc VARCHAR(10) NOT NULL,
    nombre  VARCHAR(100) NOT NULL,
    correo  VARCHAR(100) NOT NULL
);

ALTER TABLE suscripcion ADD CONSTRAINT suscripcion_pk PRIMARY KEY ( id_susc );

CREATE TABLE tag (
    nom_tag  VARCHAR(30) NOT NULL,
    id_tag   VARCHAR(10) NOT NULL,
    desc_tag VARCHAR(500)
);

ALTER TABLE tag ADD CONSTRAINT tag_pk PRIMARY KEY ( id_tag );

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

ALTER TABLE comm
    ADD CONSTRAINT comm_cliente_fk FOREIGN KEY ( cliente_rut_cliente )
        REFERENCES cliente ( rut_cliente );

ALTER TABLE comm
    ADD CONSTRAINT comm_post_fk FOREIGN KEY ( post_id_post )
        REFERENCES post ( id_post );

ALTER TABLE curso
    ADD CONSTRAINT curso_item_detalle_fk FOREIGN KEY ( item_detalle_item )
        REFERENCES item_detalle ( item );

ALTER TABLE detalle
    ADD CONSTRAINT detalle_pago_fk FOREIGN KEY ( pago_id_pago1 )
        REFERENCES pago ( id_pago1 );

ALTER TABLE hist_sesiones
    ADD CONSTRAINT hist_sesiones_cliente_fk FOREIGN KEY ( cliente_rut_cliente )
        REFERENCES cliente ( rut_cliente );

ALTER TABLE hist_sesiones
    ADD CONSTRAINT hist_sesiones_hora_fk FOREIGN KEY ( hora_id_hora )
        REFERENCES hora ( id_hora );

ALTER TABLE hora
    ADD CONSTRAINT hora_paquete_fk FOREIGN KEY ( paquete_id_paquete )
        REFERENCES paquete ( id_paquete );

ALTER TABLE item_detalle
    ADD CONSTRAINT item_detalle_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE item_detalle
    ADD CONSTRAINT item_detalle_detalle_fk FOREIGN KEY ( detalle_id_compra,
                                                         detalle_cliente_rut_cliente )
        REFERENCES detalle ( id_compra,
                             cliente_rut_cliente );

ALTER TABLE item_detalle
    ADD CONSTRAINT item_detalle_paquete_fk FOREIGN KEY ( paquete_id_paquete )
        REFERENCES paquete ( id_paquete );

ALTER TABLE detalle
    ADD CONSTRAINT pago_cliente_fk FOREIGN KEY ( cliente_rut_cliente )
        REFERENCES cliente ( rut_cliente );

ALTER TABLE pago
    ADD CONSTRAINT pago_detalle_fk FOREIGN KEY ( detalle_id_compra,
                                                 detalle_cliente_rut_cliente )
        REFERENCES detalle ( id_compra,
                             cliente_rut_cliente );

ALTER TABLE pago
    ADD CONSTRAINT pago_met_pago_fk FOREIGN KEY ( met_pago_id_metodo )
        REFERENCES met_pago ( id_metodo );

ALTER TABLE detalle
    ADD CONSTRAINT pago_paquete_fk FOREIGN KEY ( paquete_id_paquete )
        REFERENCES paquete ( id_paquete );

ALTER TABLE paquete
    ADD CONSTRAINT paquete_item_detalle_fk FOREIGN KEY ( item_detalle_item )
        REFERENCES item_detalle ( item );

ALTER TABLE relation_19
    ADD CONSTRAINT relation_19_post_fk FOREIGN KEY ( post_id_post )
        REFERENCES post ( id_post );

ALTER TABLE relation_19
    ADD CONSTRAINT relation_19_tag_fk FOREIGN KEY ( tag_id_tag )
        REFERENCES tag ( id_tag );

ALTER TABLE relation_22
    ADD CONSTRAINT relation_22_new_fk FOREIGN KEY ( new_id_new )
        REFERENCES new ( id_new );

ALTER TABLE relation_22
    ADD CONSTRAINT relation_22_suscripcion_fk FOREIGN KEY ( suscripcion_id_susc )
        REFERENCES suscripcion ( id_susc );

ALTER TABLE sesiones
    ADD CONSTRAINT sesiones_cliente_fk FOREIGN KEY ( cliente_rut_cliente )
        REFERENCES cliente ( rut_cliente );

ALTER TABLE sesiones
    ADD CONSTRAINT sesiones_paquete_fk FOREIGN KEY ( paquete_id_paquete )
        REFERENCES paquete ( id_paquete );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_cliente_fk FOREIGN KEY ( cliente_rut_cliente )
        REFERENCES cliente ( rut_cliente );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            18
-- CREATE INDEX                             7
-- ALTER TABLE                             41
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
