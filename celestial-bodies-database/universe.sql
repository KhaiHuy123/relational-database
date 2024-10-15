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
    name character varying(30) NOT NULL,
    description text,
    speed_movement numeric,
    comet_id integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--
    
CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_shape character varying(30),
    description text,
    speed_movement numeric,
    num_of_clusters integer,
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    radius numeric,
    distance_from_planet integer,
    in_group boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    radius numeric,
    num_of_moons integer, -- satellites
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_shining boolean DEFAULT(True), -- Alive star
    is_white_dwarf boolean DEFAULT (False),  -- Dead star
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES ('001', 'comet 001', 1000, 1);
INSERT INTO public.comet VALUES ('002', 'comet 002', 2000, 2);
INSERT INTO public.comet VALUES ('003', 'comet 003', 3000, 3);
INSERT INTO public.comet VALUES ('004', 'comet 004', 4000, 4);
INSERT INTO public.comet VALUES ('005', 'comet 005', 5000, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, '001', 'spiral', 'galaxy 001', 1000, 2, 1000);
INSERT INTO public.galaxy VALUES (2, '002', 'spiral', 'galaxy 002', 500, 3, 1000);
INSERT INTO public.galaxy VALUES (3, '003', 'spiral', 'galaxy 003', 700, 1, 2000);
INSERT INTO public.galaxy VALUES (4, '004', 'spiral', 'galaxy 004', 600, 4, 5000);
INSERT INTO public.galaxy VALUES (5, '005', 'spiral', 'galaxy 005', 900, 3, 7000);
INSERT INTO public.galaxy VALUES (6, '006', 'spiral', 'galaxy 006', 1750, 6, 20000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'm001', 'moon 001', 500, 100, false, 1);
INSERT INTO public.moon VALUES (2, 'm002', 'moon 002', 600, 100, false, 2);
INSERT INTO public.moon VALUES (3, 'm003', 'moon 003', 700, 100, false, 3);
INSERT INTO public.moon VALUES (4, 'm004', 'moon 004', 800, 100, false, 4);
INSERT INTO public.moon VALUES (5, 'm005', 'moon 005', 900, 200, false, 5);
INSERT INTO public.moon VALUES (6, 'm006', 'moon 006', 1000, 200, false, 6);
INSERT INTO public.moon VALUES (7, 'm007', 'moon 007', 1100, 200, false, 7);
INSERT INTO public.moon VALUES (8, 'm008', 'moon 008', 1200, 200, false, 8);
INSERT INTO public.moon VALUES (9, 'm009', 'moon 009', 1300, 300, false, 9);
INSERT INTO public.moon VALUES (10, 'm0010', 'moon 0010', 1400, 300, false, 10);
INSERT INTO public.moon VALUES (11, 'm0011', 'moon 0011', 1500, 300, false, 11);
INSERT INTO public.moon VALUES (12, 'm0012', 'moon 0012', 1600, 300, false, 12);
INSERT INTO public.moon VALUES (13, 'm0013', 'moon 0013', 1700, 400, false, 13);
INSERT INTO public.moon VALUES (14, 'm0014', 'moon 0014', 1800, 400, false, 14);
INSERT INTO public.moon VALUES (15, 'm0015', 'moon 0015', 1900, 400, false, 15);
INSERT INTO public.moon VALUES (16, 'm0016', 'moon 0016', 2000, 400, true, 16);
INSERT INTO public.moon VALUES (17, 'm0017', 'moon 0017', 2100, 500, true, 16);
INSERT INTO public.moon VALUES (18, 'm0018', 'moon 0018', 2200, 500, true, 17);
INSERT INTO public.moon VALUES (19, 'm0019', 'moon 0019', 2300, 500, true, 17);
INSERT INTO public.moon VALUES (20, 'm0020', 'moon 0020', 2400, 500, true, 17);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'p001', 'planet 001', true, 3000, 1, 1);
INSERT INTO public.planet VALUES (2, 'p002', 'planet 002', true, 4000, 1, 2);
INSERT INTO public.planet VALUES (3, 'p003', 'planet 003', true, 5000, 1, 3);
INSERT INTO public.planet VALUES (4, 'p004', 'planet 004', true, 6000, 1, 4);
INSERT INTO public.planet VALUES (5, 'p005', 'planet 005', true, 7000, 1, 5);
INSERT INTO public.planet VALUES (6, 'p006', 'planet 006', true, 8000, 1, 6);
INSERT INTO public.planet VALUES (7, 'p007', 'planet 007', true, 9000, 1, 7);
INSERT INTO public.planet VALUES (8, 'p008', 'planet 008', true, 10000, 1, 8);
INSERT INTO public.planet VALUES (9, 'p009', 'planet 009', true, 11000, 1, 8);
INSERT INTO public.planet VALUES (10, 'p0010', 'planet 0010', true, 12000, 1, 7);
INSERT INTO public.planet VALUES (11, 'p0011', 'planet 0011', true, 13000, 1, 7);
INSERT INTO public.planet VALUES (12, 'p0012', 'planet 0012', true, 14000, 1, 6);
INSERT INTO public.planet VALUES (13, 'p0013', 'planet 0013', true, 15000, 1, 5);
INSERT INTO public.planet VALUES (14, 'p0014', 'planet 0014', true, 16000, 1, 4);
INSERT INTO public.planet VALUES (15, 'p0015', 'planet 0015', true, 17000, 1, 3);
INSERT INTO public.planet VALUES (16, 'p0016', 'planet 0016', true, 18000, 2, 2);
INSERT INTO public.planet VALUES (17, 'p0017', 'planet 0017', true, 19000, 3, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 's001', 'star 001', true, false, 1);
INSERT INTO public.star VALUES (2, 's002', 'star 002', true, false, 2);
INSERT INTO public.star VALUES (3, 's003', 'star 003', true, false, 2);
INSERT INTO public.star VALUES (4, 's004', 'star 004', true, false, 3);
INSERT INTO public.star VALUES (5, 's005', 'star 005', true, false, 4);
INSERT INTO public.star VALUES (6, 's006', 'star 006', true, false, 5);
INSERT INTO public.star VALUES (7, 's007', 'star 007', true, false, 6);
INSERT INTO public.star VALUES (8, 's008', 'star 008', true, false, 6);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet nam_ckey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT nam_ckey UNIQUE (name);


--
-- Name: galaxy name_gkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_gkey UNIQUE (name);


--
-- Name: moon name_mkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_mkey UNIQUE (name);


--
-- Name: planet name_plkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_plkey UNIQUE (name);


--
-- Name: star name_skey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_skey UNIQUE (name);


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
