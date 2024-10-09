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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    name character varying(30) NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (469, 2018, 'Final', 409, 410, 4, 2);
INSERT INTO public.games VALUES (470, 2018, 'Third Place', 411, 412, 2, 0);
INSERT INTO public.games VALUES (471, 2018, 'Semi-Final', 411, 412, 2, 1);
INSERT INTO public.games VALUES (472, 2018, 'Semi-Final', 411, 412, 1, 0);
INSERT INTO public.games VALUES (473, 2018, 'Quarter-Final', 411, 413, 3, 2);
INSERT INTO public.games VALUES (474, 2018, 'Quarter-Final', 411, 414, 2, 0);
INSERT INTO public.games VALUES (475, 2018, 'Quarter-Final', 411, 415, 2, 1);
INSERT INTO public.games VALUES (476, 2018, 'Quarter-Final', 411, 416, 2, 0);
INSERT INTO public.games VALUES (477, 2018, 'Eighth-Final', 411, 417, 2, 1);
INSERT INTO public.games VALUES (478, 2018, 'Eighth-Final', 411, 418, 1, 0);
INSERT INTO public.games VALUES (479, 2018, 'Eighth-Final', 411, 419, 3, 2);
INSERT INTO public.games VALUES (480, 2018, 'Eighth-Final', 411, 420, 2, 0);
INSERT INTO public.games VALUES (481, 2018, 'Eighth-Final', 411, 421, 2, 1);
INSERT INTO public.games VALUES (482, 2018, 'Eighth-Final', 411, 422, 2, 1);
INSERT INTO public.games VALUES (483, 2018, 'Eighth-Final', 411, 423, 2, 1);
INSERT INTO public.games VALUES (484, 2018, 'Eighth-Final', 411, 424, 4, 3);
INSERT INTO public.games VALUES (485, 2014, 'Final', 425, 424, 1, 0);
INSERT INTO public.games VALUES (486, 2014, 'Third Place', 426, 424, 3, 0);
INSERT INTO public.games VALUES (487, 2014, 'Semi-Final', 426, 424, 1, 0);
INSERT INTO public.games VALUES (488, 2014, 'Semi-Final', 426, 424, 7, 1);
INSERT INTO public.games VALUES (489, 2014, 'Quarter-Final', 426, 427, 1, 0);
INSERT INTO public.games VALUES (490, 2014, 'Quarter-Final', 426, 427, 1, 0);
INSERT INTO public.games VALUES (491, 2014, 'Quarter-Final', 426, 427, 2, 1);
INSERT INTO public.games VALUES (492, 2014, 'Quarter-Final', 426, 427, 1, 0);
INSERT INTO public.games VALUES (493, 2014, 'Eighth-Final', 426, 428, 2, 1);
INSERT INTO public.games VALUES (494, 2014, 'Eighth-Final', 426, 428, 2, 0);
INSERT INTO public.games VALUES (495, 2014, 'Eighth-Final', 426, 429, 2, 0);
INSERT INTO public.games VALUES (496, 2014, 'Eighth-Final', 426, 430, 2, 1);
INSERT INTO public.games VALUES (497, 2014, 'Eighth-Final', 426, 430, 2, 1);
INSERT INTO public.games VALUES (498, 2014, 'Eighth-Final', 426, 431, 2, 1);
INSERT INTO public.games VALUES (499, 2014, 'Eighth-Final', 426, 431, 1, 0);
INSERT INTO public.games VALUES (500, 2014, 'Eighth-Final', 426, 432, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES ('France', 409);
INSERT INTO public.teams VALUES ('Croatia', 410);
INSERT INTO public.teams VALUES ('Belgium', 411);
INSERT INTO public.teams VALUES ('England', 412);
INSERT INTO public.teams VALUES ('Russia', 413);
INSERT INTO public.teams VALUES ('Sweden', 414);
INSERT INTO public.teams VALUES ('Brazil', 415);
INSERT INTO public.teams VALUES ('Uruguay', 416);
INSERT INTO public.teams VALUES ('Colombia', 417);
INSERT INTO public.teams VALUES ('Switzerland', 418);
INSERT INTO public.teams VALUES ('Japan', 419);
INSERT INTO public.teams VALUES ('Mexico', 420);
INSERT INTO public.teams VALUES ('Denmark', 421);
INSERT INTO public.teams VALUES ('Spain', 422);
INSERT INTO public.teams VALUES ('Portugal', 423);
INSERT INTO public.teams VALUES ('Argentina', 424);
INSERT INTO public.teams VALUES ('Germany', 425);
INSERT INTO public.teams VALUES ('Netherlands', 426);
INSERT INTO public.teams VALUES ('Costa Rica', 427);
INSERT INTO public.teams VALUES ('Chile', 428);
INSERT INTO public.teams VALUES ('Nigeria', 429);
INSERT INTO public.teams VALUES ('Algeria', 430);
INSERT INTO public.teams VALUES ('Greece', 431);
INSERT INTO public.teams VALUES ('United States', 432);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 500, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 432, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

