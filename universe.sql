--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: celestial_adjacentcy_list; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_adjacentcy_list (
    celestial_adjacentcy_list_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.celestial_adjacentcy_list OWNER TO freecodecamp;

--
-- Name: celestial_adjacentcy_list_celestial_adjacentcy_list_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_adjacentcy_list_celestial_adjacentcy_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_adjacentcy_list_celestial_adjacentcy_list_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_adjacentcy_list_celestial_adjacentcy_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_adjacentcy_list_celestial_adjacentcy_list_id_seq OWNED BY public.celestial_adjacentcy_list.celestial_adjacentcy_list_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    celestial_type integer,
    age integer,
    dist_ly_whole integer,
    dist_ly_real numeric,
    sector text,
    inhabitable boolean,
    visited boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    celestial_type integer,
    age integer,
    dist_ly_whole integer,
    dist_ly_real numeric,
    sector text,
    inhabitable boolean,
    visited boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    celestial_type integer,
    age integer,
    dist_ly_whole integer,
    dist_ly_real numeric,
    sector text,
    inhabitable boolean,
    visited boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    celestial_type integer,
    age integer,
    dist_ly_whole integer,
    dist_ly_real numeric,
    sector text,
    inhabitable boolean,
    visited boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: celestial_adjacentcy_list celestial_adjacentcy_list_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_adjacentcy_list ALTER COLUMN celestial_adjacentcy_list_id SET DEFAULT nextval('public.celestial_adjacentcy_list_celestial_adjacentcy_list_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_adjacentcy_list; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_adjacentcy_list VALUES (1, 'Listing 1', 0, 0, 0, 0);
INSERT INTO public.celestial_adjacentcy_list VALUES (2, 'Listing 2', 1, 1, 1, 1);
INSERT INTO public.celestial_adjacentcy_list VALUES (3, 'Listing 3', 2, 2, 2, 2);
INSERT INTO public.celestial_adjacentcy_list VALUES (4, 'Listing 4', 3, 3, 3, 3);
INSERT INTO public.celestial_adjacentcy_list VALUES (5, 'Listing 5', 4, 4, 4, 4);
INSERT INTO public.celestial_adjacentcy_list VALUES (6, 'Listing 6', 5, 5, 5, 5);
INSERT INTO public.celestial_adjacentcy_list VALUES (7, 'Listing 7', 0, 0, 0, 6);
INSERT INTO public.celestial_adjacentcy_list VALUES (8, 'Listing 8', 1, 1, 1, 7);
INSERT INTO public.celestial_adjacentcy_list VALUES (9, 'Listing 9', 2, 2, 2, 8);
INSERT INTO public.celestial_adjacentcy_list VALUES (10, 'Listing 10', 3, 3, 3, 9);
INSERT INTO public.celestial_adjacentcy_list VALUES (11, 'Listing 11', 4, 4, 4, 10);
INSERT INTO public.celestial_adjacentcy_list VALUES (12, 'Listing 12', 5, 5, 5, 11);
INSERT INTO public.celestial_adjacentcy_list VALUES (13, 'Listing 13', 0, 0, 0, 12);
INSERT INTO public.celestial_adjacentcy_list VALUES (14, 'Listing 14', 1, 1, 1, 13);
INSERT INTO public.celestial_adjacentcy_list VALUES (15, 'Listing 15', 2, 2, 2, 14);
INSERT INTO public.celestial_adjacentcy_list VALUES (16, 'Listing 16', 3, 3, 3, 15);
INSERT INTO public.celestial_adjacentcy_list VALUES (17, 'Listing 17', 4, 4, 4, 16);
INSERT INTO public.celestial_adjacentcy_list VALUES (18, 'Listing 18', 5, 5, 5, 17);
INSERT INTO public.celestial_adjacentcy_list VALUES (19, 'Listing 19', 0, 0, 0, 18);
INSERT INTO public.celestial_adjacentcy_list VALUES (20, 'Listing 20', 1, 1, 1, 19);
INSERT INTO public.celestial_adjacentcy_list VALUES (21, 'Listing 21', 2, 2, 8, 20);
INSERT INTO public.celestial_adjacentcy_list VALUES (22, 'Listing 22', 3, 3, 9, 21);
INSERT INTO public.celestial_adjacentcy_list VALUES (23, 'Listing 23', 4, 4, 10, 22);
INSERT INTO public.celestial_adjacentcy_list VALUES (24, 'Listing 24', 5, 5, 11, 23);
INSERT INTO public.celestial_adjacentcy_list VALUES (25, 'Listing 25', 0, 0, 0, 24);
INSERT INTO public.celestial_adjacentcy_list VALUES (26, 'Listing 26', 1, 1, 1, 25);
INSERT INTO public.celestial_adjacentcy_list VALUES (27, 'Listing 27', 2, 2, 2, 26);
INSERT INTO public.celestial_adjacentcy_list VALUES (28, 'Listing 28', 3, 3, 3, 27);
INSERT INTO public.celestial_adjacentcy_list VALUES (29, 'Listing 29', 4, 4, 4, 28);
INSERT INTO public.celestial_adjacentcy_list VALUES (30, 'Listing 30', 5, 5, 5, 29);
INSERT INTO public.celestial_adjacentcy_list VALUES (31, 'Listing 31', 0, 0, 6, 30);
INSERT INTO public.celestial_adjacentcy_list VALUES (32, 'Listing 32', 1, 1, 7, 31);
INSERT INTO public.celestial_adjacentcy_list VALUES (33, 'Listing 33', 2, 2, 8, 32);
INSERT INTO public.celestial_adjacentcy_list VALUES (34, 'Listing 34', 3, 3, 9, 33);
INSERT INTO public.celestial_adjacentcy_list VALUES (35, 'Listing 35', 4, 4, 10, 34);
INSERT INTO public.celestial_adjacentcy_list VALUES (36, 'Listing 36', 5, 5, 11, 35);
INSERT INTO public.celestial_adjacentcy_list VALUES (37, 'Listing 37', 0, 0, 0, 36);
INSERT INTO public.celestial_adjacentcy_list VALUES (38, 'Listing 38', 1, 1, 1, 37);
INSERT INTO public.celestial_adjacentcy_list VALUES (39, 'Listing 39', 2, 2, 2, 38);
INSERT INTO public.celestial_adjacentcy_list VALUES (40, 'Listing 40', 3, 3, 3, 39);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (0, 'Barna100', 44, 30000, 0, 0.000000, 'AXED@X0', true, true);
INSERT INTO public.galaxy VALUES (1, 'Barna101', 45, 30001, 2000, 2000.124568, 'AXED@X13', true, true);
INSERT INTO public.galaxy VALUES (2, 'Barna102', 46, 30002, 4000, 4000.249136, 'AXED@X26', true, true);
INSERT INTO public.galaxy VALUES (3, 'Barna103', 47, 30003, 6000, 6000.373704, 'AXED@X39', true, true);
INSERT INTO public.galaxy VALUES (4, 'Barna104', 48, 30004, 8000, 8000.498272, 'AXED@X52', true, true);
INSERT INTO public.galaxy VALUES (5, 'Barna105', 49, 30005, 10000, 10000.622840, 'AXED@X65', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (0, 'Moon 100', 44, 30000, 2000, 2000.124568, 'AXED@Be0', true, true, 0);
INSERT INTO public.moon VALUES (1, 'Moon 101', 45, 30001, 4000, 4000.249136, 'AXED@Be213', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Moon 102', 46, 30002, 6000, 6000.373704, 'AXED@Be426', true, true, 2);
INSERT INTO public.moon VALUES (3, 'Moon 103', 47, 30003, 8000, 8000.498272, 'AXED@Be639', true, true, 3);
INSERT INTO public.moon VALUES (4, 'Moon 104', 48, 30004, 10000, 10000.622840, 'AXED@Be852', true, true, 4);
INSERT INTO public.moon VALUES (5, 'Moon 105', 49, 30005, 12000, 12000.747408, 'AXED@Be1065', true, true, 5);
INSERT INTO public.moon VALUES (6, 'Moon 106', 50, 30006, 14000, 14000.871976, 'AXED@Be1278', true, true, 0);
INSERT INTO public.moon VALUES (7, 'Moon 107', 51, 30007, 16000, 16000.996544, 'AXED@Be1491', true, true, 1);
INSERT INTO public.moon VALUES (8, 'Moon 108', 52, 30008, 18000, 18001.121112, 'AXED@Be1704', true, true, 2);
INSERT INTO public.moon VALUES (9, 'Moon 109', 53, 30009, 20000, 20001.245680, 'AXED@Be1917', true, true, 3);
INSERT INTO public.moon VALUES (10, 'Moon 110', 54, 30010, 22000, 22001.370248, 'AXED@Be2130', true, true, 4);
INSERT INTO public.moon VALUES (11, 'Moon 111', 55, 30011, 24000, 24001.494816, 'AXED@Be2343', true, true, 5);
INSERT INTO public.moon VALUES (12, 'Moon 112', 56, 30012, 26000, 26001.619384, 'AXED@Be2556', true, true, 0);
INSERT INTO public.moon VALUES (13, 'Moon 113', 57, 30013, 28000, 28001.743952, 'AXED@Be2769', true, true, 1);
INSERT INTO public.moon VALUES (14, 'Moon 114', 58, 30014, 30000, 30001.868520, 'AXED@Be2982', true, true, 2);
INSERT INTO public.moon VALUES (15, 'Moon 115', 59, 30015, 32000, 32001.993088, 'AXED@Be3195', true, true, 3);
INSERT INTO public.moon VALUES (16, 'Moon 116', 60, 30016, 34000, 34002.117656, 'AXED@Be3408', true, true, 4);
INSERT INTO public.moon VALUES (17, 'Moon 117', 61, 30017, 36000, 36002.242224, 'AXED@Be3621', true, true, 5);
INSERT INTO public.moon VALUES (18, 'Moon 118', 62, 30018, 38000, 38002.366792, 'AXED@Be3834', true, true, 0);
INSERT INTO public.moon VALUES (19, 'Moon 119', 63, 30019, 40000, 40002.491360, 'AXED@Be4047', true, true, 1);
INSERT INTO public.moon VALUES (20, 'Moon 120', 64, 30020, 42000, 42002.615928, 'AXED@Be4260', true, true, 8);
INSERT INTO public.moon VALUES (21, 'Moon 121', 65, 30021, 44000, 44002.740496, 'AXED@Be4473', true, true, 9);
INSERT INTO public.moon VALUES (22, 'Moon 122', 66, 30022, 46000, 46002.865064, 'AXED@Be4686', true, true, 10);
INSERT INTO public.moon VALUES (23, 'Moon 123', 67, 30023, 48000, 48002.989632, 'AXED@Be4899', true, true, 11);
INSERT INTO public.moon VALUES (24, 'Moon 124', 68, 30024, 50000, 50003.114200, 'AXED@Be5112', true, true, 0);
INSERT INTO public.moon VALUES (25, 'Moon 125', 69, 30025, 52000, 52003.238768, 'AXED@Be5325', true, true, 1);
INSERT INTO public.moon VALUES (26, 'Moon 126', 70, 30026, 54000, 54003.363336, 'AXED@Be5538', true, true, 2);
INSERT INTO public.moon VALUES (27, 'Moon 127', 71, 30027, 56000, 56003.487904, 'AXED@Be5751', true, true, 3);
INSERT INTO public.moon VALUES (28, 'Moon 128', 72, 30028, 58000, 58003.612472, 'AXED@Be5964', true, true, 4);
INSERT INTO public.moon VALUES (29, 'Moon 129', 73, 30029, 60000, 60003.737040, 'AXED@Be6177', true, true, 5);
INSERT INTO public.moon VALUES (30, 'Moon 130', 74, 30030, 62000, 62003.861608, 'AXED@Be6390', true, true, 6);
INSERT INTO public.moon VALUES (31, 'Moon 131', 75, 30031, 64000, 64003.986176, 'AXED@Be6603', true, true, 7);
INSERT INTO public.moon VALUES (32, 'Moon 132', 76, 30032, 66000, 66004.110744, 'AXED@Be6816', true, true, 8);
INSERT INTO public.moon VALUES (33, 'Moon 133', 77, 30033, 68000, 68004.235312, 'AXED@Be7029', true, true, 9);
INSERT INTO public.moon VALUES (34, 'Moon 134', 78, 30034, 70000, 70004.359880, 'AXED@Be7242', true, true, 10);
INSERT INTO public.moon VALUES (35, 'Moon 135', 79, 30035, 72000, 72004.484448, 'AXED@Be7455', true, true, 11);
INSERT INTO public.moon VALUES (36, 'Moon 136', 80, 30036, 74000, 74004.609016, 'AXED@Be7668', true, true, 0);
INSERT INTO public.moon VALUES (37, 'Moon 137', 81, 30037, 76000, 76004.733584, 'AXED@Be7881', true, true, 1);
INSERT INTO public.moon VALUES (38, 'Moon 138', 82, 30038, 78000, 78004.858152, 'AXED@Be8094', true, true, 2);
INSERT INTO public.moon VALUES (39, 'Moon 139', 83, 30039, 80000, 80004.982720, 'AXED@Be8307', true, true, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (0, 'Planet 100', 44, 30000, 0, 0.000000, 'AXED@Be0', true, true, 0);
INSERT INTO public.planet VALUES (1, 'Planet 101', 45, 30001, 2000, 2000.124568, 'AXED@Be213', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Planet 102', 46, 30002, 4000, 4000.249136, 'AXED@Be426', true, true, 2);
INSERT INTO public.planet VALUES (3, 'Planet 103', 47, 30003, 6000, 6000.373704, 'AXED@Be639', true, true, 3);
INSERT INTO public.planet VALUES (4, 'Planet 104', 48, 30004, 8000, 8000.498272, 'AXED@Be852', true, true, 4);
INSERT INTO public.planet VALUES (5, 'Planet 105', 49, 30005, 10000, 10000.622840, 'AXED@Be1065', true, true, 5);
INSERT INTO public.planet VALUES (6, 'Planet 106', 50, 30006, 12000, 12000.747408, 'AXED@Be1278', true, true, 0);
INSERT INTO public.planet VALUES (7, 'Planet 107', 51, 30007, 14000, 14000.871976, 'AXED@Be1491', true, true, 1);
INSERT INTO public.planet VALUES (8, 'Planet 108', 52, 30008, 16000, 16000.996544, 'AXED@Be1704', true, true, 2);
INSERT INTO public.planet VALUES (9, 'Planet 109', 53, 30009, 18000, 18001.121112, 'AXED@Be1917', true, true, 3);
INSERT INTO public.planet VALUES (10, 'Planet 110', 54, 30010, 20000, 20001.245680, 'AXED@Be2130', true, true, 4);
INSERT INTO public.planet VALUES (11, 'Planet 111', 55, 30011, 22000, 22001.370248, 'AXED@Be2343', true, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (0, 'Sckerf 100', 44, 30000, 0, 0.000000, 'AXED@F0', true, true, 0);
INSERT INTO public.star VALUES (1, 'Sckerf 101', 45, 30001, 2000, 2000.124568, 'AXED@F213', true, true, 1);
INSERT INTO public.star VALUES (2, 'Sckerf 102', 46, 30002, 4000, 4000.249136, 'AXED@F426', true, true, 2);
INSERT INTO public.star VALUES (3, 'Sckerf 103', 47, 30003, 6000, 6000.373704, 'AXED@F639', true, true, 3);
INSERT INTO public.star VALUES (4, 'Sckerf 104', 48, 30004, 8000, 8000.498272, 'AXED@F852', true, true, 4);
INSERT INTO public.star VALUES (5, 'Sckerf 105', 49, 30005, 10000, 10000.622840, 'AXED@F1065', true, true, 5);


--
-- Name: celestial_adjacentcy_list_celestial_adjacentcy_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_adjacentcy_list_celestial_adjacentcy_list_id_seq', 40, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: celestial_adjacentcy_list celestial_adjacentcy_list_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_adjacentcy_list
    ADD CONSTRAINT celestial_adjacentcy_list_pkey PRIMARY KEY (celestial_adjacentcy_list_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_uniq UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_uniq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: celestial_adjacentcy_list name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_adjacentcy_list
    ADD CONSTRAINT name_uniq UNIQUE (name);


--
-- Name: planet planet_name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_uniq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_uniq UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id_fkey_galaxy_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fkey_galaxy_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: celestial_adjacentcy_list galaxy_id_fkey_galaxy_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_adjacentcy_list
    ADD CONSTRAINT galaxy_id_fkey_galaxy_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: celestial_adjacentcy_list moon_id_fkey_moon_moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_adjacentcy_list
    ADD CONSTRAINT moon_id_fkey_moon_moon_id FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon planet_id_fkey_planet_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_fkey_planet_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: celestial_adjacentcy_list planet_id_fkey_planet_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_adjacentcy_list
    ADD CONSTRAINT planet_id_fkey_planet_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_fkey_star_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fkey_star_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: celestial_adjacentcy_list star_id_fkey_star_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_adjacentcy_list
    ADD CONSTRAINT star_id_fkey_star_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

