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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer,
    game_id integer NOT NULL,
    best_record integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(30),
    num_of_attemps integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 805);
INSERT INTO public.games VALUES (1, 2, 626);
INSERT INTO public.games VALUES (2, 3, 247);
INSERT INTO public.games VALUES (2, 4, 37);
INSERT INTO public.games VALUES (1, 5, 703);
INSERT INTO public.games VALUES (1, 6, 136);
INSERT INTO public.games VALUES (1, 7, 546);
INSERT INTO public.games VALUES (5, 8, 850);
INSERT INTO public.games VALUES (5, 9, 251);
INSERT INTO public.games VALUES (6, 10, 668);
INSERT INTO public.games VALUES (6, 11, 178);
INSERT INTO public.games VALUES (5, 12, 892);
INSERT INTO public.games VALUES (5, 13, 56);
INSERT INTO public.games VALUES (5, 14, 743);
INSERT INTO public.games VALUES (7, 15, 441);
INSERT INTO public.games VALUES (7, 16, 908);
INSERT INTO public.games VALUES (8, 17, 82);
INSERT INTO public.games VALUES (8, 18, 657);
INSERT INTO public.games VALUES (7, 19, 945);
INSERT INTO public.games VALUES (7, 20, 174);
INSERT INTO public.games VALUES (7, 21, 593);
INSERT INTO public.games VALUES (9, 22, 600);
INSERT INTO public.games VALUES (9, 23, 201);
INSERT INTO public.games VALUES (10, 24, 870);
INSERT INTO public.games VALUES (10, 25, 204);
INSERT INTO public.games VALUES (9, 26, 182);
INSERT INTO public.games VALUES (9, 27, 680);
INSERT INTO public.games VALUES (9, 28, 658);
INSERT INTO public.games VALUES (11, 29, 786);
INSERT INTO public.games VALUES (11, 30, 548);
INSERT INTO public.games VALUES (12, 31, 711);
INSERT INTO public.games VALUES (12, 32, 486);
INSERT INTO public.games VALUES (11, 33, 825);
INSERT INTO public.games VALUES (11, 34, 800);
INSERT INTO public.games VALUES (11, 35, 206);
INSERT INTO public.games VALUES (13, 36, 58);
INSERT INTO public.games VALUES (13, 37, 487);
INSERT INTO public.games VALUES (14, 38, 898);
INSERT INTO public.games VALUES (14, 39, 667);
INSERT INTO public.games VALUES (13, 40, 428);
INSERT INTO public.games VALUES (13, 41, 851);
INSERT INTO public.games VALUES (13, 42, 345);
INSERT INTO public.games VALUES (15, 43, 128);
INSERT INTO public.games VALUES (15, 44, 614);
INSERT INTO public.games VALUES (16, 45, 183);
INSERT INTO public.games VALUES (16, 46, 546);
INSERT INTO public.games VALUES (15, 47, 849);
INSERT INTO public.games VALUES (15, 48, 609);
INSERT INTO public.games VALUES (15, 49, 980);
INSERT INTO public.games VALUES (17, 50, 785);
INSERT INTO public.games VALUES (17, 51, 831);
INSERT INTO public.games VALUES (18, 52, 813);
INSERT INTO public.games VALUES (18, 53, 213);
INSERT INTO public.games VALUES (17, 54, 534);
INSERT INTO public.games VALUES (17, 55, 972);
INSERT INTO public.games VALUES (17, 56, 760);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (15, 'user_1728397169471', 5);
INSERT INTO public.users VALUES (2, 'user_1728394090273', 2);
INSERT INTO public.users VALUES (1, 'user_1728394090274', 5);
INSERT INTO public.users VALUES (18, 'user_1728397239181', 2);
INSERT INTO public.users VALUES (4, 'user_1728395107619', 2);
INSERT INTO public.users VALUES (3, 'user_1728395107620', 5);
INSERT INTO public.users VALUES (17, 'user_1728397239182', 5);
INSERT INTO public.users VALUES (6, 'user_1728395665473', 2);
INSERT INTO public.users VALUES (5, 'user_1728395665474', 5);
INSERT INTO public.users VALUES (8, 'user_1728395702797', 2);
INSERT INTO public.users VALUES (7, 'user_1728395702798', 5);
INSERT INTO public.users VALUES (10, 'user_1728396601849', 2);
INSERT INTO public.users VALUES (9, 'user_1728396601850', 5);
INSERT INTO public.users VALUES (12, 'user_1728397048945', 2);
INSERT INTO public.users VALUES (11, 'user_1728397048946', 5);
INSERT INTO public.users VALUES (14, 'user_1728397118276', 2);
INSERT INTO public.users VALUES (13, 'user_1728397118277', 5);
INSERT INTO public.users VALUES (16, 'user_1728397169470', 2);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 56, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--