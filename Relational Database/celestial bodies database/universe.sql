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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_cluster_id integer,
    year_discovered numeric(4,0)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    galaxy_cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    year_discovered numeric(4,0)
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


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
    name character varying(30) NOT NULL,
    description text,
    planet_id integer,
    year_discovered numeric(4,0)
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
    name character varying(30) NOT NULL,
    description text,
    star_id integer,
    year_discovered numeric(4,0),
    has_life boolean,
    num_of_moons integer
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
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    year_discovered numeric(4,0),
    num_of_planets integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (2, 'Whirlpool galaxy', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (5, 'Canes Venatici I', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', NULL, 2, NULL);


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES (1, 'Local Group', NULL, NULL);
INSERT INTO public.galaxy_cluster VALUES (2, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy_cluster VALUES (3, 'Coma Cluster', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Metis', NULL, 5, 1979);
INSERT INTO public.moon VALUES (3, 'Adrastea', NULL, 5, 1979);
INSERT INTO public.moon VALUES (4, 'Amalthea', NULL, 5, 1892);
INSERT INTO public.moon VALUES (5, 'Theb', NULL, 5, 1979);
INSERT INTO public.moon VALUES (6, 'Io', NULL, 5, 1610);
INSERT INTO public.moon VALUES (7, 'Europa', NULL, 5, 1610);
INSERT INTO public.moon VALUES (8, 'Ganymede', NULL, 5, 1610);
INSERT INTO public.moon VALUES (9, 'Callisto', NULL, 5, 1610);
INSERT INTO public.moon VALUES (10, 'Themisto', NULL, 5, 1975);
INSERT INTO public.moon VALUES (11, 'Leda', NULL, 5, 1974);
INSERT INTO public.moon VALUES (12, 'Ersa', NULL, 5, 2018);
INSERT INTO public.moon VALUES (13, 'Himalia', NULL, 5, 1904);
INSERT INTO public.moon VALUES (14, 'S/2018 J 2', NULL, 5, 2018);
INSERT INTO public.moon VALUES (15, 'Pandia', NULL, 5, 2017);
INSERT INTO public.moon VALUES (16, 'Lysithea', NULL, 5, 1938);
INSERT INTO public.moon VALUES (17, 'Elara', NULL, 5, 1905);
INSERT INTO public.moon VALUES (18, 'S/2011 J 3', NULL, 5, 2011);
INSERT INTO public.moon VALUES (19, 'Dia', NULL, 5, 2000);
INSERT INTO public.moon VALUES (20, 'Carpo', NULL, 5, 2003);
INSERT INTO public.moon VALUES (21, 'Valetudo', NULL, 5, 2016);
INSERT INTO public.moon VALUES (22, 'Euporie', NULL, 5, 2001);
INSERT INTO public.moon VALUES (23, 'S/2003 J 18', NULL, 5, 2003);
INSERT INTO public.moon VALUES (24, 'S/2021 J 1', NULL, 5, 2021);
INSERT INTO public.moon VALUES (25, 'Eupheme', NULL, 5, 2003);
INSERT INTO public.moon VALUES (26, 'S/2010 J 2', NULL, 5, 2010);
INSERT INTO public.moon VALUES (27, 'S/2016 J 1', NULL, 5, 2016);
INSERT INTO public.moon VALUES (28, 'Mneme', NULL, 5, 2003);
INSERT INTO public.moon VALUES (29, 'Euanthe', NULL, 5, 2001);
INSERT INTO public.moon VALUES (30, 'S/2003 J 16', NULL, 5, 2003);
INSERT INTO public.moon VALUES (31, 'Harpalyke', NULL, 5, 2000);
INSERT INTO public.moon VALUES (32, 'Orthosie', NULL, 5, 2001);
INSERT INTO public.moon VALUES (33, 'Helike', NULL, 5, 2003);
INSERT INTO public.moon VALUES (34, 'Praxidike', NULL, 5, 2000);
INSERT INTO public.moon VALUES (35, 'S/2017 J 3', NULL, 5, 2017);
INSERT INTO public.moon VALUES (36, 'S/2003 J 12', NULL, 5, 2003);
INSERT INTO public.moon VALUES (37, 'S/2017 J 7', NULL, 5, 2017);
INSERT INTO public.moon VALUES (38, 'Thelxinoe', NULL, 5, 2003);
INSERT INTO public.moon VALUES (39, 'Thyone', NULL, 5, 2001);
INSERT INTO public.moon VALUES (40, 'S/2003 J 2', NULL, 5, 2003);
INSERT INTO public.moon VALUES (41, 'Ananke', NULL, 5, 1951);
INSERT INTO public.moon VALUES (42, 'Iocaste', NULL, 5, 2000);
INSERT INTO public.moon VALUES (43, 'Hermippe', NULL, 5, 2001);
INSERT INTO public.moon VALUES (44, 'S/2017 J 9', NULL, 5, 2017);
INSERT INTO public.moon VALUES (45, 'S/2016 J 3', NULL, 5, 2016);
INSERT INTO public.moon VALUES (46, 'Philophrosyne', NULL, 5, 2003);
INSERT INTO public.moon VALUES (47, 'Pastihee', NULL, 5, 2001);
INSERT INTO public.moon VALUES (48, 'S/2017 J 8', NULL, 5, 2017);
INSERT INTO public.moon VALUES (49, 'S/2003 J 24', NULL, 5, 2003);
INSERT INTO public.moon VALUES (50, 'Eurydome', NULL, 5, 2001);
INSERT INTO public.moon VALUES (51, 'S/2011 J 2', NULL, 5, 2011);
INSERT INTO public.moon VALUES (52, 'S/2003 J 4', NULL, 5, 2003);
INSERT INTO public.moon VALUES (53, 'Chaldene', NULL, 5, 2000);
INSERT INTO public.moon VALUES (54, 'S/2017 J 2', NULL, 5, 2017);
INSERT INTO public.moon VALUES (55, 'Isonoe', NULL, 5, 2000);
INSERT INTO public.moon VALUES (56, 'Kallichore', NULL, 5, 2003);
INSERT INTO public.moon VALUES (57, 'Erinome', NULL, 5, 2000);
INSERT INTO public.moon VALUES (58, 'Kale', NULL, 5, 2001);
INSERT INTO public.moon VALUES (59, 'Eirene', NULL, 5, 2003);
INSERT INTO public.moon VALUES (60, 'Aitne', NULL, 5, 2001);
INSERT INTO public.moon VALUES (61, 'Eukelade', NULL, 5, 2003);
INSERT INTO public.moon VALUES (62, 'Arche', NULL, 5, 2002);
INSERT INTO public.moon VALUES (63, 'Taygete', NULL, 5, 2000);
INSERT INTO public.moon VALUES (64, 'S/2011 J 1', NULL, 5, 2011);
INSERT INTO public.moon VALUES (65, 'Carme', NULL, 5, 1938);
INSERT INTO public.moon VALUES (66, 'Herse', NULL, 5, 2003);
INSERT INTO public.moon VALUES (67, 'S/2003 J 19', NULL, 5, 2003);
INSERT INTO public.moon VALUES (68, 'S/2010 J 1', NULL, 5, 2010);
INSERT INTO public.moon VALUES (69, 'S/2003 J 9', NULL, 5, 2003);
INSERT INTO public.moon VALUES (70, 'S/2017 J 5', NULL, 5, 2017);
INSERT INTO public.moon VALUES (71, 'S/2017 J 6', NULL, 5, 2017);
INSERT INTO public.moon VALUES (72, 'Kalyke', NULL, 5, 2000);
INSERT INTO public.moon VALUES (73, 'Hegemone', NULL, 5, 2003);
INSERT INTO public.moon VALUES (74, 'Pasiphae', NULL, 5, 1908);
INSERT INTO public.moon VALUES (75, 'Sponde', NULL, 5, 2001);
INSERT INTO public.moon VALUES (76, 'S/2003 J 10', NULL, 5, 2003);
INSERT INTO public.moon VALUES (77, 'Megaclite', NULL, 5, 2000);
INSERT INTO public.moon VALUES (78, 'Cyllene', NULL, 5, 2003);
INSERT INTO public.moon VALUES (79, 'Sinope', NULL, 5, 1914);
INSERT INTO public.moon VALUES (80, 'S/2017 J 1', NULL, 5, 2017);
INSERT INTO public.moon VALUES (81, 'Aoede', NULL, 5, 2003);
INSERT INTO public.moon VALUES (82, 'Autonoe', NULL, 5, 2001);
INSERT INTO public.moon VALUES (83, 'Callirrhoe', NULL, 5, 1999);
INSERT INTO public.moon VALUES (84, 'S/2003 J 23', NULL, 5, 2003);
INSERT INTO public.moon VALUES (85, 'Kore', NULL, 5, 2003);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Gliese 876 d', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Gliese 876 c', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Gliese 876 b', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Gliese 876 e', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, 1, NULL, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Gliese 876', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'UY Scuti', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'RSGC1-F01', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'M51-ULS-1', NULL, 2, NULL, NULL);


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 85, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_cluster galaxy_cluster_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_unique UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: moon star_moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT star_moon_unique UNIQUE (name);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet star_planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_planet_unique UNIQUE (name);


--
-- Name: galaxy galaxy_galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_cluster_id_fkey FOREIGN KEY (galaxy_cluster_id) REFERENCES public.galaxy_cluster(galaxy_cluster_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star__id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

