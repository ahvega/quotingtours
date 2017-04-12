--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-03-31 11:01:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 17266)
-- Name: tenant1; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tenant1;


ALTER SCHEMA tenant1 OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 193 (class 1259 OID 16862)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16860)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 192
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 195 (class 1259 OID 16872)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16870)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 194
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 191 (class 1259 OID 16854)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16852)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 190
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 197 (class 1259 OID 16880)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16890)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16888)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 198
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 196 (class 1259 OID 16878)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 196
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 201 (class 1259 OID 16898)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16896)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 204 (class 1259 OID 16981)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17001)
-- Name: clientes_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clientes_cliente (
    id integer NOT NULL,
    domain_url character varying(128) NOT NULL,
    schema_name character varying(63) NOT NULL,
    nombre character varying(100) NOT NULL,
    pagado_hasta date NOT NULL,
    en_prueba boolean NOT NULL,
    creado date NOT NULL
);


ALTER TABLE clientes_cliente OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16999)
-- Name: clientes_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clientes_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clientes_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 205
-- Name: clientes_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clientes_cliente_id_seq OWNED BY clientes_cliente.id;


--
-- TOC entry 203 (class 1259 OID 16958)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16956)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 189 (class 1259 OID 16844)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16842)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 187 (class 1259 OID 16833)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16831)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 207 (class 1259 OID 17013)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17025)
-- Name: transporte_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_cliente (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contacto character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    email character varying(254),
    tel character varying(15),
    ciudad character varying(50) NOT NULL,
    pais character varying(50) NOT NULL,
    rtn character varying(16) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    nivel_de_precio_id integer NOT NULL
);


ALTER TABLE transporte_cliente OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17023)
-- Name: transporte_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 208
-- Name: transporte_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_cliente_id_seq OWNED BY transporte_cliente.id;


--
-- TOC entry 211 (class 1259 OID 17038)
-- Name: transporte_conductor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_conductor (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    identidad text NOT NULL,
    telefono text NOT NULL,
    empleado boolean NOT NULL,
    incentivo_por_dia numeric(6,2) NOT NULL
);


ALTER TABLE transporte_conductor OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17036)
-- Name: transporte_conductor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_conductor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_conductor_id_seq OWNER TO postgres;

--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 210
-- Name: transporte_conductor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_conductor_id_seq OWNED BY transporte_conductor.id;


--
-- TOC entry 213 (class 1259 OID 17049)
-- Name: transporte_cotizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_cotizacion (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    fecha_vence date NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    itinerario_id integer NOT NULL,
    nivel_de_precio_id integer,
    subtotal numeric(10,2),
    total numeric(10,2),
    utilidad numeric(10,2)
);


ALTER TABLE transporte_cotizacion OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17047)
-- Name: transporte_cotizacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_cotizacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_cotizacion_id_seq OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 212
-- Name: transporte_cotizacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_cotizacion_id_seq OWNED BY transporte_cotizacion.id;


--
-- TOC entry 215 (class 1259 OID 17057)
-- Name: transporte_cotizaciondetalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_cotizaciondetalle (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    cantidad numeric(10,2) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    cotizacion_id integer NOT NULL,
    descripcion character varying(100),
    nivel_de_precio_id integer,
    item_id integer NOT NULL,
    costo numeric(10,2) NOT NULL,
    markup numeric(6,4) NOT NULL,
    monto numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL
);


ALTER TABLE transporte_cotizaciondetalle OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17055)
-- Name: transporte_cotizaciondetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_cotizaciondetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_cotizaciondetalle_id_seq OWNER TO postgres;

--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 214
-- Name: transporte_cotizaciondetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_cotizaciondetalle_id_seq OWNED BY transporte_cotizaciondetalle.id;


--
-- TOC entry 217 (class 1259 OID 17065)
-- Name: transporte_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_item (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    tipo_item character varying(13) NOT NULL,
    unidad character varying(50) NOT NULL,
    costo numeric(10,4) NOT NULL,
    precio numeric(10,4) NOT NULL,
    descripcion_compra character varying(50) NOT NULL,
    descripcion_venta character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL
);


ALTER TABLE transporte_item OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17063)
-- Name: transporte_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_item_id_seq OWNER TO postgres;

--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 216
-- Name: transporte_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_item_id_seq OWNED BY transporte_item.id;


--
-- TOC entry 219 (class 1259 OID 17073)
-- Name: transporte_itinerario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_itinerario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    estatus character varying(10) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    cliente_id integer NOT NULL,
    nivel_de_precio_id integer
);


ALTER TABLE transporte_itinerario OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17071)
-- Name: transporte_itinerario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_itinerario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_itinerario_id_seq OWNER TO postgres;

--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 218
-- Name: transporte_itinerario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_itinerario_id_seq OWNED BY transporte_itinerario.id;


--
-- TOC entry 221 (class 1259 OID 17081)
-- Name: transporte_lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_lugar (
    id integer NOT NULL,
    codigo character varying(3) NOT NULL,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    nombre character varying(50) NOT NULL,
    pais character varying(30) NOT NULL,
    zona character varying(4) NOT NULL
);


ALTER TABLE transporte_lugar OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17079)
-- Name: transporte_lugar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_lugar_id_seq OWNER TO postgres;

--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 220
-- Name: transporte_lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_lugar_id_seq OWNED BY transporte_lugar.id;


--
-- TOC entry 223 (class 1259 OID 17091)
-- Name: transporte_niveldeprecio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_niveldeprecio (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    tipo character varying(10) NOT NULL,
    accion character varying(10) NOT NULL,
    valor numeric(5,2) NOT NULL,
    factor numeric(5,4),
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL
);


ALTER TABLE transporte_niveldeprecio OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17089)
-- Name: transporte_niveldeprecio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_niveldeprecio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_niveldeprecio_id_seq OWNER TO postgres;

--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 222
-- Name: transporte_niveldeprecio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_niveldeprecio_id_seq OWNED BY transporte_niveldeprecio.id;


--
-- TOC entry 225 (class 1259 OID 17099)
-- Name: transporte_parametro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_parametro (
    id integer NOT NULL,
    annio integer NOT NULL,
    nombre character varying(25) NOT NULL,
    valor character varying(100) NOT NULL,
    unidad character varying(100) NOT NULL,
    orden integer NOT NULL,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL
);


ALTER TABLE transporte_parametro OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17097)
-- Name: transporte_parametro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_parametro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_parametro_id_seq OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 224
-- Name: transporte_parametro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_parametro_id_seq OWNED BY transporte_parametro.id;


--
-- TOC entry 227 (class 1259 OID 17107)
-- Name: transporte_tipodevehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_tipodevehiculo (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    slug character varying(50) NOT NULL,
    rendimiento integer NOT NULL,
    costo_por_dia numeric(10,2) NOT NULL,
    costo_por_km numeric(10,2) NOT NULL,
    capacidad_nominal integer NOT NULL,
    capacidad_real integer NOT NULL,
    galones_tanque numeric(6,2) NOT NULL,
    activo boolean NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL
);


ALTER TABLE transporte_tipodevehiculo OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17105)
-- Name: transporte_tipodevehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_tipodevehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_tipodevehiculo_id_seq OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 226
-- Name: transporte_tipodevehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_tipodevehiculo_id_seq OWNED BY transporte_tipodevehiculo.id;


--
-- TOC entry 229 (class 1259 OID 17115)
-- Name: transporte_tramo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_tramo (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    desde_hacia text NOT NULL,
    codigo text NOT NULL,
    desde_lugar_id integer NOT NULL,
    hacia_lugar_id integer NOT NULL,
    descripcion character varying(255),
    hrs numeric(4,1),
    kms integer,
    cruza_frontera boolean NOT NULL,
    zona_destino character varying(4)
);


ALTER TABLE transporte_tramo OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17113)
-- Name: transporte_tramo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_tramo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_tramo_id_seq OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 228
-- Name: transporte_tramo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_tramo_id_seq OWNED BY transporte_tramo.id;


--
-- TOC entry 231 (class 1259 OID 17142)
-- Name: transporte_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transporte_vehiculo (
    id integer NOT NULL,
    nombre character varying(5) NOT NULL,
    placa character varying(10) NOT NULL,
    chofer_fijo boolean NOT NULL,
    fecha_adquirido date,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    tipo_id integer NOT NULL
);


ALTER TABLE transporte_vehiculo OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17140)
-- Name: transporte_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transporte_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_vehiculo_id_seq OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 230
-- Name: transporte_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_vehiculo_id_seq OWNED BY transporte_vehiculo.id;


SET search_path = tenant1, pg_catalog;

--
-- TOC entry 239 (class 1259 OID 17298)
-- Name: auth_group; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17296)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 238
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 241 (class 1259 OID 17308)
-- Name: auth_group_permissions; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17306)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 240
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 237 (class 1259 OID 17290)
-- Name: auth_permission; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17288)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 236
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 243 (class 1259 OID 17316)
-- Name: auth_user; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17326)
-- Name: auth_user_groups; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17324)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 244
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 242 (class 1259 OID 17314)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 242
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 247 (class 1259 OID 17334)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17332)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 246
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 250 (class 1259 OID 17417)
-- Name: authtoken_token; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17394)
-- Name: django_admin_log; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17392)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 248
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 235 (class 1259 OID 17280)
-- Name: django_content_type; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17278)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 233 (class 1259 OID 17269)
-- Name: django_migrations; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17267)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 232
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 251 (class 1259 OID 17435)
-- Name: django_session; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 17447)
-- Name: transporte_cliente; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_cliente (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contacto character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    email character varying(254),
    tel character varying(15),
    ciudad character varying(50) NOT NULL,
    pais character varying(50) NOT NULL,
    rtn character varying(16) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    nivel_de_precio_id integer NOT NULL
);


ALTER TABLE transporte_cliente OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 17445)
-- Name: transporte_cliente_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 252
-- Name: transporte_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_cliente_id_seq OWNED BY transporte_cliente.id;


--
-- TOC entry 255 (class 1259 OID 17460)
-- Name: transporte_conductor; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_conductor (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    identidad text NOT NULL,
    telefono text NOT NULL,
    empleado boolean NOT NULL,
    incentivo_por_dia numeric(6,2) NOT NULL
);


ALTER TABLE transporte_conductor OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 17458)
-- Name: transporte_conductor_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_conductor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_conductor_id_seq OWNER TO postgres;

--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 254
-- Name: transporte_conductor_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_conductor_id_seq OWNED BY transporte_conductor.id;


--
-- TOC entry 257 (class 1259 OID 17471)
-- Name: transporte_cotizacion; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_cotizacion (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    fecha_vence date NOT NULL,
    subtotal numeric(10,2),
    markup numeric(10,2),
    total numeric(10,2),
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    itinerario_id integer NOT NULL
);


ALTER TABLE transporte_cotizacion OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 17469)
-- Name: transporte_cotizacion_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_cotizacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_cotizacion_id_seq OWNER TO postgres;

--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 256
-- Name: transporte_cotizacion_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_cotizacion_id_seq OWNED BY transporte_cotizacion.id;


--
-- TOC entry 259 (class 1259 OID 17479)
-- Name: transporte_cotizaciondetalle; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_cotizaciondetalle (
    id integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    cantidad numeric(10,2) NOT NULL,
    precio numeric(10,2) NOT NULL,
    monto numeric(10,2) NOT NULL,
    markup numeric(5,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    cotizacion_id integer NOT NULL
);


ALTER TABLE transporte_cotizaciondetalle OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 17477)
-- Name: transporte_cotizaciondetalle_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_cotizaciondetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_cotizaciondetalle_id_seq OWNER TO postgres;

--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 258
-- Name: transporte_cotizaciondetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_cotizaciondetalle_id_seq OWNED BY transporte_cotizaciondetalle.id;


--
-- TOC entry 281 (class 1259 OID 17574)
-- Name: transporte_cotizaciondetalle_item; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_cotizaciondetalle_item (
    id integer NOT NULL,
    cotizaciondetalle_id integer NOT NULL,
    item_id integer NOT NULL
);


ALTER TABLE transporte_cotizaciondetalle_item OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 17572)
-- Name: transporte_cotizaciondetalle_item_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_cotizaciondetalle_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_cotizaciondetalle_item_id_seq OWNER TO postgres;

--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 280
-- Name: transporte_cotizaciondetalle_item_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_cotizaciondetalle_item_id_seq OWNED BY transporte_cotizaciondetalle_item.id;


--
-- TOC entry 261 (class 1259 OID 17487)
-- Name: transporte_item; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_item (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    tipo_item character varying(13) NOT NULL,
    unidad character varying(50) NOT NULL,
    costo numeric(10,4) NOT NULL,
    precio numeric(10,4) NOT NULL,
    descripcion_compra character varying(50) NOT NULL,
    descripcion_venta character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL
);


ALTER TABLE transporte_item OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 17485)
-- Name: transporte_item_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_item_id_seq OWNER TO postgres;

--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 260
-- Name: transporte_item_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_item_id_seq OWNED BY transporte_item.id;


--
-- TOC entry 263 (class 1259 OID 17495)
-- Name: transporte_itinerario; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_itinerario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    estatus character varying(10) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    cliente_id integer NOT NULL
);


ALTER TABLE transporte_itinerario OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 17493)
-- Name: transporte_itinerario_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_itinerario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_itinerario_id_seq OWNER TO postgres;

--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 262
-- Name: transporte_itinerario_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_itinerario_id_seq OWNED BY transporte_itinerario.id;


--
-- TOC entry 265 (class 1259 OID 17503)
-- Name: transporte_lugar; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_lugar (
    id integer NOT NULL,
    codigo character varying(3) NOT NULL,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    nombre character varying(50) NOT NULL,
    pais character varying(30) NOT NULL
);


ALTER TABLE transporte_lugar OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 17501)
-- Name: transporte_lugar_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_lugar_id_seq OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 264
-- Name: transporte_lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_lugar_id_seq OWNED BY transporte_lugar.id;


--
-- TOC entry 267 (class 1259 OID 17513)
-- Name: transporte_niveldeprecio; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_niveldeprecio (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    tipo character varying(10) NOT NULL,
    accion character varying(10) NOT NULL,
    valor numeric(5,2) NOT NULL,
    factor numeric(5,4),
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL
);


ALTER TABLE transporte_niveldeprecio OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 17511)
-- Name: transporte_niveldeprecio_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_niveldeprecio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_niveldeprecio_id_seq OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 266
-- Name: transporte_niveldeprecio_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_niveldeprecio_id_seq OWNED BY transporte_niveldeprecio.id;


--
-- TOC entry 269 (class 1259 OID 17521)
-- Name: transporte_parametro; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_parametro (
    id integer NOT NULL,
    annio integer NOT NULL,
    nombre character varying(25) NOT NULL,
    valor character varying(100) NOT NULL,
    unidad character varying(100) NOT NULL,
    orden integer NOT NULL,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL
);


ALTER TABLE transporte_parametro OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17519)
-- Name: transporte_parametro_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_parametro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_parametro_id_seq OWNER TO postgres;

--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 268
-- Name: transporte_parametro_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_parametro_id_seq OWNED BY transporte_parametro.id;


--
-- TOC entry 271 (class 1259 OID 17529)
-- Name: transporte_tipodevehiculo; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_tipodevehiculo (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    slug character varying(50) NOT NULL,
    rendimiento integer NOT NULL,
    costo_por_dia numeric(10,2) NOT NULL,
    costo_por_km numeric(10,2) NOT NULL,
    capacidad_nominal integer NOT NULL,
    capacidad_real integer NOT NULL,
    galones_tanque numeric(6,2) NOT NULL,
    activo boolean NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL
);


ALTER TABLE transporte_tipodevehiculo OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 17527)
-- Name: transporte_tipodevehiculo_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_tipodevehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_tipodevehiculo_id_seq OWNER TO postgres;

--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 270
-- Name: transporte_tipodevehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_tipodevehiculo_id_seq OWNED BY transporte_tipodevehiculo.id;


--
-- TOC entry 273 (class 1259 OID 17537)
-- Name: transporte_tramo; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_tramo (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    codigo text NOT NULL,
    desde_hacia text NOT NULL,
    kms integer NOT NULL,
    hrs numeric(4,1) NOT NULL,
    codigo_desde character varying(7) NOT NULL,
    codigo_hacia character varying(7) NOT NULL
);


ALTER TABLE transporte_tramo OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 17548)
-- Name: transporte_tramo_desde_lugar; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_tramo_desde_lugar (
    id integer NOT NULL,
    tramo_id integer NOT NULL,
    lugar_id integer NOT NULL
);


ALTER TABLE transporte_tramo_desde_lugar OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 17546)
-- Name: transporte_tramo_desde_lugar_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_tramo_desde_lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_tramo_desde_lugar_id_seq OWNER TO postgres;

--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 274
-- Name: transporte_tramo_desde_lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_tramo_desde_lugar_id_seq OWNED BY transporte_tramo_desde_lugar.id;


--
-- TOC entry 277 (class 1259 OID 17556)
-- Name: transporte_tramo_hacia_lugar; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_tramo_hacia_lugar (
    id integer NOT NULL,
    tramo_id integer NOT NULL,
    lugar_id integer NOT NULL
);


ALTER TABLE transporte_tramo_hacia_lugar OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 17554)
-- Name: transporte_tramo_hacia_lugar_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_tramo_hacia_lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_tramo_hacia_lugar_id_seq OWNER TO postgres;

--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 276
-- Name: transporte_tramo_hacia_lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_tramo_hacia_lugar_id_seq OWNED BY transporte_tramo_hacia_lugar.id;


--
-- TOC entry 272 (class 1259 OID 17535)
-- Name: transporte_tramo_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_tramo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_tramo_id_seq OWNER TO postgres;

--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 272
-- Name: transporte_tramo_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_tramo_id_seq OWNED BY transporte_tramo.id;


--
-- TOC entry 279 (class 1259 OID 17564)
-- Name: transporte_vehiculo; Type: TABLE; Schema: tenant1; Owner: postgres
--

CREATE TABLE transporte_vehiculo (
    id integer NOT NULL,
    nombre character varying(5) NOT NULL,
    placa character varying(10) NOT NULL,
    chofer_fijo boolean NOT NULL,
    fecha_adquirido date,
    slug character varying(50) NOT NULL,
    creado timestamp with time zone NOT NULL,
    actualizado timestamp with time zone NOT NULL,
    tipo_id integer NOT NULL
);


ALTER TABLE transporte_vehiculo OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 17562)
-- Name: transporte_vehiculo_id_seq; Type: SEQUENCE; Schema: tenant1; Owner: postgres
--

CREATE SEQUENCE transporte_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transporte_vehiculo_id_seq OWNER TO postgres;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 278
-- Name: transporte_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant1; Owner: postgres
--

ALTER SEQUENCE transporte_vehiculo_id_seq OWNED BY transporte_vehiculo.id;


SET search_path = public, pg_catalog;

--
-- TOC entry 2304 (class 2604 OID 16865)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2305 (class 2604 OID 16875)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2303 (class 2604 OID 16857)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2306 (class 2604 OID 16883)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2307 (class 2604 OID 16893)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2308 (class 2604 OID 16901)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2311 (class 2604 OID 17004)
-- Name: clientes_cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes_cliente ALTER COLUMN id SET DEFAULT nextval('clientes_cliente_id_seq'::regclass);


--
-- TOC entry 2309 (class 2604 OID 16961)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2302 (class 2604 OID 16847)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2301 (class 2604 OID 16836)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2312 (class 2604 OID 17028)
-- Name: transporte_cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cliente ALTER COLUMN id SET DEFAULT nextval('transporte_cliente_id_seq'::regclass);


--
-- TOC entry 2313 (class 2604 OID 17041)
-- Name: transporte_conductor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_conductor ALTER COLUMN id SET DEFAULT nextval('transporte_conductor_id_seq'::regclass);


--
-- TOC entry 2314 (class 2604 OID 17052)
-- Name: transporte_cotizacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizacion ALTER COLUMN id SET DEFAULT nextval('transporte_cotizacion_id_seq'::regclass);


--
-- TOC entry 2315 (class 2604 OID 17060)
-- Name: transporte_cotizaciondetalle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle ALTER COLUMN id SET DEFAULT nextval('transporte_cotizaciondetalle_id_seq'::regclass);


--
-- TOC entry 2316 (class 2604 OID 17068)
-- Name: transporte_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_item ALTER COLUMN id SET DEFAULT nextval('transporte_item_id_seq'::regclass);


--
-- TOC entry 2317 (class 2604 OID 17076)
-- Name: transporte_itinerario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_itinerario ALTER COLUMN id SET DEFAULT nextval('transporte_itinerario_id_seq'::regclass);


--
-- TOC entry 2318 (class 2604 OID 17084)
-- Name: transporte_lugar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_lugar ALTER COLUMN id SET DEFAULT nextval('transporte_lugar_id_seq'::regclass);


--
-- TOC entry 2319 (class 2604 OID 17094)
-- Name: transporte_niveldeprecio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_niveldeprecio ALTER COLUMN id SET DEFAULT nextval('transporte_niveldeprecio_id_seq'::regclass);


--
-- TOC entry 2320 (class 2604 OID 17102)
-- Name: transporte_parametro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_parametro ALTER COLUMN id SET DEFAULT nextval('transporte_parametro_id_seq'::regclass);


--
-- TOC entry 2321 (class 2604 OID 17110)
-- Name: transporte_tipodevehiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_tipodevehiculo ALTER COLUMN id SET DEFAULT nextval('transporte_tipodevehiculo_id_seq'::regclass);


--
-- TOC entry 2322 (class 2604 OID 17118)
-- Name: transporte_tramo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo ALTER COLUMN id SET DEFAULT nextval('transporte_tramo_id_seq'::regclass);


--
-- TOC entry 2323 (class 2604 OID 17145)
-- Name: transporte_vehiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_vehiculo ALTER COLUMN id SET DEFAULT nextval('transporte_vehiculo_id_seq'::regclass);


SET search_path = tenant1, pg_catalog;

--
-- TOC entry 2327 (class 2604 OID 17301)
-- Name: auth_group id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2328 (class 2604 OID 17311)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2326 (class 2604 OID 17293)
-- Name: auth_permission id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2329 (class 2604 OID 17319)
-- Name: auth_user id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2330 (class 2604 OID 17329)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2331 (class 2604 OID 17337)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2332 (class 2604 OID 17397)
-- Name: django_admin_log id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2325 (class 2604 OID 17283)
-- Name: django_content_type id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2324 (class 2604 OID 17272)
-- Name: django_migrations id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2334 (class 2604 OID 17450)
-- Name: transporte_cliente id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cliente ALTER COLUMN id SET DEFAULT nextval('transporte_cliente_id_seq'::regclass);


--
-- TOC entry 2335 (class 2604 OID 17463)
-- Name: transporte_conductor id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_conductor ALTER COLUMN id SET DEFAULT nextval('transporte_conductor_id_seq'::regclass);


--
-- TOC entry 2336 (class 2604 OID 17474)
-- Name: transporte_cotizacion id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizacion ALTER COLUMN id SET DEFAULT nextval('transporte_cotizacion_id_seq'::regclass);


--
-- TOC entry 2337 (class 2604 OID 17482)
-- Name: transporte_cotizaciondetalle id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle ALTER COLUMN id SET DEFAULT nextval('transporte_cotizaciondetalle_id_seq'::regclass);


--
-- TOC entry 2348 (class 2604 OID 17577)
-- Name: transporte_cotizaciondetalle_item id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle_item ALTER COLUMN id SET DEFAULT nextval('transporte_cotizaciondetalle_item_id_seq'::regclass);


--
-- TOC entry 2338 (class 2604 OID 17490)
-- Name: transporte_item id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_item ALTER COLUMN id SET DEFAULT nextval('transporte_item_id_seq'::regclass);


--
-- TOC entry 2339 (class 2604 OID 17498)
-- Name: transporte_itinerario id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_itinerario ALTER COLUMN id SET DEFAULT nextval('transporte_itinerario_id_seq'::regclass);


--
-- TOC entry 2340 (class 2604 OID 17506)
-- Name: transporte_lugar id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_lugar ALTER COLUMN id SET DEFAULT nextval('transporte_lugar_id_seq'::regclass);


--
-- TOC entry 2341 (class 2604 OID 17516)
-- Name: transporte_niveldeprecio id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_niveldeprecio ALTER COLUMN id SET DEFAULT nextval('transporte_niveldeprecio_id_seq'::regclass);


--
-- TOC entry 2342 (class 2604 OID 17524)
-- Name: transporte_parametro id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_parametro ALTER COLUMN id SET DEFAULT nextval('transporte_parametro_id_seq'::regclass);


--
-- TOC entry 2343 (class 2604 OID 17532)
-- Name: transporte_tipodevehiculo id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tipodevehiculo ALTER COLUMN id SET DEFAULT nextval('transporte_tipodevehiculo_id_seq'::regclass);


--
-- TOC entry 2344 (class 2604 OID 17540)
-- Name: transporte_tramo id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo ALTER COLUMN id SET DEFAULT nextval('transporte_tramo_id_seq'::regclass);


--
-- TOC entry 2345 (class 2604 OID 17551)
-- Name: transporte_tramo_desde_lugar id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_desde_lugar ALTER COLUMN id SET DEFAULT nextval('transporte_tramo_desde_lugar_id_seq'::regclass);


--
-- TOC entry 2346 (class 2604 OID 17559)
-- Name: transporte_tramo_hacia_lugar id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_hacia_lugar ALTER COLUMN id SET DEFAULT nextval('transporte_tramo_hacia_lugar_id_seq'::regclass);


--
-- TOC entry 2347 (class 2604 OID 17567)
-- Name: transporte_vehiculo id; Type: DEFAULT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_vehiculo ALTER COLUMN id SET DEFAULT nextval('transporte_vehiculo_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2775 (class 0 OID 16862)
-- Dependencies: 193
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 192
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2777 (class 0 OID 16872)
-- Dependencies: 195
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 194
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2773 (class 0 OID 16854)
-- Dependencies: 191
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add cliente	1	add_cliente
2	Can change cliente	1	change_cliente
3	Can delete cliente	1	delete_cliente
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can add Token	8	add_token
23	Can change Token	8	change_token
24	Can delete Token	8	delete_token
25	Can add Tipo de Vehículo	9	add_tipodevehiculo
26	Can change Tipo de Vehículo	9	change_tipodevehiculo
27	Can delete Tipo de Vehículo	9	delete_tipodevehiculo
28	Can add Parámetro	10	add_parametro
29	Can change Parámetro	10	change_parametro
30	Can delete Parámetro	10	delete_parametro
31	Can add Item	11	add_item
32	Can change Item	11	change_item
33	Can delete Item	11	delete_item
34	Can add Nivel de Precio	12	add_niveldeprecio
35	Can change Nivel de Precio	12	change_niveldeprecio
36	Can delete Nivel de Precio	12	delete_niveldeprecio
37	Can add Cliente	13	add_cliente
38	Can change Cliente	13	change_cliente
39	Can delete Cliente	13	delete_cliente
40	Can add Itinerario	14	add_itinerario
41	Can change Itinerario	14	change_itinerario
42	Can delete Itinerario	14	delete_itinerario
43	Can add Cotización	15	add_cotizacion
44	Can change Cotización	15	change_cotizacion
45	Can delete Cotización	15	delete_cotizacion
46	Can add Detalle de Cotización	16	add_cotizaciondetalle
47	Can change Detalle de Cotización	16	change_cotizaciondetalle
48	Can delete Detalle de Cotización	16	delete_cotizaciondetalle
49	Can add vehiculo	17	add_vehiculo
50	Can change vehiculo	17	change_vehiculo
51	Can delete vehiculo	17	delete_vehiculo
52	Can add lugar	18	add_lugar
53	Can change lugar	18	change_lugar
54	Can delete lugar	18	delete_lugar
55	Can add tramo	19	add_tramo
56	Can change tramo	19	change_tramo
57	Can delete tramo	19	delete_tramo
58	Can add conductor	20	add_conductor
59	Can change conductor	20	change_conductor
60	Can delete conductor	20	delete_conductor
\.


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 190
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 60, true);


--
-- TOC entry 2779 (class 0 OID 16880)
-- Dependencies: 197
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$U1z7WhSZc871$n8W7PyS8MuHmJWlf25ZS+FsZlu9SQEvuSAJmI4rzJ0k=	2017-02-12 16:12:11.599706-06	t	adalberto			bertovega@gmail.com	t	t	2017-02-12 13:27:02.316602-06
\.


--
-- TOC entry 2781 (class 0 OID 16890)
-- Dependencies: 199
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 198
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 196
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 2783 (class 0 OID 16898)
-- Dependencies: 201
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2786 (class 0 OID 16981)
-- Dependencies: 204
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 17001)
-- Dependencies: 206
-- Data for Name: clientes_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clientes_cliente (id, domain_url, schema_name, nombre, pagado_hasta, en_prueba, creado) FROM stdin;
1	mistenants.com	public	Public, Inc.	2017-12-12	f	2017-02-12
2	demo.mistenants.com	tenant1	Empresa Demo, Inc.	2017-12-31	t	2017-02-12
\.


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 205
-- Name: clientes_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clientes_cliente_id_seq', 2, true);


--
-- TOC entry 2785 (class 0 OID 16958)
-- Dependencies: 203
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 2771 (class 0 OID 16844)
-- Dependencies: 189
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	clientes	cliente
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
8	authtoken	token
9	transporte	tipodevehiculo
10	transporte	parametro
11	transporte	item
12	transporte	niveldeprecio
13	transporte	cliente
14	transporte	itinerario
15	transporte	cotizacion
16	transporte	cotizaciondetalle
17	transporte	vehiculo
18	transporte	lugar
19	transporte	tramo
20	transporte	conductor
\.


--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 20, true);


--
-- TOC entry 2769 (class 0 OID 16833)
-- Dependencies: 187
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-02-12 13:09:29.303814-06
2	auth	0001_initial	2017-02-12 13:09:29.456816-06
3	admin	0001_initial	2017-02-12 13:09:29.488085-06
4	admin	0002_logentry_remove_auto_add	2017-02-12 13:09:29.503682-06
5	contenttypes	0002_remove_content_type_name	2017-02-12 13:09:29.541443-06
6	auth	0002_alter_permission_name_max_length	2017-02-12 13:09:29.557071-06
7	auth	0003_alter_user_email_max_length	2017-02-12 13:09:29.572696-06
8	auth	0004_alter_user_username_opts	2017-02-12 13:09:29.572696-06
9	auth	0005_alter_user_last_login_null	2017-02-12 13:09:29.588323-06
10	auth	0006_require_contenttypes_0002	2017-02-12 13:09:29.588323-06
11	auth	0007_alter_validators_add_error_messages	2017-02-12 13:09:29.603949-06
12	authtoken	0001_initial	2017-02-12 13:09:29.641206-06
13	authtoken	0002_auto_20160226_1747	2017-02-12 13:09:29.688539-06
14	clientes	0001_initial	2017-02-12 13:09:29.7198-06
15	sessions	0001_initial	2017-02-12 13:09:29.757574-06
16	transporte	0001_initial	2017-02-12 13:09:30.289321-06
17	auth	0008_alter_user_username_max_length	2017-03-30 22:35:28.421612-06
18	transporte	0002_auto_20170213_0838	2017-03-30 22:35:28.444627-06
19	transporte	0003_auto_20170213_1409	2017-03-30 22:35:28.531685-06
20	transporte	0004_auto_20170214_1113	2017-03-30 22:35:28.646761-06
21	transporte	0005_auto_20170214_1117	2017-03-30 22:35:28.834885-06
22	transporte	0006_auto_20170214_1137	2017-03-30 22:35:29.030014-06
23	transporte	0007_auto_20170214_1139	2017-03-30 22:35:29.070041-06
24	transporte	0008_auto_20170214_1744	2017-03-30 22:35:29.138086-06
25	transporte	0009_remove_tramo_nombre	2017-03-30 22:35:29.155097-06
26	transporte	0010_auto_20170214_1851	2017-03-30 22:35:29.187118-06
27	transporte	0011_auto_20170214_1853	2017-03-30 22:35:29.245157-06
28	transporte	0012_auto_20170215_1020	2017-03-30 22:35:30.108759-06
29	transporte	0013_auto_20170215_1119	2017-03-30 22:35:30.443002-06
30	transporte	0014_auto_20170215_1207	2017-03-30 22:35:31.142009-06
31	transporte	0015_auto_20170215_1745	2017-03-30 22:35:31.423206-06
32	transporte	0016_auto_20170215_1934	2017-03-30 22:35:31.674372-06
33	transporte	0017_auto_20170216_2054	2017-03-30 22:35:31.966566-06
34	transporte	0018_auto_20170216_2159	2017-03-30 22:35:32.37984-06
35	transporte	0019_auto_20170216_2210	2017-03-30 22:35:32.576973-06
36	transporte	0020_auto_20170216_2231	2017-03-30 22:35:32.702566-06
37	transporte	0021_auto_20170301_0825	2017-03-30 22:35:32.729584-06
\.


--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 37, true);


--
-- TOC entry 2789 (class 0 OID 17013)
-- Dependencies: 207
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
vu0qhlwh2ef92qlzskpyy8ln3x0e79ev	ZGZmMDNiNmYyZTA3NTBjOTBhNzMxNDFmYTA1ZmVhM2Q5ZTI1MjFjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyN2MzNmMxOWRkYjY1Y2M1YjQ0NTRkMGFjOTUzYzMyNTRiMjI0ZDciLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-02-26 16:12:11.599706-06
\.


--
-- TOC entry 2791 (class 0 OID 17025)
-- Dependencies: 209
-- Data for Name: transporte_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_cliente (id, nombre, contacto, slug, email, tel, ciudad, pais, rtn, creado, actualizado, nivel_de_precio_id) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 208
-- Name: transporte_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_cliente_id_seq', 1, false);


--
-- TOC entry 2793 (class 0 OID 17038)
-- Dependencies: 211
-- Data for Name: transporte_conductor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_conductor (id, nombre, slug, creado, actualizado, identidad, telefono, empleado, incentivo_por_dia) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 210
-- Name: transporte_conductor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_conductor_id_seq', 1, false);


--
-- TOC entry 2795 (class 0 OID 17049)
-- Dependencies: 213
-- Data for Name: transporte_cotizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_cotizacion (id, nombre, slug, fecha_vence, creado, actualizado, itinerario_id, nivel_de_precio_id, subtotal, total, utilidad) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 212
-- Name: transporte_cotizacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_cotizacion_id_seq', 1, false);


--
-- TOC entry 2797 (class 0 OID 17057)
-- Dependencies: 215
-- Data for Name: transporte_cotizaciondetalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_cotizaciondetalle (id, slug, cantidad, creado, actualizado, cotizacion_id, descripcion, nivel_de_precio_id, item_id, costo, markup, monto, total) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 214
-- Name: transporte_cotizaciondetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_cotizaciondetalle_id_seq', 1, false);


--
-- TOC entry 2799 (class 0 OID 17065)
-- Dependencies: 217
-- Data for Name: transporte_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_item (id, nombre, slug, tipo_item, unidad, costo, precio, descripcion_compra, descripcion_venta, creado, actualizado) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 216
-- Name: transporte_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_item_id_seq', 1, false);


--
-- TOC entry 2801 (class 0 OID 17073)
-- Dependencies: 219
-- Data for Name: transporte_itinerario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_itinerario (id, nombre, slug, fecha_desde, fecha_hasta, estatus, creado, actualizado, cliente_id, nivel_de_precio_id) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 218
-- Name: transporte_itinerario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_itinerario_id_seq', 1, false);


--
-- TOC entry 2803 (class 0 OID 17081)
-- Dependencies: 221
-- Data for Name: transporte_lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_lugar (id, codigo, slug, creado, actualizado, nombre, pais, zona) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 220
-- Name: transporte_lugar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_lugar_id_seq', 1, false);


--
-- TOC entry 2805 (class 0 OID 17091)
-- Dependencies: 223
-- Data for Name: transporte_niveldeprecio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_niveldeprecio (id, nombre, slug, tipo, accion, valor, factor, creado, actualizado) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 222
-- Name: transporte_niveldeprecio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_niveldeprecio_id_seq', 1, false);


--
-- TOC entry 2807 (class 0 OID 17099)
-- Dependencies: 225
-- Data for Name: transporte_parametro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_parametro (id, annio, nombre, valor, unidad, orden, slug, creado, actualizado) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 224
-- Name: transporte_parametro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_parametro_id_seq', 1, false);


--
-- TOC entry 2809 (class 0 OID 17107)
-- Dependencies: 227
-- Data for Name: transporte_tipodevehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_tipodevehiculo (id, nombre, slug, rendimiento, costo_por_dia, costo_por_km, capacidad_nominal, capacidad_real, galones_tanque, activo, creado, actualizado) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 226
-- Name: transporte_tipodevehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_tipodevehiculo_id_seq', 1, false);


--
-- TOC entry 2811 (class 0 OID 17115)
-- Dependencies: 229
-- Data for Name: transporte_tramo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_tramo (id, slug, creado, actualizado, desde_hacia, codigo, desde_lugar_id, hacia_lugar_id, descripcion, hrs, kms, cruza_frontera, zona_destino) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 228
-- Name: transporte_tramo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_tramo_id_seq', 1, false);


--
-- TOC entry 2813 (class 0 OID 17142)
-- Dependencies: 231
-- Data for Name: transporte_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_vehiculo (id, nombre, placa, chofer_fijo, fecha_adquirido, slug, creado, actualizado, tipo_id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 230
-- Name: transporte_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_vehiculo_id_seq', 1, false);


SET search_path = tenant1, pg_catalog;

--
-- TOC entry 2821 (class 0 OID 17298)
-- Dependencies: 239
-- Data for Name: auth_group; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 238
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2823 (class 0 OID 17308)
-- Dependencies: 241
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 240
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2819 (class 0 OID 17290)
-- Dependencies: 237
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add cliente	1	add_cliente
2	Can change cliente	1	change_cliente
3	Can delete cliente	1	delete_cliente
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can add Token	8	add_token
23	Can change Token	8	change_token
24	Can delete Token	8	delete_token
25	Can add Tipo de Vehículo	9	add_tipodevehiculo
26	Can change Tipo de Vehículo	9	change_tipodevehiculo
27	Can delete Tipo de Vehículo	9	delete_tipodevehiculo
28	Can add Parámetro	10	add_parametro
29	Can change Parámetro	10	change_parametro
30	Can delete Parámetro	10	delete_parametro
31	Can add Item	11	add_item
32	Can change Item	11	change_item
33	Can delete Item	11	delete_item
34	Can add Nivel de Precio	12	add_niveldeprecio
35	Can change Nivel de Precio	12	change_niveldeprecio
36	Can delete Nivel de Precio	12	delete_niveldeprecio
37	Can add Cliente	13	add_cliente
38	Can change Cliente	13	change_cliente
39	Can delete Cliente	13	delete_cliente
40	Can add Itinerario	14	add_itinerario
41	Can change Itinerario	14	change_itinerario
42	Can delete Itinerario	14	delete_itinerario
43	Can add Cotización	15	add_cotizacion
44	Can change Cotización	15	change_cotizacion
45	Can delete Cotización	15	delete_cotizacion
46	Can add Detalle de Cotización	16	add_cotizaciondetalle
47	Can change Detalle de Cotización	16	change_cotizaciondetalle
48	Can delete Detalle de Cotización	16	delete_cotizaciondetalle
49	Can add vehiculo	17	add_vehiculo
50	Can change vehiculo	17	change_vehiculo
51	Can delete vehiculo	17	delete_vehiculo
52	Can add lugar	18	add_lugar
53	Can change lugar	18	change_lugar
54	Can delete lugar	18	delete_lugar
55	Can add tramo	19	add_tramo
56	Can change tramo	19	change_tramo
57	Can delete tramo	19	delete_tramo
58	Can add conductor	20	add_conductor
59	Can change conductor	20	change_conductor
60	Can delete conductor	20	delete_conductor
\.


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 236
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 60, true);


--
-- TOC entry 2825 (class 0 OID 17316)
-- Dependencies: 243
-- Data for Name: auth_user; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$5n0aZGDdfwur$C75Qv5v0jfB1Rvzbs1wluf2yL3GkeD62hLMW8j0eUMo=	2017-02-12 13:22:51.965776-06	t	adalberto			bertovega@gmail.com	t	t	2017-02-12 13:19:48.333395-06
\.


--
-- TOC entry 2827 (class 0 OID 17326)
-- Dependencies: 245
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 244
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 242
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 2829 (class 0 OID 17334)
-- Dependencies: 247
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 246
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2832 (class 0 OID 17417)
-- Dependencies: 250
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 17394)
-- Dependencies: 249
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-02-13 13:56:15.515914-06	1	Coaster	1	Añadido.	9	1
\.


--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 248
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, true);


--
-- TOC entry 2817 (class 0 OID 17280)
-- Dependencies: 235
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	clientes	cliente
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
8	authtoken	token
9	transporte	tipodevehiculo
10	transporte	parametro
11	transporte	item
12	transporte	niveldeprecio
13	transporte	cliente
14	transporte	itinerario
15	transporte	cotizacion
16	transporte	cotizaciondetalle
17	transporte	vehiculo
18	transporte	lugar
19	transporte	tramo
20	transporte	conductor
\.


--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 20, true);


--
-- TOC entry 2815 (class 0 OID 17269)
-- Dependencies: 233
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-02-12 13:16:25.959616-06
2	auth	0001_initial	2017-02-12 13:16:26.112946-06
3	admin	0001_initial	2017-02-12 13:16:26.159836-06
4	admin	0002_logentry_remove_auto_add	2017-02-12 13:16:26.17545-06
5	contenttypes	0002_remove_content_type_name	2017-02-12 13:16:26.213215-06
6	auth	0002_alter_permission_name_max_length	2017-02-12 13:16:26.22884-06
7	auth	0003_alter_user_email_max_length	2017-02-12 13:16:26.22884-06
8	auth	0004_alter_user_username_opts	2017-02-12 13:16:26.244465-06
9	auth	0005_alter_user_last_login_null	2017-02-12 13:16:26.260092-06
10	auth	0006_require_contenttypes_0002	2017-02-12 13:16:26.260092-06
11	auth	0007_alter_validators_add_error_messages	2017-02-12 13:16:26.275718-06
12	authtoken	0001_initial	2017-02-12 13:16:26.313038-06
13	authtoken	0002_auto_20160226_1747	2017-02-12 13:16:26.359899-06
14	clientes	0001_initial	2017-02-12 13:16:26.359899-06
15	sessions	0001_initial	2017-02-12 13:16:26.397665-06
16	transporte	0001_initial	2017-02-12 13:16:26.929865-06
\.


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 232
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 16, true);


--
-- TOC entry 2833 (class 0 OID 17435)
-- Dependencies: 251
-- Data for Name: django_session; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
dwfp2k6cxh3uz9siq9lq8re5j33nhcm9	NTI4MzdhNGZkNjlkMmU3M2ZkM2Y0MjdmZDBiZjcyYTk4NTcwYjIwZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxOGE3N2U0OGRiNDQ5NTUxMWJhZjIzYWFhNWZiYzdlODhiMjYyOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-02-26 13:22:51.968276-06
\.


--
-- TOC entry 2835 (class 0 OID 17447)
-- Dependencies: 253
-- Data for Name: transporte_cliente; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_cliente (id, nombre, contacto, slug, email, tel, ciudad, pais, rtn, creado, actualizado, nivel_de_precio_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 252
-- Name: transporte_cliente_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_cliente_id_seq', 1, false);


--
-- TOC entry 2837 (class 0 OID 17460)
-- Dependencies: 255
-- Data for Name: transporte_conductor; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_conductor (id, nombre, slug, creado, actualizado, identidad, telefono, empleado, incentivo_por_dia) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 254
-- Name: transporte_conductor_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_conductor_id_seq', 1, false);


--
-- TOC entry 2839 (class 0 OID 17471)
-- Dependencies: 257
-- Data for Name: transporte_cotizacion; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_cotizacion (id, nombre, slug, fecha_vence, subtotal, markup, total, creado, actualizado, itinerario_id) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 256
-- Name: transporte_cotizacion_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_cotizacion_id_seq', 1, false);


--
-- TOC entry 2841 (class 0 OID 17479)
-- Dependencies: 259
-- Data for Name: transporte_cotizaciondetalle; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_cotizaciondetalle (id, descripcion, slug, cantidad, precio, monto, markup, total, creado, actualizado, cotizacion_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 258
-- Name: transporte_cotizaciondetalle_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_cotizaciondetalle_id_seq', 1, false);


--
-- TOC entry 2863 (class 0 OID 17574)
-- Dependencies: 281
-- Data for Name: transporte_cotizaciondetalle_item; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_cotizaciondetalle_item (id, cotizaciondetalle_id, item_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 280
-- Name: transporte_cotizaciondetalle_item_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_cotizaciondetalle_item_id_seq', 1, false);


--
-- TOC entry 2843 (class 0 OID 17487)
-- Dependencies: 261
-- Data for Name: transporte_item; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_item (id, nombre, slug, tipo_item, unidad, costo, precio, descripcion_compra, descripcion_venta, creado, actualizado) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 260
-- Name: transporte_item_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_item_id_seq', 1, false);


--
-- TOC entry 2845 (class 0 OID 17495)
-- Dependencies: 263
-- Data for Name: transporte_itinerario; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_itinerario (id, nombre, slug, fecha_desde, fecha_hasta, estatus, creado, actualizado, cliente_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 262
-- Name: transporte_itinerario_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_itinerario_id_seq', 1, false);


--
-- TOC entry 2847 (class 0 OID 17503)
-- Dependencies: 265
-- Data for Name: transporte_lugar; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_lugar (id, codigo, slug, creado, actualizado, nombre, pais) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 264
-- Name: transporte_lugar_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_lugar_id_seq', 1, false);


--
-- TOC entry 2849 (class 0 OID 17513)
-- Dependencies: 267
-- Data for Name: transporte_niveldeprecio; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_niveldeprecio (id, nombre, slug, tipo, accion, valor, factor, creado, actualizado) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 266
-- Name: transporte_niveldeprecio_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_niveldeprecio_id_seq', 1, false);


--
-- TOC entry 2851 (class 0 OID 17521)
-- Dependencies: 269
-- Data for Name: transporte_parametro; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_parametro (id, annio, nombre, valor, unidad, orden, slug, creado, actualizado) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 268
-- Name: transporte_parametro_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_parametro_id_seq', 1, false);


--
-- TOC entry 2853 (class 0 OID 17529)
-- Dependencies: 271
-- Data for Name: transporte_tipodevehiculo; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_tipodevehiculo (id, nombre, slug, rendimiento, costo_por_dia, costo_por_km, capacidad_nominal, capacidad_real, galones_tanque, activo, creado, actualizado) FROM stdin;
1	Coaster	coaster	17	1100.00	8.00	29	26	22.50	t	2017-02-13 13:56:15.511913-06	2017-02-13 13:56:15.511913-06
\.


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 270
-- Name: transporte_tipodevehiculo_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_tipodevehiculo_id_seq', 1, true);


--
-- TOC entry 2855 (class 0 OID 17537)
-- Dependencies: 273
-- Data for Name: transporte_tramo; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_tramo (id, nombre, slug, creado, actualizado, codigo, desde_hacia, kms, hrs, codigo_desde, codigo_hacia) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 17548)
-- Dependencies: 275
-- Data for Name: transporte_tramo_desde_lugar; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_tramo_desde_lugar (id, tramo_id, lugar_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 274
-- Name: transporte_tramo_desde_lugar_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_tramo_desde_lugar_id_seq', 1, false);


--
-- TOC entry 2859 (class 0 OID 17556)
-- Dependencies: 277
-- Data for Name: transporte_tramo_hacia_lugar; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_tramo_hacia_lugar (id, tramo_id, lugar_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 276
-- Name: transporte_tramo_hacia_lugar_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_tramo_hacia_lugar_id_seq', 1, false);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 272
-- Name: transporte_tramo_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_tramo_id_seq', 1, false);


--
-- TOC entry 2861 (class 0 OID 17564)
-- Dependencies: 279
-- Data for Name: transporte_vehiculo; Type: TABLE DATA; Schema: tenant1; Owner: postgres
--

COPY transporte_vehiculo (id, nombre, placa, chofer_fijo, fecha_adquirido, slug, creado, actualizado, tipo_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 278
-- Name: transporte_vehiculo_id_seq; Type: SEQUENCE SET; Schema: tenant1; Owner: postgres
--

SELECT pg_catalog.setval('transporte_vehiculo_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 2362 (class 2606 OID 16869)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2368 (class 2606 OID 16924)
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2370 (class 2606 OID 16877)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 16867)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 16910)
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2359 (class 2606 OID 16859)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 16895)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 16939)
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2372 (class 2606 OID 16885)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 16903)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 16953)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2375 (class 2606 OID 17690)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2394 (class 2606 OID 16985)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 2396 (class 2606 OID 16987)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 2399 (class 2606 OID 17008)
-- Name: clientes_cliente clientes_cliente_domain_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes_cliente
    ADD CONSTRAINT clientes_cliente_domain_url_key UNIQUE (domain_url);


--
-- TOC entry 2401 (class 2606 OID 17006)
-- Name: clientes_cliente clientes_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes_cliente
    ADD CONSTRAINT clientes_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 17010)
-- Name: clientes_cliente clientes_cliente_schema_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes_cliente
    ADD CONSTRAINT clientes_cliente_schema_name_key UNIQUE (schema_name);


--
-- TOC entry 2391 (class 2606 OID 16967)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 16851)
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2354 (class 2606 OID 16849)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 16841)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 17020)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2413 (class 2606 OID 17035)
-- Name: transporte_cliente transporte_cliente_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cliente
    ADD CONSTRAINT transporte_cliente_email_key UNIQUE (email);


--
-- TOC entry 2415 (class 2606 OID 17033)
-- Name: transporte_cliente transporte_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cliente
    ADD CONSTRAINT transporte_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 17046)
-- Name: transporte_conductor transporte_conductor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_conductor
    ADD CONSTRAINT transporte_conductor_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 17054)
-- Name: transporte_cotizacion transporte_cotizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizacion
    ADD CONSTRAINT transporte_cotizacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 17062)
-- Name: transporte_cotizaciondetalle transporte_cotizaciondetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle
    ADD CONSTRAINT transporte_cotizaciondetalle_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 17070)
-- Name: transporte_item transporte_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_item
    ADD CONSTRAINT transporte_item_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 17078)
-- Name: transporte_itinerario transporte_itinerario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_itinerario
    ADD CONSTRAINT transporte_itinerario_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 17088)
-- Name: transporte_lugar transporte_lugar_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_lugar
    ADD CONSTRAINT transporte_lugar_codigo_key UNIQUE (codigo);


--
-- TOC entry 2449 (class 2606 OID 17086)
-- Name: transporte_lugar transporte_lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_lugar
    ADD CONSTRAINT transporte_lugar_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 17096)
-- Name: transporte_niveldeprecio transporte_niveldeprecio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_niveldeprecio
    ADD CONSTRAINT transporte_niveldeprecio_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 17149)
-- Name: transporte_parametro transporte_parametro_annio_82a8303b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_parametro
    ADD CONSTRAINT transporte_parametro_annio_82a8303b_uniq UNIQUE (annio, nombre);


--
-- TOC entry 2459 (class 2606 OID 17104)
-- Name: transporte_parametro transporte_parametro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_parametro
    ADD CONSTRAINT transporte_parametro_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 17112)
-- Name: transporte_tipodevehiculo transporte_tipodevehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_tipodevehiculo
    ADD CONSTRAINT transporte_tipodevehiculo_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 17740)
-- Name: transporte_tramo transporte_tramo_desde_lugar_id_e7586ee2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo
    ADD CONSTRAINT transporte_tramo_desde_lugar_id_e7586ee2_uniq UNIQUE (desde_lugar_id, hacia_lugar_id);


--
-- TOC entry 2471 (class 2606 OID 17123)
-- Name: transporte_tramo transporte_tramo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo
    ADD CONSTRAINT transporte_tramo_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 17147)
-- Name: transporte_vehiculo transporte_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_vehiculo
    ADD CONSTRAINT transporte_vehiculo_pkey PRIMARY KEY (id);


SET search_path = tenant1, pg_catalog;

--
-- TOC entry 2491 (class 2606 OID 17305)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2497 (class 2606 OID 17360)
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2499 (class 2606 OID 17313)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 17303)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 17346)
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2488 (class 2606 OID 17295)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 17331)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 17375)
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2501 (class 2606 OID 17321)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 17339)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 17389)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2504 (class 2606 OID 17323)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2523 (class 2606 OID 17421)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 2525 (class 2606 OID 17423)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 2520 (class 2606 OID 17403)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 17287)
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2483 (class 2606 OID 17285)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 17277)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 17442)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2534 (class 2606 OID 17457)
-- Name: transporte_cliente transporte_cliente_email_key; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cliente
    ADD CONSTRAINT transporte_cliente_email_key UNIQUE (email);


--
-- TOC entry 2536 (class 2606 OID 17455)
-- Name: transporte_cliente transporte_cliente_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cliente
    ADD CONSTRAINT transporte_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 17468)
-- Name: transporte_conductor transporte_conductor_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_conductor
    ADD CONSTRAINT transporte_conductor_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 17476)
-- Name: transporte_cotizacion transporte_cotizacion_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizacion
    ADD CONSTRAINT transporte_cotizacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 17672)
-- Name: transporte_cotizaciondetalle_item transporte_cotizaciondetalle_cotizaciondetalle_id_7e880c54_uniq; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle_item
    ADD CONSTRAINT transporte_cotizaciondetalle_cotizaciondetalle_id_7e880c54_uniq UNIQUE (cotizaciondetalle_id, item_id);


--
-- TOC entry 2608 (class 2606 OID 17579)
-- Name: transporte_cotizaciondetalle_item transporte_cotizaciondetalle_item_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle_item
    ADD CONSTRAINT transporte_cotizaciondetalle_item_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 17484)
-- Name: transporte_cotizaciondetalle transporte_cotizaciondetalle_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle
    ADD CONSTRAINT transporte_cotizaciondetalle_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 17492)
-- Name: transporte_item transporte_item_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_item
    ADD CONSTRAINT transporte_item_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 17500)
-- Name: transporte_itinerario transporte_itinerario_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_itinerario
    ADD CONSTRAINT transporte_itinerario_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 17510)
-- Name: transporte_lugar transporte_lugar_codigo_key; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_lugar
    ADD CONSTRAINT transporte_lugar_codigo_key UNIQUE (codigo);


--
-- TOC entry 2566 (class 2606 OID 17508)
-- Name: transporte_lugar transporte_lugar_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_lugar
    ADD CONSTRAINT transporte_lugar_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 17518)
-- Name: transporte_niveldeprecio transporte_niveldeprecio_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_niveldeprecio
    ADD CONSTRAINT transporte_niveldeprecio_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 17571)
-- Name: transporte_parametro transporte_parametro_annio_82a8303b_uniq; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_parametro
    ADD CONSTRAINT transporte_parametro_annio_82a8303b_uniq UNIQUE (annio, nombre);


--
-- TOC entry 2576 (class 2606 OID 17526)
-- Name: transporte_parametro transporte_parametro_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_parametro
    ADD CONSTRAINT transporte_parametro_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 17534)
-- Name: transporte_tipodevehiculo transporte_tipodevehiculo_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tipodevehiculo
    ADD CONSTRAINT transporte_tipodevehiculo_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 17553)
-- Name: transporte_tramo_desde_lugar transporte_tramo_desde_lugar_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_desde_lugar
    ADD CONSTRAINT transporte_tramo_desde_lugar_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 17636)
-- Name: transporte_tramo_desde_lugar transporte_tramo_desde_lugar_tramo_id_bc1d5753_uniq; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_desde_lugar
    ADD CONSTRAINT transporte_tramo_desde_lugar_tramo_id_bc1d5753_uniq UNIQUE (tramo_id, lugar_id);


--
-- TOC entry 2595 (class 2606 OID 17561)
-- Name: transporte_tramo_hacia_lugar transporte_tramo_hacia_lugar_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_hacia_lugar
    ADD CONSTRAINT transporte_tramo_hacia_lugar_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 17650)
-- Name: transporte_tramo_hacia_lugar transporte_tramo_hacia_lugar_tramo_id_4dfcb7b3_uniq; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_hacia_lugar
    ADD CONSTRAINT transporte_tramo_hacia_lugar_tramo_id_4dfcb7b3_uniq UNIQUE (tramo_id, lugar_id);


--
-- TOC entry 2584 (class 2606 OID 17545)
-- Name: transporte_tramo transporte_tramo_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo
    ADD CONSTRAINT transporte_tramo_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 17569)
-- Name: transporte_vehiculo transporte_vehiculo_pkey; Type: CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_vehiculo
    ADD CONSTRAINT transporte_vehiculo_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2360 (class 1259 OID 16912)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2365 (class 1259 OID 16925)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2366 (class 1259 OID 16926)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2355 (class 1259 OID 16911)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2376 (class 1259 OID 16941)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2377 (class 1259 OID 16940)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2382 (class 1259 OID 16955)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2383 (class 1259 OID 16954)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2373 (class 1259 OID 17691)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2392 (class 1259 OID 16993)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2397 (class 1259 OID 17011)
-- Name: clientes_cliente_domain_url_959a055a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX clientes_cliente_domain_url_959a055a_like ON clientes_cliente USING btree (domain_url varchar_pattern_ops);


--
-- TOC entry 2402 (class 1259 OID 17012)
-- Name: clientes_cliente_schema_name_97ed7abf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX clientes_cliente_schema_name_97ed7abf_like ON clientes_cliente USING btree (schema_name varchar_pattern_ops);


--
-- TOC entry 2388 (class 1259 OID 16978)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2389 (class 1259 OID 16979)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 17021)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 2408 (class 1259 OID 17022)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2409 (class 1259 OID 17167)
-- Name: transporte_cliente_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cliente_2dbcba41 ON transporte_cliente USING btree (slug);


--
-- TOC entry 2410 (class 1259 OID 17259)
-- Name: transporte_cliente_b8932be1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cliente_b8932be1 ON transporte_cliente USING btree (nivel_de_precio_id);


--
-- TOC entry 2411 (class 1259 OID 17169)
-- Name: transporte_cliente_email_17fd1b22_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cliente_email_17fd1b22_like ON transporte_cliente USING btree (email varchar_pattern_ops);


--
-- TOC entry 2416 (class 1259 OID 17168)
-- Name: transporte_cliente_slug_9fcb83db_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cliente_slug_9fcb83db_like ON transporte_cliente USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2417 (class 1259 OID 17170)
-- Name: transporte_conductor_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_conductor_2dbcba41 ON transporte_conductor USING btree (slug);


--
-- TOC entry 2420 (class 1259 OID 17171)
-- Name: transporte_conductor_slug_d2e157f6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_conductor_slug_d2e157f6_like ON transporte_conductor USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2421 (class 1259 OID 17172)
-- Name: transporte_cotizacion_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cotizacion_2dbcba41 ON transporte_cotizacion USING btree (slug);


--
-- TOC entry 2422 (class 1259 OID 17829)
-- Name: transporte_cotizacion_b8932be1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cotizacion_b8932be1 ON transporte_cotizacion USING btree (nivel_de_precio_id);


--
-- TOC entry 2423 (class 1259 OID 17253)
-- Name: transporte_cotizacion_bb257c07; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cotizacion_bb257c07 ON transporte_cotizacion USING btree (itinerario_id);


--
-- TOC entry 2426 (class 1259 OID 17173)
-- Name: transporte_cotizacion_slug_ffcd83fd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cotizacion_slug_ffcd83fd_like ON transporte_cotizacion USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2427 (class 1259 OID 17180)
-- Name: transporte_cotizaciondetalle_1b44b901; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_1b44b901 ON transporte_cotizaciondetalle USING btree (cotizacion_id);


--
-- TOC entry 2428 (class 1259 OID 17179)
-- Name: transporte_cotizaciondetalle_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_2dbcba41 ON transporte_cotizaciondetalle USING btree (slug);


--
-- TOC entry 2429 (class 1259 OID 17847)
-- Name: transporte_cotizaciondetalle_82bfda79; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_82bfda79 ON transporte_cotizaciondetalle USING btree (item_id);


--
-- TOC entry 2430 (class 1259 OID 17835)
-- Name: transporte_cotizaciondetalle_b8932be1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_b8932be1 ON transporte_cotizaciondetalle USING btree (nivel_de_precio_id);


--
-- TOC entry 2433 (class 1259 OID 17181)
-- Name: transporte_cotizaciondetalle_slug_5d351e93_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_slug_5d351e93_like ON transporte_cotizaciondetalle USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2434 (class 1259 OID 17182)
-- Name: transporte_item_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_item_2dbcba41 ON transporte_item USING btree (slug);


--
-- TOC entry 2437 (class 1259 OID 17183)
-- Name: transporte_item_slug_b4748372_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_item_slug_b4748372_like ON transporte_item USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2438 (class 1259 OID 17189)
-- Name: transporte_itinerario_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_itinerario_2dbcba41 ON transporte_itinerario USING btree (slug);


--
-- TOC entry 2439 (class 1259 OID 17190)
-- Name: transporte_itinerario_4a860110; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_itinerario_4a860110 ON transporte_itinerario USING btree (cliente_id);


--
-- TOC entry 2440 (class 1259 OID 17841)
-- Name: transporte_itinerario_b8932be1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_itinerario_b8932be1 ON transporte_itinerario USING btree (nivel_de_precio_id);


--
-- TOC entry 2443 (class 1259 OID 17191)
-- Name: transporte_itinerario_slug_50d37d6c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_itinerario_slug_50d37d6c_like ON transporte_itinerario USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2444 (class 1259 OID 17192)
-- Name: transporte_lugar_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_lugar_2dbcba41 ON transporte_lugar USING btree (slug);


--
-- TOC entry 2445 (class 1259 OID 17193)
-- Name: transporte_lugar_codigo_f176aa11_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_lugar_codigo_f176aa11_like ON transporte_lugar USING btree (codigo varchar_pattern_ops);


--
-- TOC entry 2450 (class 1259 OID 17194)
-- Name: transporte_lugar_slug_72d07ccd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_lugar_slug_72d07ccd_like ON transporte_lugar USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2451 (class 1259 OID 17195)
-- Name: transporte_niveldeprecio_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_niveldeprecio_2dbcba41 ON transporte_niveldeprecio USING btree (slug);


--
-- TOC entry 2454 (class 1259 OID 17196)
-- Name: transporte_niveldeprecio_slug_e74c9bd3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_niveldeprecio_slug_e74c9bd3_like ON transporte_niveldeprecio USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2455 (class 1259 OID 17197)
-- Name: transporte_parametro_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_parametro_2dbcba41 ON transporte_parametro USING btree (slug);


--
-- TOC entry 2460 (class 1259 OID 17198)
-- Name: transporte_parametro_slug_aa299f69_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_parametro_slug_aa299f69_like ON transporte_parametro USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2461 (class 1259 OID 17199)
-- Name: transporte_tipodevehiculo_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_tipodevehiculo_2dbcba41 ON transporte_tipodevehiculo USING btree (slug);


--
-- TOC entry 2464 (class 1259 OID 17200)
-- Name: transporte_tipodevehiculo_slug_615c15bb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_tipodevehiculo_slug_615c15bb_like ON transporte_tipodevehiculo USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2465 (class 1259 OID 17727)
-- Name: transporte_tramo_0bc858a8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_tramo_0bc858a8 ON transporte_tramo USING btree (desde_lugar_id);


--
-- TOC entry 2466 (class 1259 OID 17201)
-- Name: transporte_tramo_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_tramo_2dbcba41 ON transporte_tramo USING btree (slug);


--
-- TOC entry 2469 (class 1259 OID 17733)
-- Name: transporte_tramo_fa74b6ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_tramo_fa74b6ae ON transporte_tramo USING btree (hacia_lugar_id);


--
-- TOC entry 2472 (class 1259 OID 17202)
-- Name: transporte_tramo_slug_f7a3158e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_tramo_slug_f7a3158e_like ON transporte_tramo USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2473 (class 1259 OID 17236)
-- Name: transporte_vehiculo_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_vehiculo_2dbcba41 ON transporte_vehiculo USING btree (slug);


--
-- TOC entry 2474 (class 1259 OID 17237)
-- Name: transporte_vehiculo_d3c0c18a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_vehiculo_d3c0c18a ON transporte_vehiculo USING btree (tipo_id);


--
-- TOC entry 2477 (class 1259 OID 17238)
-- Name: transporte_vehiculo_slug_268f921f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transporte_vehiculo_slug_268f921f_like ON transporte_vehiculo USING btree (slug varchar_pattern_ops);


SET search_path = tenant1, pg_catalog;

--
-- TOC entry 2489 (class 1259 OID 17348)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2494 (class 1259 OID 17361)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2495 (class 1259 OID 17362)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 17347)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2505 (class 1259 OID 17377)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2506 (class 1259 OID 17376)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2511 (class 1259 OID 17391)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2512 (class 1259 OID 17390)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2502 (class 1259 OID 17363)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2521 (class 1259 OID 17429)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2517 (class 1259 OID 17414)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2518 (class 1259 OID 17415)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 2526 (class 1259 OID 17443)
-- Name: django_session_de54fa62; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 2529 (class 1259 OID 17444)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2530 (class 1259 OID 17589)
-- Name: transporte_cliente_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cliente_2dbcba41 ON transporte_cliente USING btree (slug);


--
-- TOC entry 2531 (class 1259 OID 17681)
-- Name: transporte_cliente_b8932be1; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cliente_b8932be1 ON transporte_cliente USING btree (nivel_de_precio_id);


--
-- TOC entry 2532 (class 1259 OID 17591)
-- Name: transporte_cliente_email_17fd1b22_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cliente_email_17fd1b22_like ON transporte_cliente USING btree (email varchar_pattern_ops);


--
-- TOC entry 2537 (class 1259 OID 17590)
-- Name: transporte_cliente_slug_9fcb83db_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cliente_slug_9fcb83db_like ON transporte_cliente USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2538 (class 1259 OID 17592)
-- Name: transporte_conductor_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_conductor_2dbcba41 ON transporte_conductor USING btree (slug);


--
-- TOC entry 2541 (class 1259 OID 17593)
-- Name: transporte_conductor_slug_d2e157f6_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_conductor_slug_d2e157f6_like ON transporte_conductor USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2542 (class 1259 OID 17594)
-- Name: transporte_cotizacion_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cotizacion_2dbcba41 ON transporte_cotizacion USING btree (slug);


--
-- TOC entry 2543 (class 1259 OID 17675)
-- Name: transporte_cotizacion_bb257c07; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cotizacion_bb257c07 ON transporte_cotizacion USING btree (itinerario_id);


--
-- TOC entry 2546 (class 1259 OID 17595)
-- Name: transporte_cotizacion_slug_ffcd83fd_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cotizacion_slug_ffcd83fd_like ON transporte_cotizacion USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2547 (class 1259 OID 17602)
-- Name: transporte_cotizaciondetalle_1b44b901; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_1b44b901 ON transporte_cotizaciondetalle USING btree (cotizacion_id);


--
-- TOC entry 2548 (class 1259 OID 17601)
-- Name: transporte_cotizaciondetalle_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_2dbcba41 ON transporte_cotizaciondetalle USING btree (slug);


--
-- TOC entry 2605 (class 1259 OID 17674)
-- Name: transporte_cotizaciondetalle_item_82bfda79; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_item_82bfda79 ON transporte_cotizaciondetalle_item USING btree (item_id);


--
-- TOC entry 2606 (class 1259 OID 17673)
-- Name: transporte_cotizaciondetalle_item_ff9174c2; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_item_ff9174c2 ON transporte_cotizaciondetalle_item USING btree (cotizaciondetalle_id);


--
-- TOC entry 2551 (class 1259 OID 17603)
-- Name: transporte_cotizaciondetalle_slug_5d351e93_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_cotizaciondetalle_slug_5d351e93_like ON transporte_cotizaciondetalle USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2552 (class 1259 OID 17604)
-- Name: transporte_item_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_item_2dbcba41 ON transporte_item USING btree (slug);


--
-- TOC entry 2555 (class 1259 OID 17605)
-- Name: transporte_item_slug_b4748372_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_item_slug_b4748372_like ON transporte_item USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2556 (class 1259 OID 17611)
-- Name: transporte_itinerario_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_itinerario_2dbcba41 ON transporte_itinerario USING btree (slug);


--
-- TOC entry 2557 (class 1259 OID 17612)
-- Name: transporte_itinerario_4a860110; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_itinerario_4a860110 ON transporte_itinerario USING btree (cliente_id);


--
-- TOC entry 2560 (class 1259 OID 17613)
-- Name: transporte_itinerario_slug_50d37d6c_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_itinerario_slug_50d37d6c_like ON transporte_itinerario USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2561 (class 1259 OID 17614)
-- Name: transporte_lugar_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_lugar_2dbcba41 ON transporte_lugar USING btree (slug);


--
-- TOC entry 2562 (class 1259 OID 17615)
-- Name: transporte_lugar_codigo_f176aa11_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_lugar_codigo_f176aa11_like ON transporte_lugar USING btree (codigo varchar_pattern_ops);


--
-- TOC entry 2567 (class 1259 OID 17616)
-- Name: transporte_lugar_slug_72d07ccd_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_lugar_slug_72d07ccd_like ON transporte_lugar USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2568 (class 1259 OID 17617)
-- Name: transporte_niveldeprecio_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_niveldeprecio_2dbcba41 ON transporte_niveldeprecio USING btree (slug);


--
-- TOC entry 2571 (class 1259 OID 17618)
-- Name: transporte_niveldeprecio_slug_e74c9bd3_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_niveldeprecio_slug_e74c9bd3_like ON transporte_niveldeprecio USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2572 (class 1259 OID 17619)
-- Name: transporte_parametro_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_parametro_2dbcba41 ON transporte_parametro USING btree (slug);


--
-- TOC entry 2577 (class 1259 OID 17620)
-- Name: transporte_parametro_slug_aa299f69_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_parametro_slug_aa299f69_like ON transporte_parametro USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2578 (class 1259 OID 17621)
-- Name: transporte_tipodevehiculo_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_tipodevehiculo_2dbcba41 ON transporte_tipodevehiculo USING btree (slug);


--
-- TOC entry 2581 (class 1259 OID 17622)
-- Name: transporte_tipodevehiculo_slug_615c15bb_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_tipodevehiculo_slug_615c15bb_like ON transporte_tipodevehiculo USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2582 (class 1259 OID 17623)
-- Name: transporte_tramo_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_tramo_2dbcba41 ON transporte_tramo USING btree (slug);


--
-- TOC entry 2586 (class 1259 OID 17638)
-- Name: transporte_tramo_desde_lugar_2dfa5f7f; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_tramo_desde_lugar_2dfa5f7f ON transporte_tramo_desde_lugar USING btree (lugar_id);


--
-- TOC entry 2587 (class 1259 OID 17637)
-- Name: transporte_tramo_desde_lugar_5ee89052; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_tramo_desde_lugar_5ee89052 ON transporte_tramo_desde_lugar USING btree (tramo_id);


--
-- TOC entry 2592 (class 1259 OID 17652)
-- Name: transporte_tramo_hacia_lugar_2dfa5f7f; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_tramo_hacia_lugar_2dfa5f7f ON transporte_tramo_hacia_lugar USING btree (lugar_id);


--
-- TOC entry 2593 (class 1259 OID 17651)
-- Name: transporte_tramo_hacia_lugar_5ee89052; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_tramo_hacia_lugar_5ee89052 ON transporte_tramo_hacia_lugar USING btree (tramo_id);


--
-- TOC entry 2585 (class 1259 OID 17624)
-- Name: transporte_tramo_slug_f7a3158e_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_tramo_slug_f7a3158e_like ON transporte_tramo USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2598 (class 1259 OID 17658)
-- Name: transporte_vehiculo_2dbcba41; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_vehiculo_2dbcba41 ON transporte_vehiculo USING btree (slug);


--
-- TOC entry 2599 (class 1259 OID 17659)
-- Name: transporte_vehiculo_d3c0c18a; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_vehiculo_d3c0c18a ON transporte_vehiculo USING btree (tipo_id);


--
-- TOC entry 2602 (class 1259 OID 17660)
-- Name: transporte_vehiculo_slug_268f921f_like; Type: INDEX; Schema: tenant1; Owner: postgres
--

CREATE INDEX transporte_vehiculo_slug_268f921f_like ON transporte_vehiculo USING btree (slug varchar_pattern_ops);


SET search_path = public, pg_catalog;

--
-- TOC entry 2611 (class 2606 OID 16918)
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2610 (class 2606 OID 16913)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2609 (class 2606 OID 16904)
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2613 (class 2606 OID 16933)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2612 (class 2606 OID 16928)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2615 (class 2606 OID 16947)
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2614 (class 2606 OID 16942)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2618 (class 2606 OID 16994)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2616 (class 2606 OID 16968)
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2617 (class 2606 OID 16973)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2619 (class 2606 OID 17260)
-- Name: transporte_cliente tran_nivel_de_precio_id_bf44849f_fk_transporte_niveldeprecio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cliente
    ADD CONSTRAINT tran_nivel_de_precio_id_bf44849f_fk_transporte_niveldeprecio_id FOREIGN KEY (nivel_de_precio_id) REFERENCES transporte_niveldeprecio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2621 (class 2606 OID 17853)
-- Name: transporte_cotizacion tran_nivel_de_precio_id_e174c337_fk_transporte_niveldeprecio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizacion
    ADD CONSTRAINT tran_nivel_de_precio_id_e174c337_fk_transporte_niveldeprecio_id FOREIGN KEY (nivel_de_precio_id) REFERENCES transporte_niveldeprecio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2626 (class 2606 OID 17863)
-- Name: transporte_itinerario tran_nivel_de_precio_id_e6cb70f6_fk_transporte_niveldeprecio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_itinerario
    ADD CONSTRAINT tran_nivel_de_precio_id_e6cb70f6_fk_transporte_niveldeprecio_id FOREIGN KEY (nivel_de_precio_id) REFERENCES transporte_niveldeprecio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2622 (class 2606 OID 17868)
-- Name: transporte_cotizaciondetalle tran_nivel_de_precio_id_f33976e4_fk_transporte_niveldeprecio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle
    ADD CONSTRAINT tran_nivel_de_precio_id_f33976e4_fk_transporte_niveldeprecio_id FOREIGN KEY (nivel_de_precio_id) REFERENCES transporte_niveldeprecio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2623 (class 2606 OID 17873)
-- Name: transporte_cotizaciondetalle transporte_c_cotizacion_id_570f0b32_fk_transporte_cotizacion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle
    ADD CONSTRAINT transporte_c_cotizacion_id_570f0b32_fk_transporte_cotizacion_id FOREIGN KEY (cotizacion_id) REFERENCES transporte_cotizacion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2620 (class 2606 OID 17254)
-- Name: transporte_cotizacion transporte_c_itinerario_id_28340401_fk_transporte_itinerario_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizacion
    ADD CONSTRAINT transporte_c_itinerario_id_28340401_fk_transporte_itinerario_id FOREIGN KEY (itinerario_id) REFERENCES transporte_itinerario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2624 (class 2606 OID 17878)
-- Name: transporte_cotizaciondetalle transporte_cotizaciondet_item_id_28f6a388_fk_transporte_item_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle
    ADD CONSTRAINT transporte_cotizaciondet_item_id_28f6a388_fk_transporte_item_id FOREIGN KEY (item_id) REFERENCES transporte_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2625 (class 2606 OID 17184)
-- Name: transporte_itinerario transporte_itinera_cliente_id_30bafc06_fk_transporte_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_itinerario
    ADD CONSTRAINT transporte_itinera_cliente_id_30bafc06_fk_transporte_cliente_id FOREIGN KEY (cliente_id) REFERENCES transporte_cliente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2627 (class 2606 OID 17741)
-- Name: transporte_tramo transporte_tramo_desde_lugar_id_45a82f9d_fk_transporte_lugar_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo
    ADD CONSTRAINT transporte_tramo_desde_lugar_id_45a82f9d_fk_transporte_lugar_id FOREIGN KEY (desde_lugar_id) REFERENCES transporte_lugar(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2628 (class 2606 OID 17746)
-- Name: transporte_tramo transporte_tramo_hacia_lugar_id_656557b9_fk_transporte_lugar_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo
    ADD CONSTRAINT transporte_tramo_hacia_lugar_id_656557b9_fk_transporte_lugar_id FOREIGN KEY (hacia_lugar_id) REFERENCES transporte_lugar(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2629 (class 2606 OID 17231)
-- Name: transporte_vehiculo transporte_veh_tipo_id_441a69ec_fk_transporte_tipodevehiculo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_vehiculo
    ADD CONSTRAINT transporte_veh_tipo_id_441a69ec_fk_transporte_tipodevehiculo_id FOREIGN KEY (tipo_id) REFERENCES transporte_tipodevehiculo(id) DEFERRABLE INITIALLY DEFERRED;


SET search_path = tenant1, pg_catalog;

--
-- TOC entry 2632 (class 2606 OID 17354)
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2631 (class 2606 OID 17349)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2630 (class 2606 OID 17340)
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2634 (class 2606 OID 17369)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2633 (class 2606 OID 17364)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2636 (class 2606 OID 17383)
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2635 (class 2606 OID 17378)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2639 (class 2606 OID 17430)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2637 (class 2606 OID 17404)
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2638 (class 2606 OID 17409)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2649 (class 2606 OID 17661)
-- Name: transporte_cotizaciondetalle_item e9169fec617abdd8a09e83524ec081d9; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle_item
    ADD CONSTRAINT e9169fec617abdd8a09e83524ec081d9 FOREIGN KEY (cotizaciondetalle_id) REFERENCES transporte_cotizaciondetalle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2640 (class 2606 OID 17682)
-- Name: transporte_cliente tran_nivel_de_precio_id_bf44849f_fk_transporte_niveldeprecio_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cliente
    ADD CONSTRAINT tran_nivel_de_precio_id_bf44849f_fk_transporte_niveldeprecio_id FOREIGN KEY (nivel_de_precio_id) REFERENCES transporte_niveldeprecio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2642 (class 2606 OID 17596)
-- Name: transporte_cotizaciondetalle transporte_c_cotizacion_id_570f0b32_fk_transporte_cotizacion_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle
    ADD CONSTRAINT transporte_c_cotizacion_id_570f0b32_fk_transporte_cotizacion_id FOREIGN KEY (cotizacion_id) REFERENCES transporte_cotizacion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2641 (class 2606 OID 17676)
-- Name: transporte_cotizacion transporte_c_itinerario_id_28340401_fk_transporte_itinerario_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizacion
    ADD CONSTRAINT transporte_c_itinerario_id_28340401_fk_transporte_itinerario_id FOREIGN KEY (itinerario_id) REFERENCES transporte_itinerario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2650 (class 2606 OID 17666)
-- Name: transporte_cotizaciondetalle_item transporte_cotizaciondet_item_id_33db8e2c_fk_transporte_item_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle_item
    ADD CONSTRAINT transporte_cotizaciondet_item_id_33db8e2c_fk_transporte_item_id FOREIGN KEY (item_id) REFERENCES transporte_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2643 (class 2606 OID 17606)
-- Name: transporte_itinerario transporte_itinera_cliente_id_30bafc06_fk_transporte_cliente_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_itinerario
    ADD CONSTRAINT transporte_itinera_cliente_id_30bafc06_fk_transporte_cliente_id FOREIGN KEY (cliente_id) REFERENCES transporte_cliente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2645 (class 2606 OID 17630)
-- Name: transporte_tramo_desde_lugar transporte_tramo_desde_lugar_id_85374dea_fk_transporte_lugar_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_desde_lugar
    ADD CONSTRAINT transporte_tramo_desde_lugar_id_85374dea_fk_transporte_lugar_id FOREIGN KEY (lugar_id) REFERENCES transporte_lugar(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2644 (class 2606 OID 17625)
-- Name: transporte_tramo_desde_lugar transporte_tramo_desde_tramo_id_64029fd7_fk_transporte_tramo_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_desde_lugar
    ADD CONSTRAINT transporte_tramo_desde_tramo_id_64029fd7_fk_transporte_tramo_id FOREIGN KEY (tramo_id) REFERENCES transporte_tramo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2647 (class 2606 OID 17644)
-- Name: transporte_tramo_hacia_lugar transporte_tramo_hacia_lugar_id_9d180ad1_fk_transporte_lugar_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_hacia_lugar
    ADD CONSTRAINT transporte_tramo_hacia_lugar_id_9d180ad1_fk_transporte_lugar_id FOREIGN KEY (lugar_id) REFERENCES transporte_lugar(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2646 (class 2606 OID 17639)
-- Name: transporte_tramo_hacia_lugar transporte_tramo_hacia_tramo_id_6b496c2d_fk_transporte_tramo_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo_hacia_lugar
    ADD CONSTRAINT transporte_tramo_hacia_tramo_id_6b496c2d_fk_transporte_tramo_id FOREIGN KEY (tramo_id) REFERENCES transporte_tramo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2648 (class 2606 OID 17653)
-- Name: transporte_vehiculo transporte_veh_tipo_id_441a69ec_fk_transporte_tipodevehiculo_id; Type: FK CONSTRAINT; Schema: tenant1; Owner: postgres
--

ALTER TABLE ONLY transporte_vehiculo
    ADD CONSTRAINT transporte_veh_tipo_id_441a69ec_fk_transporte_tipodevehiculo_id FOREIGN KEY (tipo_id) REFERENCES transporte_tipodevehiculo(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2017-03-31 11:01:38

--
-- PostgreSQL database dump complete
--

