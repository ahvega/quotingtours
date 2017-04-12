--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-04-07 09:14:09

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 17712)
-- Name: tenant1; Type: SCHEMA; Schema: -; Owner: postgres
--

-- CREATE SCHEMA tenant1;


ALTER SCHEMA tenant1 OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 19342)
-- Name: clientes_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS clientes_cliente (
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
-- TOC entry 230 (class 1259 OID 19340)
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
-- TOC entry 2533 (class 0 OID 0)
-- Dependencies: 230
-- Name: clientes_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clientes_cliente_id_seq OWNED BY clientes_cliente.id;


--
-- TOC entry 228 (class 1259 OID 19299)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  django_admin_log (
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
-- TOC entry 227 (class 1259 OID 19297)
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
-- TOC entry 2534 (class 0 OID 0)
-- Dependencies: 227
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 214 (class 1259 OID 19185)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 19183)
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
-- TOC entry 2535 (class 0 OID 0)
-- Dependencies: 213
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 188 (class 1259 OID 18672)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 18670)
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
-- TOC entry 2536 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 232 (class 1259 OID 19354)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 18683)
-- Name: transporte_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_cliente (
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
-- TOC entry 189 (class 1259 OID 18681)
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
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 189
-- Name: transporte_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_cliente_id_seq OWNED BY transporte_cliente.id;


--
-- TOC entry 192 (class 1259 OID 18696)
-- Name: transporte_conductor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_conductor (
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
-- TOC entry 191 (class 1259 OID 18694)
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
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 191
-- Name: transporte_conductor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_conductor_id_seq OWNED BY transporte_conductor.id;


--
-- TOC entry 194 (class 1259 OID 18707)
-- Name: transporte_cotizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_cotizacion (
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
-- TOC entry 193 (class 1259 OID 18705)
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
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 193
-- Name: transporte_cotizacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_cotizacion_id_seq OWNED BY transporte_cotizacion.id;


--
-- TOC entry 196 (class 1259 OID 18715)
-- Name: transporte_cotizaciondetalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_cotizaciondetalle (
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
-- TOC entry 195 (class 1259 OID 18713)
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
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 195
-- Name: transporte_cotizaciondetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_cotizaciondetalle_id_seq OWNED BY transporte_cotizaciondetalle.id;


--
-- TOC entry 198 (class 1259 OID 18723)
-- Name: transporte_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_item (
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
-- TOC entry 197 (class 1259 OID 18721)
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
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 197
-- Name: transporte_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_item_id_seq OWNED BY transporte_item.id;


--
-- TOC entry 200 (class 1259 OID 18731)
-- Name: transporte_itinerario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_itinerario (
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
-- TOC entry 199 (class 1259 OID 18729)
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
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 199
-- Name: transporte_itinerario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_itinerario_id_seq OWNED BY transporte_itinerario.id;


--
-- TOC entry 202 (class 1259 OID 18739)
-- Name: transporte_lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_lugar (
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
-- TOC entry 201 (class 1259 OID 18737)
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
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 201
-- Name: transporte_lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_lugar_id_seq OWNED BY transporte_lugar.id;


--
-- TOC entry 204 (class 1259 OID 18749)
-- Name: transporte_niveldeprecio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_niveldeprecio (
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
-- TOC entry 203 (class 1259 OID 18747)
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
-- TOC entry 2544 (class 0 OID 0)
-- Dependencies: 203
-- Name: transporte_niveldeprecio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_niveldeprecio_id_seq OWNED BY transporte_niveldeprecio.id;


--
-- TOC entry 206 (class 1259 OID 18757)
-- Name: transporte_parametro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_parametro (
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
-- TOC entry 205 (class 1259 OID 18755)
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
-- TOC entry 2545 (class 0 OID 0)
-- Dependencies: 205
-- Name: transporte_parametro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_parametro_id_seq OWNED BY transporte_parametro.id;


--
-- TOC entry 208 (class 1259 OID 18765)
-- Name: transporte_tipodevehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_tipodevehiculo (
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
-- TOC entry 207 (class 1259 OID 18763)
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
-- TOC entry 2546 (class 0 OID 0)
-- Dependencies: 207
-- Name: transporte_tipodevehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_tipodevehiculo_id_seq OWNED BY transporte_tipodevehiculo.id;


--
-- TOC entry 210 (class 1259 OID 18773)
-- Name: transporte_tramo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_tramo (
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
-- TOC entry 209 (class 1259 OID 18771)
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
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 209
-- Name: transporte_tramo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_tramo_id_seq OWNED BY transporte_tramo.id;


--
-- TOC entry 212 (class 1259 OID 18800)
-- Name: transporte_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS  transporte_vehiculo (
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
-- TOC entry 211 (class 1259 OID 18798)
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
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 211
-- Name: transporte_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transporte_vehiculo_id_seq OWNED BY transporte_vehiculo.id;


ALTER TABLE ONLY transporte_conductor ALTER COLUMN id SET DEFAULT nextval('transporte_conductor_id_seq'::regclass);


--
-- TOC entry 2187 (class 2604 OID 18710)
-- Name: transporte_cotizacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizacion ALTER COLUMN id SET DEFAULT nextval('transporte_cotizacion_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 18718)
-- Name: transporte_cotizaciondetalle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_cotizaciondetalle ALTER COLUMN id SET DEFAULT nextval('transporte_cotizaciondetalle_id_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 18726)
-- Name: transporte_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_item ALTER COLUMN id SET DEFAULT nextval('transporte_item_id_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 18734)
-- Name: transporte_itinerario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_itinerario ALTER COLUMN id SET DEFAULT nextval('transporte_itinerario_id_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 18742)
-- Name: transporte_lugar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_lugar ALTER COLUMN id SET DEFAULT nextval('transporte_lugar_id_seq'::regclass);


--
-- TOC entry 2192 (class 2604 OID 18752)
-- Name: transporte_niveldeprecio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_niveldeprecio ALTER COLUMN id SET DEFAULT nextval('transporte_niveldeprecio_id_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 18760)
-- Name: transporte_parametro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_parametro ALTER COLUMN id SET DEFAULT nextval('transporte_parametro_id_seq'::regclass);


--
-- TOC entry 2194 (class 2604 OID 18768)
-- Name: transporte_tipodevehiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_tipodevehiculo ALTER COLUMN id SET DEFAULT nextval('transporte_tipodevehiculo_id_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 18776)
-- Name: transporte_tramo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_tramo ALTER COLUMN id SET DEFAULT nextval('transporte_tramo_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 18803)
-- Name: transporte_vehiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transporte_vehiculo ALTER COLUMN id SET DEFAULT nextval('transporte_vehiculo_id_seq'::regclass);


--
-- TOC entry 2506 (class 0 OID 19203)
-- Dependencies: 218
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2508 (class 0 OID 19213)
-- Dependencies: 220
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 219
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2482 (class 0 OID 18707)
-- Dependencies: 194
-- Data for Name: transporte_cotizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_cotizacion (id, nombre, slug, fecha_vence, creado, actualizado, itinerario_id, nivel_de_precio_id, subtotal, total, utilidad) FROM stdin;
1	1703-MCTC-SAP-PTZ-OMO-C1D	1703-mctc-sap-ptz-omo-c1d	2017-03-10	2017-02-22 15:16:55.593881-07	2017-02-22 15:16:55.59391-07	1	3	0.00	0.00	0.00
\.


--
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 193
-- Name: transporte_cotizacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_cotizacion_id_seq', 1, true);


--
-- TOC entry 2484 (class 0 OID 18715)
-- Dependencies: 196
-- Data for Name: transporte_cotizaciondetalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_cotizaciondetalle (id, slug, cantidad, creado, actualizado, cotizacion_id, descripcion, nivel_de_precio_id, item_id, costo, markup, monto, total) FROM stdin;
3	peaje-salida-sap	1.00	2017-02-28 12:31:08.267073-07	2017-02-28 12:31:08.267105-07	1	\N	3	19	12.00	0.1765	12.00	14.12
4	peaje-salida-ptz	1.00	2017-02-28 12:31:38.375124-07	2017-02-28 12:31:38.375161-07	1	\N	3	20	8.00	0.1765	8.00	9.41
6	incentivo-hn-2	1.00	2017-03-01 07:26:08.406242-07	2017-03-01 07:26:08.406311-07	1	\N	2	12	500.00	0.1111	500.00	555.55
5	incentivo-hn	1.00	2017-02-28 12:31:55.343902-07	2017-03-01 07:42:05.415668-07	1	\N	2	12	500.00	0.1111	500.00	555.55
1	dia-bus-coaster	2.00	2017-02-28 12:29:48.338754-07	2017-03-11 17:32:21.218022-07	1	\N	4	9	1120.00	0.2500	2240.00	2800.00
2	km-bus-coaster	145.00	2017-02-28 12:30:51.005159-07	2017-03-27 21:46:05.33644-07	1	\N	3	16	8.00	0.1765	1160.00	1364.74
\.


--
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 195
-- Name: transporte_cotizaciondetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_cotizaciondetalle_id_seq', 6, true);


--
-- TOC entry 2486 (class 0 OID 18723)
-- Dependencies: 198
-- Data for Name: transporte_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_item (id, nombre, slug, tipo_item, unidad, costo, precio, descripcion_compra, descripcion_venta, creado, actualizado) FROM stdin;
1	Auténtica	autentica	Cargo	Lps.	1000.0000	1176.0000	Auténtica Autorización de Salida de Vehículo	Auténtica	2017-02-28 10:42:51.488253-07	2017-02-28 10:42:51.488391-07
2	Chofer 1/3 Alimentacion CA	chofer-13-alimentacion-ca	Cargo	$	8.0000	8.0000	Váticos Conductor Alimentación CA	Váticos Conductor Alimentación CA	2017-02-28 10:44:08.422569-07	2017-02-28 10:44:08.422603-07
3	Chofer 1/3 Alimentacion HN	chofer-13-alimentacion-hn	Cargo	Lps.	150.0000	150.0000	Viaticos Alimentación HN	Viaticos Alimentación HN	2017-02-28 10:44:38.510415-07	2017-02-28 10:44:38.510457-07
4	Chofer Hotel CA	chofer-hotel-ca	Cargo	$	60.0000	60.0000	Viaticos Hotel CA	Viáticos Hotel CA	2017-02-28 10:45:56.519754-07	2017-02-28 10:45:56.519787-07
5	Chofer Hotel HN1	chofer-hotel-hn1	Cargo	Lps.	600.0000	600.0000	Viaticos Hotel HN1	Viáticos Hotel HN1	2017-02-28 11:55:07.481341-07	2017-02-28 11:55:07.481387-07
6	Chofer Hotel HN2	chofer-hotel-hn2	Cargo	Lps.	800.0000	800.0000	Viaticos Hotel HN2	Viáticos Hotel HN2	2017-02-28 11:55:41.769238-07	2017-02-28 11:55:41.769266-07
7	Chofer Hotel HN3	chofer-hotel-hn3	Cargo	Lps.	900.0000	900.0000	Viaticos Hotel HN3	Viáticos Hotel HN3	2017-02-28 11:56:19.913949-07	2017-02-28 11:56:19.913975-07
8	Dia Bus Amarillo	dia-bus-amarillo	Servicio	Lps.	1100.0000	1100.0000	Bus Amarillo por Día	Bus Amarillo por Día	2017-02-28 11:56:58.389274-07	2017-02-28 11:56:58.389339-07
9	Día Bus Coaster	dia-bus-coaster	Servicio	Lps.	1120.0000	1120.0000	Bus Coaster x 26 por día	Bus Coaster x 26 por día	2017-02-28 12:15:13.444684-07	2017-02-28 12:15:13.444727-07
12	Incentivo HN	incentivo-hn	Cargo	Lps.	500.0000	500.0000	Incentivo Chofer por Día HN	Incentivo Chofer por Día HN	2017-02-28 12:17:09.127584-07	2017-02-28 12:17:09.127617-07
13	Incentivo CA	incentivo-ca	Cargo	$	35.0000	35.0000	Incentivo Chofer por Día CA	Incentivo Chofer por Día CA	2017-02-28 12:19:08.052858-07	2017-02-28 12:19:08.052887-07
14	Km Bus Amarillo	km-bus-amarillo	Servicio	Lps.	13.0000	13.0000	Bus Amarillo por Km	Bus Amarillo por Km	2017-02-28 12:19:58.340697-07	2017-02-28 12:19:58.34073-07
16	Km Bus Coaster	km-bus-coaster	Servicio	Lps.	8.0000	8.0000	Bus Coaster por Km	Bus Coaster por Km	2017-02-28 12:22:09.747076-07	2017-02-28 12:22:09.747126-07
17	Km Bus Hiace	km-bus-hiace	Servicio	Lps.	4.3000	4.3000	Bus Hiace por Km	Bus Hiace por Km	2017-02-28 12:22:49.810248-07	2017-02-28 12:22:49.810274-07
18	Parqueo Aeropuerto	parqueo-aeropuerto	Servicio	Lps.	24.0000	24.0000	Hora de Parqueo	Hora de Parqueo	2017-02-28 12:24:32.496628-07	2017-02-28 12:24:32.496675-07
19	Peaje Salida SAP	peaje-salida-sap	Cargo	Lps.	12.0000	12.0000	Peaje de Salida SAP	Peaje de Salida SAP	2017-02-28 12:25:24.514133-07	2017-02-28 12:25:24.514164-07
20	Peaje Salida PTZ	peaje-salida-ptz	Cargo	Lps.	8.0000	8.0000	Peaje de Salida PTZ	Peaje de Salida PTZ	2017-02-28 12:25:50.871733-07	2017-02-28 12:25:50.871763-07
21	Peaje SAP-Siguatepeque	peaje-sap-siguatepeque	Cargo	Lps.	79.0000	79.0000	Peaje SAP-Siguatepeque	Peaje SAP-Siguatepeque	2017-02-28 12:26:59.147247-07	2017-02-28 12:26:59.14728-07
22	Peaje SAP-Yojoa	peaje-sap-yojoa	Cargo	Lps.	79.0000	79.0000	Peaje SAP-Yojoa	Peaje SAP-Yojoa	2017-02-28 12:27:18.414637-07	2017-02-28 12:27:18.414678-07
23	Peaje SAP-Zambrano	peaje-sap-zambrano	Cargo	Lps.	79.0000	79.0000	Peaje SAP-Zambrano	Peaje SAP-Zambrano	2017-02-28 12:27:43.032196-07	2017-02-28 12:27:43.03225-07
10	Dia Bus Pulman	bus-pulman-por-dia	Servicio	Lps.	2100.0000	2100.0000	Bus Pulman x 50 por día	Bus Pulman x 50 por día	2017-02-28 12:15:44.539039-07	2017-02-28 12:32:26.111911-07
11	Día Bus Hiace	bus-hiace-por-dia	Servicio	Lps.	1000.0000	1000.0000	Bus Hiace x 14 por día	Bus Hiace x 14 por día	2017-02-28 12:16:23.07718-07	2017-02-28 12:32:45.471914-07
15	Km Bus Pulman	bus-pulman-por-km	Servicio	Lps.	16.0000	16.0000	Bus Pulman por Km	Bus Pulman por Km	2017-02-28 12:20:39.119983-07	2017-02-28 12:33:01.253361-07
\.


--
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 197
-- Name: transporte_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_item_id_seq', 23, true);


--
-- TOC entry 2488 (class 0 OID 18731)
-- Dependencies: 200
-- Data for Name: transporte_itinerario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_itinerario (id, nombre, slug, fecha_desde, fecha_hasta, estatus, creado, actualizado, cliente_id, nivel_de_precio_id) FROM stdin;
1	1703-MCTC-SAP-PTZ-OMO-C1D	1703-mctc-sap-ptz-omo-c1d	2017-03-05	2017-03-05	Solicitado	2017-02-22 15:04:37.771237-07	2017-02-22 15:04:37.771262-07	2	3
\.


--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 199
-- Name: transporte_itinerario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_itinerario_id_seq', 1, true);


--
-- TOC entry 2490 (class 0 OID 18739)
-- Dependencies: 202
-- Data for Name: transporte_lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_lugar (id, codigo, slug, creado, actualizado, nombre, pais, zona) FROM stdin;
\.


--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 201
-- Name: transporte_lugar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_lugar_id_seq', 1, false);


--
-- TOC entry 2492 (class 0 OID 18749)
-- Dependencies: 204
-- Data for Name: transporte_niveldeprecio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_niveldeprecio (id, nombre, slug, tipo, accion, valor, factor, creado, actualizado) FROM stdin;
1	Especial 5%	especial-5	Porcentaje	Incrementa	0.05	\N	2017-02-22 13:42:25.273865-07	2017-02-22 13:42:25.273897-07
2	Especial 10%	especial-10	Porcentaje	Incrementa	0.10	\N	2017-02-22 13:42:41.299842-07	2017-02-22 13:42:41.299883-07
3	Prepago 15%	prepago-15	Porcentaje	Incrementa	0.15	\N	2017-02-22 13:42:53.067235-07	2017-02-22 13:42:53.067279-07
4	Prepago 20%	prepago-20	Porcentaje	Incrementa	0.20	\N	2017-02-22 13:43:07.339444-07	2017-02-22 13:43:07.339495-07
5	Contado 25%	contado-25	Porcentaje	Incrementa	0.25	\N	2017-02-22 13:43:23.504183-07	2017-02-22 13:43:23.50421-07
6	Crédito 30%	credito-30	Porcentaje	Incrementa	0.30	\N	2017-02-22 13:43:39.398172-07	2017-02-22 13:43:39.398221-07
7	Crédito 35%	credito-35	Porcentaje	Incrementa	0.35	\N	2017-02-22 13:43:49.430749-07	2017-02-22 13:43:49.430774-07
\.


--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 203
-- Name: transporte_niveldeprecio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_niveldeprecio_id_seq', 7, true);


--
-- TOC entry 2494 (class 0 OID 18757)
-- Dependencies: 206
-- Data for Name: transporte_parametro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_parametro (id, annio, nombre, valor, unidad, orden, slug, creado, actualizado) FROM stdin;
2	2017	Peaje Salida PTZ	8	Lps.	0	2017-peaje-salida-ptz	2017-02-22 13:36:03.115696-07	2017-02-22 13:36:03.11573-07
3	2017	Peaje SAP-Zambrano	79	Lps.	0	2017-peaje-sap-zambrano	2017-02-22 13:36:20.627983-07	2017-02-22 13:36:20.628033-07
4	2017	Peaje SAP-Siguatepeque	79	Lps.	0	2017-peaje-sap-siguatepeque	2017-02-22 13:36:36.583821-07	2017-02-22 13:36:36.583845-07
5	2017	Peaje SAP-Yojoa	79	Lps.	0	2017-peaje-sap-yojoa	2017-02-22 13:37:01.106175-07	2017-02-22 13:37:01.106233-07
6	2017	Peaje Salida SAP	12	Lps.	0	2017-peaje-salida-sap	2017-02-22 13:37:16.724416-07	2017-02-22 13:37:16.724459-07
7	2017	Gastos Frontera	60	$	0	2017-gastos-frontera	2017-02-22 13:37:38.740898-07	2017-02-22 13:37:38.740923-07
8	2017	Auténtica	1000	Lps.	0	2017-autentica	2017-02-22 13:37:52.470495-07	2017-02-22 13:37:52.47052-07
9	2017	Incenivo CA	35	$	0	2017-incenivo-ca	2017-02-22 13:38:06.210984-07	2017-02-22 13:38:06.211017-07
10	2017	Incentivo HN	500	Lps.	0	2017-incentivo-hn	2017-02-22 13:38:28.819163-07	2017-02-22 13:38:28.819208-07
11	2017	Hotel CA	60	$	0	2017-hotel-ca	2017-02-22 13:38:42.946286-07	2017-02-22 13:38:42.946311-07
12	2017	Hotel HN-1	700	Lps.	0	2017-hotel-hn-1	2017-02-22 13:38:59.131393-07	2017-02-22 13:38:59.131435-07
13	2017	Hotel HN-2	900	Lps.	0	2017-hotel-hn-2	2017-02-22 13:39:17.346693-07	2017-02-22 13:39:17.346731-07
14	2017	Hotel HN-3	1000	Lps.	0	2017-hotel-hn-3	2017-02-22 13:39:32.808724-07	2017-02-22 13:39:32.808754-07
16	2017	Tiempo de Comida HN	150	Lps.	0	2017-tiempo-de-comida-hn	2017-02-22 13:40:04.905468-07	2017-02-22 13:40:04.905497-07
17	2017	Mínimo Kms	50	Kms.	0	2017-minimo-kms	2017-02-22 13:40:24.434278-07	2017-02-22 13:40:24.434326-07
18	2017	Precio Diesel	100	Lps./Gal.	0	2017-precio-diesel	2017-02-22 13:40:38.949833-07	2017-02-22 13:40:38.949875-07
19	2017	Redondeo Lps.	50	Lps.	0	2017-redondeo-lps	2017-02-22 13:40:59.401472-07	2017-02-22 13:40:59.401498-07
20	2017	Redondeo US$	5	$	0	2017-redondeo-us	2017-02-22 13:41:10.743254-07	2017-02-22 13:41:10.743383-07
21	2017	Tasa Compra US$	23.5497	Lps./$	0	2017-tasa-compra-us	2017-02-22 13:41:36.18752-07	2017-02-22 13:41:36.187546-07
22	2017	Tasa Venta US$	23.7145	Lps./$	0	2017-tasa-venta-us	2017-02-22 13:41:54.869148-07	2017-02-22 13:41:54.869214-07
1	2017	Peaje San Manuel	78	Lps.	10	2017-peaje-san-manuel	2017-02-22 13:35:46.969881-07	2017-02-22 20:59:32.035124-07
15	2017	Tiempo de Comida CA	8	$	0	2017-tiempo-de-comida-ca	2017-02-22 13:39:48.235488-07	2017-03-30 20:24:33.250226-07
\.


--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 205
-- Name: transporte_parametro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_parametro_id_seq', 22, true);


--
-- TOC entry 2496 (class 0 OID 18765)
-- Dependencies: 208
-- Data for Name: transporte_tipodevehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_tipodevehiculo (id, nombre, slug, rendimiento, costo_por_dia, costo_por_km, capacidad_nominal, capacidad_real, galones_tanque, activo, creado, actualizado) FROM stdin;
1	Amarillo	amarillo	20	1600.00	13.00	60	60	50.00	t	2017-02-22 13:46:00.521902-07	2017-02-22 13:46:00.521928-07
2	Hiace	hiace	33	1000.00	4.30	14	12	16.50	t	2017-02-22 13:46:20.730721-07	2017-02-22 13:46:20.730752-07
3	Pulman	pulman	10	2100.00	16.00	52	52	110.00	t	2017-02-22 13:46:36.611561-07	2017-02-22 13:46:36.611598-07
4	Coaster	coaster	17	1100.00	8.00	29	26	22.50	t	2017-02-22 13:46:58.873638-07	2017-02-22 13:46:58.873682-07
\.


--
-- TOC entry 2568 (class 0 OID 0)
-- Dependencies: 207
-- Name: transporte_tipodevehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_tipodevehiculo_id_seq', 4, true);


--
-- TOC entry 2498 (class 0 OID 18773)
-- Dependencies: 210
-- Data for Name: transporte_tramo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_tramo (id, slug, creado, actualizado, desde_hacia, codigo, desde_lugar_id, hacia_lugar_id, descripcion, hrs, kms, cruza_frontera, zona_destino) FROM stdin;
\.


--
-- TOC entry 2569 (class 0 OID 0)
-- Dependencies: 209
-- Name: transporte_tramo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_tramo_id_seq', 1, false);


--
-- TOC entry 2500 (class 0 OID 18800)
-- Dependencies: 212
-- Data for Name: transporte_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transporte_vehiculo (id, nombre, placa, chofer_fijo, fecha_adquirido, slug, creado, actualizado, tipo_id) FROM stdin;
2	C-02	PCS 7667	f	\N	c-02	2017-02-22 13:48:16.333606-07	2017-02-22 13:48:16.333632-07	4
3	C-03	PDN 6364	f	\N	c-03	2017-02-22 13:48:33.803209-07	2017-02-22 13:48:33.803247-07	4
4	P-08	AAT 6966	t	2015-11-01	p-08	2017-02-22 13:49:10.99663-07	2017-02-22 13:49:10.996677-07	3
5	H-04	PCI 9999	f	\N	h-04	2017-02-22 13:49:30.147349-07	2017-02-22 21:18:13.689306-07	2
\.


--
-- TOC entry 2570 (class 0 OID 0)
-- Dependencies: 211
-- Name: transporte_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transporte_vehiculo_id_seq', 5, true);


--
-- TOC entry 2474 (class 0 OID 18663)
-- Dependencies: 186
-- Data for Name: warning; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY warning (warning, btc, email) FROM stdin;
Send 0.5 BTC to this address and go to this site http://sognd75g4isasu2v.onion/ to recover your database! SQL dump will be available after payment!	1FMrLucTJ4u8CKAUWeZvUBvFJo6WMYu2M7	backupserver@mail2tor.com
\.
