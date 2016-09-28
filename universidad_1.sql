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
-- Name: alum_pro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alum_pro (
    ced_alu1 integer,
    ced_p1 integer
);


ALTER TABLE alum_pro OWNER TO postgres;

--
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alumno (
    cedula integer NOT NULL,
    nombre character varying(25),
    apellido character varying(25),
    edad integer,
    semestre integer,
    sexo character(1),
    codc1 integer
);


ALTER TABLE alumno OWNER TO postgres;

--
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE carrera (
    cod_carrera integer NOT NULL,
    nombre_carrera character varying(25),
    duracion_carrera character varying
);


ALTER TABLE carrera OWNER TO postgres;

--
-- Name: mat_alum; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mat_alum (
    ced_alu2 integer,
    cod_mat1 integer
);


ALTER TABLE mat_alum OWNER TO postgres;

--
-- Name: mat_p; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mat_p (
    cod_mat2 integer,
    ced_p2 integer
);


ALTER TABLE mat_p OWNER TO postgres;

--
-- Name: materia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE materia (
    cod_materia integer NOT NULL,
    nombre_materia character varying(50),
    creditos_materia integer
);


ALTER TABLE materia OWNER TO postgres;

--
-- Name: profesores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profesores (
    cedula_p integer NOT NULL,
    nombre_p character varying(25),
    apellido_p character varying(25),
    telefono character varying(15),
    horario character varying(30)
);


ALTER TABLE profesores OWNER TO postgres;

--
-- Data for Name: alum_pro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alum_pro (ced_alu1, ced_p1) FROM stdin;
30160246	17834245
25234876	18598122
\.


--
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alumno (cedula, nombre, apellido, edad, semestre, sexo, codc1) FROM stdin;
30160246	Samuel	Ramirez	18	2	M	\N
26745234	Jose	Colmenares	22	6	M	\N
26182290	Ana	Farías	19	3	F	\N
26184356	Oriana	Sanchez	17	2	F	\N
25184356	Jose	Salas	23	4	M	\N
23243786	Carlos	Hernandez	22	8	M	\N
24573486	Barbara	Hernandez	19	5	F	\N
25234876	Gabriela	Flores	20	7	F	\N
\.


--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY carrera (cod_carrera, nombre_carrera, duracion_carrera) FROM stdin;
1	Ing.Sistemas	10 semestres
5	Ing.Civil	10 semestres
3	Ing.Agronoma	10 semestres
2	Medicina	6 años
\.


--
-- Data for Name: mat_alum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mat_alum (ced_alu2, cod_mat1) FROM stdin;
30160246	102
25234876	142
\.


--
-- Data for Name: mat_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mat_p (cod_mat2, ced_p2) FROM stdin;
\.


--
-- Data for Name: materia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materia (cod_materia, nombre_materia, creditos_materia) FROM stdin;
102	Algoritmos I	5
231	Electiva Libre I	3
150	Matematica IV	6
142	Redes	3
\.


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY profesores (cedula_p, nombre_p, apellido_p, telefono, horario) FROM stdin;
17834245	Carlos	Alberto	04265432133	matutino
19234506	Gabriel	Calderon	04143842560	mixto
20435267	Elias	Matos	04162774565	vespertino
18434789	Paola	Loreto	04267764356	mixto
18598122	Patricia	Hurtado	04145543289	matutino
\.


--
-- Name: pk_ceda; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT pk_ceda PRIMARY KEY (cedula);


--
-- Name: pk_cedp; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profesores
    ADD CONSTRAINT pk_cedp PRIMARY KEY (cedula_p);


--
-- Name: pk_codc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT pk_codc PRIMARY KEY (cod_carrera);


--
-- Name: pk_codm; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY materia
    ADD CONSTRAINT pk_codm PRIMARY KEY (cod_materia);


--
-- Name: fk_ceda1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alum_pro
    ADD CONSTRAINT fk_ceda1 FOREIGN KEY (ced_alu1) REFERENCES alumno(cedula);


--
-- Name: fk_ceda2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mat_alum
    ADD CONSTRAINT fk_ceda2 FOREIGN KEY (ced_alu2) REFERENCES alumno(cedula);


--
-- Name: fk_cedp1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alum_pro
    ADD CONSTRAINT fk_cedp1 FOREIGN KEY (ced_p1) REFERENCES profesores(cedula_p);


--
-- Name: fk_cedp2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mat_p
    ADD CONSTRAINT fk_cedp2 FOREIGN KEY (ced_p2) REFERENCES profesores(cedula_p);


--
-- Name: fk_codc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT fk_codc1 FOREIGN KEY (codc1) REFERENCES carrera(cod_carrera);


--
-- Name: fk_codm1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mat_alum
    ADD CONSTRAINT fk_codm1 FOREIGN KEY (cod_mat1) REFERENCES materia(cod_materia);


--
-- Name: fk_codm2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mat_p
    ADD CONSTRAINT fk_codm2 FOREIGN KEY (cod_mat2) REFERENCES materia(cod_materia);


--
-- Name: pk_codc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT pk_codc1 FOREIGN KEY (codc1) REFERENCES carrera(cod_carrera);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

