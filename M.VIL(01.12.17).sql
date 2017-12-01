DROP DATABASE IF EXISTS M.VIL;
CREATE DATABASE M.VIL;
GRANT ALL PRIVILEGES ON DATABASE M.VIL TO postgres;
\connect M.VIL
--

CREATE TYPE hierarchy AS ENUM (
    'Alpha',
    'Beta',
    'Omega',
    'True Alpha'
);


ALTER TYPE hierarchy OWNER TO postgres;

--
-- Name: sex; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE sex AS ENUM (
    'M',
    'W'
);


ALTER TYPE sex OWNER TO postgres;

--
-- Name: side; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE side AS ENUM (
    'Dark',
    'Light',
    'both'
);


ALTER TYPE side OWNER TO postgres;

--
-- Name: status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE status AS ENUM (
    'Alive',
    'Dead'
);


ALTER TYPE status OWNER TO postgres;

--
-- Name: status_of_pack; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE status_of_pack AS ENUM (
    'is',
    'is not'
);


ALTER TYPE status_of_pack OWNER TO postgres;


--
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE actors (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    age integer NOT NULL,
    sex sex NOT NULL,
    season_of_start integer NOT NULL,
    season_of_finish integer,
    CONSTRAINT max_age CHECK ((age < 100)),
    CONSTRAINT min_age CHECK ((age > 16))
);


ALTER TABLE actors OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE actors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actors_id_seq OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE actors_id_seq OWNED BY actors.id;


--
-- Name: actors_season_of_finish_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE actors_season_of_finish_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actors_season_of_finish_seq OWNER TO postgres;

--
-- Name: actors_season_of_finish_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE actors_season_of_finish_seq OWNED BY actors.season_of_finish;


--
-- Name: actors_season_of_start_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE actors_season_of_start_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actors_season_of_start_seq OWNER TO postgres;

--
-- Name: actors_season_of_start_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE actors_season_of_start_seq OWNED BY actors.season_of_start;


--
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE characters (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    essence integer NOT NULL,
    actor integer NOT NULL,
    hierarchy hierarchy,
    status_of_character status NOT NULL
);


ALTER TABLE characters OWNER TO postgres;

--
-- Name: characters_actor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE characters_actor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characters_actor_seq OWNER TO postgres;

--
-- Name: characters_actor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE characters_actor_seq OWNED BY characters.actor;


--
-- Name: characters_essence_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE characters_essence_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characters_essence_seq OWNER TO postgres;

--
-- Name: characters_essence_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE characters_essence_seq OWNED BY characters.essence;


--
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE characters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characters_id_seq OWNER TO postgres;

--
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE characters_id_seq OWNED BY characters.id;


--
-- Name: characters_in_packs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE characters_in_packs (
    "character" integer NOT NULL,
    pack integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE characters_in_packs OWNER TO postgres;

--
-- Name: characters_in_packs_character_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE characters_in_packs_character_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characters_in_packs_character_seq OWNER TO postgres;

--
-- Name: characters_in_packs_character_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE characters_in_packs_character_seq OWNED BY characters_in_packs."character";


--
-- Name: characters_in_packs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE characters_in_packs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characters_in_packs_id_seq OWNER TO postgres;

--
-- Name: characters_in_packs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE characters_in_packs_id_seq OWNED BY characters_in_packs.id;


--
-- Name: characters_in_packs_pack_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE characters_in_packs_pack_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characters_in_packs_pack_seq OWNER TO postgres;

--
-- Name: characters_in_packs_pack_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE characters_in_packs_pack_seq OWNED BY characters_in_packs.pack;


--
-- Name: essences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE essences (
    id integer NOT NULL,
    type_of_essence character varying(50) NOT NULL
);


ALTER TABLE essences OWNER TO postgres;

--
-- Name: essences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE essences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE essences_id_seq OWNER TO postgres;

--
-- Name: essences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE essences_id_seq OWNED BY essences.id;


--
-- Name: packs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE packs (
    id integer NOT NULL,
    name_of_pack character varying(50) NOT NULL,
    alpha integer,
    status_of_pack status_of_pack NOT NULL,
    side side NOT NULL
);


ALTER TABLE packs OWNER TO postgres;

--
-- Name: packs_alpha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE packs_alpha_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE packs_alpha_seq OWNER TO postgres;

--
-- Name: packs_alpha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE packs_alpha_seq OWNED BY packs.alpha;


--
-- Name: packs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE packs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE packs_id_seq OWNER TO postgres;

--
-- Name: packs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE packs_id_seq OWNED BY packs.id;


--
-- Name: seasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE seasons (
    id integer NOT NULL,
    number_of_season character varying(3) NOT NULL,
    release_date date NOT NULL,
    CONSTRAINT check_date CHECK ((release_date > '2011-06-04'::date))
);


ALTER TABLE seasons OWNER TO postgres;

--
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seasons_id_seq OWNER TO postgres;

--
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE seasons_id_seq OWNED BY seasons.id;


--
-- Name: actors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actors ALTER COLUMN id SET DEFAULT nextval('actors_id_seq'::regclass);


--
-- Name: actors season_of_start; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actors ALTER COLUMN season_of_start SET DEFAULT nextval('actors_season_of_start_seq'::regclass);


--
-- Name: actors season_of_finish; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actors ALTER COLUMN season_of_finish SET DEFAULT nextval('actors_season_of_finish_seq'::regclass);


--
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters ALTER COLUMN id SET DEFAULT nextval('characters_id_seq'::regclass);


--
-- Name: characters essence; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters ALTER COLUMN essence SET DEFAULT nextval('characters_essence_seq'::regclass);


--
-- Name: characters actor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters ALTER COLUMN actor SET DEFAULT nextval('characters_actor_seq'::regclass);


--
-- Name: characters_in_packs character; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters_in_packs ALTER COLUMN "character" SET DEFAULT nextval('characters_in_packs_character_seq'::regclass);


--
-- Name: characters_in_packs pack; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters_in_packs ALTER COLUMN pack SET DEFAULT nextval('characters_in_packs_pack_seq'::regclass);


--
-- Name: characters_in_packs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters_in_packs ALTER COLUMN id SET DEFAULT nextval('characters_in_packs_id_seq'::regclass);


--
-- Name: essences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY essences ALTER COLUMN id SET DEFAULT nextval('essences_id_seq'::regclass);


--
-- Name: packs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY packs ALTER COLUMN id SET DEFAULT nextval('packs_id_seq'::regclass);


--
-- Name: packs alpha; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY packs ALTER COLUMN alpha SET DEFAULT nextval('packs_alpha_seq'::regclass);


--
-- Name: seasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seasons ALTER COLUMN id SET DEFAULT nextval('seasons_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY actors (id, first_name, last_name, age, sex, season_of_start, season_of_finish) FROM stdin;
2	Tyler	Posey	25	M	1	\N
3	Crystal	Reed	32	W	1	4
4	Dylan	O`Brien	26	M	1	\N
5	Tyler	Hoechlin	30	M	1	\N
6	Holland	Roden	31	W	1	\N
7	Colton	Haynes	29	M	1	\N
8	Shelley	Hennig	30	W	4	\N
9	Arden	Cho	32	W	4	7
10	Dylan	Sprayberry	19	M	5	\N
11	Linden	Ashby	57	M	1	\N
12	Melissa	Ponzio	45	W	1	\N
13	J.R	Bourne	47	M	1	\N
14	Seth	Gilliam	48	M	1	\N
15	Rayn	Kelley	31	M	4	\N
16	Ian	Bohen	41	M	1	\N
17	Orny	Adams	47	M	1	\N
18	Khylin	Rhambo	21	M	5	\N
19	Daniel	Sharman	31	M	2	4
20	Cody	Christian	22	M	6	\N
21	Michael	Johnston	21	M	6	\N
22	Keahu	Kahuanui	31	M	1	4
23	Victoria	Moroles	21	W	6	8
24	Susan	Walters	54	W	1	\N
25	Michael	Hogan	68	M	2	9
26	Charlie	Carver	29	M	3	\N
27	Max	Carver	29	M	3	4
28	Jillian	Wagner	38	W	1	\N
29	Matthew	Negro	45	M	3	\N
30	Meagan	Tandy	32	W	3	7
31	Gideon	Emery	45	M	3	9
32	Eaddy	Mays	40	W	1	3
33	Tamlyn	Tomita	51	W	4	8
34	Sinqua	Walls	32	M	2	3
35	Kelsey	Chow	26	W	6	7
36	Bianca	Lawson	38	W	2	4
39	Heley	Webb	31	W	3	3
40	Gage	Golightly	24	W	2	3
41	Adelaide	Kane	27	W	3	3
42	Felisha	Terrell	38	W	3	3
43	Adam	Fristoe	39	M	1	3
44	Stephen	Ford	27	M	2	2
45	Sibongile	Mlambo	27	W	9	\N
46	Froy	Gutierrez	19	M	9	\N
47	Maya	Eshet	27	W	4	7
48	Andrew	Matarazzo	20	M	9	9
49	Pete	Ploszek	30	M	8	8
50	Ivonne	Coll	70	W	4	5
51	Brian	Wade	39	M	3	3
52	Joseph	Gatt	42	M	5	5
53	Cody	Saintgnue	24	M	5	9
54	Lily	Mariye	53	W	4	5
\.


--
-- Name: actors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('actors_id_seq', 54, true);


--
-- Name: actors_season_of_finish_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('actors_season_of_finish_seq', 1, false);


--
-- Name: actors_season_of_start_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('actors_season_of_start_seq', 1, false);


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY characters (id, first_name, last_name, essence, actor, hierarchy, status_of_character) FROM stdin;
1	Scott	McCall	1	2	True Alpha	Alive
2	Allison	Argent	11	3	\N	Dead
3	Marie-Jeanne	Valet	11	3	\N	Dead
4	Mieczyslaw	Stilinski	4	4	\N	Alive
5	Nogitsune	\N	3	4	\N	Alive
6	Derek	Hale	1	5	Beta	Alive
7	Lydia	Martin	10	6	\N	Alive
8	Jackson	Whittemore	5	7	\N	Alive
9	Malia	Hale	1	8	Beta	Alive
10	Kira	Yukimura	3	9	\N	Alive
11	Liam	Danbar	1	10	Beta	Alive
12	Noa	Stilinski	4	11	\N	Alive
13	Melissa	McCall	4	12	\N	Alive
14	Christopher	Argent	11	13	\N	Alive
15	Alan	Deaton	7	14	\N	Alive
16	Jordan	Parrish	9	15	\N	Alive
17	Peter	Hale	1	16	Omega	Alive
18	Bobby	Finstock	4	17	\N	Alive
19	Mason	Hewitt	4	18	\N	Alive
20	La Bestia de Gavaudan	\N	1	18	Alpha	Dead
21	Isaac	Lahey	1	19	Beta	Alive
22	Theo	Raeken	2	20	\N	Alive
23	Corey	\N	2	21	\N	Alive
24	Danny	Mahealani	4	22	\N	Alive
25	Hayden	Romero	1	23	Beta	Alive
26	Natalie	Martin	4	24	\N	Alive
27	Gerard	Argent	11	25	\N	Dead
28	Ethan	\N	1	26	Omega	Alive
29	Aiden	\N	1	27	Omega	Dead
30	Kate	Argent	6	28	\N	Alive
31	Rafael	McCall	4	29	\N	Alive
32	Braeden	\N	4	30	\N	Alive
33	Deucalion	\N	1	31	Alpha	Dead
34	Victoria	Argent	4	32	\N	Dead
35	Noshiko	Yukimura	3	33	\N	Alive
36	Vernon	Boyd	1	34	Beta	Dead
37	Tracy	Stewart	2	35	\N	Dead
38	Marin	Morrell	7	36	\N	Alive
39	Jennifer	Blake	8	39	\N	Dead
40	Erica	Reyes	1	40	Beta	Dead
41	Kora	Hale	1	41	Beta	Alive
42	Kali	\N	1	42	Alpha	Dead
43	Adrian	Harris	4	43	\N	Dead
44	Matt	Daehler	4	44	\N	Dead
45	Tamora	Monroe	11	45	\N	Alive
46	Nolan	Godfrey	11	46	\N	Alive
47	Meredith	Walker	10	47	\N	Alive
48	Gabe	\N	11	48	\N	Dead
49	Garret	Duglas	1	49	Alpha	Dead
50	Araya	Calavera	11	50	\N	Alive
51	Ennis	\N	1	51	Alpha	Dead
52	The Voiceless	\N	4	52	\N	Dead
53	Brett	Talbot	1	53	Beta	Dead
54	Satomy	Ito	1	54	Alpha	Dead
\.


--
-- Name: characters_actor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('characters_actor_seq', 1, false);


--
-- Name: characters_essence_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('characters_essence_seq', 1, false);


--
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('characters_id_seq', 54, true);


--
-- Data for Name: characters_in_packs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY characters_in_packs ("character", pack, id) FROM stdin;
1	1	1
1	9	2
2	1	3
2	6	4
3	6	5
4	1	6
4	11	7
5	16	8
6	5	9
6	12	10
7	10	11
7	7	12
8	16	13
9	1	14
9	12	15
10	1	16
10	13	17
11	1	18
12	11	19
13	9	20
14	6	21
15	1	22
15	5	23
15	14	24
16	16	25
17	12	26
18	16	27
19	16	28
20	16	29
21	1	30
21	5	31
22	3	32
23	3	33
24	16	34
25	1	35
25	3	36
26	10	37
27	6	38
28	2	39
29	2	40
30	6	41
31	9	42
32	15	43
33	2	44
34	6	45
35	13	46
36	5	47
37	3	48
38	2	49
38	14	50
39	14	51
40	5	52
41	5	53
41	12	54
42	2	55
43	16	56
44	16	57
45	16	58
46	16	59
47	15	60
48	16	61
49	16	62
50	7	63
52	15	64
53	4	65
54	4	66
\.


--
-- Name: characters_in_packs_character_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('characters_in_packs_character_seq', 1, false);


--
-- Name: characters_in_packs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('characters_in_packs_id_seq', 132, true);


--
-- Name: characters_in_packs_pack_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('characters_in_packs_pack_seq', 1, false);


--
-- Data for Name: essences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY essences (id, type_of_essence) FROM stdin;
1	WereWolf
2	Chimera
3	Kitsune
4	Human
5	Kanima
6	Jaguar
7	Advisor
8	Darak
9	Hellhound
10	Banchee
11	Hunter
\.


--
-- Name: essences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('essences_id_seq', 11, true);


--
-- Data for Name: packs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY packs (id, name_of_pack, alpha, status_of_pack, side) FROM stdin;
1	McCall`s pack	1	is	Light
2	Alpha`s pack	33	is not	Dark
3	Chimera`s pack	22	is not	Dark
4	Satomy`s pack	54	is not	Light
5	Derek`s pack	6	is not	Dark
6	Argents family	27	is	both
7	Calaveras family	50	is	Light
9	McCalls family	\N	is	Light
10	Martins family	\N	is	Light
11	Stilinskis family	\N	is	Light
12	Hales family	\N	is	Light
13	Yukimuras family	\N	is	Light
14	The Druids	\N	is	both
15	Mercenaries	47	is not	Dark
16	Other characters	\N	is	both
\.


--
-- Name: packs_alpha_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('packs_alpha_seq', 1, true);


--
-- Name: packs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('packs_id_seq', 18, true);


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY seasons (id, number_of_season, release_date) FROM stdin;
1	1	2011-06-05
2	2	2012-06-03
3	3a	2013-06-03
4	3b	2014-01-06
5	4	2014-06-23
6	5a	2015-06-29
7	5b	2016-01-05
8	6a	2016-11-15
9	6b	2017-07-30
\.


--
-- Name: seasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seasons_id_seq', 9, true);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);


--
-- Name: characters_in_packs characters_in_packs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters_in_packs
    ADD CONSTRAINT characters_in_packs_pkey PRIMARY KEY (id);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- Name: essences essences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY essences
    ADD CONSTRAINT essences_pkey PRIMARY KEY (id);


--
-- Name: essences essences_type_of_essence_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY essences
    ADD CONSTRAINT essences_type_of_essence_key UNIQUE (type_of_essence);


--
-- Name: packs name_of_pack; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY packs
    ADD CONSTRAINT name_of_pack UNIQUE (name_of_pack);


--
-- Name: packs packs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY packs
    ADD CONSTRAINT packs_pkey PRIMARY KEY (id);


--
-- Name: seasons seasons_number_of_season_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seasons
    ADD CONSTRAINT seasons_number_of_season_key UNIQUE (number_of_season);


--
-- Name: seasons seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- Name: essences type_of_essence; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY essences
    ADD CONSTRAINT type_of_essence UNIQUE (type_of_essence);



--
-- Name: actors actors_season_of_finish_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actors
    ADD CONSTRAINT actors_season_of_finish_fkey FOREIGN KEY (season_of_finish) REFERENCES seasons(id);


--
-- Name: actors actors_season_of_start_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actors
    ADD CONSTRAINT actors_season_of_start_fkey FOREIGN KEY (season_of_start) REFERENCES seasons(id);


--
-- Name: characters characters_actor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters
    ADD CONSTRAINT characters_actor_fkey FOREIGN KEY (actor) REFERENCES actors(id);


--
-- Name: characters characters_essence_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters
    ADD CONSTRAINT characters_essence_fkey FOREIGN KEY (essence) REFERENCES essences(id);


--
-- Name: characters_in_packs characters_in_packs_character_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters_in_packs
    ADD CONSTRAINT characters_in_packs_character_fkey FOREIGN KEY ("character") REFERENCES characters(id);


--
-- Name: characters_in_packs characters_in_packs_pack_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY characters_in_packs
    ADD CONSTRAINT characters_in_packs_pack_fkey FOREIGN KEY (pack) REFERENCES packs(id);


--
-- Name: packs packs_alpha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY packs
    ADD CONSTRAINT packs_alpha_fkey FOREIGN KEY (alpha) REFERENCES characters(id);
	
	--
-- Name: actors_age_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX actors_age_idx ON actors USING btree (age);


--
-- Name: actors_sex_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX actors_sex_idx ON actors USING btree (sex);


--
-- Name: characters_actor_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX characters_actor_idx ON characters USING btree (actor);


--
-- Name: characters_essence_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX characters_essence_idx ON characters USING btree (essence);


--
-- Name: characters_in_packs_character_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX characters_in_packs_character_idx ON characters_in_packs USING btree ("character");


--
-- Name: characters_in_packs_pack_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX characters_in_packs_pack_idx ON characters_in_packs USING btree (pack);


--
-- Name: characters_status_of_character_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX characters_status_of_character_idx ON characters USING btree (status_of_character);


--
-- Name: essences_type_of_essence_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX essences_type_of_essence_idx ON essences USING btree (type_of_essence);


--
-- Name: packs_status_of_pack_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX packs_status_of_pack_idx ON packs USING btree (status_of_pack);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

