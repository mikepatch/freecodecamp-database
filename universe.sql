--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_planets boolean NOT NULL,
    mass_in_solar_masses numeric(20,0)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    mass_in_kg numeric(40,4),
    distance_from_earth_in_km numeric(40,0),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    mass_in_kg numeric(38,0),
    distance_from_earth_in_km numeric(40,0),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_spherical boolean,
    description text,
    age_in_millions_of_years integer,
    mass_in_kg numeric(40,4),
    distance_from_earth_in_km numeric(40,0),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    test_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_ok boolean,
    test_huge_number numeric(30,10)
);


ALTER TABLE public.test OWNER TO postgres;

--
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO postgres;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.test_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: test test_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test ALTER COLUMN test_id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'Our barred spiral galaxy.', 13600, true, 1500000000000);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'Nearest spiral galaxy to the Milky Way.', 10000, true, 1000000000000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Third largest in the Local Group.', 12000, true, 50000000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy with prominent bulge.', 13000, true, 800000000000);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 'Known for its clear spiral arms.', 500, true, 160000000000);
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way.', 13600, true, 10000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s natural satellite.', true, 4500, 73476730900000000000000.0000, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger moon of Mars.', true, 4500, 10600000000000000.0000, 9376, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars.', true, 4500, 1476200000000000.0000, 23460, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon of Jupiter.', true, 4500, 148190000000000000000000.0000, 628730000, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon of Jupiter.', true, 4500, 48000000000000000000000.0000, 628730000, 4);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Heavily cratered moon of Jupiter.', true, 4500, 107590000000000000000000.0000, 628730000, 4);
INSERT INTO public.moon VALUES (7, 'Io', 'Volcanically active moon of Jupiter.', true, 4500, 89319000000000000000000.0000, 628730000, 4);
INSERT INTO public.moon VALUES (8, 'Proxima b Moon 1', 'Hypothetical moon of Proxima Centauri b.', NULL, NULL, 5000000000000000.0000, 40080000000000, 3);
INSERT INTO public.moon VALUES (9, 'Proxima b Moon 2', 'Hypothetical moon of Proxima Centauri b.', NULL, NULL, 6000000000000000.0000, 40080000000000, 3);
INSERT INTO public.moon VALUES (10, 'M31-V1 b Moon 1', 'Hypothetical moon in Andromeda.', NULL, NULL, 7000000000000000.0000, 2500000000000000, 5);
INSERT INTO public.moon VALUES (11, 'M31-V1 b Moon 2', 'Hypothetical moon in Andromeda.', NULL, NULL, 8000000000000000.0000, 2500000000000000, 5);
INSERT INTO public.moon VALUES (12, 'R136a1 b Moon 1', 'Hypothetical moon in LMC.', NULL, NULL, 9000000000000000.0000, 163000000000000, 7);
INSERT INTO public.moon VALUES (13, 'R136a1 b Moon 2', 'Hypothetical moon in LMC.', NULL, NULL, 10000000000000000.0000, 163000000000000, 7);
INSERT INTO public.moon VALUES (14, 'V1 c Moon 1', 'Hypothetical moon in Andromeda.', NULL, NULL, 11000000000000000.0000, 2500000000000000, 6);
INSERT INTO public.moon VALUES (15, 'V1 c Moon 2', 'Hypothetical moon in Andromeda.', NULL, NULL, 12000000000000000.0000, 2500000000000000, 6);
INSERT INTO public.moon VALUES (16, 'S Dorad b Moon 1', 'Hypothetical moon in LMC.', NULL, NULL, 13000000000000000.0000, 163000000000000, 9);
INSERT INTO public.moon VALUES (17, 'S Dorad b Moon 2', 'Hypothetical moon in LMC.', NULL, NULL, 14000000000000000.0000, 163000000000000, 9);
INSERT INTO public.moon VALUES (18, 'Alpha Centauri Bb Moon 1', 'Hypothetical moon of Alpha Centauri Bb.', NULL, NULL, 15000000000000000.0000, 40080000000000, 4);
INSERT INTO public.moon VALUES (19, 'Alpha Centauri Bb Moon 2', 'Hypothetical moon of Alpha Centauri Bb.', NULL, NULL, 16000000000000000.0000, 40080000000000, 4);
INSERT INTO public.moon VALUES (20, 'M31-V1 d Moon 1', 'Hypothetical moon in Andromeda.', NULL, NULL, 17000000000000000.0000, 2500000000000000, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Blue planet, abundant life.', true, true, 4540, 5972000000000000000000000, 0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet, potential for life.', false, true, 4603, 641710000000000000000000, 225000000, 1);
INSERT INTO public.planet VALUES (3, 'Proxima Centauri b', 'Closest exoplanet, Earth-like.', NULL, true, NULL, 7584440000000000000000000, 40080000000000, 2);
INSERT INTO public.planet VALUES (4, 'Alpha Centauri Bb', 'Hypothetical rocky exoplanet.', NULL, true, NULL, 8000000000000000000000000, 40080000000000, 2);
INSERT INTO public.planet VALUES (5, 'M31-V1 b', 'Hypothetical exoplanet in Andromeda.', NULL, true, NULL, 30000000000000000000000000, 2500000000000000, 5);
INSERT INTO public.planet VALUES (6, 'V1 c', 'Hypothetical exoplanet in Andromeda.', NULL, true, NULL, 35000000000000000000000000, 2500000000000000, 3);
INSERT INTO public.planet VALUES (7, 'R136a1 b', 'Hypothetical exoplanet in LMC.', NULL, true, NULL, 9000000000000000000000000, 163000000000000, 4);
INSERT INTO public.planet VALUES (8, 'R136a1 c', 'Hypothetical exoplanet in LMC.', NULL, true, NULL, 10000000000000000000000000, 163000000000000, 4);
INSERT INTO public.planet VALUES (9, 'S Dorad b', 'Hypothetical exoplanet in LMC.', NULL, true, NULL, 11000000000000000000000000, 163000000000000, 6);
INSERT INTO public.planet VALUES (10, 'S Doradus c', 'Hypothetical exoplanet in LMC.', NULL, true, NULL, 12000000000000000000000000, 163000000000000, 6);
INSERT INTO public.planet VALUES (11, 'M31-V1 d', 'Hypothetical exoplanet in Andromeda.', NULL, true, NULL, 32000000000000000000000000, 2500000000000000, 5);
INSERT INTO public.planet VALUES (12, 'V1 d', 'Hypothetical exoplanet in Andromeda.', NULL, true, NULL, 36000000000000000000000000, 2500000000000000, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 'The star at the center of our Solar System.', 4600, 1989000000000000000000000000000.0000, 149600000, 3);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', true, 'Closest known star to the Sun.', 4500, 417000000000000000000000000000.0000, 40080000000000, 3);
INSERT INTO public.star VALUES (3, 'V1', true, 'Cepheid variable star in Andromeda.', 100, 2000000000000000000000000000000.0000, 2500000000000000, 4);
INSERT INTO public.star VALUES (4, 'R136a1', true, 'One of the most massive stars known.', 1, 315000000000000000000000000000000.0000, 163000000000000, 8);
INSERT INTO public.star VALUES (5, 'M31-V1', true, 'Historic Cepheid variable star.', 100, 4000000000000000000000000000000.0000, 2500000000000000, 4);
INSERT INTO public.star VALUES (6, 'S Doradus', true, 'Luminous blue variable star.', 2, 50000000000000000000000000000000.0000, 163000000000000, 8);


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.test VALUES (1, 'test1', NULL, NULL, NULL);
INSERT INTO public.test VALUES (2, 'test2', NULL, NULL, NULL);
INSERT INTO public.test VALUES (3, 'test3', NULL, NULL, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_id_seq', 3, true);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (test_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: test unique_test_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT unique_test_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: TABLE test; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.test TO freecodecamp;


--
-- Name: SEQUENCE test_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.test_id_seq TO freecodecamp;


--
-- PostgreSQL database dump complete
--

