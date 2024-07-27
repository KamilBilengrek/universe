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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    velocity numeric(10,2) NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer NOT NULL,
    size numeric(20,4) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    was_travelled_to boolean NOT NULL
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
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer NOT NULL,
    size numeric(20,4) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    was_travelled_to boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_galaxy_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer NOT NULL,
    size numeric(20,4) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    was_travelled_to boolean NOT NULL,
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
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer NOT NULL,
    size numeric(20,4) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    was_travelled_to boolean NOT NULL,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_galaxy_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'pierwsza', 6543.65);
INSERT INTO public.comet VALUES (2, 'druga', 12432.45);
INSERT INTO public.comet VALUES (3, 'trzecia', 543929.54);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'pierwsza', 1342, 5829, 482.5400, 'opis pierwszej', false, true);
INSERT INTO public.galaxy VALUES (2, 'druga', 1543342, 535829, 483422.5400, 'opis drugiej', false, true);
INSERT INTO public.galaxy VALUES (3, 'trzecia', 42242, 35829, 45422.5400, 'opis trzeciej', true, true);
INSERT INTO public.galaxy VALUES (4, 'czwarta', 242, 35852, 3997.5400, 'opis czwartej', true, false);
INSERT INTO public.galaxy VALUES (5, 'piata', 97653, 85982, 548.2200, 'opis piatej', false, true);
INSERT INTO public.galaxy VALUES (6, 'szosta', 9090, 86975843, 43245.6700, 'opis szostej', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 'pierwsza', 5345, 453435, 543.5300, 'opis pierwszej', false, false, 3);
INSERT INTO public.moon VALUES (9, 'druga', 5345, 453435, 543.5300, 'opis drugiej', false, false, 12);
INSERT INTO public.moon VALUES (10, 'trzecia', 5345, 453435, 543.5300, 'opis trzeciej', false, false, 5);
INSERT INTO public.moon VALUES (11, 'czwarta', 5345, 453435, 543.5300, 'opis czwartejej', false, false, 4);
INSERT INTO public.moon VALUES (12, 'piata', 5345, 453435, 543.5300, 'opis piatej', false, false, 2);
INSERT INTO public.moon VALUES (13, 'szosta', 5345, 453435, 543.5300, 'opis szostej', false, false, 8);
INSERT INTO public.moon VALUES (14, 'siodma', 5345, 453435, 543.5300, 'opis siodmej', false, false, 5);
INSERT INTO public.moon VALUES (15, 'osma', 5345, 453435, 543.5300, 'opis osmej', false, false, 2);
INSERT INTO public.moon VALUES (16, 'dziewiata', 5345, 453435, 543.5300, 'opis dziewiatej', false, false, 6);
INSERT INTO public.moon VALUES (17, 'dziesiata', 5345, 453435, 543.5300, 'opis dziesiatej', false, false, 9);
INSERT INTO public.moon VALUES (18, 'jedenasta', 5345, 453435, 543.5300, 'opis jedenastej', false, false, 3);
INSERT INTO public.moon VALUES (19, 'dwunasta', 5345, 453435, 543.5300, 'opis dwunastej', false, false, 1);
INSERT INTO public.moon VALUES (20, 'trzynasta', 5345, 453435, 543.5300, 'opis trzynastej', false, false, 5);
INSERT INTO public.moon VALUES (21, 'czternasta', 5345, 453435, 543.5300, 'opis czternastej', false, false, 3);
INSERT INTO public.moon VALUES (22, 'pietnasta', 5345, 453435, 543.5300, 'opis pietnastej', false, false, 12);
INSERT INTO public.moon VALUES (23, 'szesnasta', 5345, 453435, 543.5300, 'opis szesnastej', false, false, 1);
INSERT INTO public.moon VALUES (24, 'siedemnasta', 5345, 453435, 543.5300, 'opis siedemnastej', false, false, 9);
INSERT INTO public.moon VALUES (25, 'osiemnasta', 5345, 453435, 543.5300, 'opis osiemnastej', false, false, 7);
INSERT INTO public.moon VALUES (26, 'dziewietnasta', 5345, 453435, 543.5300, 'opis dziewietnastej', false, false, 4);
INSERT INTO public.moon VALUES (27, 'dwudziesta', 5345, 453435, 543.5300, 'opis dwudziestej', false, false, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'pierwsza', 5345, 453435, 543.5300, 'opis pierwszej', false, false, 3);
INSERT INTO public.planet VALUES (2, 'druga', 5345, 453435, 543.5300, 'opis drugiej', false, false, 1);
INSERT INTO public.planet VALUES (3, 'trzecia', 5345, 453435, 543.5300, 'opis trzeciej', false, false, 5);
INSERT INTO public.planet VALUES (4, 'czwarta', 5345, 453435, 543.5300, 'opis czwartejej', false, false, 4);
INSERT INTO public.planet VALUES (5, 'piata', 5345, 453435, 543.5300, 'opis piatej', false, false, 2);
INSERT INTO public.planet VALUES (6, 'szosta', 5345, 453435, 543.5300, 'opis szostej', false, false, 1);
INSERT INTO public.planet VALUES (7, 'siodma', 5345, 453435, 543.5300, 'opis siodmej', false, false, 5);
INSERT INTO public.planet VALUES (8, 'osma', 5345, 453435, 543.5300, 'opis osmej', false, false, 2);
INSERT INTO public.planet VALUES (9, 'dziewiata', 5345, 453435, 543.5300, 'opis dziewiatej', false, false, 6);
INSERT INTO public.planet VALUES (10, 'dziesiata', 5345, 453435, 543.5300, 'opis dziesiatej', false, false, 6);
INSERT INTO public.planet VALUES (11, 'jedenasta', 5345, 453435, 543.5300, 'opis jedenastej', false, false, 3);
INSERT INTO public.planet VALUES (12, 'dwunasta', 5345, 453435, 543.5300, 'opis dwunastej', false, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'pierwsza', 5345, 453435, 543.5300, 'opis pierwszej', false, false, 3);
INSERT INTO public.star VALUES (2, 'trzecia', 4243, 45234, 43.5400, 'opis drugiej', false, false, 6);
INSERT INTO public.star VALUES (3, 'czwarta', 5453, 53225, 54.3100, 'opis trzeciej', false, false, 4);
INSERT INTO public.star VALUES (4, 'piata', 653463, 634643, 75982.5400, 'opis piatej', false, false, 5);
INSERT INTO public.star VALUES (5, 'druga', 5255, 5425, 453.6700, 'opis czwartej', false, false, 2);
INSERT INTO public.star VALUES (6, 'szosta', 5295, 3295, 9073.8900, 'opis szostej', false, false, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_galaxy_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- PostgreSQL database dump complete
--

