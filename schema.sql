--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: crime_stats; Type: TABLE; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE TABLE crime_stats (
    incident_id integer NOT NULL,
    incident_num character varying(60),
    data_source character varying(60) NOT NULL,
    category character varying(60),
    map_category character varying(60) NOT NULL,
    description character varying(200) NOT NULL,
    day_of_week character varying(10) NOT NULL,
    date date NOT NULL,
    month character varying(10) NOT NULL,
    "time" time without time zone NOT NULL,
    hour character varying(10) NOT NULL,
    district character varying(60),
    address character varying(60) NOT NULL,
    x_cord numeric NOT NULL,
    y_cord numeric NOT NULL
);


ALTER TABLE crime_stats OWNER TO bhushan;

--
-- Name: crime_stats_incident_id_seq; Type: SEQUENCE; Schema: public; Owner: bhushan
--

CREATE SEQUENCE crime_stats_incident_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crime_stats_incident_id_seq OWNER TO bhushan;

--
-- Name: crime_stats_incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhushan
--

ALTER SEQUENCE crime_stats_incident_id_seq OWNED BY crime_stats.incident_id;


--
-- Name: data_imports; Type: TABLE; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE TABLE data_imports (
    import_id integer NOT NULL,
    max_date date NOT NULL
);


ALTER TABLE data_imports OWNER TO bhushan;

--
-- Name: data_imports_import_id_seq; Type: SEQUENCE; Schema: public; Owner: bhushan
--

CREATE SEQUENCE data_imports_import_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_imports_import_id_seq OWNER TO bhushan;

--
-- Name: data_imports_import_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhushan
--

ALTER SEQUENCE data_imports_import_id_seq OWNED BY data_imports.import_id;


--
-- Name: day_counts; Type: TABLE; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE TABLE day_counts (
    id integer NOT NULL,
    day character varying(10) NOT NULL,
    map_category character varying(60) NOT NULL,
    count integer NOT NULL
);


ALTER TABLE day_counts OWNER TO bhushan;

--
-- Name: day_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: bhushan
--

CREATE SEQUENCE day_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE day_counts_id_seq OWNER TO bhushan;

--
-- Name: day_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhushan
--

ALTER SEQUENCE day_counts_id_seq OWNED BY day_counts.id;


--
-- Name: hour_counts; Type: TABLE; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE TABLE hour_counts (
    id integer NOT NULL,
    hour character varying(10) NOT NULL,
    map_category character varying(60) NOT NULL,
    count integer NOT NULL
);


ALTER TABLE hour_counts OWNER TO bhushan;

--
-- Name: hour_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: bhushan
--

CREATE SEQUENCE hour_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hour_counts_id_seq OWNER TO bhushan;

--
-- Name: hour_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhushan
--

ALTER SEQUENCE hour_counts_id_seq OWNED BY hour_counts.id;


--
-- Name: month_counts; Type: TABLE; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE TABLE month_counts (
    id integer NOT NULL,
    month character varying(10) NOT NULL,
    map_category character varying(60) NOT NULL,
    count integer NOT NULL
);


ALTER TABLE month_counts OWNER TO bhushan;

--
-- Name: month_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: bhushan
--

CREATE SEQUENCE month_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE month_counts_id_seq OWNER TO bhushan;

--
-- Name: month_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhushan
--

ALTER SEQUENCE month_counts_id_seq OWNED BY month_counts.id;


--
-- Name: incident_id; Type: DEFAULT; Schema: public; Owner: bhushan
--

ALTER TABLE ONLY crime_stats ALTER COLUMN incident_id SET DEFAULT nextval('crime_stats_incident_id_seq'::regclass);


--
-- Name: import_id; Type: DEFAULT; Schema: public; Owner: bhushan
--

ALTER TABLE ONLY data_imports ALTER COLUMN import_id SET DEFAULT nextval('data_imports_import_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bhushan
--

ALTER TABLE ONLY day_counts ALTER COLUMN id SET DEFAULT nextval('day_counts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bhushan
--

ALTER TABLE ONLY hour_counts ALTER COLUMN id SET DEFAULT nextval('hour_counts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bhushan
--

ALTER TABLE ONLY month_counts ALTER COLUMN id SET DEFAULT nextval('month_counts_id_seq'::regclass);


--
-- Name: crime_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: bhushan; Tablespace: 
--

ALTER TABLE ONLY crime_stats
    ADD CONSTRAINT crime_stats_pkey PRIMARY KEY (incident_id);


--
-- Name: data_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: bhushan; Tablespace: 
--

ALTER TABLE ONLY data_imports
    ADD CONSTRAINT data_imports_pkey PRIMARY KEY (import_id);


--
-- Name: day_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: bhushan; Tablespace: 
--

ALTER TABLE ONLY day_counts
    ADD CONSTRAINT day_counts_pkey PRIMARY KEY (id);


--
-- Name: hour_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: bhushan; Tablespace: 
--

ALTER TABLE ONLY hour_counts
    ADD CONSTRAINT hour_counts_pkey PRIMARY KEY (id);


--
-- Name: month_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: bhushan; Tablespace: 
--

ALTER TABLE ONLY month_counts
    ADD CONSTRAINT month_counts_pkey PRIMARY KEY (id);


--
-- Name: date; Type: INDEX; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE INDEX date ON crime_stats USING btree (date);


--
-- Name: day_map_category; Type: INDEX; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE INDEX day_map_category ON crime_stats USING btree (day_of_week, map_category);


--
-- Name: hour_map_category; Type: INDEX; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE INDEX hour_map_category ON crime_stats USING btree (hour, map_category);


--
-- Name: incident_num_category; Type: INDEX; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE INDEX incident_num_category ON crime_stats USING btree (incident_num, category);


--
-- Name: month_map_category; Type: INDEX; Schema: public; Owner: bhushan; Tablespace: 
--

CREATE INDEX month_map_category ON crime_stats USING btree (month, map_category);


--
-- Name: public; Type: ACL; Schema: -; Owner: bhushan
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM bhushan;
GRANT ALL ON SCHEMA public TO bhushan;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

