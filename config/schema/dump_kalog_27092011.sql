--
-- PostgreSQL database dump
--

-- Started on 2011-09-27 21:31:40 WIT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 20 (class 1255 OID 17317)
-- Dependencies: 7 472
-- Name: generatecontainertype(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION generatecontainertype() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    contLength RECORD;
    contHeight RECORD;
    contGroup RECORD;
BEGIN
    FOR contLength IN SELECT * FROM container_lengths LOOP
	FOR contHeight IN SELECT * FROM container_heights_container_widths LOOP
	    FOR contGroup IN SELECT * FROM container_group_types LOOP
		-- raise log '%', contLength.code || contHeight.code || contGroup.code;
		INSERT INTO container_types (
		    container_length_id,
		    container_heights_container_widths_id,
		    container_group_type_id
		)
		VALUES (
		    contLength.id,
		    contHeight.id,
		    contGroup.id
		);
	    END LOOP;
	END LOOP;
    END LOOP;
    RETURN 1;
END;
$$;


ALTER FUNCTION public.generatecontainertype() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1659 (class 1259 OID 17318)
-- Dependencies: 7
-- Name: agreements; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE agreements (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    start_date date,
    expired_date date
);


ALTER TABLE public.agreements OWNER TO cms_kalog;

--
-- TOC entry 1660 (class 1259 OID 17321)
-- Dependencies: 1659 7
-- Name: agreements_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE agreements_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.agreements_customer_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 1660
-- Name: agreements_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE agreements_customer_id_seq OWNED BY agreements.customer_id;


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 1660
-- Name: agreements_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('agreements_customer_id_seq', 1, false);


--
-- TOC entry 1661 (class 1259 OID 17323)
-- Dependencies: 1659 7
-- Name: agreements_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE agreements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.agreements_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 1661
-- Name: agreements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE agreements_id_seq OWNED BY agreements.id;


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 1661
-- Name: agreements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('agreements_id_seq', 1, false);


--
-- TOC entry 1662 (class 1259 OID 17325)
-- Dependencies: 7
-- Name: agreements_packets; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE agreements_packets (
    id integer NOT NULL,
    agreement_id integer,
    packet_id integer,
    charge money
);


ALTER TABLE public.agreements_packets OWNER TO cms_kalog;

--
-- TOC entry 1663 (class 1259 OID 17328)
-- Dependencies: 7 1662
-- Name: agreements_packets_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE agreements_packets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.agreements_packets_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 1663
-- Name: agreements_packets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE agreements_packets_id_seq OWNED BY agreements_packets.id;


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 1663
-- Name: agreements_packets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('agreements_packets_id_seq', 1, false);


--
-- TOC entry 1760 (class 1259 OID 17806)
-- Dependencies: 7
-- Name: blocks; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE blocks (
    id integer NOT NULL,
    code character varying(255)
);


ALTER TABLE public.blocks OWNER TO cms_kalog;

--
-- TOC entry 1759 (class 1259 OID 17804)
-- Dependencies: 1760 7
-- Name: blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.blocks_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 1759
-- Name: blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE blocks_id_seq OWNED BY blocks.id;


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 1759
-- Name: blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('blocks_id_seq', 1, false);


--
-- TOC entry 1748 (class 1259 OID 17728)
-- Dependencies: 2115 7
-- Name: branches; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE branches (
    id integer NOT NULL,
    name character varying(255),
    location_id integer DEFAULT 0
);


ALTER TABLE public.branches OWNER TO cms_kalog;

--
-- TOC entry 1747 (class 1259 OID 17726)
-- Dependencies: 1748 7
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.branches_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 1747
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE branches_id_seq OWNED BY branches.id;


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 1747
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('branches_id_seq', 1, false);


--
-- TOC entry 1736 (class 1259 OID 17662)
-- Dependencies: 7
-- Name: carriages; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE carriages (
    id integer NOT NULL,
    code character varying(50)
);


ALTER TABLE public.carriages OWNER TO cms_kalog;

--
-- TOC entry 1738 (class 1259 OID 17673)
-- Dependencies: 2106 2107 7
-- Name: carriages_freights; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE carriages_freights (
    id integer NOT NULL,
    carriage_id integer DEFAULT 0,
    freight_id integer DEFAULT 0
);


ALTER TABLE public.carriages_freights OWNER TO cms_kalog;

--
-- TOC entry 1737 (class 1259 OID 17671)
-- Dependencies: 1738 7
-- Name: carriages_freights_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE carriages_freights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.carriages_freights_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 1737
-- Name: carriages_freights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE carriages_freights_id_seq OWNED BY carriages_freights.id;


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 1737
-- Name: carriages_freights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('carriages_freights_id_seq', 1, false);


--
-- TOC entry 1735 (class 1259 OID 17660)
-- Dependencies: 1736 7
-- Name: carriages_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE carriages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.carriages_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 1735
-- Name: carriages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE carriages_id_seq OWNED BY carriages.id;


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 1735
-- Name: carriages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('carriages_id_seq', 1, false);


--
-- TOC entry 1664 (class 1259 OID 17330)
-- Dependencies: 2047 2048 2049 2050 2051 7
-- Name: cities; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    province_id integer DEFAULT 0 NOT NULL,
    name character varying(60) DEFAULT NULL::character varying,
    other_name character varying(255) DEFAULT NULL::character varying,
    created_by character varying(30) DEFAULT NULL::character varying,
    created timestamp without time zone,
    modified_by character varying(30) DEFAULT NULL::character varying,
    modified timestamp without time zone
);


ALTER TABLE public.cities OWNER TO cms_kalog;

--
-- TOC entry 1665 (class 1259 OID 17338)
-- Dependencies: 1664 7
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 1665
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 1665
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('cities_id_seq', 449, true);


--
-- TOC entry 1762 (class 1259 OID 17814)
-- Dependencies: 7
-- Name: columns; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE columns (
    id integer NOT NULL,
    code character varying(255)
);


ALTER TABLE public.columns OWNER TO cms_kalog;

--
-- TOC entry 1761 (class 1259 OID 17812)
-- Dependencies: 7 1762
-- Name: columns_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE columns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.columns_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 1761
-- Name: columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE columns_id_seq OWNED BY columns.id;


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 1761
-- Name: columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('columns_id_seq', 1, false);


--
-- TOC entry 1666 (class 1259 OID 17340)
-- Dependencies: 7
-- Name: contact_person; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE contact_person (
    id integer NOT NULL,
    first_name character varying(50),
    middle_name character varying(50),
    last_name character varying(50),
    email character varying(50),
    mobile_phone_number character varying(20)
);


ALTER TABLE public.contact_person OWNER TO cms_kalog;

--
-- TOC entry 1667 (class 1259 OID 17343)
-- Dependencies: 7 1666
-- Name: contact_person_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE contact_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contact_person_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 1667
-- Name: contact_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE contact_person_id_seq OWNED BY contact_person.id;


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 1667
-- Name: contact_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('contact_person_id_seq', 1, false);


--
-- TOC entry 1758 (class 1259 OID 17778)
-- Dependencies: 2130 2131 7
-- Name: container_depo_coordinates; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_depo_coordinates (
    id integer NOT NULL,
    container_depo_id integer DEFAULT 0,
    coordinate_id integer DEFAULT 0
);


ALTER TABLE public.container_depo_coordinates OWNER TO cms_kalog;

--
-- TOC entry 1757 (class 1259 OID 17776)
-- Dependencies: 7 1758
-- Name: container_depo_coordinates_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_depo_coordinates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_depo_coordinates_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 1757
-- Name: container_depo_coordinates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_depo_coordinates_id_seq OWNED BY container_depo_coordinates.id;


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 1757
-- Name: container_depo_coordinates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_depo_coordinates_id_seq', 1, false);


--
-- TOC entry 1752 (class 1259 OID 17746)
-- Dependencies: 2119 7
-- Name: container_depos; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_depos (
    id integer NOT NULL,
    name character varying(255),
    branch_id integer DEFAULT 0
);


ALTER TABLE public.container_depos OWNER TO cms_kalog;

--
-- TOC entry 1751 (class 1259 OID 17744)
-- Dependencies: 7 1752
-- Name: container_depos_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_depos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_depos_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 1751
-- Name: container_depos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_depos_id_seq OWNED BY container_depos.id;


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 1751
-- Name: container_depos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_depos_id_seq', 1, false);


--
-- TOC entry 1668 (class 1259 OID 17345)
-- Dependencies: 7
-- Name: container_group_designations; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_group_designations (
    id integer NOT NULL,
    code character(2),
    description character varying(60),
    container_group_id integer,
    created timestamp without time zone,
    created_by integer,
    modified timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.container_group_designations OWNER TO cms_kalog;

--
-- TOC entry 1669 (class 1259 OID 17348)
-- Dependencies: 7 1668
-- Name: container_group_designations_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_group_designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_group_designations_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 1669
-- Name: container_group_designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_group_designations_id_seq OWNED BY container_group_designations.id;


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 1669
-- Name: container_group_designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_group_designations_id_seq', 19, true);


--
-- TOC entry 1670 (class 1259 OID 17350)
-- Dependencies: 7
-- Name: container_group_types; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_group_types (
    id integer NOT NULL,
    code character(2),
    description character varying(150),
    container_group_id integer,
    container_group_designation_id integer,
    created timestamp without time zone,
    created_by integer,
    modified timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.container_group_types OWNER TO cms_kalog;

--
-- TOC entry 1671 (class 1259 OID 17353)
-- Dependencies: 1670 7
-- Name: container_group_types_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_group_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_group_types_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 1671
-- Name: container_group_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_group_types_id_seq OWNED BY container_group_types.id;


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 1671
-- Name: container_group_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_group_types_id_seq', 48, true);


--
-- TOC entry 1672 (class 1259 OID 17355)
-- Dependencies: 7
-- Name: container_groups; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_groups (
    id integer NOT NULL,
    code character(2),
    description character varying(60),
    created timestamp without time zone,
    created_by integer,
    modified timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.container_groups OWNER TO cms_kalog;

--
-- TOC entry 1673 (class 1259 OID 17358)
-- Dependencies: 7 1672
-- Name: container_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_groups_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 1673
-- Name: container_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_groups_id_seq OWNED BY container_groups.id;


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 1673
-- Name: container_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_groups_id_seq', 10, true);


--
-- TOC entry 1674 (class 1259 OID 17360)
-- Dependencies: 7
-- Name: container_heights; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_heights (
    id integer NOT NULL,
    min_millimeter integer,
    max_millimeter integer,
    min_feet integer,
    max_feet integer,
    min_inch integer,
    max_inch integer,
    created timestamp without time zone,
    created_by integer,
    modified timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.container_heights OWNER TO cms_kalog;

--
-- TOC entry 1675 (class 1259 OID 17363)
-- Dependencies: 7
-- Name: container_heights_container_widths; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_heights_container_widths (
    id integer NOT NULL,
    code character(1),
    container_height_id integer,
    container_width_id integer,
    created timestamp without time zone,
    created_by integer,
    modified timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.container_heights_container_widths OWNER TO cms_kalog;

--
-- TOC entry 1676 (class 1259 OID 17366)
-- Dependencies: 7 1675
-- Name: container_heights_container_widths_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_heights_container_widths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_heights_container_widths_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 1676
-- Name: container_heights_container_widths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_heights_container_widths_id_seq OWNED BY container_heights_container_widths.id;


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 1676
-- Name: container_heights_container_widths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_heights_container_widths_id_seq', 15, true);


--
-- TOC entry 1677 (class 1259 OID 17368)
-- Dependencies: 1674 7
-- Name: container_heights_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_heights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_heights_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 1677
-- Name: container_heights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_heights_id_seq OWNED BY container_heights.id;


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 1677
-- Name: container_heights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_heights_id_seq', 7, true);


--
-- TOC entry 1678 (class 1259 OID 17370)
-- Dependencies: 7
-- Name: container_lengths; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_lengths (
    id integer NOT NULL,
    code character(1),
    millimeter integer,
    feet integer,
    inch integer,
    created timestamp without time zone,
    created_by integer,
    modified timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.container_lengths OWNER TO cms_kalog;

--
-- TOC entry 1679 (class 1259 OID 17373)
-- Dependencies: 1678 7
-- Name: container_lengths_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_lengths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_lengths_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 1679
-- Name: container_lengths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_lengths_id_seq OWNED BY container_lengths.id;


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 1679
-- Name: container_lengths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_lengths_id_seq', 17, true);


--
-- TOC entry 1680 (class 1259 OID 17375)
-- Dependencies: 7
-- Name: container_types; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_types (
    id integer NOT NULL,
    container_length_id integer,
    container_heights_container_widths_id integer,
    container_group_type_id integer,
    created timestamp without time zone,
    created_by integer,
    modified timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.container_types OWNER TO cms_kalog;

--
-- TOC entry 1681 (class 1259 OID 17378)
-- Dependencies: 1680 7
-- Name: container_types_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_types_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 1681
-- Name: container_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_types_id_seq OWNED BY container_types.id;


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 1681
-- Name: container_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_types_id_seq', 12240, true);


--
-- TOC entry 1682 (class 1259 OID 17380)
-- Dependencies: 7
-- Name: container_widths; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_widths (
    id integer NOT NULL,
    min_millimeter integer,
    max_millimeter integer,
    min_feet integer,
    max_feet integer,
    min_inch integer,
    max_inch integer,
    created timestamp without time zone,
    created_by integer,
    modified timestamp without time zone,
    modified_by integer
);


ALTER TABLE public.container_widths OWNER TO cms_kalog;

--
-- TOC entry 1683 (class 1259 OID 17383)
-- Dependencies: 1682 7
-- Name: container_widths_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_widths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_widths_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 1683
-- Name: container_widths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_widths_id_seq OWNED BY container_widths.id;


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 1683
-- Name: container_widths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_widths_id_seq', 3, true);


--
-- TOC entry 1756 (class 1259 OID 17768)
-- Dependencies: 2127 2128 7
-- Name: container_yard_coordinates; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_yard_coordinates (
    id integer NOT NULL,
    container_yard_id integer DEFAULT 0,
    coordinate_id integer DEFAULT 0
);


ALTER TABLE public.container_yard_coordinates OWNER TO cms_kalog;

--
-- TOC entry 1755 (class 1259 OID 17766)
-- Dependencies: 1756 7
-- Name: container_yard_coordinates_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_yard_coordinates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_yard_coordinates_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 1755
-- Name: container_yard_coordinates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_yard_coordinates_id_seq OWNED BY container_yard_coordinates.id;


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 1755
-- Name: container_yard_coordinates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_yard_coordinates_id_seq', 1, false);


--
-- TOC entry 1750 (class 1259 OID 17737)
-- Dependencies: 2117 7
-- Name: container_yards; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE container_yards (
    id integer NOT NULL,
    name character varying(255),
    branch_id integer DEFAULT 0
);


ALTER TABLE public.container_yards OWNER TO cms_kalog;

--
-- TOC entry 1749 (class 1259 OID 17735)
-- Dependencies: 1750 7
-- Name: container_yards_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE container_yards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.container_yards_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 1749
-- Name: container_yards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE container_yards_id_seq OWNED BY container_yards.id;


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 1749
-- Name: container_yards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('container_yards_id_seq', 1, false);


--
-- TOC entry 1754 (class 1259 OID 17755)
-- Dependencies: 2120 2121 2123 2124 2125 7
-- Name: coordinates; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE coordinates (
    id integer NOT NULL,
    block_id integer DEFAULT 0,
    column_id integer DEFAULT 0,
    row_id integer DEFAULT 0,
    tier_id integer DEFAULT 0,
    container_id integer DEFAULT 0
);


ALTER TABLE public.coordinates OWNER TO cms_kalog;

--
-- TOC entry 1753 (class 1259 OID 17753)
-- Dependencies: 1754 7
-- Name: coordinates_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE coordinates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.coordinates_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 1753
-- Name: coordinates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE coordinates_id_seq OWNED BY coordinates.id;


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 1753
-- Name: coordinates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('coordinates_id_seq', 1, false);


--
-- TOC entry 1684 (class 1259 OID 17385)
-- Dependencies: 7
-- Name: countries; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    iso2 character(2) NOT NULL,
    iso3 character(3) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.countries OWNER TO cms_kalog;

--
-- TOC entry 1685 (class 1259 OID 17388)
-- Dependencies: 1684 7
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 1685
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 1685
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('countries_id_seq', 894, true);


--
-- TOC entry 1686 (class 1259 OID 17390)
-- Dependencies: 7
-- Name: customers; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE customers (
    id integer NOT NULL,
    name character varying(50),
    contact_person_id integer
);


ALTER TABLE public.customers OWNER TO cms_kalog;

--
-- TOC entry 1687 (class 1259 OID 17393)
-- Dependencies: 1686 7
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 1687
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 1687
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('customers_id_seq', 1, false);


--
-- TOC entry 1688 (class 1259 OID 17395)
-- Dependencies: 7
-- Name: drivers; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE drivers (
    id integer NOT NULL,
    first_name character varying(50),
    middle_name character varying(50),
    last_name character varying(50),
    license_id integer NOT NULL
);


ALTER TABLE public.drivers OWNER TO cms_kalog;

--
-- TOC entry 1689 (class 1259 OID 17398)
-- Dependencies: 7 1688
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE drivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.drivers_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 1689
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE drivers_id_seq OWNED BY drivers.id;


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 1689
-- Name: drivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('drivers_id_seq', 52, true);


--
-- TOC entry 1690 (class 1259 OID 17400)
-- Dependencies: 7 1688
-- Name: drivers_license_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE drivers_license_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.drivers_license_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 1690
-- Name: drivers_license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE drivers_license_id_seq OWNED BY drivers.license_id;


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 1690
-- Name: drivers_license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('drivers_license_id_seq', 52, true);


--
-- TOC entry 1740 (class 1259 OID 17683)
-- Dependencies: 2109 2110 7
-- Name: freights; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE freights (
    id integer NOT NULL,
    schedule_id integer DEFAULT 0,
    locomotive_id integer DEFAULT 0,
    date date
);


ALTER TABLE public.freights OWNER TO cms_kalog;

--
-- TOC entry 1739 (class 1259 OID 17681)
-- Dependencies: 7 1740
-- Name: freights_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE freights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.freights_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 1739
-- Name: freights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE freights_id_seq OWNED BY freights.id;


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 1739
-- Name: freights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('freights_id_seq', 1, false);


--
-- TOC entry 1691 (class 1259 OID 17402)
-- Dependencies: 7
-- Name: groups; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.groups OWNER TO cms_kalog;

--
-- TOC entry 1692 (class 1259 OID 17405)
-- Dependencies: 7 1691
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 1692
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 1692
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('groups_id_seq', 2, true);


--
-- TOC entry 1693 (class 1259 OID 17407)
-- Dependencies: 7
-- Name: groups_menus; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE groups_menus (
    group_id integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.groups_menus OWNER TO cms_kalog;

--
-- TOC entry 1694 (class 1259 OID 17410)
-- Dependencies: 7
-- Name: groups_module_actions; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE groups_module_actions (
    module_action_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.groups_module_actions OWNER TO cms_kalog;

--
-- TOC entry 1695 (class 1259 OID 17413)
-- Dependencies: 2067 7
-- Name: letter_numbers; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE letter_numbers (
    id bigint NOT NULL,
    no_start integer NOT NULL,
    no_end integer NOT NULL,
    valid_start date,
    valid_end date,
    active integer DEFAULT 1,
    created timestamp without time zone NOT NULL,
    created_by integer NOT NULL
);


ALTER TABLE public.letter_numbers OWNER TO cms_kalog;

--
-- TOC entry 1696 (class 1259 OID 17417)
-- Dependencies: 1695 7
-- Name: letter_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE letter_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.letter_numbers_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 1696
-- Name: letter_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE letter_numbers_id_seq OWNED BY letter_numbers.id;


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 1696
-- Name: letter_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('letter_numbers_id_seq', 1, false);


--
-- TOC entry 1697 (class 1259 OID 17419)
-- Dependencies: 7
-- Name: license_types; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE license_types (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.license_types OWNER TO cms_kalog;

--
-- TOC entry 1698 (class 1259 OID 17422)
-- Dependencies: 1697 7
-- Name: license_types_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE license_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.license_types_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 1698
-- Name: license_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE license_types_id_seq OWNED BY license_types.id;


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 1698
-- Name: license_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('license_types_id_seq', 1, false);


--
-- TOC entry 1699 (class 1259 OID 17424)
-- Dependencies: 7
-- Name: licenses; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE licenses (
    id integer NOT NULL,
    license_type_id integer,
    code character varying,
    authorized_by character varying,
    issued_date date,
    expired_date date
);


ALTER TABLE public.licenses OWNER TO cms_kalog;

--
-- TOC entry 1700 (class 1259 OID 17430)
-- Dependencies: 1699 7
-- Name: licenses_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE licenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.licenses_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 1700
-- Name: licenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE licenses_id_seq OWNED BY licenses.id;


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 1700
-- Name: licenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('licenses_id_seq', 1, false);


--
-- TOC entry 1746 (class 1259 OID 17717)
-- Dependencies: 7
-- Name: locations; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.locations OWNER TO cms_kalog;

--
-- TOC entry 1745 (class 1259 OID 17715)
-- Dependencies: 7 1746
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 1745
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 1745
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('locations_id_seq', 1, false);


--
-- TOC entry 1742 (class 1259 OID 17693)
-- Dependencies: 7
-- Name: locomotives; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE locomotives (
    id integer NOT NULL,
    code character varying(50)
);


ALTER TABLE public.locomotives OWNER TO cms_kalog;

--
-- TOC entry 1741 (class 1259 OID 17691)
-- Dependencies: 7 1742
-- Name: locomotives_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE locomotives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.locomotives_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 1741
-- Name: locomotives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE locomotives_id_seq OWNED BY locomotives.id;


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 1741
-- Name: locomotives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('locomotives_id_seq', 1, false);


--
-- TOC entry 1701 (class 1259 OID 17432)
-- Dependencies: 7
-- Name: members; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE members (
    id integer NOT NULL,
    code character varying(16) NOT NULL,
    name character varying(50) NOT NULL,
    vehicle_category_id integer,
    stnk_no character varying(50) NOT NULL,
    created timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified timestamp without time zone NOT NULL,
    modified_by integer
);


ALTER TABLE public.members OWNER TO cms_kalog;

--
-- TOC entry 1702 (class 1259 OID 17435)
-- Dependencies: 1701 7
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 1702
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 1702
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('members_id_seq', 1, false);


--
-- TOC entry 1703 (class 1259 OID 17437)
-- Dependencies: 7
-- Name: menu_types; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE menu_types (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    call_name character varying(10) NOT NULL,
    created timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified timestamp without time zone NOT NULL,
    modified_by integer
);


ALTER TABLE public.menu_types OWNER TO cms_kalog;

--
-- TOC entry 1704 (class 1259 OID 17440)
-- Dependencies: 7 1703
-- Name: menu_types_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE menu_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.menu_types_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 1704
-- Name: menu_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE menu_types_id_seq OWNED BY menu_types.id;


--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 1704
-- Name: menu_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('menu_types_id_seq', 6, true);


--
-- TOC entry 1705 (class 1259 OID 17442)
-- Dependencies: 2073 7
-- Name: menus; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE menus (
    id integer NOT NULL,
    parent_id integer DEFAULT 0,
    name character varying(30) NOT NULL,
    url character varying(50) NOT NULL,
    element_id character varying(20) NOT NULL,
    enable integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    menu_type_id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified timestamp without time zone NOT NULL,
    modified_by integer
);


ALTER TABLE public.menus OWNER TO cms_kalog;

--
-- TOC entry 1706 (class 1259 OID 17446)
-- Dependencies: 7 1705
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 1706
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE menus_id_seq OWNED BY menus.id;


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 1706
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('menus_id_seq', 33, true);


--
-- TOC entry 1707 (class 1259 OID 17448)
-- Dependencies: 7
-- Name: module_actions; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE module_actions (
    id integer NOT NULL,
    module_id integer NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp without time zone NOT NULL,
    created_by integer,
    modified timestamp without time zone NOT NULL,
    modified_by integer
);


ALTER TABLE public.module_actions OWNER TO cms_kalog;

--
-- TOC entry 1708 (class 1259 OID 17451)
-- Dependencies: 1707 7
-- Name: module_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE module_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.module_actions_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 1708
-- Name: module_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE module_actions_id_seq OWNED BY module_actions.id;


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 1708
-- Name: module_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('module_actions_id_seq', 228, true);


--
-- TOC entry 1709 (class 1259 OID 17453)
-- Dependencies: 2076 7
-- Name: modules; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE modules (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    controller character varying(50) NOT NULL,
    show_all integer DEFAULT 1,
    created timestamp without time zone NOT NULL,
    created_by integer,
    modified timestamp without time zone NOT NULL,
    modified_by integer
);


ALTER TABLE public.modules OWNER TO cms_kalog;

--
-- TOC entry 1710 (class 1259 OID 17457)
-- Dependencies: 1709 7
-- Name: modules_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.modules_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 1710
-- Name: modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE modules_id_seq OWNED BY modules.id;


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 1710
-- Name: modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('modules_id_seq', 32, true);


--
-- TOC entry 1711 (class 1259 OID 17459)
-- Dependencies: 7
-- Name: packets; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE packets (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.packets OWNER TO cms_kalog;

--
-- TOC entry 1712 (class 1259 OID 17465)
-- Dependencies: 1711 7
-- Name: packets_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE packets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.packets_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 1712
-- Name: packets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE packets_id_seq OWNED BY packets.id;


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 1712
-- Name: packets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('packets_id_seq', 1, false);


--
-- TOC entry 1713 (class 1259 OID 17467)
-- Dependencies: 7
-- Name: packets_services; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE packets_services (
    id integer NOT NULL,
    packet_id integer,
    service_id integer
);


ALTER TABLE public.packets_services OWNER TO cms_kalog;

--
-- TOC entry 1714 (class 1259 OID 17470)
-- Dependencies: 1713 7
-- Name: packets_services_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE packets_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.packets_services_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 1714
-- Name: packets_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE packets_services_id_seq OWNED BY packets_services.id;


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 1714
-- Name: packets_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('packets_services_id_seq', 1, false);


--
-- TOC entry 1715 (class 1259 OID 17472)
-- Dependencies: 2080 2081 2082 2083 7
-- Name: provinces; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE provinces (
    id integer NOT NULL,
    code character varying(2) DEFAULT NULL::character varying,
    name character varying(60) DEFAULT NULL::character varying,
    created_by character varying(60) DEFAULT NULL::character varying,
    created timestamp without time zone,
    modified_by character varying(60) DEFAULT NULL::character varying,
    modified timestamp without time zone
);


ALTER TABLE public.provinces OWNER TO cms_kalog;

--
-- TOC entry 1716 (class 1259 OID 17479)
-- Dependencies: 7 1715
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.provinces_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 1716
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE provinces_id_seq OWNED BY provinces.id;


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 1716
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('provinces_id_seq', 48, true);


--
-- TOC entry 1764 (class 1259 OID 17822)
-- Dependencies: 7
-- Name: rows; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE rows (
    id integer NOT NULL,
    code character varying(255)
);


ALTER TABLE public.rows OWNER TO cms_kalog;

--
-- TOC entry 1763 (class 1259 OID 17820)
-- Dependencies: 1764 7
-- Name: rows_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rows_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 1763
-- Name: rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE rows_id_seq OWNED BY rows.id;


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 1763
-- Name: rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('rows_id_seq', 1, false);


--
-- TOC entry 1744 (class 1259 OID 17703)
-- Dependencies: 7
-- Name: schedules; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE schedules (
    id integer NOT NULL,
    arrival_time timestamp without time zone,
    departure_time timestamp without time zone,
    closing_time timestamp without time zone
);


ALTER TABLE public.schedules OWNER TO cms_kalog;

--
-- TOC entry 1743 (class 1259 OID 17701)
-- Dependencies: 1744 7
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.schedules_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 1743
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE schedules_id_seq OWNED BY schedules.id;


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 1743
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('schedules_id_seq', 1, false);


--
-- TOC entry 1717 (class 1259 OID 17481)
-- Dependencies: 7
-- Name: service_charges; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE service_charges (
    id integer NOT NULL,
    service_id integer,
    date_applied date,
    basic_charge money
);


ALTER TABLE public.service_charges OWNER TO cms_kalog;

--
-- TOC entry 1718 (class 1259 OID 17484)
-- Dependencies: 7 1717
-- Name: service_charges_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE service_charges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.service_charges_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 1718
-- Name: service_charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE service_charges_id_seq OWNED BY service_charges.id;


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 1718
-- Name: service_charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('service_charges_id_seq', 1, false);


--
-- TOC entry 1719 (class 1259 OID 17486)
-- Dependencies: 7
-- Name: services; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE services (
    id integer NOT NULL,
    name character varying,
    default_debitur integer,
    default_creditur integer
);


ALTER TABLE public.services OWNER TO cms_kalog;

--
-- TOC entry 1720 (class 1259 OID 17492)
-- Dependencies: 1719 7
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 1720
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 1720
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('services_id_seq', 1, false);


--
-- TOC entry 1721 (class 1259 OID 17494)
-- Dependencies: 7
-- Name: site_settings; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE site_settings (
    id integer NOT NULL,
    param character varying(20) NOT NULL,
    value character varying(100) NOT NULL
);


ALTER TABLE public.site_settings OWNER TO cms_kalog;

--
-- TOC entry 1722 (class 1259 OID 17497)
-- Dependencies: 1721 7
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE site_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.site_settings_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 1722
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE site_settings_id_seq OWNED BY site_settings.id;


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 1722
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('site_settings_id_seq', 8, true);


--
-- TOC entry 1766 (class 1259 OID 17830)
-- Dependencies: 7
-- Name: tiers; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE tiers (
    id integer NOT NULL,
    code character varying(255)
);


ALTER TABLE public.tiers OWNER TO cms_kalog;

--
-- TOC entry 1765 (class 1259 OID 17828)
-- Dependencies: 1766 7
-- Name: tiers_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE tiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tiers_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 1765
-- Name: tiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE tiers_id_seq OWNED BY tiers.id;


--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 1765
-- Name: tiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('tiers_id_seq', 1, false);


--
-- TOC entry 1723 (class 1259 OID 17499)
-- Dependencies: 7
-- Name: trucking_companies; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE trucking_companies (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.trucking_companies OWNER TO cms_kalog;

--
-- TOC entry 1724 (class 1259 OID 17502)
-- Dependencies: 1723 7
-- Name: trucking_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE trucking_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.trucking_companies_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 1724
-- Name: trucking_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE trucking_companies_id_seq OWNED BY trucking_companies.id;


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 1724
-- Name: trucking_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('trucking_companies_id_seq', 5, true);


--
-- TOC entry 1725 (class 1259 OID 17504)
-- Dependencies: 7
-- Name: trucks; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE trucks (
    id integer NOT NULL,
    plate_number character(10),
    driver_id integer,
    trucking_company_id integer
);


ALTER TABLE public.trucks OWNER TO cms_kalog;

--
-- TOC entry 1726 (class 1259 OID 17507)
-- Dependencies: 1725 7
-- Name: trucks_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE trucks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.trucks_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 1726
-- Name: trucks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE trucks_id_seq OWNED BY trucks.id;


--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 1726
-- Name: trucks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('trucks_id_seq', 52, true);


--
-- TOC entry 1727 (class 1259 OID 17509)
-- Dependencies: 7
-- Name: unit_codes; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE unit_codes (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10) NOT NULL,
    created timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified timestamp without time zone NOT NULL,
    modified_by integer
);


ALTER TABLE public.unit_codes OWNER TO cms_kalog;

--
-- TOC entry 1728 (class 1259 OID 17512)
-- Dependencies: 1727 7
-- Name: unit_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE unit_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.unit_codes_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 1728
-- Name: unit_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE unit_codes_id_seq OWNED BY unit_codes.id;


--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 1728
-- Name: unit_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('unit_codes_id_seq', 1, true);


--
-- TOC entry 1729 (class 1259 OID 17514)
-- Dependencies: 7
-- Name: user_logs; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE user_logs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    ip_address character(15) NOT NULL,
    controller character varying(50) NOT NULL,
    action character varying(50) NOT NULL,
    request_method character varying(10) NOT NULL,
    referer character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    user_agent text NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.user_logs OWNER TO cms_kalog;

--
-- TOC entry 1730 (class 1259 OID 17520)
-- Dependencies: 7 1729
-- Name: user_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE user_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_logs_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 1730
-- Name: user_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE user_logs_id_seq OWNED BY user_logs.id;


--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 1730
-- Name: user_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('user_logs_id_seq', 1136, true);


--
-- TOC entry 1731 (class 1259 OID 17522)
-- Dependencies: 7
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE user_preferences (
    id integer NOT NULL,
    user_id integer NOT NULL,
    param character varying(20) NOT NULL,
    value character varying(100) NOT NULL
);


ALTER TABLE public.user_preferences OWNER TO cms_kalog;

--
-- TOC entry 1732 (class 1259 OID 17525)
-- Dependencies: 1731 7
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_preferences_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 1732
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE user_preferences_id_seq OWNED BY user_preferences.id;


--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 1732
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('user_preferences_id_seq', 1, false);


--
-- TOC entry 1733 (class 1259 OID 17527)
-- Dependencies: 2093 2094 2095 2096 2097 2098 2099 2100 2101 2102 7
-- Name: users; Type: TABLE; Schema: public; Owner: cms_kalog; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    group_id integer NOT NULL,
    unit_code_id integer NOT NULL,
    username character varying(10) NOT NULL,
    name character varying(30) NOT NULL,
    password_real character varying(20) NOT NULL,
    password character(40) NOT NULL,
    sex character(1) DEFAULT NULL::bpchar,
    pob character varying(20) DEFAULT NULL::character varying,
    dob date,
    address1 character varying(100) DEFAULT NULL::character varying,
    address2 character varying(100) DEFAULT NULL::character varying,
    address3 character varying(100) DEFAULT NULL::character varying,
    zipcode character varying(5) DEFAULT NULL::character varying,
    city_id integer,
    province_id integer,
    handphone character varying(20) DEFAULT NULL::character varying,
    homephone character varying(20) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    active integer DEFAULT 0 NOT NULL,
    created timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified timestamp without time zone NOT NULL,
    modified_by integer
);


ALTER TABLE public.users OWNER TO cms_kalog;

--
-- TOC entry 1734 (class 1259 OID 17543)
-- Dependencies: 1733 7
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: cms_kalog
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO cms_kalog;

--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 1734
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cms_kalog
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 1734
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cms_kalog
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- TOC entry 2044 (class 2604 OID 17545)
-- Dependencies: 1661 1659
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE agreements ALTER COLUMN id SET DEFAULT nextval('agreements_id_seq'::regclass);


--
-- TOC entry 2045 (class 2604 OID 17546)
-- Dependencies: 1660 1659
-- Name: customer_id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE agreements ALTER COLUMN customer_id SET DEFAULT nextval('agreements_customer_id_seq'::regclass);


--
-- TOC entry 2046 (class 2604 OID 17547)
-- Dependencies: 1663 1662
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE agreements_packets ALTER COLUMN id SET DEFAULT nextval('agreements_packets_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 17809)
-- Dependencies: 1760 1759 1760
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE blocks ALTER COLUMN id SET DEFAULT nextval('blocks_id_seq'::regclass);


--
-- TOC entry 2114 (class 2604 OID 17731)
-- Dependencies: 1748 1747 1748
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE branches ALTER COLUMN id SET DEFAULT nextval('branches_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 17665)
-- Dependencies: 1735 1736 1736
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE carriages ALTER COLUMN id SET DEFAULT nextval('carriages_id_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 17676)
-- Dependencies: 1737 1738 1738
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE carriages_freights ALTER COLUMN id SET DEFAULT nextval('carriages_freights_id_seq'::regclass);


--
-- TOC entry 2052 (class 2604 OID 17548)
-- Dependencies: 1665 1664
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 17817)
-- Dependencies: 1761 1762 1762
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE columns ALTER COLUMN id SET DEFAULT nextval('columns_id_seq'::regclass);


--
-- TOC entry 2053 (class 2604 OID 17549)
-- Dependencies: 1667 1666
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE contact_person ALTER COLUMN id SET DEFAULT nextval('contact_person_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 17781)
-- Dependencies: 1757 1758 1758
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_depo_coordinates ALTER COLUMN id SET DEFAULT nextval('container_depo_coordinates_id_seq'::regclass);


--
-- TOC entry 2118 (class 2604 OID 17749)
-- Dependencies: 1752 1751 1752
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_depos ALTER COLUMN id SET DEFAULT nextval('container_depos_id_seq'::regclass);


--
-- TOC entry 2054 (class 2604 OID 17550)
-- Dependencies: 1669 1668
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_group_designations ALTER COLUMN id SET DEFAULT nextval('container_group_designations_id_seq'::regclass);


--
-- TOC entry 2055 (class 2604 OID 17551)
-- Dependencies: 1671 1670
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_group_types ALTER COLUMN id SET DEFAULT nextval('container_group_types_id_seq'::regclass);


--
-- TOC entry 2056 (class 2604 OID 17552)
-- Dependencies: 1673 1672
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_groups ALTER COLUMN id SET DEFAULT nextval('container_groups_id_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 17553)
-- Dependencies: 1677 1674
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_heights ALTER COLUMN id SET DEFAULT nextval('container_heights_id_seq'::regclass);


--
-- TOC entry 2058 (class 2604 OID 17554)
-- Dependencies: 1676 1675
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_heights_container_widths ALTER COLUMN id SET DEFAULT nextval('container_heights_container_widths_id_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 17555)
-- Dependencies: 1679 1678
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_lengths ALTER COLUMN id SET DEFAULT nextval('container_lengths_id_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 17556)
-- Dependencies: 1681 1680
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_types ALTER COLUMN id SET DEFAULT nextval('container_types_id_seq'::regclass);


--
-- TOC entry 2061 (class 2604 OID 17557)
-- Dependencies: 1683 1682
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_widths ALTER COLUMN id SET DEFAULT nextval('container_widths_id_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 17771)
-- Dependencies: 1756 1755 1756
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_yard_coordinates ALTER COLUMN id SET DEFAULT nextval('container_yard_coordinates_id_seq'::regclass);


--
-- TOC entry 2116 (class 2604 OID 17740)
-- Dependencies: 1749 1750 1750
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE container_yards ALTER COLUMN id SET DEFAULT nextval('container_yards_id_seq'::regclass);


--
-- TOC entry 2122 (class 2604 OID 17758)
-- Dependencies: 1754 1753 1754
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE coordinates ALTER COLUMN id SET DEFAULT nextval('coordinates_id_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 17558)
-- Dependencies: 1685 1684
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 17559)
-- Dependencies: 1687 1686
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- TOC entry 2064 (class 2604 OID 17560)
-- Dependencies: 1689 1688
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE drivers ALTER COLUMN id SET DEFAULT nextval('drivers_id_seq'::regclass);


--
-- TOC entry 2065 (class 2604 OID 17561)
-- Dependencies: 1690 1688
-- Name: license_id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE drivers ALTER COLUMN license_id SET DEFAULT nextval('drivers_license_id_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 17686)
-- Dependencies: 1739 1740 1740
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE freights ALTER COLUMN id SET DEFAULT nextval('freights_id_seq'::regclass);


--
-- TOC entry 2066 (class 2604 OID 17562)
-- Dependencies: 1692 1691
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 17563)
-- Dependencies: 1696 1695
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE letter_numbers ALTER COLUMN id SET DEFAULT nextval('letter_numbers_id_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 17564)
-- Dependencies: 1698 1697
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE license_types ALTER COLUMN id SET DEFAULT nextval('license_types_id_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 17565)
-- Dependencies: 1700 1699
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE licenses ALTER COLUMN id SET DEFAULT nextval('licenses_id_seq'::regclass);


--
-- TOC entry 2113 (class 2604 OID 17720)
-- Dependencies: 1745 1746 1746
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 17696)
-- Dependencies: 1742 1741 1742
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE locomotives ALTER COLUMN id SET DEFAULT nextval('locomotives_id_seq'::regclass);


--
-- TOC entry 2071 (class 2604 OID 17566)
-- Dependencies: 1702 1701
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 17567)
-- Dependencies: 1704 1703
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE menu_types ALTER COLUMN id SET DEFAULT nextval('menu_types_id_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 17568)
-- Dependencies: 1706 1705
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE menus ALTER COLUMN id SET DEFAULT nextval('menus_id_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 17569)
-- Dependencies: 1708 1707
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE module_actions ALTER COLUMN id SET DEFAULT nextval('module_actions_id_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 17570)
-- Dependencies: 1710 1709
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE modules ALTER COLUMN id SET DEFAULT nextval('modules_id_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 17571)
-- Dependencies: 1712 1711
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE packets ALTER COLUMN id SET DEFAULT nextval('packets_id_seq'::regclass);


--
-- TOC entry 2079 (class 2604 OID 17572)
-- Dependencies: 1714 1713
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE packets_services ALTER COLUMN id SET DEFAULT nextval('packets_services_id_seq'::regclass);


--
-- TOC entry 2084 (class 2604 OID 17573)
-- Dependencies: 1716 1715
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE provinces ALTER COLUMN id SET DEFAULT nextval('provinces_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 17825)
-- Dependencies: 1763 1764 1764
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE rows ALTER COLUMN id SET DEFAULT nextval('rows_id_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 17706)
-- Dependencies: 1743 1744 1744
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE schedules ALTER COLUMN id SET DEFAULT nextval('schedules_id_seq'::regclass);


--
-- TOC entry 2085 (class 2604 OID 17574)
-- Dependencies: 1718 1717
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE service_charges ALTER COLUMN id SET DEFAULT nextval('service_charges_id_seq'::regclass);


--
-- TOC entry 2086 (class 2604 OID 17575)
-- Dependencies: 1720 1719
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- TOC entry 2087 (class 2604 OID 17576)
-- Dependencies: 1722 1721
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE site_settings ALTER COLUMN id SET DEFAULT nextval('site_settings_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 17833)
-- Dependencies: 1766 1765 1766
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE tiers ALTER COLUMN id SET DEFAULT nextval('tiers_id_seq'::regclass);


--
-- TOC entry 2088 (class 2604 OID 17577)
-- Dependencies: 1724 1723
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE trucking_companies ALTER COLUMN id SET DEFAULT nextval('trucking_companies_id_seq'::regclass);


--
-- TOC entry 2089 (class 2604 OID 17578)
-- Dependencies: 1726 1725
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE trucks ALTER COLUMN id SET DEFAULT nextval('trucks_id_seq'::regclass);


--
-- TOC entry 2090 (class 2604 OID 17579)
-- Dependencies: 1728 1727
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE unit_codes ALTER COLUMN id SET DEFAULT nextval('unit_codes_id_seq'::regclass);


--
-- TOC entry 2091 (class 2604 OID 17580)
-- Dependencies: 1730 1729
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE user_logs ALTER COLUMN id SET DEFAULT nextval('user_logs_id_seq'::regclass);


--
-- TOC entry 2092 (class 2604 OID 17581)
-- Dependencies: 1732 1731
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE user_preferences ALTER COLUMN id SET DEFAULT nextval('user_preferences_id_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 17582)
-- Dependencies: 1734 1733
-- Name: id; Type: DEFAULT; Schema: public; Owner: cms_kalog
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2248 (class 0 OID 17318)
-- Dependencies: 1659
-- Data for Name: agreements; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY agreements (id, customer_id, start_date, expired_date) FROM stdin;
\.


--
-- TOC entry 2249 (class 0 OID 17325)
-- Dependencies: 1662
-- Data for Name: agreements_packets; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY agreements_packets (id, agreement_id, packet_id, charge) FROM stdin;
\.


--
-- TOC entry 2298 (class 0 OID 17806)
-- Dependencies: 1760
-- Data for Name: blocks; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY blocks (id, code) FROM stdin;
\.


--
-- TOC entry 2292 (class 0 OID 17728)
-- Dependencies: 1748
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY branches (id, name, location_id) FROM stdin;
\.


--
-- TOC entry 2286 (class 0 OID 17662)
-- Dependencies: 1736
-- Data for Name: carriages; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY carriages (id, code) FROM stdin;
\.


--
-- TOC entry 2287 (class 0 OID 17673)
-- Dependencies: 1738
-- Data for Name: carriages_freights; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY carriages_freights (id, carriage_id, freight_id) FROM stdin;
\.


--
-- TOC entry 2250 (class 0 OID 17330)
-- Dependencies: 1664
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY cities (id, province_id, name, other_name, created_by, created, modified_by, modified) FROM stdin;
10	37	KABUPATEN ACEH SELATAN	TAPAKTUAN	\N	\N	1	2009-12-17 00:18:29
11	37	KABUPATEN ACEH TENGGARA	KUTACANE	\N	\N	admin	2009-06-24 10:47:44
12	37	KABUPATEN ACEH TIMUR DAN KOTA LANGSA	LANGSA	\N	\N	\N	\N
13	37	KABUPATEN ACEH TENGAH	TAKENGON	\N	\N	\N	\N
14	37	KABUPATEN ACEH BARAT	MEULABOH	\N	\N	\N	\N
15	37	KABUPATEN ACEH BESAR	JANTHO	\N	\N	\N	\N
16	37	KABUPATEN PIDIE	SIGLI	\N	\N	\N	\N
17	37	KABUPATEN ACEH UTARA DAN KOTA LHOKSEUMAWE	LHOKSEUMAWE	\N	\N	\N	\N
18	37	KABUPATEN SIMEULUE	SINABANG	\N	\N	\N	\N
19	37	KABUPATEN ACEH SINGKIL	SINGKIL	\N	\N	\N	\N
20	37	KABUPATEN BIREUEN	BIREUEN	\N	\N	\N	\N
21	37	KABUPATEN ACEH BARAT DAYA	BLANGPIDIE	\N	\N	\N	\N
22	37	KABUPATEN GAYO LUES	BLANGKEJERAN	\N	\N	\N	\N
23	37	KABUPATEN ACEH JAYA	CALANG	\N	\N	\N	\N
24	37	KABUPATEN NAGAN RAYA	SUKA MAKMUE	\N	\N	\N	\N
25	37	KABUPATEN ACEH TAMIANG	KARANG BARU	\N	\N	\N	\N
26	37	KABUPATEN BENER MERIAH	SIMPANG TIGA REDELONG	\N	\N	\N	\N
27	37	KABUPATEN PIDIE JAYA	MEUREUDU	\N	\N	\N	\N
28	37	KOTA BANDA ACEH	BANDA ACEH	\N	\N	\N	\N
29	37	KOTA SABANG	SABANG	\N	\N	\N	\N
30	37	KOTA SUBULUSSALAM	SUBULUSSALAM	\N	\N	\N	\N
31	45	KABUPATEN TAPANULI TENGAH DAN KOTA SIBOLGA	SIBOLGA	\N	\N	\N	\N
32	45	KABUPATEN TAPANULI UTARA	TARUTUNG	\N	\N	\N	\N
33	45	KABUPATEN TAPANULI SELATAN DAN KOTA PADANG SIDEMPUAN	PADANG SIDEMPUAN	\N	\N	\N	\N
34	45	KABUPATEN NIAS	GUNUNGSITOLI	\N	\N	\N	\N
35	45	KABUPATEN LANGKAT	STABAT	\N	\N	\N	\N
36	45	KABUPATEN KARO	KABANJAHE	\N	\N	\N	\N
37	45	KABUPATEN DELI SERDANG	LUBUKPAKAM	\N	\N	\N	\N
38	45	KABUPATEN SIMALUNGUN DAN KOTA PEMATANG SIANTAR	PEMATANGSIANTAR	\N	\N	\N	\N
39	45	KABUPATEN ASAHAN	KISARAN	\N	\N	\N	\N
40	45	KABUPATEN LABUHANBATU SELATAN	KOTA PINANG	\N	\N	\N	\N
41	45	KABUPATEN LABUHANBATU UTARA	AEK KANOPAN	\N	\N	\N	\N
42	45	KABUPATEN LABUHANBATU	RANTAUPRAPAT	\N	\N	\N	\N
43	45	KABUPATEN DAIRI	SIDIKALANG	\N	\N	\N	\N
44	45	KABUPATEN TOBA SAMOSIR	BALIGE	\N	\N	\N	\N
45	45	KABUPATEN MANDAILING NATAL	PENYABUNGAN	\N	\N	\N	\N
46	45	KABUPATEN NIAS SELATAN	TELUK DALAM	\N	\N	\N	\N
47	45	KABUPATEN PAKPAK BHARAT	SALAK	\N	\N	\N	\N
48	45	KABUPATEN HUMBANG HASUNDUTAN	DOLOK SANGGUL	\N	\N	\N	\N
49	45	KABUPATEN SAMOSIR	PANGURUAN	\N	\N	\N	\N
50	45	KABUPATEN SERDANG BEDAGAI	SEI RAMPAH	\N	\N	\N	\N
51	45	KABUPATEN BATU BARA	LIMA PULUH	\N	\N	\N	\N
52	45	KABUPATEN PADANG LAWAS UTARA	GUNUNG TUA	\N	\N	\N	\N
53	45	KABUPATEN PADANG LAWAS	SIBUHUAN	\N	\N	\N	\N
54	45	KOTA MEDAN	MEDAN	\N	\N	\N	\N
55	45	KOTA TANJUNG BALAI	TANJUNG BALAI	\N	\N	\N	\N
56	45	KOTA BINJAI	BINJAI	\N	\N	\N	\N
57	45	KOTA TEBING TINGGI	TEBING TINGGI	\N	\N	\N	\N
58	2	KABUPATEN BENGKULU SELATAN	MANNA	\N	\N	\N	\N
59	2	KABUPATEN REJANG LEBONG	CURUP	\N	\N	\N	\N
60	2	KABUPATEN BENGKULU UTARA	ARGAMAKMUR	\N	\N	\N	\N
61	2	KABUPATEN KAUR	BINTUHAN	\N	\N	\N	\N
62	2	KABUPATEN SELUMA	TAIS	\N	\N	\N	\N
63	2	KABUPATEN MUKOMUKO	MUKOMUKO	\N	\N	\N	\N
64	2	KABUPATEN LEBONG	TUBEI	\N	\N	\N	\N
65	2	KABUPATEN KEPAHIANG	KEPAHIANG	\N	\N	\N	\N
66	2	KABUPATEN BENGKULU TENGAH	KARANG TINGGI	\N	\N	\N	\N
67	2	KOTA BENGKULU	BENGKULU	\N	\N	\N	\N
68	31	KABUPATEN KERINCI DAN KOTA SUNGAI PENUH	SUNGAIPENUH	\N	\N	\N	\N
69	31	KABUPATEN MERANGIN	BANGKO	\N	\N	\N	\N
70	31	KABUPATEN SAROLANGUN	SAROLANGUN	\N	\N	\N	\N
71	31	KABUPATEN BATANG HARI	MUARA BULIAN	\N	\N	\N	\N
72	31	KABUPATEN MUARO JAMBI	SENGETI	\N	\N	\N	\N
73	31	KABUPATEN TANJUNG JABUNG BARAT	KUALA TUNGKAL	\N	\N	\N	\N
74	31	KABUPATEN TANJUNG JABUNG TIMUR	MUARA SABAK	\N	\N	\N	\N
75	31	KABUPATEN BUNGO	MUARA BUNGO	\N	\N	\N	\N
76	31	KABUPATEN TEBO	MUARA TEBO	\N	\N	\N	\N
77	31	KOTA JAMBI	JAMBI	\N	\N	\N	\N
78	42	KABUPATEN KAMPAR	BANGKINANG	\N	\N	\N	\N
79	42	KABUPATEN INDRAGIRI HULU	RENGAT	\N	\N	\N	\N
80	42	KABUPATEN BENGKALIS	BENGKALIS	\N	\N	\N	\N
81	42	KABUPATEN INDRAGIRI HILIR	TEMBILAHAN	\N	\N	\N	\N
82	42	KABUPATEN PELALAWAN	PANGKALAN KERINCI	\N	\N	\N	\N
83	42	KABUPATEN ROKAN HULU	PASIR PANGARAIAN	\N	\N	\N	\N
84	42	KABUPATEN ROKAN HILIR	UJUNG TANJUNG	\N	\N	\N	\N
85	42	KABUPATEN SIAK	SIAK SRIINDRAPURA	\N	\N	\N	\N
86	42	KABUPATEN KUANTAN SINGINGI	TELUK KUANTAN	\N	\N	\N	\N
87	42	KOTA PEKANBARU	PEKANBARU	\N	\N	\N	\N
88	42	KOTA DUMAI	DUMAI	\N	\N	\N	\N
89	43	KABUPATEN PESISIR SELATAN	PAINAN	\N	\N	\N	\N
90	43	KABUPATEN SOLOK DAN KOTA SOLOK	SOLOK	\N	\N	\N	\N
91	43	KABUPATEN SIJUNJUNG	MUARO SIJUNJUNG	\N	\N	\N	\N
92	43	KABUPATEN TANAH DATAR	BATUSANGKAR	\N	\N	\N	\N
93	43	KABUPATEN PADANG PARIAMAN DAN KOTA PARIAMAN	PARIAMAN	\N	\N	\N	\N
94	43	KABUPATEN AGAM	LUBUKBASUNG	\N	\N	\N	\N
95	43	KABUPATEN LIMA PULUH KOTA DAN KOTA PAYAKUMBUH	PAYAKUMBUH	\N	\N	\N	\N
96	43	KABUPATEN PASAMAN	LUBUKSIKAPING	\N	\N	\N	\N
97	43	KABUPATEN KEPULAUAN MENTAWAI	TUA PEJAT	\N	\N	\N	\N
98	43	KABUPATEN DHARMASRAYA	PULAU PUNJUNG	\N	\N	\N	\N
99	43	KABUPATEN SOLOK SELATAN	PADANG ARO	\N	\N	\N	\N
100	43	KABUPATEN PASAMAN BARAT	SIMPANG EMPAT	\N	\N	\N	\N
101	43	KOTA PADANG	PADANG	\N	\N	\N	\N
102	43	KOTA SAWAHLUNTO	SAWAHLUNTO	\N	\N	\N	\N
103	43	KOTA PADANGPANJANG	PADANGPANJANG	\N	\N	\N	\N
104	43	KOTA BUKITTINGGI	BUKITTINGGI	\N	\N	\N	\N
105	44	KABUPATEN OGAN KOMERING ULU	BATURAJA	\N	\N	\N	\N
106	44	KABUPATEN OGAN KOMERING ILIR	KAYU AGUNG	\N	\N	\N	\N
107	44	KABUPATEN MUARA ENIM	MUARA ENIM	\N	\N	\N	\N
108	44	KABUPATEN LAHAT	LAHAT	\N	\N	\N	\N
109	44	KABUPATEN MUSI RAWAS DAN KOTA LUBUK LINGGAU	LUBUK LINGGAU	\N	\N	\N	\N
110	44	KABUPATEN MUSI BANYUASIN	SEKAYU	\N	\N	\N	\N
111	44	KABUPATEN BANYUASIN	BANYUASIN	\N	\N	\N	\N
112	44	KABUPATEN OGAN KOMERING ULU TIMUR	MARTAPURA	\N	\N	\N	\N
113	44	KABUPATEN OGAN KOMERING ULU SELATAN	MUARADUA	\N	\N	\N	\N
114	44	KABUPATEN OGAN ILIR	INDRALAYA	\N	\N	\N	\N
115	44	KABUPATEN EMPAT LAWANG	TEBING TINGGI	\N	\N	\N	\N
116	44	KOTA PALEMBANG	PALEMBANG	\N	\N	\N	\N
117	44	KOTA PAGAR ALAM	PAGAR ALAM	\N	\N	\N	\N
118	44	KOTA PRABUMULIH	PRABUMULIH	\N	\N	\N	\N
119	22	KABUPATEN LAMPUNG SELATAN	KALIANDA	\N	\N	\N	\N
120	22	KABUPATEN LAMPUNG TENGAH	GUNUNGSUGIH	\N	\N	\N	\N
121	22	KABUPATEN LAMPUNG UTARA	KOTABUMI	\N	\N	\N	\N
122	22	KABUPATEN LAMPUNG BARAT	LIWA	\N	\N	\N	\N
123	22	KABUPATEN TULANG BAWANG	MENGGALA	\N	\N	\N	\N
124	22	KABUPATEN TANGGAMUS	KOTAAGUNG	\N	\N	\N	\N
125	22	KABUPATEN LAMPUNG TIMUR	SUKADANA	\N	\N	\N	\N
126	22	KABUPATEN WAY KANAN	BLAMBANGAN UMPU	\N	\N	\N	\N
127	22	KABUPATEN PESAWARAN	GEDONG TATAAN	\N	\N	\N	\N
128	22	KOTA BANDAR LAMPUNG	BANDAR LAMPUNG	\N	\N	\N	\N
129	22	KOTA METRO	METRO	\N	\N	\N	\N
130	1	KABUPATEN BANGKA	SUNGAILIAT	\N	\N	\N	\N
131	1	KABUPATEN BELITUNG	TANJUNGPANDAN	\N	\N	\N	\N
132	1	KABUPATEN BANGKA SELATAN	MENTOK	\N	\N	\N	\N
133	1	KABUPATEN BANGKA TENGAH	KOBA	\N	\N	\N	\N
134	1	KABUPATEN BANGKA BARAT	TOBOALI	\N	\N	\N	\N
135	1	KABUPATEN BELITUNG TIMUR	MANGGAR	\N	\N	\N	\N
136	1	KOTA PANGKAL PINANG	PANGKAL PINANG	\N	\N	\N	\N
137	19	KABUPATEN BINTAN DAN KOTA TANJUNG PINANG	TANJUNGPINANG	\N	\N	\N	\N
138	19	KABUPATEN KARIMUN	TANJUNG BALAI KARIMUN	\N	\N	\N	\N
139	19	KABUPATEN NATUNA	RANAI	\N	\N	\N	\N
140	19	KABUPATEN LINGGA	DAIK LINGGA	\N	\N	\N	\N
141	19	KABUPATEN KEPULAUAN ANAMBAS	TAREMPA	\N	\N	\N	\N
142	19	KOTA BATAM	BATAM	\N	\N	\N	\N
143	4	KABUPATEN PANDEGLANG	PANDEGLANG	\N	\N	\N	\N
144	4	KABUPATEN LEBAK	RANGKASBITUNG	\N	\N	\N	\N
145	4	KABUPATEN TANGERANG DAN KOTA TANGERANG	TANGERANG	\N	\N	\N	\N
146	4	KABUPATEN SERANG DAN KOTA SERANG	SERANG	\N	\N	\N	\N
147	4	KOTA CILEGON	CILEGON	\N	\N	\N	\N
148	11	KABUPATEN BOGOR DAN KOTA BOGOR	CIBINONG	\N	\N	\N	\N
149	11	KABUPATEN SUKABUMI DAN KOTA SUKABUMI	SUKABUMI	\N	\N	\N	\N
150	11	KABUPATEN CIANJUR	CIANJUR	\N	\N	\N	\N
151	11	KABUPATEN BANDUNG DAN KOTA BANDUNG	SOREANG	\N	\N	\N	\N
152	11	KABUPATEN GARUT	GARUT	\N	\N	\N	\N
153	11	KABUPATEN TASIKMALAYA DAN KOTA TASIKMALAYA	SINGAPARNA	\N	\N	\N	\N
154	11	KABUPATEN CIAMIS	CIAMIS	\N	\N	\N	\N
155	11	KABUPATEN KUNINGAN	KUNINGAN	\N	\N	\N	\N
156	11	KABUPATEN CIREBON DAN KOTA CIREBON	SUMBER	\N	\N	\N	\N
157	11	KABUPATEN MAJALENGKA	MAJALENGKA	\N	\N	\N	\N
158	11	KABUPATEN SUMEDANG	SUMEDANG	\N	\N	\N	\N
159	11	KABUPATEN INDRAMAYU	INDRAMAYU	\N	\N	\N	\N
160	11	KABUPATEN SUBANG	SUBANG	\N	\N	\N	\N
161	11	KABUPATEN PURWAKARTA	PURWAKARTA	\N	\N	\N	\N
162	11	KABUPATEN KARAWANG	KARAWANG	\N	\N	\N	\N
163	11	KABUPATEN BEKASI DAN KOTA BEKASI	BEKASI	\N	\N	\N	\N
164	11	KABUPATEN BANDUNG BARAT	NGAMPRAH	\N	\N	\N	\N
165	11	KOTA DEPOK	DEPOK	\N	\N	\N	\N
166	11	KOTA CIMAHI	CIMAHI	\N	\N	\N	\N
167	11	KOTA BANJAR	BANJAR	\N	\N	\N	\N
168	30	KABUPATEN ADMINISTRASI KEPULAUAN SERIBU	PULAU PRAMUKA	\N	\N	\N	\N
169	30	KOTA ADMINISTRASI JAKARTA PUSAT	JAKARTA	\N	\N	\N	\N
170	30	KOTA ADMINISTRASI JAKARTA UTARA	JAKARTA	\N	\N	\N	\N
171	30	KOTA ADMINISTRASI JAKARTA BARAT	JAKARTA	\N	\N	\N	\N
172	30	KOTA ADMINISTRASI JAKARTA SELATAN	JAKARTA	\N	\N	\N	\N
173	30	KOTA ADMINISTRASI JAKARTA TIMUR	JAKARTA	\N	\N	\N	\N
174	29	KABUPATEN CILACAP	CILACAP	\N	\N	\N	\N
175	29	KABUPATEN BANYUMAS	PURWOKERTO	\N	\N	\N	\N
176	29	KABUPATEN PURBALINGGA	PURBALINGGA	\N	\N	\N	\N
177	29	KABUPATEN BANJARNEGARA	BANJARNEGARA	\N	\N	\N	\N
178	29	KABUPATEN KEBUMEN	KEBUMEN	\N	\N	\N	\N
179	29	KABUPATEN PURWOREJO	PURWOREJO	\N	\N	\N	\N
180	29	KABUPATEN WONOSOBO	WONOSOBO	\N	\N	\N	\N
181	29	KABUPATEN MAGELANG & KOTA MAGELANG	MUNGKID	\N	\N	\N	\N
182	29	KABUPATEN BOYOLALI	BOYOLALI	\N	\N	\N	\N
183	29	KABUPATEN KLATEN	KLATEN	\N	\N	\N	\N
184	29	KABUPATEN SUKOHARJO	SUKOHARJO	\N	\N	\N	\N
185	29	KABUPATEN WONOGIRI	WONOGIRI	\N	\N	\N	\N
186	29	KABUPATEN KARANGANYAR	KARANGANYAR	\N	\N	\N	\N
187	29	KABUPATEN SRAGEN	SRAGEN	\N	\N	\N	\N
188	29	KABUPATEN GROBOGAN	PURWODADI	\N	\N	\N	\N
189	29	KABUPATEN BLORA	BLORA	\N	\N	\N	\N
190	29	KABUPATEN REMBANG	REMBANG	\N	\N	\N	\N
191	29	KABUPATEN PATI	PATI	\N	\N	\N	\N
192	29	KABUPATEN KUDUS	KUDUS	\N	\N	\N	\N
193	29	KABUPATEN JEPARA	JEPARA	\N	\N	\N	\N
194	29	KABUPATEN DEMAK	DEMAK	\N	\N	\N	\N
195	29	KABUPATEN SEMARANG DAN KOTA SEMARANG	UNGARAN	\N	\N	\N	\N
196	29	KABUPATEN TEMANGGUNG	TEMANGGUNG	\N	\N	\N	\N
197	29	KABUPATEN KENDAL	KENDAL	\N	\N	\N	\N
198	29	KABUPATEN BATANG	BATANG	\N	\N	\N	\N
199	29	KABUPATEN PEKALONGAN DAN KOTA PEKALONGAN	KAJEN	\N	\N	\N	\N
200	29	KABUPATEN PEMALANG	PEMALANG	\N	\N	\N	\N
201	29	KABUPATEN TEGAL DAN KOTA TEGAL	SLAWI	\N	\N	\N	\N
202	29	KABUPATEN BREBES	BREBES	\N	\N	\N	\N
203	29	KOTA SURAKARTA	SOLO	\N	\N	\N	\N
204	29	KOTA SALATIGA	SALATIGA	\N	\N	\N	\N
205	33	KABUPATEN PACITAN	PACITAN	\N	\N	\N	\N
206	33	KABUPATEN PONOROGO	PONOROGO	\N	\N	\N	\N
207	33	KABUPATEN TRENGGALEK	TRENGGALEK	\N	\N	\N	\N
208	33	KABUPATEN TULUNGAGUNG	TULUNGAGUNG	\N	\N	\N	\N
209	33	KABUPATEN BLITAR DAN KOTA BLITAR	BLITAR	\N	\N	\N	\N
210	33	KABUPATEN KEDIRI DAN KOTA KEDIRI	KEDIRI	\N	\N	\N	\N
211	33	KABUPATEN MALANG DAN KOTA MALANG	KEPANJEN	\N	\N	\N	\N
212	33	KABUPATEN LUMAJANG	LUMAJANG	\N	\N	\N	\N
213	33	KABUPATEN JEMBER	JEMBER	\N	\N	\N	\N
214	33	KABUPATEN BANYUWANGI	BANYUWANGI	\N	\N	\N	\N
215	33	KABUPATEN BONDOWOSO	BONDOWOSO	\N	\N	\N	\N
216	33	KABUPATEN SITUBONDO	SITUBONDO	\N	\N	\N	\N
217	33	KABUPATEN PROBOLINGGO DAN KOTA PROBOLINGGO	PROBOLINGGO	\N	\N	\N	\N
218	33	KABUPATEN PASURUAN DAN KOTA PASURUAN	PASURUAN	\N	\N	\N	\N
219	33	KABUPATEN SIDOARJO	SIDOARJO	\N	\N	\N	\N
220	33	KABUPATEN MOJOKERTO DAN KOTA MOJOKERTO	MOJOKERTO	\N	\N	\N	\N
221	33	KABUPATEN JOMBANG	JOMBANG	\N	\N	\N	\N
222	33	KABUPATEN NGANJUK	NGANJUK	\N	\N	\N	\N
223	33	KABUPATEN MADIUN DAN KOTA MADIUN	MADIUN	\N	\N	\N	\N
224	33	KABUPATEN MAGETAN	MAGETAN	\N	\N	\N	\N
225	33	KABUPATEN NGAWI	NGAWI	\N	\N	\N	\N
226	33	KABUPATEN BOJONEGORO	BOJONEGORO	\N	\N	\N	\N
227	33	KABUPATEN TUBAN	TUBAN	\N	\N	\N	\N
228	33	KABUPATEN LAMONGAN	LAMONGAN	\N	\N	\N	\N
229	33	KABUPATEN GRESIK	GRESIK	\N	\N	\N	\N
230	33	KABUPATEN BANGKALAN	BANGKALAN	\N	\N	\N	\N
231	33	KABUPATEN SAMPANG	SAMPANG	\N	\N	\N	\N
232	33	KABUPATEN PAMEKASAN	PAMEKASAN	\N	\N	\N	\N
233	33	KABUPATEN SUMENEP	SUMENEP	\N	\N	\N	\N
234	33	KOTA SURABAYA	SURABAYA	\N	\N	\N	\N
235	33	KOTA BATU	BATU	\N	\N	\N	\N
236	32	KABUPATEN KULON PROGO	WATES	\N	\N	\N	\N
237	32	KABUPATEN BANTUL	BANTUL	\N	\N	\N	\N
238	32	KABUPATEN GUNUNG KIDUL	WONOSARI	\N	\N	\N	\N
239	32	KABUPATEN SLEMAN	SLEMAN	\N	\N	\N	\N
240	32	KOTA YOGYAKARTA	JOGJAKARTA	\N	\N	\N	\N
241	3	KABUPATEN JEMBRANA	NEGARA	\N	\N	\N	\N
242	3	KABUPATEN TABANAN	TABANAN	\N	\N	\N	\N
243	3	KABUPATEN BADUNG	BADUNG	\N	\N	\N	\N
244	3	KABUPATEN GIANYAR	GIANYAR	\N	\N	\N	\N
245	3	KABUPATEN KLUNGKUNG	KLUNGKUNG	\N	\N	\N	\N
246	3	KABUPATEN BANGLI	BANGLI	\N	\N	\N	\N
247	3	KABUPATEN KARANGASEM	KARANGASEM	\N	\N	\N	\N
248	3	KABUPATEN BULELENG	SINGARAJA	\N	\N	\N	\N
249	3	KOTA DENPASAR	DENPASAR	\N	\N	\N	\N
250	38	KABUPATEN LOMBOK BARAT DAN KOTA MATARAM	MATARAM	\N	\N	\N	\N
251	38	KABUPATEN LOMBOK TENGAH	PRAYA	\N	\N	\N	\N
252	38	KABUPATEN LOMBOK TIMUR	SELONG	\N	\N	\N	\N
253	38	KABUPATEN SUMBAWA	SUMBAWA BESAR	\N	\N	\N	\N
254	38	KABUPATEN DOMPU	DOMPU	\N	\N	\N	\N
255	38	KABUPATEN BIMA DAN KOTA BIMA	RABA	\N	\N	\N	\N
256	38	KABUPATEN SUMBAWA BARAT	TALIWANG	\N	\N	\N	\N
257	38	KABUPATEN LOMBOK UTARA	TANJUNG	\N	\N	\N	\N
258	39	KABUPATEN KUPANG DAN KOTA KUPANG	KUPANG	\N	\N	\N	\N
259	39	KABUPATEN TIMOR TENGAH SELATAN	SOE	\N	\N	\N	\N
260	39	KABUPATEN TIMOR TENGAH UTARA	KEFAMENANU	\N	\N	\N	\N
261	39	KABUPATEN BELU	ATAMBUA	\N	\N	\N	\N
262	39	KABUPATEN ALOR	KALABAHI	\N	\N	\N	\N
263	39	KABUPATEN FLORES TIMUR	LARANTUKA	\N	\N	\N	\N
264	39	KABUPATEN SIKKA	MAUMERE	\N	\N	\N	\N
265	39	KABUPATEN ENDE	ENDE	\N	\N	\N	\N
266	39	KABUPATEN NGADA	BAJAWA	\N	\N	\N	\N
267	39	KABUPATEN MANGGARAI	RUTENG	\N	\N	\N	\N
268	39	KABUPATEN SUMBA TIMUR	WAINGAPU	\N	\N	\N	\N
269	39	KABUPATEN SUMBA BARAT	WAIKABUBAK	\N	\N	\N	\N
270	39	KABUPATEN LEMBATA	LEWOLEBA	\N	\N	\N	\N
271	39	KABUPATEN ROTE NDAO	BAA	\N	\N	\N	\N
272	39	KABUPATEN MANGGARAI BARAT	LABUAN BAJO	\N	\N	\N	\N
273	39	KABUPATEN NAGEKEO	MBAY	\N	\N	\N	\N
274	39	KABUPATEN SUMBA TENGAH	WAIBAKUL	\N	\N	\N	\N
275	39	KABUPATEN SUMBA BARAT DAYA	TAMBOLAKA	\N	\N	\N	\N
276	39	KABUPATEN MANGGARAI TIMUR	BORONG	\N	\N	\N	\N
277	34	KABUPATEN SAMBAS	SAMBAS	\N	\N	\N	\N
278	34	KABUPATEN PONTIANAK DAN KOTA PONTIANAK	MEMPAWAH	\N	\N	\N	\N
279	34	KABUPATEN SANGGAU	BATANG TARANG	\N	\N	\N	\N
280	34	KABUPATEN KETAPANG	KETAPANG	\N	\N	\N	\N
281	34	KABUPATEN SINTANG	SINTANG	\N	\N	\N	\N
282	34	KABUPATEN KAPUAS HULU	PUTUSSIBAU	\N	\N	\N	\N
283	34	KABUPATEN BENGKAYANG	BENGKAYANG	\N	\N	\N	\N
284	34	KABUPATEN LANDAK	NGABANG	\N	\N	\N	\N
285	34	KABUPATEN MELAWI	NANGA PINOH	\N	\N	\N	\N
286	34	KABUPATEN SEKADAU	SEKADAU	\N	\N	\N	\N
287	34	KABUPATEN KAYONG UTARA	SUKADANA	\N	\N	\N	\N
288	34	KABUPATEN KUBU RAYA	SUNGAI RAYA	\N	\N	\N	\N
289	34	KOTA SINGKAWANG	SINGKAWANG	\N	\N	\N	\N
290	20	KABUPATEN TANAH LAUT	PELAIHARI	\N	\N	\N	\N
291	20	KABUPATEN KOTABARU	KOTABARU	\N	\N	\N	\N
292	20	KABUPATEN BANJAR	MARTAPURA	\N	\N	\N	\N
293	20	KABUPATEN BARITO KUALA	MARABAHAN	\N	\N	\N	\N
294	20	KABUPATEN TAPIN	RANTAU	\N	\N	\N	\N
295	20	KABUPATEN HULU SUNGAI SELATAN	KANDANGAN	\N	\N	\N	\N
296	20	KABUPATEN HULU SUNGAI TENGAH	BARABAI	\N	\N	\N	\N
297	20	KABUPATEN HULU SUNGAI UTARA	AMUNTAI	\N	\N	\N	\N
298	20	KABUPATEN TABALONG	TANJUNG	\N	\N	\N	\N
299	20	KABUPATEN TANAH BUMBU	BATULICIN	\N	\N	\N	\N
300	20	KABUPATEN BALANGAN	PARINGIN	\N	\N	\N	\N
301	20	KOTA BANJARMASIN	BANJARMASIN	\N	\N	\N	\N
302	20	KOTA BANJARBARU	BANJARBARU	\N	\N	\N	\N
303	18	KABUPATEN KOTAWARINGIN BARAT	PANGKALAN BUN	\N	\N	\N	\N
304	18	KABUPATEN KOTAWARINGIN TIMUR	SAMPIT	\N	\N	\N	\N
305	18	KABUPATEN KAPUAS	KUALA KAPUAS	\N	\N	\N	\N
306	18	KABUPATEN BARITO SELATAN	BUNTOK	\N	\N	\N	\N
307	18	KABUPATEN BARITO UTARA	MUARA TEWEH	\N	\N	\N	\N
308	18	KABUPATEN KATINGAN	KASONGAN	\N	\N	\N	\N
309	18	KABUPATEN SERUYAN	KUALA PEMBUANG	\N	\N	\N	\N
310	18	KABUPATEN SUKAMARA	SUKAMARA	\N	\N	\N	\N
311	18	KABUPATEN LAMANDAU	NANGA BULIK	\N	\N	\N	\N
312	18	KABUPATEN GUNUNG MAS	KUALA KURUN	\N	\N	\N	\N
313	18	KABUPATEN PULANG PISAU	PULANG PISAU	\N	\N	\N	\N
314	18	KABUPATEN MURUNG RAYA	PURUKCAHU	\N	\N	\N	\N
315	18	KABUPATEN BARITO TIMUR	TAMIANG	\N	\N	\N	\N
316	18	KOTA PALANGKARAYA	PALANGKARAYA	\N	\N	\N	\N
317	35	KABUPATEN PASER	TANAH GROGOT	\N	\N	\N	\N
318	35	KABUPATEN KUTAI KARTANEGARA	TENGGARONG	\N	\N	\N	\N
319	35	KABUPATEN BERAU	TANJUNGREDEP	\N	\N	\N	\N
320	35	KABUPATEN BULUNGAN	TANJUNGSELOR	\N	\N	\N	\N
321	35	KABUPATEN NUNUKAN	NUNUKAN	\N	\N	\N	\N
322	35	KABUPATEN MALINAU	MALINAU	\N	\N	\N	\N
323	35	KABUPATEN KUTAI BARAT	SENDAWAR	\N	\N	\N	\N
324	35	KABUPATEN KUTAI TIMUR	SANGATTA	\N	\N	\N	\N
325	35	KABUPATEN PENAJAM PASER UTARA	PENAJAM	\N	\N	\N	\N
326	35	KOTA BALIKPAPAN	BALIKPAPAN	\N	\N	\N	\N
327	35	KOTA SAMARINDA	SAMARINDA	\N	\N	\N	\N
328	35	KOTA TARAKAN	TARAKAN	\N	\N	\N	\N
329	35	KOTA BONTANG	BONTANG	\N	\N	\N	\N
330	28	KABUPATEN GORONTALO & KOTA GORONTALO	GORONTALO	\N	\N	\N	\N
331	28	KABUPATEN BOALEMO	TILAMUTA	\N	\N	\N	\N
332	28	KABUPATEN BONE BOLANGO	SUWAWA	\N	\N	\N	\N
333	28	KABUPATEN POHUWATO	MARISA	\N	\N	\N	\N
334	28	KABUPATEN GORONTALO UTARA	KWANDANG	\N	\N	\N	\N
335	26	KABUPATEN SELAYAR	BENTENG	\N	\N	\N	\N
336	26	KABUPATEN BULUKUMBA	BULUKUMBA	\N	\N	\N	\N
337	26	KABUPATEN BANTAENG	BANTAENG	\N	\N	\N	\N
338	26	KABUPATEN JENEPONTO	JENEPONTO	\N	\N	\N	\N
339	26	KABUPATEN TAKALAR	TAKALAR	\N	\N	\N	\N
340	26	KABUPATEN GOWA	SUNGGU MINASA	\N	\N	\N	\N
341	26	KABUPATEN SINJAI	SINJAI	\N	\N	\N	\N
342	26	KABUPATEN BONE	WATAMPONE	\N	\N	\N	\N
343	26	KABUPATEN MAROS	MAROS	\N	\N	\N	\N
344	26	KABUPATEN PANGKAJENE DAN KEPULAUAN	PANGKAJENE	\N	\N	\N	\N
345	26	KABUPATEN BARRU	BARRU	\N	\N	\N	\N
346	26	KABUPATEN SOPPENG	WATAN SOPPENG	\N	\N	\N	\N
347	26	KABUPATEN WAJO	SENGKANG	\N	\N	\N	\N
348	26	KABUPATEN SIDENRENG RAPPANG	SIDENRENG	\N	\N	\N	\N
349	26	KABUPATEN PINRANG	PINRANG	\N	\N	\N	\N
350	26	KABUPATEN ENREKANG	ENREKANG	\N	\N	\N	\N
351	26	KABUPATEN LUWU & KOTA PALOPO	PALOPO	\N	\N	\N	\N
352	26	KABUPATEN TANA TORAJA	MAKALE	\N	\N	\N	\N
353	26	KABUPATEN LUWU UTARA	MASAMBA	\N	\N	\N	\N
354	26	KABUPATEN LUWU TIMUR	MALILI	\N	\N	\N	\N
355	26	KABUPATEN TORAJA UTARA	RANTEPAO	\N	\N	\N	\N
356	26	KOTA MAKASSAR	MAKASSAR	\N	\N	\N	\N
357	26	KOTA PARE-PARE	PARE-PARE	\N	\N	\N	\N
358	7	KABUPATEN KOLAKA	KOLAKA	\N	\N	\N	\N
359	7	KABUPATEN KONAWE	UNAAHA	\N	\N	\N	\N
360	7	KABUPATEN MUNA	RAHA	\N	\N	\N	\N
361	7	KABUPATEN BUTON & KOTA BAU-BAU	BAU-BAU	\N	\N	\N	\N
362	7	KABUPATEN KONAWE SELATAN	ANDOLO	\N	\N	\N	\N
363	7	KABUPATEN BOMBANA	RUMBIA	\N	\N	\N	\N
364	7	KABUPATEN WAKATOBI	WANGI-WANGI	\N	\N	\N	\N
365	7	KABUPATEN KOLAKA UTARA	LASUSUA	\N	\N	\N	\N
366	7	KABUPATEN KONAWE UTARA	WANGGUDU	\N	\N	\N	\N
367	7	KABUPATEN BUTON UTARA	BURANGA	\N	\N	\N	\N
368	7	KOTA KENDARI	KENDARI	\N	\N	\N	\N
369	25	KABUPATEN BANGGAI	LUWUK	\N	\N	\N	\N
370	25	KABUPATEN POSO	POSO	\N	\N	\N	\N
371	25	KABUPATEN DONGGALA	DONGGALA	\N	\N	\N	\N
372	25	KABUPATEN TOLI-TOLI	TOLI-TOLI	\N	\N	\N	\N
373	25	KABUPATEN BUOL	BUOL	\N	\N	\N	\N
374	25	KABUPATEN MOROWALI	BUNGKU	\N	\N	\N	\N
375	25	KABUPATEN BANGGAI KEPULAUAN	BANGGAI	\N	\N	\N	\N
376	25	KABUPATEN PARIGI MOUTONG	PARIGI	\N	\N	\N	\N
377	25	KABUPATEN TOJO UNA-UNA	AMPANA	\N	\N	\N	\N
378	25	KABUPATEN SIGI	SIGI BIROMARU	\N	\N	\N	\N
379	25	KOTA PALU	PALU	\N	\N	\N	\N
380	27	KABUPATEN BOLAANG MONGONDOW & KOTA KOTAMUBAGU	KOTAMOBAGU	\N	\N	\N	\N
381	27	KABUPATEN BOLAANG MONGONDOW TIMUR	TUTUYAN	\N	\N	\N	\N
382	27	KABUPATEN BOLAANG MONGONDOW SELATAN	BOLAANG UKI	\N	\N	\N	\N
383	27	KABUPATEN MINAHASA	TONDANO	\N	\N	\N	\N
384	27	KABUPATEN KEPULAUAN SANGIHE	TAHUNA	\N	\N	\N	\N
385	27	KABUPATEN KEPULAUAN TALAUD	MELONGUANE	\N	\N	\N	\N
386	27	KABUPATEN MINAHASA SELATAN	AMURANG	\N	\N	\N	\N
387	27	KABUPATEN MINAHASA UTARA	AIRMADIDI	\N	\N	\N	\N
388	27	KABUPATEN MINAHASA TENGGARA	RATAHAN	\N	\N	\N	\N
389	27	KABUPATEN BOLAANG MONGONDOW UTARA	BOROKO	\N	\N	\N	\N
390	27	KABUPATEN KEPULAUAN SIAU TAGULANDANG BIARO	ONDONG SIAU	\N	\N	\N	\N
391	27	KOTA MANADO	MANADO	\N	\N	\N	\N
392	27	KOTA BITUNG	BITUNG	\N	\N	\N	\N
393	27	KOTA TOMOHON	TOMOHON	\N	\N	\N	\N
394	24	KABUPATEN MAMUJU UTARA	PASANGKAYU	\N	\N	\N	\N
395	24	KABUPATEN MAMUJU	MAMUJU	\N	\N	\N	\N
396	24	KABUPATEN MAMASA	MAMASA	\N	\N	\N	\N
397	24	KABUPATEN POLEWALI MANDAR	POLEWALI	\N	\N	\N	\N
398	24	KABUPATEN MAJENE	MAJENE	\N	\N	\N	\N
399	23	KABUPATEN MALUKU BARAT DAYA	TIAKUR	\N	\N	\N	\N
400	23	KABUPATEN MALUKU TENGAH	MASOHI	\N	\N	\N	\N
401	23	KABUPATEN MALUKU TENGGARA & KOTA TUAL	TUAL	\N	\N	\N	\N
402	23	KABUPATEN MALUKU TENGGARA BARAT	SAUMLAKI	\N	\N	\N	\N
403	23	KABUPATEN BURU	NAMLEA	\N	\N	\N	\N
404	23	KABUPATEN BURU SELATAN	NAMROLE	\N	\N	\N	\N
405	23	KABUPATEN SERAM BAGIAN TIMUR	DATARAN HUNIMOA	\N	\N	\N	\N
406	23	KABUPATEN SERAM BAGIAN BARAT	DATARAN HUNIPOPU	\N	\N	\N	\N
407	23	KABUPATEN KEPULAUAN ARU	DOBO	\N	\N	\N	\N
408	23	KOTA AMBON	AMBON	\N	\N	\N	\N
409	36	KABUPATEN HALMAHERA BARAT & KOTA TERNATE	TERNATE	\N	\N	\N	\N
410	36	KABUPATEN HALMAHERA TENGAH	WEDA	\N	\N	\N	\N
411	36	KABUPATEN HALMAHERA UTARA	TOBELO	\N	\N	\N	\N
412	36	KABUPATEN HALMAHERA SELATAN	LABUHA	\N	\N	\N	\N
413	36	KABUPATEN KEPULAUAN SULA	SANANA	\N	\N	\N	\N
414	36	KABUPATEN HALMAHERA TIMUR	MABA	\N	\N	\N	\N
415	36	KOTA TIDORE KEPULAUAN	TIDORE KEPULAUAN	\N	\N	\N	\N
416	41	KABUPATEN MERAUKE	MERAUKE	\N	\N	\N	\N
417	41	KABUPATEN JAYAWIJAYA	WAMENA	\N	\N	\N	\N
418	41	KABUPATEN JAYAPURA & KOTA JAYAPURA	JAYAPURA	\N	\N	\N	\N
419	41	KABUPATEN NABIRE	NABIRE	\N	\N	\N	\N
420	41	KABUPATEN KEPULAUAN YAPEN	SERUI	\N	\N	\N	\N
421	41	KABUPATEN BIAK NUMFOR	BIAK	\N	\N	\N	\N
422	41	KABUPATEN PUNCAK JAYA	KOTAMULIA	\N	\N	\N	\N
423	41	KABUPATEN PANIAI	ENAROTALI	\N	\N	\N	\N
424	41	KABUPATEN MIMIKA	TIMIKA	\N	\N	\N	\N
425	41	KABUPATEN SARMI	SARMI	\N	\N	\N	\N
426	41	KABUPATEN KEEROM	WARIS	\N	\N	\N	\N
427	41	KABUPATEN PEGUNUNGAN BINTANG	OKSIBIL	\N	\N	\N	\N
428	41	KABUPATEN YAHUKIMO	SUMOHAI	\N	\N	\N	\N
429	41	KABUPATEN TOLIKARA	KARUBAGA	\N	\N	\N	\N
430	41	KABUPATEN WAROPEN	BOTAWA	\N	\N	\N	\N
431	41	KABUPATEN BOVEN DIGOEL	TANAH MERAH	\N	\N	\N	\N
432	41	KABUPATEN MAPPI	KEPI	\N	\N	\N	\N
433	41	KABUPATEN ASMAT	AGATS	\N	\N	\N	\N
434	41	KABUPATEN SUPIORI	SORENDIWERI	\N	\N	\N	\N
435	41	KABUPATEN MAMBERAMO RAYA	BURMESO	\N	\N	\N	\N
436	41	KABUPATEN MAMBERAMO TENGAH	KOBAKMA	\N	\N	\N	\N
437	41	KABUPATEN YALIMO	ELELIM	\N	\N	\N	\N
438	41	KABUPATEN LANNY JAYA	TIOM	\N	\N	\N	\N
439	41	KABUPATEN NDUGA	KENYAM	\N	\N	\N	\N
440	41	KABUPATEN PUNCAK	ILAGA	\N	\N	\N	\N
441	41	KABUPATEN DOGIYAI	KIGAMANI	\N	\N	\N	\N
442	40	KABUPATEN SORONG & KOTA SORONG	SORONG	\N	\N	\N	\N
443	40	KABUPATEN MANOKWARI	MANOKWARI	\N	\N	\N	\N
444	40	KABUPATEN FAKFAK	FAKFAK	\N	\N	\N	\N
445	40	KABUPATEN SORONG SELATAN	TEMINABUAN	\N	\N	\N	\N
446	40	KABUPATEN RAJA AMPAT	WAISAI	\N	\N	\N	\N
447	40	KABUPATEN TELUK BINTUNI	BINTUNI	\N	\N	\N	\N
448	40	KABUPATEN TELUK WONDAMA	RASIEI	\N	\N	\N	\N
449	40	KABUPATEN KAIMANA	KAIMANA	\N	\N	\N	\N
\.


--
-- TOC entry 2299 (class 0 OID 17814)
-- Dependencies: 1762
-- Data for Name: columns; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY columns (id, code) FROM stdin;
\.


--
-- TOC entry 2251 (class 0 OID 17340)
-- Dependencies: 1666
-- Data for Name: contact_person; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY contact_person (id, first_name, middle_name, last_name, email, mobile_phone_number) FROM stdin;
\.


--
-- TOC entry 2297 (class 0 OID 17778)
-- Dependencies: 1758
-- Data for Name: container_depo_coordinates; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_depo_coordinates (id, container_depo_id, coordinate_id) FROM stdin;
\.


--
-- TOC entry 2294 (class 0 OID 17746)
-- Dependencies: 1752
-- Data for Name: container_depos; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_depos (id, name, branch_id) FROM stdin;
\.


--
-- TOC entry 2252 (class 0 OID 17345)
-- Dependencies: 1668
-- Data for Name: container_group_designations; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_group_designations (id, code, description, container_group_id, created, created_by, modified, modified_by) FROM stdin;
1	GP		1	\N	\N	\N	\N
2	VH		2	\N	\N	\N	\N
3	BU		3	\N	\N	\N	\N
4	BK		3	\N	\N	\N	\N
5	SN		4	\N	\N	\N	\N
6	RE		5	\N	\N	\N	\N
7	RT		5	\N	\N	\N	\N
8	RS		5	\N	\N	\N	\N
9	HR		6	\N	\N	\N	\N
10	HI		6	\N	\N	\N	\N
11	UT		7	\N	\N	\N	\N
12	PL		8	\N	\N	\N	\N
13	PF		8	\N	\N	\N	\N
14	PC		8	\N	\N	\N	\N
15	PS		8	\N	\N	\N	\N
16	TN		9	\N	\N	\N	\N
17	TD		9	\N	\N	\N	\N
18	TG		9	\N	\N	\N	\N
19	AS		10	\N	\N	\N	\N
\.


--
-- TOC entry 2253 (class 0 OID 17350)
-- Dependencies: 1670
-- Data for Name: container_group_types; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_group_types (id, code, description, container_group_id, container_group_designation_id, created, created_by, modified, modified_by) FROM stdin;
1	G0	Opening(s) at one end or both ends	\N	1	\N	\N	\N	\N
2	G1	Passive vents at upper part of cargo space	\N	1	\N	\N	\N	\N
3	G2	Opening(s) at one or both ends plus “full” opening(s) on one or both sides	\N	1	\N	\N	\N	\N
4	G3	Opening(s) at one or both ends plus “partial” opening(s) on one or both sides	\N	1	\N	\N	\N	\N
5	V0	Nonmechanical system, vents at lower and upper parts of cargo space	\N	2	\N	\N	\N	\N
6	V2	Mechanical ventilation system, located internally	\N	2	\N	\N	\N	\N
7	V4	Mechanical ventilation system, located externally	\N	2	\N	\N	\N	\N
8	B0	Nonpresurized, box type, closed	\N	3	\N	\N	\N	\N
9	B1	Nonpresurized, box type, airtight	\N	3	\N	\N	\N	\N
10	B3	Pressurized, horizontal discharge, test pressure 150kPa1)	\N	4	\N	\N	\N	\N
11	B4	Pressurized, horizontal discharge, test pressure 265kPa	\N	4	\N	\N	\N	\N
12	B5	Pressurized, tipping discharge, test pressure 150 kPa	\N	4	\N	\N	\N	\N
13	B6	Pressurized, tipping discharge, test pressure 265kPa	\N	4	\N	\N	\N	\N
14	S0	Livestock carrier	\N	5	\N	\N	\N	\N
15	S1	Automobile carrier	\N	5	\N	\N	\N	\N
16	S2	Live fish carrier	\N	5	\N	\N	\N	\N
17	R0	Refrigerated, mechanically refrigerated	\N	6	\N	\N	\N	\N
18	R1	Refrigerated and heated, mechanically refrigerated and heated	\N	7	\N	\N	\N	\N
19	R2	Self-powered refrigerated/heated, mechanically refrigerated	\N	8	\N	\N	\N	\N
20	R3	Mechanically refrigerated and heated	\N	8	\N	\N	\N	\N
21	H0	Refrigerated and/or heated, with removable equipment located externally; heat transfer coefficient K=0,4W/(m2*K)	\N	9	\N	\N	\N	\N
22	H1	Refrigerated and/or heated with removable equipment located internally	\N	9	\N	\N	\N	\N
23	H2	Refrigerated and/or heated with removable equipment located externally; heat transfer coefficient K =0,7W/(m2*K)	\N	9	\N	\N	\N	\N
24	H5	Insulated; heat transfer coefficient K= 0,4W/(m2*K)	\N	10	\N	\N	\N	\N
25	H6	Insulated; heat transfer coefficient K= 0,7W/(m2*K)	\N	10	\N	\N	\N	\N
26	U0	Opening(s) at one or both ends	\N	11	\N	\N	\N	\N
27	U1	Opening(s) at one or both ends, plus removable top member(s) in end frame(s)	\N	11	\N	\N	\N	\N
28	U2	Opening(s) at one or both ends, plus opening(s) on one or both sides	\N	11	\N	\N	\N	\N
29	U3	Opening(s) at one or both ends, plus opening(s) on one or both sides plus removable top member(s) in end frame(s)	\N	11	\N	\N	\N	\N
30	U4	Opening(s) at one or both ends, plus partial opening on one side and full opening on the other side	\N	11	\N	\N	\N	\N
31	U5	Complete, fixed side and end walls (no doors)	\N	11	\N	\N	\N	\N
32	P0	Platform (container)	\N	12	\N	\N	\N	\N
33	P1	Fixed, two complete and fixed ends	\N	13	\N	\N	\N	\N
34	P2	Fixed, fixed posts, either free-standing or with removable top member	\N	13	\N	\N	\N	\N
35	P3	Folding (collapsible), folding complete end structure	\N	16	\N	\N	\N	\N
36	P4	Folding (collapsible), Folding posts, either free-standing or with removable top member	\N	16	\N	\N	\N	\N
37	P5	Open top, open ends (skeletal)	\N	15	\N	\N	\N	\N
38	T0	For non dangerous liquids, minimum pressure 45kPa	\N	16	\N	\N	\N	\N
39	T1	For non dangerous liquids, minimum pressure 150kPa	\N	16	\N	\N	\N	\N
40	T2	For non dangerous liquids, minimum pressure 265kPa	\N	16	\N	\N	\N	\N
41	T3	For dangerous liquids, minimum pressure 150kPa	\N	17	\N	\N	\N	\N
42	T4	For dangerous liquids, minimum pressure 265kPa	\N	17	\N	\N	\N	\N
43	T5	For dangerous liquids, minimum pressure 40kPa	\N	17	\N	\N	\N	\N
44	T6	For dangerous liquids, minimum pressure 60kPa	\N	17	\N	\N	\N	\N
45	T7	For gases, minimum pressure 910kPa	\N	18	\N	\N	\N	\N
46	T8	For gases, minimum pressure 220 kPa	\N	18	\N	\N	\N	\N
47	T9	For gases, minimum pressure (to be decided)	\N	18	\N	\N	\N	\N
48	A0		\N	19	\N	\N	\N	\N
\.


--
-- TOC entry 2254 (class 0 OID 17355)
-- Dependencies: 1672
-- Data for Name: container_groups; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_groups (id, code, description, created, created_by, modified, modified_by) FROM stdin;
1	G 	General purpose container without ventilation	\N	\N	\N	\N
2	V 	General purpose container with ventilation	\N	\N	\N	\N
3	B 	Dry bulk container	\N	\N	\N	\N
4	S 	Named cargo container	\N	\N	\N	\N
5	R 	Thermal container	\N	\N	\N	\N
6	H 	Thermal container	\N	\N	\N	\N
7	U 	Open-top container	\N	\N	\N	\N
8	P 	Platform (container)	\N	\N	\N	\N
9	T 	Tank container	\N	\N	\N	\N
10	A 	Air/surface container	\N	\N	\N	\N
\.


--
-- TOC entry 2255 (class 0 OID 17360)
-- Dependencies: 1674
-- Data for Name: container_heights; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_heights (id, min_millimeter, max_millimeter, min_feet, max_feet, min_inch, max_inch, created, created_by, modified, modified_by) FROM stdin;
1	2438	2438	8	8	0	0	\N	\N	\N	\N
2	2591	2591	8	8	6	6	\N	\N	\N	\N
3	2743	2743	9	9	0	0	\N	\N	\N	\N
4	2895	2895	9	9	6	6	\N	\N	\N	\N
5	2896	\N	9	\N	7	\N	\N	\N	\N	\N
6	1295	1295	4	4	3	3	\N	\N	\N	\N
7	0	1219	0	4	0	4	\N	\N	\N	\N
\.


--
-- TOC entry 2256 (class 0 OID 17363)
-- Dependencies: 1675
-- Data for Name: container_heights_container_widths; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_heights_container_widths (id, code, container_height_id, container_width_id, created, created_by, modified, modified_by) FROM stdin;
1	0	1	1	\N	\N	\N	\N
2	2	2	1	\N	\N	\N	\N
3	4	3	1	\N	\N	\N	\N
4	5	4	1	\N	\N	\N	\N
5	6	5	1	\N	\N	\N	\N
6	8	6	1	\N	\N	\N	\N
7	9	7	1	\N	\N	\N	\N
8	C	2	2	\N	\N	\N	\N
9	D	3	2	\N	\N	\N	\N
10	E	4	2	\N	\N	\N	\N
11	F	5	2	\N	\N	\N	\N
12	L	2	3	\N	\N	\N	\N
13	M	3	3	\N	\N	\N	\N
14	N	4	3	\N	\N	\N	\N
15	P	5	3	\N	\N	\N	\N
\.


--
-- TOC entry 2257 (class 0 OID 17370)
-- Dependencies: 1678
-- Data for Name: container_lengths; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_lengths (id, code, millimeter, feet, inch, created, created_by, modified, modified_by) FROM stdin;
1	1	2991	10	0	\N	\N	\N	\N
2	2	6068	20	0	\N	\N	\N	\N
3	3	9125	30	0	\N	\N	\N	\N
4	4	12192	40	0	\N	\N	\N	\N
5	A	7150	\N	\N	\N	\N	\N	\N
6	B	7315	24	0	\N	\N	\N	\N
7	C	7430	24	6	\N	\N	\N	\N
8	D	7450	\N	\N	\N	\N	\N	\N
9	E	7820	\N	\N	\N	\N	\N	\N
10	F	8100	\N	\N	\N	\N	\N	\N
11	G	12500	41	0	\N	\N	\N	\N
12	H	13106	43	0	\N	\N	\N	\N
13	K	13600	\N	\N	\N	\N	\N	\N
14	L	13716	45	0	\N	\N	\N	\N
15	M	14630	48	0	\N	\N	\N	\N
16	N	14935	49	0	\N	\N	\N	\N
17	P	16154	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2258 (class 0 OID 17375)
-- Dependencies: 1680
-- Data for Name: container_types; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_types (id, container_length_id, container_heights_container_widths_id, container_group_type_id, created, created_by, modified, modified_by) FROM stdin;
1	1	1	1	\N	\N	\N	\N
2	1	1	2	\N	\N	\N	\N
3	1	1	3	\N	\N	\N	\N
4	1	1	4	\N	\N	\N	\N
5	1	1	5	\N	\N	\N	\N
6	1	1	6	\N	\N	\N	\N
7	1	1	7	\N	\N	\N	\N
8	1	1	8	\N	\N	\N	\N
9	1	1	9	\N	\N	\N	\N
10	1	1	10	\N	\N	\N	\N
11	1	1	11	\N	\N	\N	\N
12	1	1	12	\N	\N	\N	\N
13	1	1	13	\N	\N	\N	\N
14	1	1	14	\N	\N	\N	\N
15	1	1	15	\N	\N	\N	\N
16	1	1	16	\N	\N	\N	\N
17	1	1	17	\N	\N	\N	\N
18	1	1	18	\N	\N	\N	\N
19	1	1	19	\N	\N	\N	\N
20	1	1	20	\N	\N	\N	\N
21	1	1	21	\N	\N	\N	\N
22	1	1	22	\N	\N	\N	\N
23	1	1	23	\N	\N	\N	\N
24	1	1	24	\N	\N	\N	\N
25	1	1	25	\N	\N	\N	\N
26	1	1	26	\N	\N	\N	\N
27	1	1	27	\N	\N	\N	\N
28	1	1	28	\N	\N	\N	\N
29	1	1	29	\N	\N	\N	\N
30	1	1	30	\N	\N	\N	\N
31	1	1	31	\N	\N	\N	\N
32	1	1	32	\N	\N	\N	\N
33	1	1	33	\N	\N	\N	\N
34	1	1	34	\N	\N	\N	\N
35	1	1	35	\N	\N	\N	\N
36	1	1	36	\N	\N	\N	\N
37	1	1	37	\N	\N	\N	\N
38	1	1	38	\N	\N	\N	\N
39	1	1	39	\N	\N	\N	\N
40	1	1	40	\N	\N	\N	\N
41	1	1	41	\N	\N	\N	\N
42	1	1	42	\N	\N	\N	\N
43	1	1	43	\N	\N	\N	\N
44	1	1	44	\N	\N	\N	\N
45	1	1	45	\N	\N	\N	\N
46	1	1	46	\N	\N	\N	\N
47	1	1	47	\N	\N	\N	\N
48	1	1	48	\N	\N	\N	\N
49	1	2	1	\N	\N	\N	\N
50	1	2	2	\N	\N	\N	\N
51	1	2	3	\N	\N	\N	\N
52	1	2	4	\N	\N	\N	\N
53	1	2	5	\N	\N	\N	\N
54	1	2	6	\N	\N	\N	\N
55	1	2	7	\N	\N	\N	\N
56	1	2	8	\N	\N	\N	\N
57	1	2	9	\N	\N	\N	\N
58	1	2	10	\N	\N	\N	\N
59	1	2	11	\N	\N	\N	\N
60	1	2	12	\N	\N	\N	\N
61	1	2	13	\N	\N	\N	\N
62	1	2	14	\N	\N	\N	\N
63	1	2	15	\N	\N	\N	\N
64	1	2	16	\N	\N	\N	\N
65	1	2	17	\N	\N	\N	\N
66	1	2	18	\N	\N	\N	\N
67	1	2	19	\N	\N	\N	\N
68	1	2	20	\N	\N	\N	\N
69	1	2	21	\N	\N	\N	\N
70	1	2	22	\N	\N	\N	\N
71	1	2	23	\N	\N	\N	\N
72	1	2	24	\N	\N	\N	\N
73	1	2	25	\N	\N	\N	\N
74	1	2	26	\N	\N	\N	\N
75	1	2	27	\N	\N	\N	\N
76	1	2	28	\N	\N	\N	\N
77	1	2	29	\N	\N	\N	\N
78	1	2	30	\N	\N	\N	\N
79	1	2	31	\N	\N	\N	\N
80	1	2	32	\N	\N	\N	\N
81	1	2	33	\N	\N	\N	\N
82	1	2	34	\N	\N	\N	\N
83	1	2	35	\N	\N	\N	\N
84	1	2	36	\N	\N	\N	\N
85	1	2	37	\N	\N	\N	\N
86	1	2	38	\N	\N	\N	\N
87	1	2	39	\N	\N	\N	\N
88	1	2	40	\N	\N	\N	\N
89	1	2	41	\N	\N	\N	\N
90	1	2	42	\N	\N	\N	\N
91	1	2	43	\N	\N	\N	\N
92	1	2	44	\N	\N	\N	\N
93	1	2	45	\N	\N	\N	\N
94	1	2	46	\N	\N	\N	\N
95	1	2	47	\N	\N	\N	\N
96	1	2	48	\N	\N	\N	\N
97	1	3	1	\N	\N	\N	\N
98	1	3	2	\N	\N	\N	\N
99	1	3	3	\N	\N	\N	\N
100	1	3	4	\N	\N	\N	\N
101	1	3	5	\N	\N	\N	\N
102	1	3	6	\N	\N	\N	\N
103	1	3	7	\N	\N	\N	\N
104	1	3	8	\N	\N	\N	\N
105	1	3	9	\N	\N	\N	\N
106	1	3	10	\N	\N	\N	\N
107	1	3	11	\N	\N	\N	\N
108	1	3	12	\N	\N	\N	\N
109	1	3	13	\N	\N	\N	\N
110	1	3	14	\N	\N	\N	\N
111	1	3	15	\N	\N	\N	\N
112	1	3	16	\N	\N	\N	\N
113	1	3	17	\N	\N	\N	\N
114	1	3	18	\N	\N	\N	\N
115	1	3	19	\N	\N	\N	\N
116	1	3	20	\N	\N	\N	\N
117	1	3	21	\N	\N	\N	\N
118	1	3	22	\N	\N	\N	\N
119	1	3	23	\N	\N	\N	\N
120	1	3	24	\N	\N	\N	\N
121	1	3	25	\N	\N	\N	\N
122	1	3	26	\N	\N	\N	\N
123	1	3	27	\N	\N	\N	\N
124	1	3	28	\N	\N	\N	\N
125	1	3	29	\N	\N	\N	\N
126	1	3	30	\N	\N	\N	\N
127	1	3	31	\N	\N	\N	\N
128	1	3	32	\N	\N	\N	\N
129	1	3	33	\N	\N	\N	\N
130	1	3	34	\N	\N	\N	\N
131	1	3	35	\N	\N	\N	\N
132	1	3	36	\N	\N	\N	\N
133	1	3	37	\N	\N	\N	\N
134	1	3	38	\N	\N	\N	\N
135	1	3	39	\N	\N	\N	\N
136	1	3	40	\N	\N	\N	\N
137	1	3	41	\N	\N	\N	\N
138	1	3	42	\N	\N	\N	\N
139	1	3	43	\N	\N	\N	\N
140	1	3	44	\N	\N	\N	\N
141	1	3	45	\N	\N	\N	\N
142	1	3	46	\N	\N	\N	\N
143	1	3	47	\N	\N	\N	\N
144	1	3	48	\N	\N	\N	\N
145	1	4	1	\N	\N	\N	\N
146	1	4	2	\N	\N	\N	\N
147	1	4	3	\N	\N	\N	\N
148	1	4	4	\N	\N	\N	\N
149	1	4	5	\N	\N	\N	\N
150	1	4	6	\N	\N	\N	\N
151	1	4	7	\N	\N	\N	\N
152	1	4	8	\N	\N	\N	\N
153	1	4	9	\N	\N	\N	\N
154	1	4	10	\N	\N	\N	\N
155	1	4	11	\N	\N	\N	\N
156	1	4	12	\N	\N	\N	\N
157	1	4	13	\N	\N	\N	\N
158	1	4	14	\N	\N	\N	\N
159	1	4	15	\N	\N	\N	\N
160	1	4	16	\N	\N	\N	\N
161	1	4	17	\N	\N	\N	\N
162	1	4	18	\N	\N	\N	\N
163	1	4	19	\N	\N	\N	\N
164	1	4	20	\N	\N	\N	\N
165	1	4	21	\N	\N	\N	\N
166	1	4	22	\N	\N	\N	\N
167	1	4	23	\N	\N	\N	\N
168	1	4	24	\N	\N	\N	\N
169	1	4	25	\N	\N	\N	\N
170	1	4	26	\N	\N	\N	\N
171	1	4	27	\N	\N	\N	\N
172	1	4	28	\N	\N	\N	\N
173	1	4	29	\N	\N	\N	\N
174	1	4	30	\N	\N	\N	\N
175	1	4	31	\N	\N	\N	\N
176	1	4	32	\N	\N	\N	\N
177	1	4	33	\N	\N	\N	\N
178	1	4	34	\N	\N	\N	\N
179	1	4	35	\N	\N	\N	\N
180	1	4	36	\N	\N	\N	\N
181	1	4	37	\N	\N	\N	\N
182	1	4	38	\N	\N	\N	\N
183	1	4	39	\N	\N	\N	\N
184	1	4	40	\N	\N	\N	\N
185	1	4	41	\N	\N	\N	\N
186	1	4	42	\N	\N	\N	\N
187	1	4	43	\N	\N	\N	\N
188	1	4	44	\N	\N	\N	\N
189	1	4	45	\N	\N	\N	\N
190	1	4	46	\N	\N	\N	\N
191	1	4	47	\N	\N	\N	\N
192	1	4	48	\N	\N	\N	\N
193	1	5	1	\N	\N	\N	\N
194	1	5	2	\N	\N	\N	\N
195	1	5	3	\N	\N	\N	\N
196	1	5	4	\N	\N	\N	\N
197	1	5	5	\N	\N	\N	\N
198	1	5	6	\N	\N	\N	\N
199	1	5	7	\N	\N	\N	\N
200	1	5	8	\N	\N	\N	\N
201	1	5	9	\N	\N	\N	\N
202	1	5	10	\N	\N	\N	\N
203	1	5	11	\N	\N	\N	\N
204	1	5	12	\N	\N	\N	\N
205	1	5	13	\N	\N	\N	\N
206	1	5	14	\N	\N	\N	\N
207	1	5	15	\N	\N	\N	\N
208	1	5	16	\N	\N	\N	\N
209	1	5	17	\N	\N	\N	\N
210	1	5	18	\N	\N	\N	\N
211	1	5	19	\N	\N	\N	\N
212	1	5	20	\N	\N	\N	\N
213	1	5	21	\N	\N	\N	\N
214	1	5	22	\N	\N	\N	\N
215	1	5	23	\N	\N	\N	\N
216	1	5	24	\N	\N	\N	\N
217	1	5	25	\N	\N	\N	\N
218	1	5	26	\N	\N	\N	\N
219	1	5	27	\N	\N	\N	\N
220	1	5	28	\N	\N	\N	\N
221	1	5	29	\N	\N	\N	\N
222	1	5	30	\N	\N	\N	\N
223	1	5	31	\N	\N	\N	\N
224	1	5	32	\N	\N	\N	\N
225	1	5	33	\N	\N	\N	\N
226	1	5	34	\N	\N	\N	\N
227	1	5	35	\N	\N	\N	\N
228	1	5	36	\N	\N	\N	\N
229	1	5	37	\N	\N	\N	\N
230	1	5	38	\N	\N	\N	\N
231	1	5	39	\N	\N	\N	\N
232	1	5	40	\N	\N	\N	\N
233	1	5	41	\N	\N	\N	\N
234	1	5	42	\N	\N	\N	\N
235	1	5	43	\N	\N	\N	\N
236	1	5	44	\N	\N	\N	\N
237	1	5	45	\N	\N	\N	\N
238	1	5	46	\N	\N	\N	\N
239	1	5	47	\N	\N	\N	\N
240	1	5	48	\N	\N	\N	\N
241	1	6	1	\N	\N	\N	\N
242	1	6	2	\N	\N	\N	\N
243	1	6	3	\N	\N	\N	\N
244	1	6	4	\N	\N	\N	\N
245	1	6	5	\N	\N	\N	\N
246	1	6	6	\N	\N	\N	\N
247	1	6	7	\N	\N	\N	\N
248	1	6	8	\N	\N	\N	\N
249	1	6	9	\N	\N	\N	\N
250	1	6	10	\N	\N	\N	\N
251	1	6	11	\N	\N	\N	\N
252	1	6	12	\N	\N	\N	\N
253	1	6	13	\N	\N	\N	\N
254	1	6	14	\N	\N	\N	\N
255	1	6	15	\N	\N	\N	\N
256	1	6	16	\N	\N	\N	\N
257	1	6	17	\N	\N	\N	\N
258	1	6	18	\N	\N	\N	\N
259	1	6	19	\N	\N	\N	\N
260	1	6	20	\N	\N	\N	\N
261	1	6	21	\N	\N	\N	\N
262	1	6	22	\N	\N	\N	\N
263	1	6	23	\N	\N	\N	\N
264	1	6	24	\N	\N	\N	\N
265	1	6	25	\N	\N	\N	\N
266	1	6	26	\N	\N	\N	\N
267	1	6	27	\N	\N	\N	\N
268	1	6	28	\N	\N	\N	\N
269	1	6	29	\N	\N	\N	\N
270	1	6	30	\N	\N	\N	\N
271	1	6	31	\N	\N	\N	\N
272	1	6	32	\N	\N	\N	\N
273	1	6	33	\N	\N	\N	\N
274	1	6	34	\N	\N	\N	\N
275	1	6	35	\N	\N	\N	\N
276	1	6	36	\N	\N	\N	\N
277	1	6	37	\N	\N	\N	\N
278	1	6	38	\N	\N	\N	\N
279	1	6	39	\N	\N	\N	\N
280	1	6	40	\N	\N	\N	\N
281	1	6	41	\N	\N	\N	\N
282	1	6	42	\N	\N	\N	\N
283	1	6	43	\N	\N	\N	\N
284	1	6	44	\N	\N	\N	\N
285	1	6	45	\N	\N	\N	\N
286	1	6	46	\N	\N	\N	\N
287	1	6	47	\N	\N	\N	\N
288	1	6	48	\N	\N	\N	\N
289	1	7	1	\N	\N	\N	\N
290	1	7	2	\N	\N	\N	\N
291	1	7	3	\N	\N	\N	\N
292	1	7	4	\N	\N	\N	\N
293	1	7	5	\N	\N	\N	\N
294	1	7	6	\N	\N	\N	\N
295	1	7	7	\N	\N	\N	\N
296	1	7	8	\N	\N	\N	\N
297	1	7	9	\N	\N	\N	\N
298	1	7	10	\N	\N	\N	\N
299	1	7	11	\N	\N	\N	\N
300	1	7	12	\N	\N	\N	\N
301	1	7	13	\N	\N	\N	\N
302	1	7	14	\N	\N	\N	\N
303	1	7	15	\N	\N	\N	\N
304	1	7	16	\N	\N	\N	\N
305	1	7	17	\N	\N	\N	\N
306	1	7	18	\N	\N	\N	\N
307	1	7	19	\N	\N	\N	\N
308	1	7	20	\N	\N	\N	\N
309	1	7	21	\N	\N	\N	\N
310	1	7	22	\N	\N	\N	\N
311	1	7	23	\N	\N	\N	\N
312	1	7	24	\N	\N	\N	\N
313	1	7	25	\N	\N	\N	\N
314	1	7	26	\N	\N	\N	\N
315	1	7	27	\N	\N	\N	\N
316	1	7	28	\N	\N	\N	\N
317	1	7	29	\N	\N	\N	\N
318	1	7	30	\N	\N	\N	\N
319	1	7	31	\N	\N	\N	\N
320	1	7	32	\N	\N	\N	\N
321	1	7	33	\N	\N	\N	\N
322	1	7	34	\N	\N	\N	\N
323	1	7	35	\N	\N	\N	\N
324	1	7	36	\N	\N	\N	\N
325	1	7	37	\N	\N	\N	\N
326	1	7	38	\N	\N	\N	\N
327	1	7	39	\N	\N	\N	\N
328	1	7	40	\N	\N	\N	\N
329	1	7	41	\N	\N	\N	\N
330	1	7	42	\N	\N	\N	\N
331	1	7	43	\N	\N	\N	\N
332	1	7	44	\N	\N	\N	\N
333	1	7	45	\N	\N	\N	\N
334	1	7	46	\N	\N	\N	\N
335	1	7	47	\N	\N	\N	\N
336	1	7	48	\N	\N	\N	\N
337	1	8	1	\N	\N	\N	\N
338	1	8	2	\N	\N	\N	\N
339	1	8	3	\N	\N	\N	\N
340	1	8	4	\N	\N	\N	\N
341	1	8	5	\N	\N	\N	\N
342	1	8	6	\N	\N	\N	\N
343	1	8	7	\N	\N	\N	\N
344	1	8	8	\N	\N	\N	\N
345	1	8	9	\N	\N	\N	\N
346	1	8	10	\N	\N	\N	\N
347	1	8	11	\N	\N	\N	\N
348	1	8	12	\N	\N	\N	\N
349	1	8	13	\N	\N	\N	\N
350	1	8	14	\N	\N	\N	\N
351	1	8	15	\N	\N	\N	\N
352	1	8	16	\N	\N	\N	\N
353	1	8	17	\N	\N	\N	\N
354	1	8	18	\N	\N	\N	\N
355	1	8	19	\N	\N	\N	\N
356	1	8	20	\N	\N	\N	\N
357	1	8	21	\N	\N	\N	\N
358	1	8	22	\N	\N	\N	\N
359	1	8	23	\N	\N	\N	\N
360	1	8	24	\N	\N	\N	\N
361	1	8	25	\N	\N	\N	\N
362	1	8	26	\N	\N	\N	\N
363	1	8	27	\N	\N	\N	\N
364	1	8	28	\N	\N	\N	\N
365	1	8	29	\N	\N	\N	\N
366	1	8	30	\N	\N	\N	\N
367	1	8	31	\N	\N	\N	\N
368	1	8	32	\N	\N	\N	\N
369	1	8	33	\N	\N	\N	\N
370	1	8	34	\N	\N	\N	\N
371	1	8	35	\N	\N	\N	\N
372	1	8	36	\N	\N	\N	\N
373	1	8	37	\N	\N	\N	\N
374	1	8	38	\N	\N	\N	\N
375	1	8	39	\N	\N	\N	\N
376	1	8	40	\N	\N	\N	\N
377	1	8	41	\N	\N	\N	\N
378	1	8	42	\N	\N	\N	\N
379	1	8	43	\N	\N	\N	\N
380	1	8	44	\N	\N	\N	\N
381	1	8	45	\N	\N	\N	\N
382	1	8	46	\N	\N	\N	\N
383	1	8	47	\N	\N	\N	\N
384	1	8	48	\N	\N	\N	\N
385	1	9	1	\N	\N	\N	\N
386	1	9	2	\N	\N	\N	\N
387	1	9	3	\N	\N	\N	\N
388	1	9	4	\N	\N	\N	\N
389	1	9	5	\N	\N	\N	\N
390	1	9	6	\N	\N	\N	\N
391	1	9	7	\N	\N	\N	\N
392	1	9	8	\N	\N	\N	\N
393	1	9	9	\N	\N	\N	\N
394	1	9	10	\N	\N	\N	\N
395	1	9	11	\N	\N	\N	\N
396	1	9	12	\N	\N	\N	\N
397	1	9	13	\N	\N	\N	\N
398	1	9	14	\N	\N	\N	\N
399	1	9	15	\N	\N	\N	\N
400	1	9	16	\N	\N	\N	\N
401	1	9	17	\N	\N	\N	\N
402	1	9	18	\N	\N	\N	\N
403	1	9	19	\N	\N	\N	\N
404	1	9	20	\N	\N	\N	\N
405	1	9	21	\N	\N	\N	\N
406	1	9	22	\N	\N	\N	\N
407	1	9	23	\N	\N	\N	\N
408	1	9	24	\N	\N	\N	\N
409	1	9	25	\N	\N	\N	\N
410	1	9	26	\N	\N	\N	\N
411	1	9	27	\N	\N	\N	\N
412	1	9	28	\N	\N	\N	\N
413	1	9	29	\N	\N	\N	\N
414	1	9	30	\N	\N	\N	\N
415	1	9	31	\N	\N	\N	\N
416	1	9	32	\N	\N	\N	\N
417	1	9	33	\N	\N	\N	\N
418	1	9	34	\N	\N	\N	\N
419	1	9	35	\N	\N	\N	\N
420	1	9	36	\N	\N	\N	\N
421	1	9	37	\N	\N	\N	\N
422	1	9	38	\N	\N	\N	\N
423	1	9	39	\N	\N	\N	\N
424	1	9	40	\N	\N	\N	\N
425	1	9	41	\N	\N	\N	\N
426	1	9	42	\N	\N	\N	\N
427	1	9	43	\N	\N	\N	\N
428	1	9	44	\N	\N	\N	\N
429	1	9	45	\N	\N	\N	\N
430	1	9	46	\N	\N	\N	\N
431	1	9	47	\N	\N	\N	\N
432	1	9	48	\N	\N	\N	\N
433	1	10	1	\N	\N	\N	\N
434	1	10	2	\N	\N	\N	\N
435	1	10	3	\N	\N	\N	\N
436	1	10	4	\N	\N	\N	\N
437	1	10	5	\N	\N	\N	\N
438	1	10	6	\N	\N	\N	\N
439	1	10	7	\N	\N	\N	\N
440	1	10	8	\N	\N	\N	\N
441	1	10	9	\N	\N	\N	\N
442	1	10	10	\N	\N	\N	\N
443	1	10	11	\N	\N	\N	\N
444	1	10	12	\N	\N	\N	\N
445	1	10	13	\N	\N	\N	\N
446	1	10	14	\N	\N	\N	\N
447	1	10	15	\N	\N	\N	\N
448	1	10	16	\N	\N	\N	\N
449	1	10	17	\N	\N	\N	\N
450	1	10	18	\N	\N	\N	\N
451	1	10	19	\N	\N	\N	\N
452	1	10	20	\N	\N	\N	\N
453	1	10	21	\N	\N	\N	\N
454	1	10	22	\N	\N	\N	\N
455	1	10	23	\N	\N	\N	\N
456	1	10	24	\N	\N	\N	\N
457	1	10	25	\N	\N	\N	\N
458	1	10	26	\N	\N	\N	\N
459	1	10	27	\N	\N	\N	\N
460	1	10	28	\N	\N	\N	\N
461	1	10	29	\N	\N	\N	\N
462	1	10	30	\N	\N	\N	\N
463	1	10	31	\N	\N	\N	\N
464	1	10	32	\N	\N	\N	\N
465	1	10	33	\N	\N	\N	\N
466	1	10	34	\N	\N	\N	\N
467	1	10	35	\N	\N	\N	\N
468	1	10	36	\N	\N	\N	\N
469	1	10	37	\N	\N	\N	\N
470	1	10	38	\N	\N	\N	\N
471	1	10	39	\N	\N	\N	\N
472	1	10	40	\N	\N	\N	\N
473	1	10	41	\N	\N	\N	\N
474	1	10	42	\N	\N	\N	\N
475	1	10	43	\N	\N	\N	\N
476	1	10	44	\N	\N	\N	\N
477	1	10	45	\N	\N	\N	\N
478	1	10	46	\N	\N	\N	\N
479	1	10	47	\N	\N	\N	\N
480	1	10	48	\N	\N	\N	\N
481	1	11	1	\N	\N	\N	\N
482	1	11	2	\N	\N	\N	\N
483	1	11	3	\N	\N	\N	\N
484	1	11	4	\N	\N	\N	\N
485	1	11	5	\N	\N	\N	\N
486	1	11	6	\N	\N	\N	\N
487	1	11	7	\N	\N	\N	\N
488	1	11	8	\N	\N	\N	\N
489	1	11	9	\N	\N	\N	\N
490	1	11	10	\N	\N	\N	\N
491	1	11	11	\N	\N	\N	\N
492	1	11	12	\N	\N	\N	\N
493	1	11	13	\N	\N	\N	\N
494	1	11	14	\N	\N	\N	\N
495	1	11	15	\N	\N	\N	\N
496	1	11	16	\N	\N	\N	\N
497	1	11	17	\N	\N	\N	\N
498	1	11	18	\N	\N	\N	\N
499	1	11	19	\N	\N	\N	\N
500	1	11	20	\N	\N	\N	\N
501	1	11	21	\N	\N	\N	\N
502	1	11	22	\N	\N	\N	\N
503	1	11	23	\N	\N	\N	\N
504	1	11	24	\N	\N	\N	\N
505	1	11	25	\N	\N	\N	\N
506	1	11	26	\N	\N	\N	\N
507	1	11	27	\N	\N	\N	\N
508	1	11	28	\N	\N	\N	\N
509	1	11	29	\N	\N	\N	\N
510	1	11	30	\N	\N	\N	\N
511	1	11	31	\N	\N	\N	\N
512	1	11	32	\N	\N	\N	\N
513	1	11	33	\N	\N	\N	\N
514	1	11	34	\N	\N	\N	\N
515	1	11	35	\N	\N	\N	\N
516	1	11	36	\N	\N	\N	\N
517	1	11	37	\N	\N	\N	\N
518	1	11	38	\N	\N	\N	\N
519	1	11	39	\N	\N	\N	\N
520	1	11	40	\N	\N	\N	\N
521	1	11	41	\N	\N	\N	\N
522	1	11	42	\N	\N	\N	\N
523	1	11	43	\N	\N	\N	\N
524	1	11	44	\N	\N	\N	\N
525	1	11	45	\N	\N	\N	\N
526	1	11	46	\N	\N	\N	\N
527	1	11	47	\N	\N	\N	\N
528	1	11	48	\N	\N	\N	\N
529	1	12	1	\N	\N	\N	\N
530	1	12	2	\N	\N	\N	\N
531	1	12	3	\N	\N	\N	\N
532	1	12	4	\N	\N	\N	\N
533	1	12	5	\N	\N	\N	\N
534	1	12	6	\N	\N	\N	\N
535	1	12	7	\N	\N	\N	\N
536	1	12	8	\N	\N	\N	\N
537	1	12	9	\N	\N	\N	\N
538	1	12	10	\N	\N	\N	\N
539	1	12	11	\N	\N	\N	\N
540	1	12	12	\N	\N	\N	\N
541	1	12	13	\N	\N	\N	\N
542	1	12	14	\N	\N	\N	\N
543	1	12	15	\N	\N	\N	\N
544	1	12	16	\N	\N	\N	\N
545	1	12	17	\N	\N	\N	\N
546	1	12	18	\N	\N	\N	\N
547	1	12	19	\N	\N	\N	\N
548	1	12	20	\N	\N	\N	\N
549	1	12	21	\N	\N	\N	\N
550	1	12	22	\N	\N	\N	\N
551	1	12	23	\N	\N	\N	\N
552	1	12	24	\N	\N	\N	\N
553	1	12	25	\N	\N	\N	\N
554	1	12	26	\N	\N	\N	\N
555	1	12	27	\N	\N	\N	\N
556	1	12	28	\N	\N	\N	\N
557	1	12	29	\N	\N	\N	\N
558	1	12	30	\N	\N	\N	\N
559	1	12	31	\N	\N	\N	\N
560	1	12	32	\N	\N	\N	\N
561	1	12	33	\N	\N	\N	\N
562	1	12	34	\N	\N	\N	\N
563	1	12	35	\N	\N	\N	\N
564	1	12	36	\N	\N	\N	\N
565	1	12	37	\N	\N	\N	\N
566	1	12	38	\N	\N	\N	\N
567	1	12	39	\N	\N	\N	\N
568	1	12	40	\N	\N	\N	\N
569	1	12	41	\N	\N	\N	\N
570	1	12	42	\N	\N	\N	\N
571	1	12	43	\N	\N	\N	\N
572	1	12	44	\N	\N	\N	\N
573	1	12	45	\N	\N	\N	\N
574	1	12	46	\N	\N	\N	\N
575	1	12	47	\N	\N	\N	\N
576	1	12	48	\N	\N	\N	\N
577	1	13	1	\N	\N	\N	\N
578	1	13	2	\N	\N	\N	\N
579	1	13	3	\N	\N	\N	\N
580	1	13	4	\N	\N	\N	\N
581	1	13	5	\N	\N	\N	\N
582	1	13	6	\N	\N	\N	\N
583	1	13	7	\N	\N	\N	\N
584	1	13	8	\N	\N	\N	\N
585	1	13	9	\N	\N	\N	\N
586	1	13	10	\N	\N	\N	\N
587	1	13	11	\N	\N	\N	\N
588	1	13	12	\N	\N	\N	\N
589	1	13	13	\N	\N	\N	\N
590	1	13	14	\N	\N	\N	\N
591	1	13	15	\N	\N	\N	\N
592	1	13	16	\N	\N	\N	\N
593	1	13	17	\N	\N	\N	\N
594	1	13	18	\N	\N	\N	\N
595	1	13	19	\N	\N	\N	\N
596	1	13	20	\N	\N	\N	\N
597	1	13	21	\N	\N	\N	\N
598	1	13	22	\N	\N	\N	\N
599	1	13	23	\N	\N	\N	\N
600	1	13	24	\N	\N	\N	\N
601	1	13	25	\N	\N	\N	\N
602	1	13	26	\N	\N	\N	\N
603	1	13	27	\N	\N	\N	\N
604	1	13	28	\N	\N	\N	\N
605	1	13	29	\N	\N	\N	\N
606	1	13	30	\N	\N	\N	\N
607	1	13	31	\N	\N	\N	\N
608	1	13	32	\N	\N	\N	\N
609	1	13	33	\N	\N	\N	\N
610	1	13	34	\N	\N	\N	\N
611	1	13	35	\N	\N	\N	\N
612	1	13	36	\N	\N	\N	\N
613	1	13	37	\N	\N	\N	\N
614	1	13	38	\N	\N	\N	\N
615	1	13	39	\N	\N	\N	\N
616	1	13	40	\N	\N	\N	\N
617	1	13	41	\N	\N	\N	\N
618	1	13	42	\N	\N	\N	\N
619	1	13	43	\N	\N	\N	\N
620	1	13	44	\N	\N	\N	\N
621	1	13	45	\N	\N	\N	\N
622	1	13	46	\N	\N	\N	\N
623	1	13	47	\N	\N	\N	\N
624	1	13	48	\N	\N	\N	\N
625	1	14	1	\N	\N	\N	\N
626	1	14	2	\N	\N	\N	\N
627	1	14	3	\N	\N	\N	\N
628	1	14	4	\N	\N	\N	\N
629	1	14	5	\N	\N	\N	\N
630	1	14	6	\N	\N	\N	\N
631	1	14	7	\N	\N	\N	\N
632	1	14	8	\N	\N	\N	\N
633	1	14	9	\N	\N	\N	\N
634	1	14	10	\N	\N	\N	\N
635	1	14	11	\N	\N	\N	\N
636	1	14	12	\N	\N	\N	\N
637	1	14	13	\N	\N	\N	\N
638	1	14	14	\N	\N	\N	\N
639	1	14	15	\N	\N	\N	\N
640	1	14	16	\N	\N	\N	\N
641	1	14	17	\N	\N	\N	\N
642	1	14	18	\N	\N	\N	\N
643	1	14	19	\N	\N	\N	\N
644	1	14	20	\N	\N	\N	\N
645	1	14	21	\N	\N	\N	\N
646	1	14	22	\N	\N	\N	\N
647	1	14	23	\N	\N	\N	\N
648	1	14	24	\N	\N	\N	\N
649	1	14	25	\N	\N	\N	\N
650	1	14	26	\N	\N	\N	\N
651	1	14	27	\N	\N	\N	\N
652	1	14	28	\N	\N	\N	\N
653	1	14	29	\N	\N	\N	\N
654	1	14	30	\N	\N	\N	\N
655	1	14	31	\N	\N	\N	\N
656	1	14	32	\N	\N	\N	\N
657	1	14	33	\N	\N	\N	\N
658	1	14	34	\N	\N	\N	\N
659	1	14	35	\N	\N	\N	\N
660	1	14	36	\N	\N	\N	\N
661	1	14	37	\N	\N	\N	\N
662	1	14	38	\N	\N	\N	\N
663	1	14	39	\N	\N	\N	\N
664	1	14	40	\N	\N	\N	\N
665	1	14	41	\N	\N	\N	\N
666	1	14	42	\N	\N	\N	\N
667	1	14	43	\N	\N	\N	\N
668	1	14	44	\N	\N	\N	\N
669	1	14	45	\N	\N	\N	\N
670	1	14	46	\N	\N	\N	\N
671	1	14	47	\N	\N	\N	\N
672	1	14	48	\N	\N	\N	\N
673	1	15	1	\N	\N	\N	\N
674	1	15	2	\N	\N	\N	\N
675	1	15	3	\N	\N	\N	\N
676	1	15	4	\N	\N	\N	\N
677	1	15	5	\N	\N	\N	\N
678	1	15	6	\N	\N	\N	\N
679	1	15	7	\N	\N	\N	\N
680	1	15	8	\N	\N	\N	\N
681	1	15	9	\N	\N	\N	\N
682	1	15	10	\N	\N	\N	\N
683	1	15	11	\N	\N	\N	\N
684	1	15	12	\N	\N	\N	\N
685	1	15	13	\N	\N	\N	\N
686	1	15	14	\N	\N	\N	\N
687	1	15	15	\N	\N	\N	\N
688	1	15	16	\N	\N	\N	\N
689	1	15	17	\N	\N	\N	\N
690	1	15	18	\N	\N	\N	\N
691	1	15	19	\N	\N	\N	\N
692	1	15	20	\N	\N	\N	\N
693	1	15	21	\N	\N	\N	\N
694	1	15	22	\N	\N	\N	\N
695	1	15	23	\N	\N	\N	\N
696	1	15	24	\N	\N	\N	\N
697	1	15	25	\N	\N	\N	\N
698	1	15	26	\N	\N	\N	\N
699	1	15	27	\N	\N	\N	\N
700	1	15	28	\N	\N	\N	\N
701	1	15	29	\N	\N	\N	\N
702	1	15	30	\N	\N	\N	\N
703	1	15	31	\N	\N	\N	\N
704	1	15	32	\N	\N	\N	\N
705	1	15	33	\N	\N	\N	\N
706	1	15	34	\N	\N	\N	\N
707	1	15	35	\N	\N	\N	\N
708	1	15	36	\N	\N	\N	\N
709	1	15	37	\N	\N	\N	\N
710	1	15	38	\N	\N	\N	\N
711	1	15	39	\N	\N	\N	\N
712	1	15	40	\N	\N	\N	\N
713	1	15	41	\N	\N	\N	\N
714	1	15	42	\N	\N	\N	\N
715	1	15	43	\N	\N	\N	\N
716	1	15	44	\N	\N	\N	\N
717	1	15	45	\N	\N	\N	\N
718	1	15	46	\N	\N	\N	\N
719	1	15	47	\N	\N	\N	\N
720	1	15	48	\N	\N	\N	\N
721	2	1	1	\N	\N	\N	\N
722	2	1	2	\N	\N	\N	\N
723	2	1	3	\N	\N	\N	\N
724	2	1	4	\N	\N	\N	\N
725	2	1	5	\N	\N	\N	\N
726	2	1	6	\N	\N	\N	\N
727	2	1	7	\N	\N	\N	\N
728	2	1	8	\N	\N	\N	\N
729	2	1	9	\N	\N	\N	\N
730	2	1	10	\N	\N	\N	\N
731	2	1	11	\N	\N	\N	\N
732	2	1	12	\N	\N	\N	\N
733	2	1	13	\N	\N	\N	\N
734	2	1	14	\N	\N	\N	\N
735	2	1	15	\N	\N	\N	\N
736	2	1	16	\N	\N	\N	\N
737	2	1	17	\N	\N	\N	\N
738	2	1	18	\N	\N	\N	\N
739	2	1	19	\N	\N	\N	\N
740	2	1	20	\N	\N	\N	\N
741	2	1	21	\N	\N	\N	\N
742	2	1	22	\N	\N	\N	\N
743	2	1	23	\N	\N	\N	\N
744	2	1	24	\N	\N	\N	\N
745	2	1	25	\N	\N	\N	\N
746	2	1	26	\N	\N	\N	\N
747	2	1	27	\N	\N	\N	\N
748	2	1	28	\N	\N	\N	\N
749	2	1	29	\N	\N	\N	\N
750	2	1	30	\N	\N	\N	\N
751	2	1	31	\N	\N	\N	\N
752	2	1	32	\N	\N	\N	\N
753	2	1	33	\N	\N	\N	\N
754	2	1	34	\N	\N	\N	\N
755	2	1	35	\N	\N	\N	\N
756	2	1	36	\N	\N	\N	\N
757	2	1	37	\N	\N	\N	\N
758	2	1	38	\N	\N	\N	\N
759	2	1	39	\N	\N	\N	\N
760	2	1	40	\N	\N	\N	\N
761	2	1	41	\N	\N	\N	\N
762	2	1	42	\N	\N	\N	\N
763	2	1	43	\N	\N	\N	\N
764	2	1	44	\N	\N	\N	\N
765	2	1	45	\N	\N	\N	\N
766	2	1	46	\N	\N	\N	\N
767	2	1	47	\N	\N	\N	\N
768	2	1	48	\N	\N	\N	\N
769	2	2	1	\N	\N	\N	\N
770	2	2	2	\N	\N	\N	\N
771	2	2	3	\N	\N	\N	\N
772	2	2	4	\N	\N	\N	\N
773	2	2	5	\N	\N	\N	\N
774	2	2	6	\N	\N	\N	\N
775	2	2	7	\N	\N	\N	\N
776	2	2	8	\N	\N	\N	\N
777	2	2	9	\N	\N	\N	\N
778	2	2	10	\N	\N	\N	\N
779	2	2	11	\N	\N	\N	\N
780	2	2	12	\N	\N	\N	\N
781	2	2	13	\N	\N	\N	\N
782	2	2	14	\N	\N	\N	\N
783	2	2	15	\N	\N	\N	\N
784	2	2	16	\N	\N	\N	\N
785	2	2	17	\N	\N	\N	\N
786	2	2	18	\N	\N	\N	\N
787	2	2	19	\N	\N	\N	\N
788	2	2	20	\N	\N	\N	\N
789	2	2	21	\N	\N	\N	\N
790	2	2	22	\N	\N	\N	\N
791	2	2	23	\N	\N	\N	\N
792	2	2	24	\N	\N	\N	\N
793	2	2	25	\N	\N	\N	\N
794	2	2	26	\N	\N	\N	\N
795	2	2	27	\N	\N	\N	\N
796	2	2	28	\N	\N	\N	\N
797	2	2	29	\N	\N	\N	\N
798	2	2	30	\N	\N	\N	\N
799	2	2	31	\N	\N	\N	\N
800	2	2	32	\N	\N	\N	\N
801	2	2	33	\N	\N	\N	\N
802	2	2	34	\N	\N	\N	\N
803	2	2	35	\N	\N	\N	\N
804	2	2	36	\N	\N	\N	\N
805	2	2	37	\N	\N	\N	\N
806	2	2	38	\N	\N	\N	\N
807	2	2	39	\N	\N	\N	\N
808	2	2	40	\N	\N	\N	\N
809	2	2	41	\N	\N	\N	\N
810	2	2	42	\N	\N	\N	\N
811	2	2	43	\N	\N	\N	\N
812	2	2	44	\N	\N	\N	\N
813	2	2	45	\N	\N	\N	\N
814	2	2	46	\N	\N	\N	\N
815	2	2	47	\N	\N	\N	\N
816	2	2	48	\N	\N	\N	\N
817	2	3	1	\N	\N	\N	\N
818	2	3	2	\N	\N	\N	\N
819	2	3	3	\N	\N	\N	\N
820	2	3	4	\N	\N	\N	\N
821	2	3	5	\N	\N	\N	\N
822	2	3	6	\N	\N	\N	\N
823	2	3	7	\N	\N	\N	\N
824	2	3	8	\N	\N	\N	\N
825	2	3	9	\N	\N	\N	\N
826	2	3	10	\N	\N	\N	\N
827	2	3	11	\N	\N	\N	\N
828	2	3	12	\N	\N	\N	\N
829	2	3	13	\N	\N	\N	\N
830	2	3	14	\N	\N	\N	\N
831	2	3	15	\N	\N	\N	\N
832	2	3	16	\N	\N	\N	\N
833	2	3	17	\N	\N	\N	\N
834	2	3	18	\N	\N	\N	\N
835	2	3	19	\N	\N	\N	\N
836	2	3	20	\N	\N	\N	\N
837	2	3	21	\N	\N	\N	\N
838	2	3	22	\N	\N	\N	\N
839	2	3	23	\N	\N	\N	\N
840	2	3	24	\N	\N	\N	\N
841	2	3	25	\N	\N	\N	\N
842	2	3	26	\N	\N	\N	\N
843	2	3	27	\N	\N	\N	\N
844	2	3	28	\N	\N	\N	\N
845	2	3	29	\N	\N	\N	\N
846	2	3	30	\N	\N	\N	\N
847	2	3	31	\N	\N	\N	\N
848	2	3	32	\N	\N	\N	\N
849	2	3	33	\N	\N	\N	\N
850	2	3	34	\N	\N	\N	\N
851	2	3	35	\N	\N	\N	\N
852	2	3	36	\N	\N	\N	\N
853	2	3	37	\N	\N	\N	\N
854	2	3	38	\N	\N	\N	\N
855	2	3	39	\N	\N	\N	\N
856	2	3	40	\N	\N	\N	\N
857	2	3	41	\N	\N	\N	\N
858	2	3	42	\N	\N	\N	\N
859	2	3	43	\N	\N	\N	\N
860	2	3	44	\N	\N	\N	\N
861	2	3	45	\N	\N	\N	\N
862	2	3	46	\N	\N	\N	\N
863	2	3	47	\N	\N	\N	\N
864	2	3	48	\N	\N	\N	\N
865	2	4	1	\N	\N	\N	\N
866	2	4	2	\N	\N	\N	\N
867	2	4	3	\N	\N	\N	\N
868	2	4	4	\N	\N	\N	\N
869	2	4	5	\N	\N	\N	\N
870	2	4	6	\N	\N	\N	\N
871	2	4	7	\N	\N	\N	\N
872	2	4	8	\N	\N	\N	\N
873	2	4	9	\N	\N	\N	\N
874	2	4	10	\N	\N	\N	\N
875	2	4	11	\N	\N	\N	\N
876	2	4	12	\N	\N	\N	\N
877	2	4	13	\N	\N	\N	\N
878	2	4	14	\N	\N	\N	\N
879	2	4	15	\N	\N	\N	\N
880	2	4	16	\N	\N	\N	\N
881	2	4	17	\N	\N	\N	\N
882	2	4	18	\N	\N	\N	\N
883	2	4	19	\N	\N	\N	\N
884	2	4	20	\N	\N	\N	\N
885	2	4	21	\N	\N	\N	\N
886	2	4	22	\N	\N	\N	\N
887	2	4	23	\N	\N	\N	\N
888	2	4	24	\N	\N	\N	\N
889	2	4	25	\N	\N	\N	\N
890	2	4	26	\N	\N	\N	\N
891	2	4	27	\N	\N	\N	\N
892	2	4	28	\N	\N	\N	\N
893	2	4	29	\N	\N	\N	\N
894	2	4	30	\N	\N	\N	\N
895	2	4	31	\N	\N	\N	\N
896	2	4	32	\N	\N	\N	\N
897	2	4	33	\N	\N	\N	\N
898	2	4	34	\N	\N	\N	\N
899	2	4	35	\N	\N	\N	\N
900	2	4	36	\N	\N	\N	\N
901	2	4	37	\N	\N	\N	\N
902	2	4	38	\N	\N	\N	\N
903	2	4	39	\N	\N	\N	\N
904	2	4	40	\N	\N	\N	\N
905	2	4	41	\N	\N	\N	\N
906	2	4	42	\N	\N	\N	\N
907	2	4	43	\N	\N	\N	\N
908	2	4	44	\N	\N	\N	\N
909	2	4	45	\N	\N	\N	\N
910	2	4	46	\N	\N	\N	\N
911	2	4	47	\N	\N	\N	\N
912	2	4	48	\N	\N	\N	\N
913	2	5	1	\N	\N	\N	\N
914	2	5	2	\N	\N	\N	\N
915	2	5	3	\N	\N	\N	\N
916	2	5	4	\N	\N	\N	\N
917	2	5	5	\N	\N	\N	\N
918	2	5	6	\N	\N	\N	\N
919	2	5	7	\N	\N	\N	\N
920	2	5	8	\N	\N	\N	\N
921	2	5	9	\N	\N	\N	\N
922	2	5	10	\N	\N	\N	\N
923	2	5	11	\N	\N	\N	\N
924	2	5	12	\N	\N	\N	\N
925	2	5	13	\N	\N	\N	\N
926	2	5	14	\N	\N	\N	\N
927	2	5	15	\N	\N	\N	\N
928	2	5	16	\N	\N	\N	\N
929	2	5	17	\N	\N	\N	\N
930	2	5	18	\N	\N	\N	\N
931	2	5	19	\N	\N	\N	\N
932	2	5	20	\N	\N	\N	\N
933	2	5	21	\N	\N	\N	\N
934	2	5	22	\N	\N	\N	\N
935	2	5	23	\N	\N	\N	\N
936	2	5	24	\N	\N	\N	\N
937	2	5	25	\N	\N	\N	\N
938	2	5	26	\N	\N	\N	\N
939	2	5	27	\N	\N	\N	\N
940	2	5	28	\N	\N	\N	\N
941	2	5	29	\N	\N	\N	\N
942	2	5	30	\N	\N	\N	\N
943	2	5	31	\N	\N	\N	\N
944	2	5	32	\N	\N	\N	\N
945	2	5	33	\N	\N	\N	\N
946	2	5	34	\N	\N	\N	\N
947	2	5	35	\N	\N	\N	\N
948	2	5	36	\N	\N	\N	\N
949	2	5	37	\N	\N	\N	\N
950	2	5	38	\N	\N	\N	\N
951	2	5	39	\N	\N	\N	\N
952	2	5	40	\N	\N	\N	\N
953	2	5	41	\N	\N	\N	\N
954	2	5	42	\N	\N	\N	\N
955	2	5	43	\N	\N	\N	\N
956	2	5	44	\N	\N	\N	\N
957	2	5	45	\N	\N	\N	\N
958	2	5	46	\N	\N	\N	\N
959	2	5	47	\N	\N	\N	\N
960	2	5	48	\N	\N	\N	\N
961	2	6	1	\N	\N	\N	\N
962	2	6	2	\N	\N	\N	\N
963	2	6	3	\N	\N	\N	\N
964	2	6	4	\N	\N	\N	\N
965	2	6	5	\N	\N	\N	\N
966	2	6	6	\N	\N	\N	\N
967	2	6	7	\N	\N	\N	\N
968	2	6	8	\N	\N	\N	\N
969	2	6	9	\N	\N	\N	\N
970	2	6	10	\N	\N	\N	\N
971	2	6	11	\N	\N	\N	\N
972	2	6	12	\N	\N	\N	\N
973	2	6	13	\N	\N	\N	\N
974	2	6	14	\N	\N	\N	\N
975	2	6	15	\N	\N	\N	\N
976	2	6	16	\N	\N	\N	\N
977	2	6	17	\N	\N	\N	\N
978	2	6	18	\N	\N	\N	\N
979	2	6	19	\N	\N	\N	\N
980	2	6	20	\N	\N	\N	\N
981	2	6	21	\N	\N	\N	\N
982	2	6	22	\N	\N	\N	\N
983	2	6	23	\N	\N	\N	\N
984	2	6	24	\N	\N	\N	\N
985	2	6	25	\N	\N	\N	\N
986	2	6	26	\N	\N	\N	\N
987	2	6	27	\N	\N	\N	\N
988	2	6	28	\N	\N	\N	\N
989	2	6	29	\N	\N	\N	\N
990	2	6	30	\N	\N	\N	\N
991	2	6	31	\N	\N	\N	\N
992	2	6	32	\N	\N	\N	\N
993	2	6	33	\N	\N	\N	\N
994	2	6	34	\N	\N	\N	\N
995	2	6	35	\N	\N	\N	\N
996	2	6	36	\N	\N	\N	\N
997	2	6	37	\N	\N	\N	\N
998	2	6	38	\N	\N	\N	\N
999	2	6	39	\N	\N	\N	\N
1000	2	6	40	\N	\N	\N	\N
1001	2	6	41	\N	\N	\N	\N
1002	2	6	42	\N	\N	\N	\N
1003	2	6	43	\N	\N	\N	\N
1004	2	6	44	\N	\N	\N	\N
1005	2	6	45	\N	\N	\N	\N
1006	2	6	46	\N	\N	\N	\N
1007	2	6	47	\N	\N	\N	\N
1008	2	6	48	\N	\N	\N	\N
1009	2	7	1	\N	\N	\N	\N
1010	2	7	2	\N	\N	\N	\N
1011	2	7	3	\N	\N	\N	\N
1012	2	7	4	\N	\N	\N	\N
1013	2	7	5	\N	\N	\N	\N
1014	2	7	6	\N	\N	\N	\N
1015	2	7	7	\N	\N	\N	\N
1016	2	7	8	\N	\N	\N	\N
1017	2	7	9	\N	\N	\N	\N
1018	2	7	10	\N	\N	\N	\N
1019	2	7	11	\N	\N	\N	\N
1020	2	7	12	\N	\N	\N	\N
1021	2	7	13	\N	\N	\N	\N
1022	2	7	14	\N	\N	\N	\N
1023	2	7	15	\N	\N	\N	\N
1024	2	7	16	\N	\N	\N	\N
1025	2	7	17	\N	\N	\N	\N
1026	2	7	18	\N	\N	\N	\N
1027	2	7	19	\N	\N	\N	\N
1028	2	7	20	\N	\N	\N	\N
1029	2	7	21	\N	\N	\N	\N
1030	2	7	22	\N	\N	\N	\N
1031	2	7	23	\N	\N	\N	\N
1032	2	7	24	\N	\N	\N	\N
1033	2	7	25	\N	\N	\N	\N
1034	2	7	26	\N	\N	\N	\N
1035	2	7	27	\N	\N	\N	\N
1036	2	7	28	\N	\N	\N	\N
1037	2	7	29	\N	\N	\N	\N
1038	2	7	30	\N	\N	\N	\N
1039	2	7	31	\N	\N	\N	\N
1040	2	7	32	\N	\N	\N	\N
1041	2	7	33	\N	\N	\N	\N
1042	2	7	34	\N	\N	\N	\N
1043	2	7	35	\N	\N	\N	\N
1044	2	7	36	\N	\N	\N	\N
1045	2	7	37	\N	\N	\N	\N
1046	2	7	38	\N	\N	\N	\N
1047	2	7	39	\N	\N	\N	\N
1048	2	7	40	\N	\N	\N	\N
1049	2	7	41	\N	\N	\N	\N
1050	2	7	42	\N	\N	\N	\N
1051	2	7	43	\N	\N	\N	\N
1052	2	7	44	\N	\N	\N	\N
1053	2	7	45	\N	\N	\N	\N
1054	2	7	46	\N	\N	\N	\N
1055	2	7	47	\N	\N	\N	\N
1056	2	7	48	\N	\N	\N	\N
1057	2	8	1	\N	\N	\N	\N
1058	2	8	2	\N	\N	\N	\N
1059	2	8	3	\N	\N	\N	\N
1060	2	8	4	\N	\N	\N	\N
1061	2	8	5	\N	\N	\N	\N
1062	2	8	6	\N	\N	\N	\N
1063	2	8	7	\N	\N	\N	\N
1064	2	8	8	\N	\N	\N	\N
1065	2	8	9	\N	\N	\N	\N
1066	2	8	10	\N	\N	\N	\N
1067	2	8	11	\N	\N	\N	\N
1068	2	8	12	\N	\N	\N	\N
1069	2	8	13	\N	\N	\N	\N
1070	2	8	14	\N	\N	\N	\N
1071	2	8	15	\N	\N	\N	\N
1072	2	8	16	\N	\N	\N	\N
1073	2	8	17	\N	\N	\N	\N
1074	2	8	18	\N	\N	\N	\N
1075	2	8	19	\N	\N	\N	\N
1076	2	8	20	\N	\N	\N	\N
1077	2	8	21	\N	\N	\N	\N
1078	2	8	22	\N	\N	\N	\N
1079	2	8	23	\N	\N	\N	\N
1080	2	8	24	\N	\N	\N	\N
1081	2	8	25	\N	\N	\N	\N
1082	2	8	26	\N	\N	\N	\N
1083	2	8	27	\N	\N	\N	\N
1084	2	8	28	\N	\N	\N	\N
1085	2	8	29	\N	\N	\N	\N
1086	2	8	30	\N	\N	\N	\N
1087	2	8	31	\N	\N	\N	\N
1088	2	8	32	\N	\N	\N	\N
1089	2	8	33	\N	\N	\N	\N
1090	2	8	34	\N	\N	\N	\N
1091	2	8	35	\N	\N	\N	\N
1092	2	8	36	\N	\N	\N	\N
1093	2	8	37	\N	\N	\N	\N
1094	2	8	38	\N	\N	\N	\N
1095	2	8	39	\N	\N	\N	\N
1096	2	8	40	\N	\N	\N	\N
1097	2	8	41	\N	\N	\N	\N
1098	2	8	42	\N	\N	\N	\N
1099	2	8	43	\N	\N	\N	\N
1100	2	8	44	\N	\N	\N	\N
1101	2	8	45	\N	\N	\N	\N
1102	2	8	46	\N	\N	\N	\N
1103	2	8	47	\N	\N	\N	\N
1104	2	8	48	\N	\N	\N	\N
1105	2	9	1	\N	\N	\N	\N
1106	2	9	2	\N	\N	\N	\N
1107	2	9	3	\N	\N	\N	\N
1108	2	9	4	\N	\N	\N	\N
1109	2	9	5	\N	\N	\N	\N
1110	2	9	6	\N	\N	\N	\N
1111	2	9	7	\N	\N	\N	\N
1112	2	9	8	\N	\N	\N	\N
1113	2	9	9	\N	\N	\N	\N
1114	2	9	10	\N	\N	\N	\N
1115	2	9	11	\N	\N	\N	\N
1116	2	9	12	\N	\N	\N	\N
1117	2	9	13	\N	\N	\N	\N
1118	2	9	14	\N	\N	\N	\N
1119	2	9	15	\N	\N	\N	\N
1120	2	9	16	\N	\N	\N	\N
1121	2	9	17	\N	\N	\N	\N
1122	2	9	18	\N	\N	\N	\N
1123	2	9	19	\N	\N	\N	\N
1124	2	9	20	\N	\N	\N	\N
1125	2	9	21	\N	\N	\N	\N
1126	2	9	22	\N	\N	\N	\N
1127	2	9	23	\N	\N	\N	\N
1128	2	9	24	\N	\N	\N	\N
1129	2	9	25	\N	\N	\N	\N
1130	2	9	26	\N	\N	\N	\N
1131	2	9	27	\N	\N	\N	\N
1132	2	9	28	\N	\N	\N	\N
1133	2	9	29	\N	\N	\N	\N
1134	2	9	30	\N	\N	\N	\N
1135	2	9	31	\N	\N	\N	\N
1136	2	9	32	\N	\N	\N	\N
1137	2	9	33	\N	\N	\N	\N
1138	2	9	34	\N	\N	\N	\N
1139	2	9	35	\N	\N	\N	\N
1140	2	9	36	\N	\N	\N	\N
1141	2	9	37	\N	\N	\N	\N
1142	2	9	38	\N	\N	\N	\N
1143	2	9	39	\N	\N	\N	\N
1144	2	9	40	\N	\N	\N	\N
1145	2	9	41	\N	\N	\N	\N
1146	2	9	42	\N	\N	\N	\N
1147	2	9	43	\N	\N	\N	\N
1148	2	9	44	\N	\N	\N	\N
1149	2	9	45	\N	\N	\N	\N
1150	2	9	46	\N	\N	\N	\N
1151	2	9	47	\N	\N	\N	\N
1152	2	9	48	\N	\N	\N	\N
1153	2	10	1	\N	\N	\N	\N
1154	2	10	2	\N	\N	\N	\N
1155	2	10	3	\N	\N	\N	\N
1156	2	10	4	\N	\N	\N	\N
1157	2	10	5	\N	\N	\N	\N
1158	2	10	6	\N	\N	\N	\N
1159	2	10	7	\N	\N	\N	\N
1160	2	10	8	\N	\N	\N	\N
1161	2	10	9	\N	\N	\N	\N
1162	2	10	10	\N	\N	\N	\N
1163	2	10	11	\N	\N	\N	\N
1164	2	10	12	\N	\N	\N	\N
1165	2	10	13	\N	\N	\N	\N
1166	2	10	14	\N	\N	\N	\N
1167	2	10	15	\N	\N	\N	\N
1168	2	10	16	\N	\N	\N	\N
1169	2	10	17	\N	\N	\N	\N
1170	2	10	18	\N	\N	\N	\N
1171	2	10	19	\N	\N	\N	\N
1172	2	10	20	\N	\N	\N	\N
1173	2	10	21	\N	\N	\N	\N
1174	2	10	22	\N	\N	\N	\N
1175	2	10	23	\N	\N	\N	\N
1176	2	10	24	\N	\N	\N	\N
1177	2	10	25	\N	\N	\N	\N
1178	2	10	26	\N	\N	\N	\N
1179	2	10	27	\N	\N	\N	\N
1180	2	10	28	\N	\N	\N	\N
1181	2	10	29	\N	\N	\N	\N
1182	2	10	30	\N	\N	\N	\N
1183	2	10	31	\N	\N	\N	\N
1184	2	10	32	\N	\N	\N	\N
1185	2	10	33	\N	\N	\N	\N
1186	2	10	34	\N	\N	\N	\N
1187	2	10	35	\N	\N	\N	\N
1188	2	10	36	\N	\N	\N	\N
1189	2	10	37	\N	\N	\N	\N
1190	2	10	38	\N	\N	\N	\N
1191	2	10	39	\N	\N	\N	\N
1192	2	10	40	\N	\N	\N	\N
1193	2	10	41	\N	\N	\N	\N
1194	2	10	42	\N	\N	\N	\N
1195	2	10	43	\N	\N	\N	\N
1196	2	10	44	\N	\N	\N	\N
1197	2	10	45	\N	\N	\N	\N
1198	2	10	46	\N	\N	\N	\N
1199	2	10	47	\N	\N	\N	\N
1200	2	10	48	\N	\N	\N	\N
1201	2	11	1	\N	\N	\N	\N
1202	2	11	2	\N	\N	\N	\N
1203	2	11	3	\N	\N	\N	\N
1204	2	11	4	\N	\N	\N	\N
1205	2	11	5	\N	\N	\N	\N
1206	2	11	6	\N	\N	\N	\N
1207	2	11	7	\N	\N	\N	\N
1208	2	11	8	\N	\N	\N	\N
1209	2	11	9	\N	\N	\N	\N
1210	2	11	10	\N	\N	\N	\N
1211	2	11	11	\N	\N	\N	\N
1212	2	11	12	\N	\N	\N	\N
1213	2	11	13	\N	\N	\N	\N
1214	2	11	14	\N	\N	\N	\N
1215	2	11	15	\N	\N	\N	\N
1216	2	11	16	\N	\N	\N	\N
1217	2	11	17	\N	\N	\N	\N
1218	2	11	18	\N	\N	\N	\N
1219	2	11	19	\N	\N	\N	\N
1220	2	11	20	\N	\N	\N	\N
1221	2	11	21	\N	\N	\N	\N
1222	2	11	22	\N	\N	\N	\N
1223	2	11	23	\N	\N	\N	\N
1224	2	11	24	\N	\N	\N	\N
1225	2	11	25	\N	\N	\N	\N
1226	2	11	26	\N	\N	\N	\N
1227	2	11	27	\N	\N	\N	\N
1228	2	11	28	\N	\N	\N	\N
1229	2	11	29	\N	\N	\N	\N
1230	2	11	30	\N	\N	\N	\N
1231	2	11	31	\N	\N	\N	\N
1232	2	11	32	\N	\N	\N	\N
1233	2	11	33	\N	\N	\N	\N
1234	2	11	34	\N	\N	\N	\N
1235	2	11	35	\N	\N	\N	\N
1236	2	11	36	\N	\N	\N	\N
1237	2	11	37	\N	\N	\N	\N
1238	2	11	38	\N	\N	\N	\N
1239	2	11	39	\N	\N	\N	\N
1240	2	11	40	\N	\N	\N	\N
1241	2	11	41	\N	\N	\N	\N
1242	2	11	42	\N	\N	\N	\N
1243	2	11	43	\N	\N	\N	\N
1244	2	11	44	\N	\N	\N	\N
1245	2	11	45	\N	\N	\N	\N
1246	2	11	46	\N	\N	\N	\N
1247	2	11	47	\N	\N	\N	\N
1248	2	11	48	\N	\N	\N	\N
1249	2	12	1	\N	\N	\N	\N
1250	2	12	2	\N	\N	\N	\N
1251	2	12	3	\N	\N	\N	\N
1252	2	12	4	\N	\N	\N	\N
1253	2	12	5	\N	\N	\N	\N
1254	2	12	6	\N	\N	\N	\N
1255	2	12	7	\N	\N	\N	\N
1256	2	12	8	\N	\N	\N	\N
1257	2	12	9	\N	\N	\N	\N
1258	2	12	10	\N	\N	\N	\N
1259	2	12	11	\N	\N	\N	\N
1260	2	12	12	\N	\N	\N	\N
1261	2	12	13	\N	\N	\N	\N
1262	2	12	14	\N	\N	\N	\N
1263	2	12	15	\N	\N	\N	\N
1264	2	12	16	\N	\N	\N	\N
1265	2	12	17	\N	\N	\N	\N
1266	2	12	18	\N	\N	\N	\N
1267	2	12	19	\N	\N	\N	\N
1268	2	12	20	\N	\N	\N	\N
1269	2	12	21	\N	\N	\N	\N
1270	2	12	22	\N	\N	\N	\N
1271	2	12	23	\N	\N	\N	\N
1272	2	12	24	\N	\N	\N	\N
1273	2	12	25	\N	\N	\N	\N
1274	2	12	26	\N	\N	\N	\N
1275	2	12	27	\N	\N	\N	\N
1276	2	12	28	\N	\N	\N	\N
1277	2	12	29	\N	\N	\N	\N
1278	2	12	30	\N	\N	\N	\N
1279	2	12	31	\N	\N	\N	\N
1280	2	12	32	\N	\N	\N	\N
1281	2	12	33	\N	\N	\N	\N
1282	2	12	34	\N	\N	\N	\N
1283	2	12	35	\N	\N	\N	\N
1284	2	12	36	\N	\N	\N	\N
1285	2	12	37	\N	\N	\N	\N
1286	2	12	38	\N	\N	\N	\N
1287	2	12	39	\N	\N	\N	\N
1288	2	12	40	\N	\N	\N	\N
1289	2	12	41	\N	\N	\N	\N
1290	2	12	42	\N	\N	\N	\N
1291	2	12	43	\N	\N	\N	\N
1292	2	12	44	\N	\N	\N	\N
1293	2	12	45	\N	\N	\N	\N
1294	2	12	46	\N	\N	\N	\N
1295	2	12	47	\N	\N	\N	\N
1296	2	12	48	\N	\N	\N	\N
1297	2	13	1	\N	\N	\N	\N
1298	2	13	2	\N	\N	\N	\N
1299	2	13	3	\N	\N	\N	\N
1300	2	13	4	\N	\N	\N	\N
1301	2	13	5	\N	\N	\N	\N
1302	2	13	6	\N	\N	\N	\N
1303	2	13	7	\N	\N	\N	\N
1304	2	13	8	\N	\N	\N	\N
1305	2	13	9	\N	\N	\N	\N
1306	2	13	10	\N	\N	\N	\N
1307	2	13	11	\N	\N	\N	\N
1308	2	13	12	\N	\N	\N	\N
1309	2	13	13	\N	\N	\N	\N
1310	2	13	14	\N	\N	\N	\N
1311	2	13	15	\N	\N	\N	\N
1312	2	13	16	\N	\N	\N	\N
1313	2	13	17	\N	\N	\N	\N
1314	2	13	18	\N	\N	\N	\N
1315	2	13	19	\N	\N	\N	\N
1316	2	13	20	\N	\N	\N	\N
1317	2	13	21	\N	\N	\N	\N
1318	2	13	22	\N	\N	\N	\N
1319	2	13	23	\N	\N	\N	\N
1320	2	13	24	\N	\N	\N	\N
1321	2	13	25	\N	\N	\N	\N
1322	2	13	26	\N	\N	\N	\N
1323	2	13	27	\N	\N	\N	\N
1324	2	13	28	\N	\N	\N	\N
1325	2	13	29	\N	\N	\N	\N
1326	2	13	30	\N	\N	\N	\N
1327	2	13	31	\N	\N	\N	\N
1328	2	13	32	\N	\N	\N	\N
1329	2	13	33	\N	\N	\N	\N
1330	2	13	34	\N	\N	\N	\N
1331	2	13	35	\N	\N	\N	\N
1332	2	13	36	\N	\N	\N	\N
1333	2	13	37	\N	\N	\N	\N
1334	2	13	38	\N	\N	\N	\N
1335	2	13	39	\N	\N	\N	\N
1336	2	13	40	\N	\N	\N	\N
1337	2	13	41	\N	\N	\N	\N
1338	2	13	42	\N	\N	\N	\N
1339	2	13	43	\N	\N	\N	\N
1340	2	13	44	\N	\N	\N	\N
1341	2	13	45	\N	\N	\N	\N
1342	2	13	46	\N	\N	\N	\N
1343	2	13	47	\N	\N	\N	\N
1344	2	13	48	\N	\N	\N	\N
1345	2	14	1	\N	\N	\N	\N
1346	2	14	2	\N	\N	\N	\N
1347	2	14	3	\N	\N	\N	\N
1348	2	14	4	\N	\N	\N	\N
1349	2	14	5	\N	\N	\N	\N
1350	2	14	6	\N	\N	\N	\N
1351	2	14	7	\N	\N	\N	\N
1352	2	14	8	\N	\N	\N	\N
1353	2	14	9	\N	\N	\N	\N
1354	2	14	10	\N	\N	\N	\N
1355	2	14	11	\N	\N	\N	\N
1356	2	14	12	\N	\N	\N	\N
1357	2	14	13	\N	\N	\N	\N
1358	2	14	14	\N	\N	\N	\N
1359	2	14	15	\N	\N	\N	\N
1360	2	14	16	\N	\N	\N	\N
1361	2	14	17	\N	\N	\N	\N
1362	2	14	18	\N	\N	\N	\N
1363	2	14	19	\N	\N	\N	\N
1364	2	14	20	\N	\N	\N	\N
1365	2	14	21	\N	\N	\N	\N
1366	2	14	22	\N	\N	\N	\N
1367	2	14	23	\N	\N	\N	\N
1368	2	14	24	\N	\N	\N	\N
1369	2	14	25	\N	\N	\N	\N
1370	2	14	26	\N	\N	\N	\N
1371	2	14	27	\N	\N	\N	\N
1372	2	14	28	\N	\N	\N	\N
1373	2	14	29	\N	\N	\N	\N
1374	2	14	30	\N	\N	\N	\N
1375	2	14	31	\N	\N	\N	\N
1376	2	14	32	\N	\N	\N	\N
1377	2	14	33	\N	\N	\N	\N
1378	2	14	34	\N	\N	\N	\N
1379	2	14	35	\N	\N	\N	\N
1380	2	14	36	\N	\N	\N	\N
1381	2	14	37	\N	\N	\N	\N
1382	2	14	38	\N	\N	\N	\N
1383	2	14	39	\N	\N	\N	\N
1384	2	14	40	\N	\N	\N	\N
1385	2	14	41	\N	\N	\N	\N
1386	2	14	42	\N	\N	\N	\N
1387	2	14	43	\N	\N	\N	\N
1388	2	14	44	\N	\N	\N	\N
1389	2	14	45	\N	\N	\N	\N
1390	2	14	46	\N	\N	\N	\N
1391	2	14	47	\N	\N	\N	\N
1392	2	14	48	\N	\N	\N	\N
1393	2	15	1	\N	\N	\N	\N
1394	2	15	2	\N	\N	\N	\N
1395	2	15	3	\N	\N	\N	\N
1396	2	15	4	\N	\N	\N	\N
1397	2	15	5	\N	\N	\N	\N
1398	2	15	6	\N	\N	\N	\N
1399	2	15	7	\N	\N	\N	\N
1400	2	15	8	\N	\N	\N	\N
1401	2	15	9	\N	\N	\N	\N
1402	2	15	10	\N	\N	\N	\N
1403	2	15	11	\N	\N	\N	\N
1404	2	15	12	\N	\N	\N	\N
1405	2	15	13	\N	\N	\N	\N
1406	2	15	14	\N	\N	\N	\N
1407	2	15	15	\N	\N	\N	\N
1408	2	15	16	\N	\N	\N	\N
1409	2	15	17	\N	\N	\N	\N
1410	2	15	18	\N	\N	\N	\N
1411	2	15	19	\N	\N	\N	\N
1412	2	15	20	\N	\N	\N	\N
1413	2	15	21	\N	\N	\N	\N
1414	2	15	22	\N	\N	\N	\N
1415	2	15	23	\N	\N	\N	\N
1416	2	15	24	\N	\N	\N	\N
1417	2	15	25	\N	\N	\N	\N
1418	2	15	26	\N	\N	\N	\N
1419	2	15	27	\N	\N	\N	\N
1420	2	15	28	\N	\N	\N	\N
1421	2	15	29	\N	\N	\N	\N
1422	2	15	30	\N	\N	\N	\N
1423	2	15	31	\N	\N	\N	\N
1424	2	15	32	\N	\N	\N	\N
1425	2	15	33	\N	\N	\N	\N
1426	2	15	34	\N	\N	\N	\N
1427	2	15	35	\N	\N	\N	\N
1428	2	15	36	\N	\N	\N	\N
1429	2	15	37	\N	\N	\N	\N
1430	2	15	38	\N	\N	\N	\N
1431	2	15	39	\N	\N	\N	\N
1432	2	15	40	\N	\N	\N	\N
1433	2	15	41	\N	\N	\N	\N
1434	2	15	42	\N	\N	\N	\N
1435	2	15	43	\N	\N	\N	\N
1436	2	15	44	\N	\N	\N	\N
1437	2	15	45	\N	\N	\N	\N
1438	2	15	46	\N	\N	\N	\N
1439	2	15	47	\N	\N	\N	\N
1440	2	15	48	\N	\N	\N	\N
1441	3	1	1	\N	\N	\N	\N
1442	3	1	2	\N	\N	\N	\N
1443	3	1	3	\N	\N	\N	\N
1444	3	1	4	\N	\N	\N	\N
1445	3	1	5	\N	\N	\N	\N
1446	3	1	6	\N	\N	\N	\N
1447	3	1	7	\N	\N	\N	\N
1448	3	1	8	\N	\N	\N	\N
1449	3	1	9	\N	\N	\N	\N
1450	3	1	10	\N	\N	\N	\N
1451	3	1	11	\N	\N	\N	\N
1452	3	1	12	\N	\N	\N	\N
1453	3	1	13	\N	\N	\N	\N
1454	3	1	14	\N	\N	\N	\N
1455	3	1	15	\N	\N	\N	\N
1456	3	1	16	\N	\N	\N	\N
1457	3	1	17	\N	\N	\N	\N
1458	3	1	18	\N	\N	\N	\N
1459	3	1	19	\N	\N	\N	\N
1460	3	1	20	\N	\N	\N	\N
1461	3	1	21	\N	\N	\N	\N
1462	3	1	22	\N	\N	\N	\N
1463	3	1	23	\N	\N	\N	\N
1464	3	1	24	\N	\N	\N	\N
1465	3	1	25	\N	\N	\N	\N
1466	3	1	26	\N	\N	\N	\N
1467	3	1	27	\N	\N	\N	\N
1468	3	1	28	\N	\N	\N	\N
1469	3	1	29	\N	\N	\N	\N
1470	3	1	30	\N	\N	\N	\N
1471	3	1	31	\N	\N	\N	\N
1472	3	1	32	\N	\N	\N	\N
1473	3	1	33	\N	\N	\N	\N
1474	3	1	34	\N	\N	\N	\N
1475	3	1	35	\N	\N	\N	\N
1476	3	1	36	\N	\N	\N	\N
1477	3	1	37	\N	\N	\N	\N
1478	3	1	38	\N	\N	\N	\N
1479	3	1	39	\N	\N	\N	\N
1480	3	1	40	\N	\N	\N	\N
1481	3	1	41	\N	\N	\N	\N
1482	3	1	42	\N	\N	\N	\N
1483	3	1	43	\N	\N	\N	\N
1484	3	1	44	\N	\N	\N	\N
1485	3	1	45	\N	\N	\N	\N
1486	3	1	46	\N	\N	\N	\N
1487	3	1	47	\N	\N	\N	\N
1488	3	1	48	\N	\N	\N	\N
1489	3	2	1	\N	\N	\N	\N
1490	3	2	2	\N	\N	\N	\N
1491	3	2	3	\N	\N	\N	\N
1492	3	2	4	\N	\N	\N	\N
1493	3	2	5	\N	\N	\N	\N
1494	3	2	6	\N	\N	\N	\N
1495	3	2	7	\N	\N	\N	\N
1496	3	2	8	\N	\N	\N	\N
1497	3	2	9	\N	\N	\N	\N
1498	3	2	10	\N	\N	\N	\N
1499	3	2	11	\N	\N	\N	\N
1500	3	2	12	\N	\N	\N	\N
1501	3	2	13	\N	\N	\N	\N
1502	3	2	14	\N	\N	\N	\N
1503	3	2	15	\N	\N	\N	\N
1504	3	2	16	\N	\N	\N	\N
1505	3	2	17	\N	\N	\N	\N
1506	3	2	18	\N	\N	\N	\N
1507	3	2	19	\N	\N	\N	\N
1508	3	2	20	\N	\N	\N	\N
1509	3	2	21	\N	\N	\N	\N
1510	3	2	22	\N	\N	\N	\N
1511	3	2	23	\N	\N	\N	\N
1512	3	2	24	\N	\N	\N	\N
1513	3	2	25	\N	\N	\N	\N
1514	3	2	26	\N	\N	\N	\N
1515	3	2	27	\N	\N	\N	\N
1516	3	2	28	\N	\N	\N	\N
1517	3	2	29	\N	\N	\N	\N
1518	3	2	30	\N	\N	\N	\N
1519	3	2	31	\N	\N	\N	\N
1520	3	2	32	\N	\N	\N	\N
1521	3	2	33	\N	\N	\N	\N
1522	3	2	34	\N	\N	\N	\N
1523	3	2	35	\N	\N	\N	\N
1524	3	2	36	\N	\N	\N	\N
1525	3	2	37	\N	\N	\N	\N
1526	3	2	38	\N	\N	\N	\N
1527	3	2	39	\N	\N	\N	\N
1528	3	2	40	\N	\N	\N	\N
1529	3	2	41	\N	\N	\N	\N
1530	3	2	42	\N	\N	\N	\N
1531	3	2	43	\N	\N	\N	\N
1532	3	2	44	\N	\N	\N	\N
1533	3	2	45	\N	\N	\N	\N
1534	3	2	46	\N	\N	\N	\N
1535	3	2	47	\N	\N	\N	\N
1536	3	2	48	\N	\N	\N	\N
1537	3	3	1	\N	\N	\N	\N
1538	3	3	2	\N	\N	\N	\N
1539	3	3	3	\N	\N	\N	\N
1540	3	3	4	\N	\N	\N	\N
1541	3	3	5	\N	\N	\N	\N
1542	3	3	6	\N	\N	\N	\N
1543	3	3	7	\N	\N	\N	\N
1544	3	3	8	\N	\N	\N	\N
1545	3	3	9	\N	\N	\N	\N
1546	3	3	10	\N	\N	\N	\N
1547	3	3	11	\N	\N	\N	\N
1548	3	3	12	\N	\N	\N	\N
1549	3	3	13	\N	\N	\N	\N
1550	3	3	14	\N	\N	\N	\N
1551	3	3	15	\N	\N	\N	\N
1552	3	3	16	\N	\N	\N	\N
1553	3	3	17	\N	\N	\N	\N
1554	3	3	18	\N	\N	\N	\N
1555	3	3	19	\N	\N	\N	\N
1556	3	3	20	\N	\N	\N	\N
1557	3	3	21	\N	\N	\N	\N
1558	3	3	22	\N	\N	\N	\N
1559	3	3	23	\N	\N	\N	\N
1560	3	3	24	\N	\N	\N	\N
1561	3	3	25	\N	\N	\N	\N
1562	3	3	26	\N	\N	\N	\N
1563	3	3	27	\N	\N	\N	\N
1564	3	3	28	\N	\N	\N	\N
1565	3	3	29	\N	\N	\N	\N
1566	3	3	30	\N	\N	\N	\N
1567	3	3	31	\N	\N	\N	\N
1568	3	3	32	\N	\N	\N	\N
1569	3	3	33	\N	\N	\N	\N
1570	3	3	34	\N	\N	\N	\N
1571	3	3	35	\N	\N	\N	\N
1572	3	3	36	\N	\N	\N	\N
1573	3	3	37	\N	\N	\N	\N
1574	3	3	38	\N	\N	\N	\N
1575	3	3	39	\N	\N	\N	\N
1576	3	3	40	\N	\N	\N	\N
1577	3	3	41	\N	\N	\N	\N
1578	3	3	42	\N	\N	\N	\N
1579	3	3	43	\N	\N	\N	\N
1580	3	3	44	\N	\N	\N	\N
1581	3	3	45	\N	\N	\N	\N
1582	3	3	46	\N	\N	\N	\N
1583	3	3	47	\N	\N	\N	\N
1584	3	3	48	\N	\N	\N	\N
1585	3	4	1	\N	\N	\N	\N
1586	3	4	2	\N	\N	\N	\N
1587	3	4	3	\N	\N	\N	\N
1588	3	4	4	\N	\N	\N	\N
1589	3	4	5	\N	\N	\N	\N
1590	3	4	6	\N	\N	\N	\N
1591	3	4	7	\N	\N	\N	\N
1592	3	4	8	\N	\N	\N	\N
1593	3	4	9	\N	\N	\N	\N
1594	3	4	10	\N	\N	\N	\N
1595	3	4	11	\N	\N	\N	\N
1596	3	4	12	\N	\N	\N	\N
1597	3	4	13	\N	\N	\N	\N
1598	3	4	14	\N	\N	\N	\N
1599	3	4	15	\N	\N	\N	\N
1600	3	4	16	\N	\N	\N	\N
1601	3	4	17	\N	\N	\N	\N
1602	3	4	18	\N	\N	\N	\N
1603	3	4	19	\N	\N	\N	\N
1604	3	4	20	\N	\N	\N	\N
1605	3	4	21	\N	\N	\N	\N
1606	3	4	22	\N	\N	\N	\N
1607	3	4	23	\N	\N	\N	\N
1608	3	4	24	\N	\N	\N	\N
1609	3	4	25	\N	\N	\N	\N
1610	3	4	26	\N	\N	\N	\N
1611	3	4	27	\N	\N	\N	\N
1612	3	4	28	\N	\N	\N	\N
1613	3	4	29	\N	\N	\N	\N
1614	3	4	30	\N	\N	\N	\N
1615	3	4	31	\N	\N	\N	\N
1616	3	4	32	\N	\N	\N	\N
1617	3	4	33	\N	\N	\N	\N
1618	3	4	34	\N	\N	\N	\N
1619	3	4	35	\N	\N	\N	\N
1620	3	4	36	\N	\N	\N	\N
1621	3	4	37	\N	\N	\N	\N
1622	3	4	38	\N	\N	\N	\N
1623	3	4	39	\N	\N	\N	\N
1624	3	4	40	\N	\N	\N	\N
1625	3	4	41	\N	\N	\N	\N
1626	3	4	42	\N	\N	\N	\N
1627	3	4	43	\N	\N	\N	\N
1628	3	4	44	\N	\N	\N	\N
1629	3	4	45	\N	\N	\N	\N
1630	3	4	46	\N	\N	\N	\N
1631	3	4	47	\N	\N	\N	\N
1632	3	4	48	\N	\N	\N	\N
1633	3	5	1	\N	\N	\N	\N
1634	3	5	2	\N	\N	\N	\N
1635	3	5	3	\N	\N	\N	\N
1636	3	5	4	\N	\N	\N	\N
1637	3	5	5	\N	\N	\N	\N
1638	3	5	6	\N	\N	\N	\N
1639	3	5	7	\N	\N	\N	\N
1640	3	5	8	\N	\N	\N	\N
1641	3	5	9	\N	\N	\N	\N
1642	3	5	10	\N	\N	\N	\N
1643	3	5	11	\N	\N	\N	\N
1644	3	5	12	\N	\N	\N	\N
1645	3	5	13	\N	\N	\N	\N
1646	3	5	14	\N	\N	\N	\N
1647	3	5	15	\N	\N	\N	\N
1648	3	5	16	\N	\N	\N	\N
1649	3	5	17	\N	\N	\N	\N
1650	3	5	18	\N	\N	\N	\N
1651	3	5	19	\N	\N	\N	\N
1652	3	5	20	\N	\N	\N	\N
1653	3	5	21	\N	\N	\N	\N
1654	3	5	22	\N	\N	\N	\N
1655	3	5	23	\N	\N	\N	\N
1656	3	5	24	\N	\N	\N	\N
1657	3	5	25	\N	\N	\N	\N
1658	3	5	26	\N	\N	\N	\N
1659	3	5	27	\N	\N	\N	\N
1660	3	5	28	\N	\N	\N	\N
1661	3	5	29	\N	\N	\N	\N
1662	3	5	30	\N	\N	\N	\N
1663	3	5	31	\N	\N	\N	\N
1664	3	5	32	\N	\N	\N	\N
1665	3	5	33	\N	\N	\N	\N
1666	3	5	34	\N	\N	\N	\N
1667	3	5	35	\N	\N	\N	\N
1668	3	5	36	\N	\N	\N	\N
1669	3	5	37	\N	\N	\N	\N
1670	3	5	38	\N	\N	\N	\N
1671	3	5	39	\N	\N	\N	\N
1672	3	5	40	\N	\N	\N	\N
1673	3	5	41	\N	\N	\N	\N
1674	3	5	42	\N	\N	\N	\N
1675	3	5	43	\N	\N	\N	\N
1676	3	5	44	\N	\N	\N	\N
1677	3	5	45	\N	\N	\N	\N
1678	3	5	46	\N	\N	\N	\N
1679	3	5	47	\N	\N	\N	\N
1680	3	5	48	\N	\N	\N	\N
1681	3	6	1	\N	\N	\N	\N
1682	3	6	2	\N	\N	\N	\N
1683	3	6	3	\N	\N	\N	\N
1684	3	6	4	\N	\N	\N	\N
1685	3	6	5	\N	\N	\N	\N
1686	3	6	6	\N	\N	\N	\N
1687	3	6	7	\N	\N	\N	\N
1688	3	6	8	\N	\N	\N	\N
1689	3	6	9	\N	\N	\N	\N
1690	3	6	10	\N	\N	\N	\N
1691	3	6	11	\N	\N	\N	\N
1692	3	6	12	\N	\N	\N	\N
1693	3	6	13	\N	\N	\N	\N
1694	3	6	14	\N	\N	\N	\N
1695	3	6	15	\N	\N	\N	\N
1696	3	6	16	\N	\N	\N	\N
1697	3	6	17	\N	\N	\N	\N
1698	3	6	18	\N	\N	\N	\N
1699	3	6	19	\N	\N	\N	\N
1700	3	6	20	\N	\N	\N	\N
1701	3	6	21	\N	\N	\N	\N
1702	3	6	22	\N	\N	\N	\N
1703	3	6	23	\N	\N	\N	\N
1704	3	6	24	\N	\N	\N	\N
1705	3	6	25	\N	\N	\N	\N
1706	3	6	26	\N	\N	\N	\N
1707	3	6	27	\N	\N	\N	\N
1708	3	6	28	\N	\N	\N	\N
1709	3	6	29	\N	\N	\N	\N
1710	3	6	30	\N	\N	\N	\N
1711	3	6	31	\N	\N	\N	\N
1712	3	6	32	\N	\N	\N	\N
1713	3	6	33	\N	\N	\N	\N
1714	3	6	34	\N	\N	\N	\N
1715	3	6	35	\N	\N	\N	\N
1716	3	6	36	\N	\N	\N	\N
1717	3	6	37	\N	\N	\N	\N
1718	3	6	38	\N	\N	\N	\N
1719	3	6	39	\N	\N	\N	\N
1720	3	6	40	\N	\N	\N	\N
1721	3	6	41	\N	\N	\N	\N
1722	3	6	42	\N	\N	\N	\N
1723	3	6	43	\N	\N	\N	\N
1724	3	6	44	\N	\N	\N	\N
1725	3	6	45	\N	\N	\N	\N
1726	3	6	46	\N	\N	\N	\N
1727	3	6	47	\N	\N	\N	\N
1728	3	6	48	\N	\N	\N	\N
1729	3	7	1	\N	\N	\N	\N
1730	3	7	2	\N	\N	\N	\N
1731	3	7	3	\N	\N	\N	\N
1732	3	7	4	\N	\N	\N	\N
1733	3	7	5	\N	\N	\N	\N
1734	3	7	6	\N	\N	\N	\N
1735	3	7	7	\N	\N	\N	\N
1736	3	7	8	\N	\N	\N	\N
1737	3	7	9	\N	\N	\N	\N
1738	3	7	10	\N	\N	\N	\N
1739	3	7	11	\N	\N	\N	\N
1740	3	7	12	\N	\N	\N	\N
1741	3	7	13	\N	\N	\N	\N
1742	3	7	14	\N	\N	\N	\N
1743	3	7	15	\N	\N	\N	\N
1744	3	7	16	\N	\N	\N	\N
1745	3	7	17	\N	\N	\N	\N
1746	3	7	18	\N	\N	\N	\N
1747	3	7	19	\N	\N	\N	\N
1748	3	7	20	\N	\N	\N	\N
1749	3	7	21	\N	\N	\N	\N
1750	3	7	22	\N	\N	\N	\N
1751	3	7	23	\N	\N	\N	\N
1752	3	7	24	\N	\N	\N	\N
1753	3	7	25	\N	\N	\N	\N
1754	3	7	26	\N	\N	\N	\N
1755	3	7	27	\N	\N	\N	\N
1756	3	7	28	\N	\N	\N	\N
1757	3	7	29	\N	\N	\N	\N
1758	3	7	30	\N	\N	\N	\N
1759	3	7	31	\N	\N	\N	\N
1760	3	7	32	\N	\N	\N	\N
1761	3	7	33	\N	\N	\N	\N
1762	3	7	34	\N	\N	\N	\N
1763	3	7	35	\N	\N	\N	\N
1764	3	7	36	\N	\N	\N	\N
1765	3	7	37	\N	\N	\N	\N
1766	3	7	38	\N	\N	\N	\N
1767	3	7	39	\N	\N	\N	\N
1768	3	7	40	\N	\N	\N	\N
1769	3	7	41	\N	\N	\N	\N
1770	3	7	42	\N	\N	\N	\N
1771	3	7	43	\N	\N	\N	\N
1772	3	7	44	\N	\N	\N	\N
1773	3	7	45	\N	\N	\N	\N
1774	3	7	46	\N	\N	\N	\N
1775	3	7	47	\N	\N	\N	\N
1776	3	7	48	\N	\N	\N	\N
1777	3	8	1	\N	\N	\N	\N
1778	3	8	2	\N	\N	\N	\N
1779	3	8	3	\N	\N	\N	\N
1780	3	8	4	\N	\N	\N	\N
1781	3	8	5	\N	\N	\N	\N
1782	3	8	6	\N	\N	\N	\N
1783	3	8	7	\N	\N	\N	\N
1784	3	8	8	\N	\N	\N	\N
1785	3	8	9	\N	\N	\N	\N
1786	3	8	10	\N	\N	\N	\N
1787	3	8	11	\N	\N	\N	\N
1788	3	8	12	\N	\N	\N	\N
1789	3	8	13	\N	\N	\N	\N
1790	3	8	14	\N	\N	\N	\N
1791	3	8	15	\N	\N	\N	\N
1792	3	8	16	\N	\N	\N	\N
1793	3	8	17	\N	\N	\N	\N
1794	3	8	18	\N	\N	\N	\N
1795	3	8	19	\N	\N	\N	\N
1796	3	8	20	\N	\N	\N	\N
1797	3	8	21	\N	\N	\N	\N
1798	3	8	22	\N	\N	\N	\N
1799	3	8	23	\N	\N	\N	\N
1800	3	8	24	\N	\N	\N	\N
1801	3	8	25	\N	\N	\N	\N
1802	3	8	26	\N	\N	\N	\N
1803	3	8	27	\N	\N	\N	\N
1804	3	8	28	\N	\N	\N	\N
1805	3	8	29	\N	\N	\N	\N
1806	3	8	30	\N	\N	\N	\N
1807	3	8	31	\N	\N	\N	\N
1808	3	8	32	\N	\N	\N	\N
1809	3	8	33	\N	\N	\N	\N
1810	3	8	34	\N	\N	\N	\N
1811	3	8	35	\N	\N	\N	\N
1812	3	8	36	\N	\N	\N	\N
1813	3	8	37	\N	\N	\N	\N
1814	3	8	38	\N	\N	\N	\N
1815	3	8	39	\N	\N	\N	\N
1816	3	8	40	\N	\N	\N	\N
1817	3	8	41	\N	\N	\N	\N
1818	3	8	42	\N	\N	\N	\N
1819	3	8	43	\N	\N	\N	\N
1820	3	8	44	\N	\N	\N	\N
1821	3	8	45	\N	\N	\N	\N
1822	3	8	46	\N	\N	\N	\N
1823	3	8	47	\N	\N	\N	\N
1824	3	8	48	\N	\N	\N	\N
1825	3	9	1	\N	\N	\N	\N
1826	3	9	2	\N	\N	\N	\N
1827	3	9	3	\N	\N	\N	\N
1828	3	9	4	\N	\N	\N	\N
1829	3	9	5	\N	\N	\N	\N
1830	3	9	6	\N	\N	\N	\N
1831	3	9	7	\N	\N	\N	\N
1832	3	9	8	\N	\N	\N	\N
1833	3	9	9	\N	\N	\N	\N
1834	3	9	10	\N	\N	\N	\N
1835	3	9	11	\N	\N	\N	\N
1836	3	9	12	\N	\N	\N	\N
1837	3	9	13	\N	\N	\N	\N
1838	3	9	14	\N	\N	\N	\N
1839	3	9	15	\N	\N	\N	\N
1840	3	9	16	\N	\N	\N	\N
1841	3	9	17	\N	\N	\N	\N
1842	3	9	18	\N	\N	\N	\N
1843	3	9	19	\N	\N	\N	\N
1844	3	9	20	\N	\N	\N	\N
1845	3	9	21	\N	\N	\N	\N
1846	3	9	22	\N	\N	\N	\N
1847	3	9	23	\N	\N	\N	\N
1848	3	9	24	\N	\N	\N	\N
1849	3	9	25	\N	\N	\N	\N
1850	3	9	26	\N	\N	\N	\N
1851	3	9	27	\N	\N	\N	\N
1852	3	9	28	\N	\N	\N	\N
1853	3	9	29	\N	\N	\N	\N
1854	3	9	30	\N	\N	\N	\N
1855	3	9	31	\N	\N	\N	\N
1856	3	9	32	\N	\N	\N	\N
1857	3	9	33	\N	\N	\N	\N
1858	3	9	34	\N	\N	\N	\N
1859	3	9	35	\N	\N	\N	\N
1860	3	9	36	\N	\N	\N	\N
1861	3	9	37	\N	\N	\N	\N
1862	3	9	38	\N	\N	\N	\N
1863	3	9	39	\N	\N	\N	\N
1864	3	9	40	\N	\N	\N	\N
1865	3	9	41	\N	\N	\N	\N
1866	3	9	42	\N	\N	\N	\N
1867	3	9	43	\N	\N	\N	\N
1868	3	9	44	\N	\N	\N	\N
1869	3	9	45	\N	\N	\N	\N
1870	3	9	46	\N	\N	\N	\N
1871	3	9	47	\N	\N	\N	\N
1872	3	9	48	\N	\N	\N	\N
1873	3	10	1	\N	\N	\N	\N
1874	3	10	2	\N	\N	\N	\N
1875	3	10	3	\N	\N	\N	\N
1876	3	10	4	\N	\N	\N	\N
1877	3	10	5	\N	\N	\N	\N
1878	3	10	6	\N	\N	\N	\N
1879	3	10	7	\N	\N	\N	\N
1880	3	10	8	\N	\N	\N	\N
1881	3	10	9	\N	\N	\N	\N
1882	3	10	10	\N	\N	\N	\N
1883	3	10	11	\N	\N	\N	\N
1884	3	10	12	\N	\N	\N	\N
1885	3	10	13	\N	\N	\N	\N
1886	3	10	14	\N	\N	\N	\N
1887	3	10	15	\N	\N	\N	\N
1888	3	10	16	\N	\N	\N	\N
1889	3	10	17	\N	\N	\N	\N
1890	3	10	18	\N	\N	\N	\N
1891	3	10	19	\N	\N	\N	\N
1892	3	10	20	\N	\N	\N	\N
1893	3	10	21	\N	\N	\N	\N
1894	3	10	22	\N	\N	\N	\N
1895	3	10	23	\N	\N	\N	\N
1896	3	10	24	\N	\N	\N	\N
1897	3	10	25	\N	\N	\N	\N
1898	3	10	26	\N	\N	\N	\N
1899	3	10	27	\N	\N	\N	\N
1900	3	10	28	\N	\N	\N	\N
1901	3	10	29	\N	\N	\N	\N
1902	3	10	30	\N	\N	\N	\N
1903	3	10	31	\N	\N	\N	\N
1904	3	10	32	\N	\N	\N	\N
1905	3	10	33	\N	\N	\N	\N
1906	3	10	34	\N	\N	\N	\N
1907	3	10	35	\N	\N	\N	\N
1908	3	10	36	\N	\N	\N	\N
1909	3	10	37	\N	\N	\N	\N
1910	3	10	38	\N	\N	\N	\N
1911	3	10	39	\N	\N	\N	\N
1912	3	10	40	\N	\N	\N	\N
1913	3	10	41	\N	\N	\N	\N
1914	3	10	42	\N	\N	\N	\N
1915	3	10	43	\N	\N	\N	\N
1916	3	10	44	\N	\N	\N	\N
1917	3	10	45	\N	\N	\N	\N
1918	3	10	46	\N	\N	\N	\N
1919	3	10	47	\N	\N	\N	\N
1920	3	10	48	\N	\N	\N	\N
1921	3	11	1	\N	\N	\N	\N
1922	3	11	2	\N	\N	\N	\N
1923	3	11	3	\N	\N	\N	\N
1924	3	11	4	\N	\N	\N	\N
1925	3	11	5	\N	\N	\N	\N
1926	3	11	6	\N	\N	\N	\N
1927	3	11	7	\N	\N	\N	\N
1928	3	11	8	\N	\N	\N	\N
1929	3	11	9	\N	\N	\N	\N
1930	3	11	10	\N	\N	\N	\N
1931	3	11	11	\N	\N	\N	\N
1932	3	11	12	\N	\N	\N	\N
1933	3	11	13	\N	\N	\N	\N
1934	3	11	14	\N	\N	\N	\N
1935	3	11	15	\N	\N	\N	\N
1936	3	11	16	\N	\N	\N	\N
1937	3	11	17	\N	\N	\N	\N
1938	3	11	18	\N	\N	\N	\N
1939	3	11	19	\N	\N	\N	\N
1940	3	11	20	\N	\N	\N	\N
1941	3	11	21	\N	\N	\N	\N
1942	3	11	22	\N	\N	\N	\N
1943	3	11	23	\N	\N	\N	\N
1944	3	11	24	\N	\N	\N	\N
1945	3	11	25	\N	\N	\N	\N
1946	3	11	26	\N	\N	\N	\N
1947	3	11	27	\N	\N	\N	\N
1948	3	11	28	\N	\N	\N	\N
1949	3	11	29	\N	\N	\N	\N
1950	3	11	30	\N	\N	\N	\N
1951	3	11	31	\N	\N	\N	\N
1952	3	11	32	\N	\N	\N	\N
1953	3	11	33	\N	\N	\N	\N
1954	3	11	34	\N	\N	\N	\N
1955	3	11	35	\N	\N	\N	\N
1956	3	11	36	\N	\N	\N	\N
1957	3	11	37	\N	\N	\N	\N
1958	3	11	38	\N	\N	\N	\N
1959	3	11	39	\N	\N	\N	\N
1960	3	11	40	\N	\N	\N	\N
1961	3	11	41	\N	\N	\N	\N
1962	3	11	42	\N	\N	\N	\N
1963	3	11	43	\N	\N	\N	\N
1964	3	11	44	\N	\N	\N	\N
1965	3	11	45	\N	\N	\N	\N
1966	3	11	46	\N	\N	\N	\N
1967	3	11	47	\N	\N	\N	\N
1968	3	11	48	\N	\N	\N	\N
1969	3	12	1	\N	\N	\N	\N
1970	3	12	2	\N	\N	\N	\N
1971	3	12	3	\N	\N	\N	\N
1972	3	12	4	\N	\N	\N	\N
1973	3	12	5	\N	\N	\N	\N
1974	3	12	6	\N	\N	\N	\N
1975	3	12	7	\N	\N	\N	\N
1976	3	12	8	\N	\N	\N	\N
1977	3	12	9	\N	\N	\N	\N
1978	3	12	10	\N	\N	\N	\N
1979	3	12	11	\N	\N	\N	\N
1980	3	12	12	\N	\N	\N	\N
1981	3	12	13	\N	\N	\N	\N
1982	3	12	14	\N	\N	\N	\N
1983	3	12	15	\N	\N	\N	\N
1984	3	12	16	\N	\N	\N	\N
1985	3	12	17	\N	\N	\N	\N
1986	3	12	18	\N	\N	\N	\N
1987	3	12	19	\N	\N	\N	\N
1988	3	12	20	\N	\N	\N	\N
1989	3	12	21	\N	\N	\N	\N
1990	3	12	22	\N	\N	\N	\N
1991	3	12	23	\N	\N	\N	\N
1992	3	12	24	\N	\N	\N	\N
1993	3	12	25	\N	\N	\N	\N
1994	3	12	26	\N	\N	\N	\N
1995	3	12	27	\N	\N	\N	\N
1996	3	12	28	\N	\N	\N	\N
1997	3	12	29	\N	\N	\N	\N
1998	3	12	30	\N	\N	\N	\N
1999	3	12	31	\N	\N	\N	\N
2000	3	12	32	\N	\N	\N	\N
2001	3	12	33	\N	\N	\N	\N
2002	3	12	34	\N	\N	\N	\N
2003	3	12	35	\N	\N	\N	\N
2004	3	12	36	\N	\N	\N	\N
2005	3	12	37	\N	\N	\N	\N
2006	3	12	38	\N	\N	\N	\N
2007	3	12	39	\N	\N	\N	\N
2008	3	12	40	\N	\N	\N	\N
2009	3	12	41	\N	\N	\N	\N
2010	3	12	42	\N	\N	\N	\N
2011	3	12	43	\N	\N	\N	\N
2012	3	12	44	\N	\N	\N	\N
2013	3	12	45	\N	\N	\N	\N
2014	3	12	46	\N	\N	\N	\N
2015	3	12	47	\N	\N	\N	\N
2016	3	12	48	\N	\N	\N	\N
2017	3	13	1	\N	\N	\N	\N
2018	3	13	2	\N	\N	\N	\N
2019	3	13	3	\N	\N	\N	\N
2020	3	13	4	\N	\N	\N	\N
2021	3	13	5	\N	\N	\N	\N
2022	3	13	6	\N	\N	\N	\N
2023	3	13	7	\N	\N	\N	\N
2024	3	13	8	\N	\N	\N	\N
2025	3	13	9	\N	\N	\N	\N
2026	3	13	10	\N	\N	\N	\N
2027	3	13	11	\N	\N	\N	\N
2028	3	13	12	\N	\N	\N	\N
2029	3	13	13	\N	\N	\N	\N
2030	3	13	14	\N	\N	\N	\N
2031	3	13	15	\N	\N	\N	\N
2032	3	13	16	\N	\N	\N	\N
2033	3	13	17	\N	\N	\N	\N
2034	3	13	18	\N	\N	\N	\N
2035	3	13	19	\N	\N	\N	\N
2036	3	13	20	\N	\N	\N	\N
2037	3	13	21	\N	\N	\N	\N
2038	3	13	22	\N	\N	\N	\N
2039	3	13	23	\N	\N	\N	\N
2040	3	13	24	\N	\N	\N	\N
2041	3	13	25	\N	\N	\N	\N
2042	3	13	26	\N	\N	\N	\N
2043	3	13	27	\N	\N	\N	\N
2044	3	13	28	\N	\N	\N	\N
2045	3	13	29	\N	\N	\N	\N
2046	3	13	30	\N	\N	\N	\N
2047	3	13	31	\N	\N	\N	\N
2048	3	13	32	\N	\N	\N	\N
2049	3	13	33	\N	\N	\N	\N
2050	3	13	34	\N	\N	\N	\N
2051	3	13	35	\N	\N	\N	\N
2052	3	13	36	\N	\N	\N	\N
2053	3	13	37	\N	\N	\N	\N
2054	3	13	38	\N	\N	\N	\N
2055	3	13	39	\N	\N	\N	\N
2056	3	13	40	\N	\N	\N	\N
2057	3	13	41	\N	\N	\N	\N
2058	3	13	42	\N	\N	\N	\N
2059	3	13	43	\N	\N	\N	\N
2060	3	13	44	\N	\N	\N	\N
2061	3	13	45	\N	\N	\N	\N
2062	3	13	46	\N	\N	\N	\N
2063	3	13	47	\N	\N	\N	\N
2064	3	13	48	\N	\N	\N	\N
2065	3	14	1	\N	\N	\N	\N
2066	3	14	2	\N	\N	\N	\N
2067	3	14	3	\N	\N	\N	\N
2068	3	14	4	\N	\N	\N	\N
2069	3	14	5	\N	\N	\N	\N
2070	3	14	6	\N	\N	\N	\N
2071	3	14	7	\N	\N	\N	\N
2072	3	14	8	\N	\N	\N	\N
2073	3	14	9	\N	\N	\N	\N
2074	3	14	10	\N	\N	\N	\N
2075	3	14	11	\N	\N	\N	\N
2076	3	14	12	\N	\N	\N	\N
2077	3	14	13	\N	\N	\N	\N
2078	3	14	14	\N	\N	\N	\N
2079	3	14	15	\N	\N	\N	\N
2080	3	14	16	\N	\N	\N	\N
2081	3	14	17	\N	\N	\N	\N
2082	3	14	18	\N	\N	\N	\N
2083	3	14	19	\N	\N	\N	\N
2084	3	14	20	\N	\N	\N	\N
2085	3	14	21	\N	\N	\N	\N
2086	3	14	22	\N	\N	\N	\N
2087	3	14	23	\N	\N	\N	\N
2088	3	14	24	\N	\N	\N	\N
2089	3	14	25	\N	\N	\N	\N
2090	3	14	26	\N	\N	\N	\N
2091	3	14	27	\N	\N	\N	\N
2092	3	14	28	\N	\N	\N	\N
2093	3	14	29	\N	\N	\N	\N
2094	3	14	30	\N	\N	\N	\N
2095	3	14	31	\N	\N	\N	\N
2096	3	14	32	\N	\N	\N	\N
2097	3	14	33	\N	\N	\N	\N
2098	3	14	34	\N	\N	\N	\N
2099	3	14	35	\N	\N	\N	\N
2100	3	14	36	\N	\N	\N	\N
2101	3	14	37	\N	\N	\N	\N
2102	3	14	38	\N	\N	\N	\N
2103	3	14	39	\N	\N	\N	\N
2104	3	14	40	\N	\N	\N	\N
2105	3	14	41	\N	\N	\N	\N
2106	3	14	42	\N	\N	\N	\N
2107	3	14	43	\N	\N	\N	\N
2108	3	14	44	\N	\N	\N	\N
2109	3	14	45	\N	\N	\N	\N
2110	3	14	46	\N	\N	\N	\N
2111	3	14	47	\N	\N	\N	\N
2112	3	14	48	\N	\N	\N	\N
2113	3	15	1	\N	\N	\N	\N
2114	3	15	2	\N	\N	\N	\N
2115	3	15	3	\N	\N	\N	\N
2116	3	15	4	\N	\N	\N	\N
2117	3	15	5	\N	\N	\N	\N
2118	3	15	6	\N	\N	\N	\N
2119	3	15	7	\N	\N	\N	\N
2120	3	15	8	\N	\N	\N	\N
2121	3	15	9	\N	\N	\N	\N
2122	3	15	10	\N	\N	\N	\N
2123	3	15	11	\N	\N	\N	\N
2124	3	15	12	\N	\N	\N	\N
2125	3	15	13	\N	\N	\N	\N
2126	3	15	14	\N	\N	\N	\N
2127	3	15	15	\N	\N	\N	\N
2128	3	15	16	\N	\N	\N	\N
2129	3	15	17	\N	\N	\N	\N
2130	3	15	18	\N	\N	\N	\N
2131	3	15	19	\N	\N	\N	\N
2132	3	15	20	\N	\N	\N	\N
2133	3	15	21	\N	\N	\N	\N
2134	3	15	22	\N	\N	\N	\N
2135	3	15	23	\N	\N	\N	\N
2136	3	15	24	\N	\N	\N	\N
2137	3	15	25	\N	\N	\N	\N
2138	3	15	26	\N	\N	\N	\N
2139	3	15	27	\N	\N	\N	\N
2140	3	15	28	\N	\N	\N	\N
2141	3	15	29	\N	\N	\N	\N
2142	3	15	30	\N	\N	\N	\N
2143	3	15	31	\N	\N	\N	\N
2144	3	15	32	\N	\N	\N	\N
2145	3	15	33	\N	\N	\N	\N
2146	3	15	34	\N	\N	\N	\N
2147	3	15	35	\N	\N	\N	\N
2148	3	15	36	\N	\N	\N	\N
2149	3	15	37	\N	\N	\N	\N
2150	3	15	38	\N	\N	\N	\N
2151	3	15	39	\N	\N	\N	\N
2152	3	15	40	\N	\N	\N	\N
2153	3	15	41	\N	\N	\N	\N
2154	3	15	42	\N	\N	\N	\N
2155	3	15	43	\N	\N	\N	\N
2156	3	15	44	\N	\N	\N	\N
2157	3	15	45	\N	\N	\N	\N
2158	3	15	46	\N	\N	\N	\N
2159	3	15	47	\N	\N	\N	\N
2160	3	15	48	\N	\N	\N	\N
2161	4	1	1	\N	\N	\N	\N
2162	4	1	2	\N	\N	\N	\N
2163	4	1	3	\N	\N	\N	\N
2164	4	1	4	\N	\N	\N	\N
2165	4	1	5	\N	\N	\N	\N
2166	4	1	6	\N	\N	\N	\N
2167	4	1	7	\N	\N	\N	\N
2168	4	1	8	\N	\N	\N	\N
2169	4	1	9	\N	\N	\N	\N
2170	4	1	10	\N	\N	\N	\N
2171	4	1	11	\N	\N	\N	\N
2172	4	1	12	\N	\N	\N	\N
2173	4	1	13	\N	\N	\N	\N
2174	4	1	14	\N	\N	\N	\N
2175	4	1	15	\N	\N	\N	\N
2176	4	1	16	\N	\N	\N	\N
2177	4	1	17	\N	\N	\N	\N
2178	4	1	18	\N	\N	\N	\N
2179	4	1	19	\N	\N	\N	\N
2180	4	1	20	\N	\N	\N	\N
2181	4	1	21	\N	\N	\N	\N
2182	4	1	22	\N	\N	\N	\N
2183	4	1	23	\N	\N	\N	\N
2184	4	1	24	\N	\N	\N	\N
2185	4	1	25	\N	\N	\N	\N
2186	4	1	26	\N	\N	\N	\N
2187	4	1	27	\N	\N	\N	\N
2188	4	1	28	\N	\N	\N	\N
2189	4	1	29	\N	\N	\N	\N
2190	4	1	30	\N	\N	\N	\N
2191	4	1	31	\N	\N	\N	\N
2192	4	1	32	\N	\N	\N	\N
2193	4	1	33	\N	\N	\N	\N
2194	4	1	34	\N	\N	\N	\N
2195	4	1	35	\N	\N	\N	\N
2196	4	1	36	\N	\N	\N	\N
2197	4	1	37	\N	\N	\N	\N
2198	4	1	38	\N	\N	\N	\N
2199	4	1	39	\N	\N	\N	\N
2200	4	1	40	\N	\N	\N	\N
2201	4	1	41	\N	\N	\N	\N
2202	4	1	42	\N	\N	\N	\N
2203	4	1	43	\N	\N	\N	\N
2204	4	1	44	\N	\N	\N	\N
2205	4	1	45	\N	\N	\N	\N
2206	4	1	46	\N	\N	\N	\N
2207	4	1	47	\N	\N	\N	\N
2208	4	1	48	\N	\N	\N	\N
2209	4	2	1	\N	\N	\N	\N
2210	4	2	2	\N	\N	\N	\N
2211	4	2	3	\N	\N	\N	\N
2212	4	2	4	\N	\N	\N	\N
2213	4	2	5	\N	\N	\N	\N
2214	4	2	6	\N	\N	\N	\N
2215	4	2	7	\N	\N	\N	\N
2216	4	2	8	\N	\N	\N	\N
2217	4	2	9	\N	\N	\N	\N
2218	4	2	10	\N	\N	\N	\N
2219	4	2	11	\N	\N	\N	\N
2220	4	2	12	\N	\N	\N	\N
2221	4	2	13	\N	\N	\N	\N
2222	4	2	14	\N	\N	\N	\N
2223	4	2	15	\N	\N	\N	\N
2224	4	2	16	\N	\N	\N	\N
2225	4	2	17	\N	\N	\N	\N
2226	4	2	18	\N	\N	\N	\N
2227	4	2	19	\N	\N	\N	\N
2228	4	2	20	\N	\N	\N	\N
2229	4	2	21	\N	\N	\N	\N
2230	4	2	22	\N	\N	\N	\N
2231	4	2	23	\N	\N	\N	\N
2232	4	2	24	\N	\N	\N	\N
2233	4	2	25	\N	\N	\N	\N
2234	4	2	26	\N	\N	\N	\N
2235	4	2	27	\N	\N	\N	\N
2236	4	2	28	\N	\N	\N	\N
2237	4	2	29	\N	\N	\N	\N
2238	4	2	30	\N	\N	\N	\N
2239	4	2	31	\N	\N	\N	\N
2240	4	2	32	\N	\N	\N	\N
2241	4	2	33	\N	\N	\N	\N
2242	4	2	34	\N	\N	\N	\N
2243	4	2	35	\N	\N	\N	\N
2244	4	2	36	\N	\N	\N	\N
2245	4	2	37	\N	\N	\N	\N
2246	4	2	38	\N	\N	\N	\N
2247	4	2	39	\N	\N	\N	\N
2248	4	2	40	\N	\N	\N	\N
2249	4	2	41	\N	\N	\N	\N
2250	4	2	42	\N	\N	\N	\N
2251	4	2	43	\N	\N	\N	\N
2252	4	2	44	\N	\N	\N	\N
2253	4	2	45	\N	\N	\N	\N
2254	4	2	46	\N	\N	\N	\N
2255	4	2	47	\N	\N	\N	\N
2256	4	2	48	\N	\N	\N	\N
2257	4	3	1	\N	\N	\N	\N
2258	4	3	2	\N	\N	\N	\N
2259	4	3	3	\N	\N	\N	\N
2260	4	3	4	\N	\N	\N	\N
2261	4	3	5	\N	\N	\N	\N
2262	4	3	6	\N	\N	\N	\N
2263	4	3	7	\N	\N	\N	\N
2264	4	3	8	\N	\N	\N	\N
2265	4	3	9	\N	\N	\N	\N
2266	4	3	10	\N	\N	\N	\N
2267	4	3	11	\N	\N	\N	\N
2268	4	3	12	\N	\N	\N	\N
2269	4	3	13	\N	\N	\N	\N
2270	4	3	14	\N	\N	\N	\N
2271	4	3	15	\N	\N	\N	\N
2272	4	3	16	\N	\N	\N	\N
2273	4	3	17	\N	\N	\N	\N
2274	4	3	18	\N	\N	\N	\N
2275	4	3	19	\N	\N	\N	\N
2276	4	3	20	\N	\N	\N	\N
2277	4	3	21	\N	\N	\N	\N
2278	4	3	22	\N	\N	\N	\N
2279	4	3	23	\N	\N	\N	\N
2280	4	3	24	\N	\N	\N	\N
2281	4	3	25	\N	\N	\N	\N
2282	4	3	26	\N	\N	\N	\N
2283	4	3	27	\N	\N	\N	\N
2284	4	3	28	\N	\N	\N	\N
2285	4	3	29	\N	\N	\N	\N
2286	4	3	30	\N	\N	\N	\N
2287	4	3	31	\N	\N	\N	\N
2288	4	3	32	\N	\N	\N	\N
2289	4	3	33	\N	\N	\N	\N
2290	4	3	34	\N	\N	\N	\N
2291	4	3	35	\N	\N	\N	\N
2292	4	3	36	\N	\N	\N	\N
2293	4	3	37	\N	\N	\N	\N
2294	4	3	38	\N	\N	\N	\N
2295	4	3	39	\N	\N	\N	\N
2296	4	3	40	\N	\N	\N	\N
2297	4	3	41	\N	\N	\N	\N
2298	4	3	42	\N	\N	\N	\N
2299	4	3	43	\N	\N	\N	\N
2300	4	3	44	\N	\N	\N	\N
2301	4	3	45	\N	\N	\N	\N
2302	4	3	46	\N	\N	\N	\N
2303	4	3	47	\N	\N	\N	\N
2304	4	3	48	\N	\N	\N	\N
2305	4	4	1	\N	\N	\N	\N
2306	4	4	2	\N	\N	\N	\N
2307	4	4	3	\N	\N	\N	\N
2308	4	4	4	\N	\N	\N	\N
2309	4	4	5	\N	\N	\N	\N
2310	4	4	6	\N	\N	\N	\N
2311	4	4	7	\N	\N	\N	\N
2312	4	4	8	\N	\N	\N	\N
2313	4	4	9	\N	\N	\N	\N
2314	4	4	10	\N	\N	\N	\N
2315	4	4	11	\N	\N	\N	\N
2316	4	4	12	\N	\N	\N	\N
2317	4	4	13	\N	\N	\N	\N
2318	4	4	14	\N	\N	\N	\N
2319	4	4	15	\N	\N	\N	\N
2320	4	4	16	\N	\N	\N	\N
2321	4	4	17	\N	\N	\N	\N
2322	4	4	18	\N	\N	\N	\N
2323	4	4	19	\N	\N	\N	\N
2324	4	4	20	\N	\N	\N	\N
2325	4	4	21	\N	\N	\N	\N
2326	4	4	22	\N	\N	\N	\N
2327	4	4	23	\N	\N	\N	\N
2328	4	4	24	\N	\N	\N	\N
2329	4	4	25	\N	\N	\N	\N
2330	4	4	26	\N	\N	\N	\N
2331	4	4	27	\N	\N	\N	\N
2332	4	4	28	\N	\N	\N	\N
2333	4	4	29	\N	\N	\N	\N
2334	4	4	30	\N	\N	\N	\N
2335	4	4	31	\N	\N	\N	\N
2336	4	4	32	\N	\N	\N	\N
2337	4	4	33	\N	\N	\N	\N
2338	4	4	34	\N	\N	\N	\N
2339	4	4	35	\N	\N	\N	\N
2340	4	4	36	\N	\N	\N	\N
2341	4	4	37	\N	\N	\N	\N
2342	4	4	38	\N	\N	\N	\N
2343	4	4	39	\N	\N	\N	\N
2344	4	4	40	\N	\N	\N	\N
2345	4	4	41	\N	\N	\N	\N
2346	4	4	42	\N	\N	\N	\N
2347	4	4	43	\N	\N	\N	\N
2348	4	4	44	\N	\N	\N	\N
2349	4	4	45	\N	\N	\N	\N
2350	4	4	46	\N	\N	\N	\N
2351	4	4	47	\N	\N	\N	\N
2352	4	4	48	\N	\N	\N	\N
2353	4	5	1	\N	\N	\N	\N
2354	4	5	2	\N	\N	\N	\N
2355	4	5	3	\N	\N	\N	\N
2356	4	5	4	\N	\N	\N	\N
2357	4	5	5	\N	\N	\N	\N
2358	4	5	6	\N	\N	\N	\N
2359	4	5	7	\N	\N	\N	\N
2360	4	5	8	\N	\N	\N	\N
2361	4	5	9	\N	\N	\N	\N
2362	4	5	10	\N	\N	\N	\N
2363	4	5	11	\N	\N	\N	\N
2364	4	5	12	\N	\N	\N	\N
2365	4	5	13	\N	\N	\N	\N
2366	4	5	14	\N	\N	\N	\N
2367	4	5	15	\N	\N	\N	\N
2368	4	5	16	\N	\N	\N	\N
2369	4	5	17	\N	\N	\N	\N
2370	4	5	18	\N	\N	\N	\N
2371	4	5	19	\N	\N	\N	\N
2372	4	5	20	\N	\N	\N	\N
2373	4	5	21	\N	\N	\N	\N
2374	4	5	22	\N	\N	\N	\N
2375	4	5	23	\N	\N	\N	\N
2376	4	5	24	\N	\N	\N	\N
2377	4	5	25	\N	\N	\N	\N
2378	4	5	26	\N	\N	\N	\N
2379	4	5	27	\N	\N	\N	\N
2380	4	5	28	\N	\N	\N	\N
2381	4	5	29	\N	\N	\N	\N
2382	4	5	30	\N	\N	\N	\N
2383	4	5	31	\N	\N	\N	\N
2384	4	5	32	\N	\N	\N	\N
2385	4	5	33	\N	\N	\N	\N
2386	4	5	34	\N	\N	\N	\N
2387	4	5	35	\N	\N	\N	\N
2388	4	5	36	\N	\N	\N	\N
2389	4	5	37	\N	\N	\N	\N
2390	4	5	38	\N	\N	\N	\N
2391	4	5	39	\N	\N	\N	\N
2392	4	5	40	\N	\N	\N	\N
2393	4	5	41	\N	\N	\N	\N
2394	4	5	42	\N	\N	\N	\N
2395	4	5	43	\N	\N	\N	\N
2396	4	5	44	\N	\N	\N	\N
2397	4	5	45	\N	\N	\N	\N
2398	4	5	46	\N	\N	\N	\N
2399	4	5	47	\N	\N	\N	\N
2400	4	5	48	\N	\N	\N	\N
2401	4	6	1	\N	\N	\N	\N
2402	4	6	2	\N	\N	\N	\N
2403	4	6	3	\N	\N	\N	\N
2404	4	6	4	\N	\N	\N	\N
2405	4	6	5	\N	\N	\N	\N
2406	4	6	6	\N	\N	\N	\N
2407	4	6	7	\N	\N	\N	\N
2408	4	6	8	\N	\N	\N	\N
2409	4	6	9	\N	\N	\N	\N
2410	4	6	10	\N	\N	\N	\N
2411	4	6	11	\N	\N	\N	\N
2412	4	6	12	\N	\N	\N	\N
2413	4	6	13	\N	\N	\N	\N
2414	4	6	14	\N	\N	\N	\N
2415	4	6	15	\N	\N	\N	\N
2416	4	6	16	\N	\N	\N	\N
2417	4	6	17	\N	\N	\N	\N
2418	4	6	18	\N	\N	\N	\N
2419	4	6	19	\N	\N	\N	\N
2420	4	6	20	\N	\N	\N	\N
2421	4	6	21	\N	\N	\N	\N
2422	4	6	22	\N	\N	\N	\N
2423	4	6	23	\N	\N	\N	\N
2424	4	6	24	\N	\N	\N	\N
2425	4	6	25	\N	\N	\N	\N
2426	4	6	26	\N	\N	\N	\N
2427	4	6	27	\N	\N	\N	\N
2428	4	6	28	\N	\N	\N	\N
2429	4	6	29	\N	\N	\N	\N
2430	4	6	30	\N	\N	\N	\N
2431	4	6	31	\N	\N	\N	\N
2432	4	6	32	\N	\N	\N	\N
2433	4	6	33	\N	\N	\N	\N
2434	4	6	34	\N	\N	\N	\N
2435	4	6	35	\N	\N	\N	\N
2436	4	6	36	\N	\N	\N	\N
2437	4	6	37	\N	\N	\N	\N
2438	4	6	38	\N	\N	\N	\N
2439	4	6	39	\N	\N	\N	\N
2440	4	6	40	\N	\N	\N	\N
2441	4	6	41	\N	\N	\N	\N
2442	4	6	42	\N	\N	\N	\N
2443	4	6	43	\N	\N	\N	\N
2444	4	6	44	\N	\N	\N	\N
2445	4	6	45	\N	\N	\N	\N
2446	4	6	46	\N	\N	\N	\N
2447	4	6	47	\N	\N	\N	\N
2448	4	6	48	\N	\N	\N	\N
2449	4	7	1	\N	\N	\N	\N
2450	4	7	2	\N	\N	\N	\N
2451	4	7	3	\N	\N	\N	\N
2452	4	7	4	\N	\N	\N	\N
2453	4	7	5	\N	\N	\N	\N
2454	4	7	6	\N	\N	\N	\N
2455	4	7	7	\N	\N	\N	\N
2456	4	7	8	\N	\N	\N	\N
2457	4	7	9	\N	\N	\N	\N
2458	4	7	10	\N	\N	\N	\N
2459	4	7	11	\N	\N	\N	\N
2460	4	7	12	\N	\N	\N	\N
2461	4	7	13	\N	\N	\N	\N
2462	4	7	14	\N	\N	\N	\N
2463	4	7	15	\N	\N	\N	\N
2464	4	7	16	\N	\N	\N	\N
2465	4	7	17	\N	\N	\N	\N
2466	4	7	18	\N	\N	\N	\N
2467	4	7	19	\N	\N	\N	\N
2468	4	7	20	\N	\N	\N	\N
2469	4	7	21	\N	\N	\N	\N
2470	4	7	22	\N	\N	\N	\N
2471	4	7	23	\N	\N	\N	\N
2472	4	7	24	\N	\N	\N	\N
2473	4	7	25	\N	\N	\N	\N
2474	4	7	26	\N	\N	\N	\N
2475	4	7	27	\N	\N	\N	\N
2476	4	7	28	\N	\N	\N	\N
2477	4	7	29	\N	\N	\N	\N
2478	4	7	30	\N	\N	\N	\N
2479	4	7	31	\N	\N	\N	\N
2480	4	7	32	\N	\N	\N	\N
2481	4	7	33	\N	\N	\N	\N
2482	4	7	34	\N	\N	\N	\N
2483	4	7	35	\N	\N	\N	\N
2484	4	7	36	\N	\N	\N	\N
2485	4	7	37	\N	\N	\N	\N
2486	4	7	38	\N	\N	\N	\N
2487	4	7	39	\N	\N	\N	\N
2488	4	7	40	\N	\N	\N	\N
2489	4	7	41	\N	\N	\N	\N
2490	4	7	42	\N	\N	\N	\N
2491	4	7	43	\N	\N	\N	\N
2492	4	7	44	\N	\N	\N	\N
2493	4	7	45	\N	\N	\N	\N
2494	4	7	46	\N	\N	\N	\N
2495	4	7	47	\N	\N	\N	\N
2496	4	7	48	\N	\N	\N	\N
2497	4	8	1	\N	\N	\N	\N
2498	4	8	2	\N	\N	\N	\N
2499	4	8	3	\N	\N	\N	\N
2500	4	8	4	\N	\N	\N	\N
2501	4	8	5	\N	\N	\N	\N
2502	4	8	6	\N	\N	\N	\N
2503	4	8	7	\N	\N	\N	\N
2504	4	8	8	\N	\N	\N	\N
2505	4	8	9	\N	\N	\N	\N
2506	4	8	10	\N	\N	\N	\N
2507	4	8	11	\N	\N	\N	\N
2508	4	8	12	\N	\N	\N	\N
2509	4	8	13	\N	\N	\N	\N
2510	4	8	14	\N	\N	\N	\N
2511	4	8	15	\N	\N	\N	\N
2512	4	8	16	\N	\N	\N	\N
2513	4	8	17	\N	\N	\N	\N
2514	4	8	18	\N	\N	\N	\N
2515	4	8	19	\N	\N	\N	\N
2516	4	8	20	\N	\N	\N	\N
2517	4	8	21	\N	\N	\N	\N
2518	4	8	22	\N	\N	\N	\N
2519	4	8	23	\N	\N	\N	\N
2520	4	8	24	\N	\N	\N	\N
2521	4	8	25	\N	\N	\N	\N
2522	4	8	26	\N	\N	\N	\N
2523	4	8	27	\N	\N	\N	\N
2524	4	8	28	\N	\N	\N	\N
2525	4	8	29	\N	\N	\N	\N
2526	4	8	30	\N	\N	\N	\N
2527	4	8	31	\N	\N	\N	\N
2528	4	8	32	\N	\N	\N	\N
2529	4	8	33	\N	\N	\N	\N
2530	4	8	34	\N	\N	\N	\N
2531	4	8	35	\N	\N	\N	\N
2532	4	8	36	\N	\N	\N	\N
2533	4	8	37	\N	\N	\N	\N
2534	4	8	38	\N	\N	\N	\N
2535	4	8	39	\N	\N	\N	\N
2536	4	8	40	\N	\N	\N	\N
2537	4	8	41	\N	\N	\N	\N
2538	4	8	42	\N	\N	\N	\N
2539	4	8	43	\N	\N	\N	\N
2540	4	8	44	\N	\N	\N	\N
2541	4	8	45	\N	\N	\N	\N
2542	4	8	46	\N	\N	\N	\N
2543	4	8	47	\N	\N	\N	\N
2544	4	8	48	\N	\N	\N	\N
2545	4	9	1	\N	\N	\N	\N
2546	4	9	2	\N	\N	\N	\N
2547	4	9	3	\N	\N	\N	\N
2548	4	9	4	\N	\N	\N	\N
2549	4	9	5	\N	\N	\N	\N
2550	4	9	6	\N	\N	\N	\N
2551	4	9	7	\N	\N	\N	\N
2552	4	9	8	\N	\N	\N	\N
2553	4	9	9	\N	\N	\N	\N
2554	4	9	10	\N	\N	\N	\N
2555	4	9	11	\N	\N	\N	\N
2556	4	9	12	\N	\N	\N	\N
2557	4	9	13	\N	\N	\N	\N
2558	4	9	14	\N	\N	\N	\N
2559	4	9	15	\N	\N	\N	\N
2560	4	9	16	\N	\N	\N	\N
2561	4	9	17	\N	\N	\N	\N
2562	4	9	18	\N	\N	\N	\N
2563	4	9	19	\N	\N	\N	\N
2564	4	9	20	\N	\N	\N	\N
2565	4	9	21	\N	\N	\N	\N
2566	4	9	22	\N	\N	\N	\N
2567	4	9	23	\N	\N	\N	\N
2568	4	9	24	\N	\N	\N	\N
2569	4	9	25	\N	\N	\N	\N
2570	4	9	26	\N	\N	\N	\N
2571	4	9	27	\N	\N	\N	\N
2572	4	9	28	\N	\N	\N	\N
2573	4	9	29	\N	\N	\N	\N
2574	4	9	30	\N	\N	\N	\N
2575	4	9	31	\N	\N	\N	\N
2576	4	9	32	\N	\N	\N	\N
2577	4	9	33	\N	\N	\N	\N
2578	4	9	34	\N	\N	\N	\N
2579	4	9	35	\N	\N	\N	\N
2580	4	9	36	\N	\N	\N	\N
2581	4	9	37	\N	\N	\N	\N
2582	4	9	38	\N	\N	\N	\N
2583	4	9	39	\N	\N	\N	\N
2584	4	9	40	\N	\N	\N	\N
2585	4	9	41	\N	\N	\N	\N
2586	4	9	42	\N	\N	\N	\N
2587	4	9	43	\N	\N	\N	\N
2588	4	9	44	\N	\N	\N	\N
2589	4	9	45	\N	\N	\N	\N
2590	4	9	46	\N	\N	\N	\N
2591	4	9	47	\N	\N	\N	\N
2592	4	9	48	\N	\N	\N	\N
2593	4	10	1	\N	\N	\N	\N
2594	4	10	2	\N	\N	\N	\N
2595	4	10	3	\N	\N	\N	\N
2596	4	10	4	\N	\N	\N	\N
2597	4	10	5	\N	\N	\N	\N
2598	4	10	6	\N	\N	\N	\N
2599	4	10	7	\N	\N	\N	\N
2600	4	10	8	\N	\N	\N	\N
2601	4	10	9	\N	\N	\N	\N
2602	4	10	10	\N	\N	\N	\N
2603	4	10	11	\N	\N	\N	\N
2604	4	10	12	\N	\N	\N	\N
2605	4	10	13	\N	\N	\N	\N
2606	4	10	14	\N	\N	\N	\N
2607	4	10	15	\N	\N	\N	\N
2608	4	10	16	\N	\N	\N	\N
2609	4	10	17	\N	\N	\N	\N
2610	4	10	18	\N	\N	\N	\N
2611	4	10	19	\N	\N	\N	\N
2612	4	10	20	\N	\N	\N	\N
2613	4	10	21	\N	\N	\N	\N
2614	4	10	22	\N	\N	\N	\N
2615	4	10	23	\N	\N	\N	\N
2616	4	10	24	\N	\N	\N	\N
2617	4	10	25	\N	\N	\N	\N
2618	4	10	26	\N	\N	\N	\N
2619	4	10	27	\N	\N	\N	\N
2620	4	10	28	\N	\N	\N	\N
2621	4	10	29	\N	\N	\N	\N
2622	4	10	30	\N	\N	\N	\N
2623	4	10	31	\N	\N	\N	\N
2624	4	10	32	\N	\N	\N	\N
2625	4	10	33	\N	\N	\N	\N
2626	4	10	34	\N	\N	\N	\N
2627	4	10	35	\N	\N	\N	\N
2628	4	10	36	\N	\N	\N	\N
2629	4	10	37	\N	\N	\N	\N
2630	4	10	38	\N	\N	\N	\N
2631	4	10	39	\N	\N	\N	\N
2632	4	10	40	\N	\N	\N	\N
2633	4	10	41	\N	\N	\N	\N
2634	4	10	42	\N	\N	\N	\N
2635	4	10	43	\N	\N	\N	\N
2636	4	10	44	\N	\N	\N	\N
2637	4	10	45	\N	\N	\N	\N
2638	4	10	46	\N	\N	\N	\N
2639	4	10	47	\N	\N	\N	\N
2640	4	10	48	\N	\N	\N	\N
2641	4	11	1	\N	\N	\N	\N
2642	4	11	2	\N	\N	\N	\N
2643	4	11	3	\N	\N	\N	\N
2644	4	11	4	\N	\N	\N	\N
2645	4	11	5	\N	\N	\N	\N
2646	4	11	6	\N	\N	\N	\N
2647	4	11	7	\N	\N	\N	\N
2648	4	11	8	\N	\N	\N	\N
2649	4	11	9	\N	\N	\N	\N
2650	4	11	10	\N	\N	\N	\N
2651	4	11	11	\N	\N	\N	\N
2652	4	11	12	\N	\N	\N	\N
2653	4	11	13	\N	\N	\N	\N
2654	4	11	14	\N	\N	\N	\N
2655	4	11	15	\N	\N	\N	\N
2656	4	11	16	\N	\N	\N	\N
2657	4	11	17	\N	\N	\N	\N
2658	4	11	18	\N	\N	\N	\N
2659	4	11	19	\N	\N	\N	\N
2660	4	11	20	\N	\N	\N	\N
2661	4	11	21	\N	\N	\N	\N
2662	4	11	22	\N	\N	\N	\N
2663	4	11	23	\N	\N	\N	\N
2664	4	11	24	\N	\N	\N	\N
2665	4	11	25	\N	\N	\N	\N
2666	4	11	26	\N	\N	\N	\N
2667	4	11	27	\N	\N	\N	\N
2668	4	11	28	\N	\N	\N	\N
2669	4	11	29	\N	\N	\N	\N
2670	4	11	30	\N	\N	\N	\N
2671	4	11	31	\N	\N	\N	\N
2672	4	11	32	\N	\N	\N	\N
2673	4	11	33	\N	\N	\N	\N
2674	4	11	34	\N	\N	\N	\N
2675	4	11	35	\N	\N	\N	\N
2676	4	11	36	\N	\N	\N	\N
2677	4	11	37	\N	\N	\N	\N
2678	4	11	38	\N	\N	\N	\N
2679	4	11	39	\N	\N	\N	\N
2680	4	11	40	\N	\N	\N	\N
2681	4	11	41	\N	\N	\N	\N
2682	4	11	42	\N	\N	\N	\N
2683	4	11	43	\N	\N	\N	\N
2684	4	11	44	\N	\N	\N	\N
2685	4	11	45	\N	\N	\N	\N
2686	4	11	46	\N	\N	\N	\N
2687	4	11	47	\N	\N	\N	\N
2688	4	11	48	\N	\N	\N	\N
2689	4	12	1	\N	\N	\N	\N
2690	4	12	2	\N	\N	\N	\N
2691	4	12	3	\N	\N	\N	\N
2692	4	12	4	\N	\N	\N	\N
2693	4	12	5	\N	\N	\N	\N
2694	4	12	6	\N	\N	\N	\N
2695	4	12	7	\N	\N	\N	\N
2696	4	12	8	\N	\N	\N	\N
2697	4	12	9	\N	\N	\N	\N
2698	4	12	10	\N	\N	\N	\N
2699	4	12	11	\N	\N	\N	\N
2700	4	12	12	\N	\N	\N	\N
2701	4	12	13	\N	\N	\N	\N
2702	4	12	14	\N	\N	\N	\N
2703	4	12	15	\N	\N	\N	\N
2704	4	12	16	\N	\N	\N	\N
2705	4	12	17	\N	\N	\N	\N
2706	4	12	18	\N	\N	\N	\N
2707	4	12	19	\N	\N	\N	\N
2708	4	12	20	\N	\N	\N	\N
2709	4	12	21	\N	\N	\N	\N
2710	4	12	22	\N	\N	\N	\N
2711	4	12	23	\N	\N	\N	\N
2712	4	12	24	\N	\N	\N	\N
2713	4	12	25	\N	\N	\N	\N
2714	4	12	26	\N	\N	\N	\N
2715	4	12	27	\N	\N	\N	\N
2716	4	12	28	\N	\N	\N	\N
2717	4	12	29	\N	\N	\N	\N
2718	4	12	30	\N	\N	\N	\N
2719	4	12	31	\N	\N	\N	\N
2720	4	12	32	\N	\N	\N	\N
2721	4	12	33	\N	\N	\N	\N
2722	4	12	34	\N	\N	\N	\N
2723	4	12	35	\N	\N	\N	\N
2724	4	12	36	\N	\N	\N	\N
2725	4	12	37	\N	\N	\N	\N
2726	4	12	38	\N	\N	\N	\N
2727	4	12	39	\N	\N	\N	\N
2728	4	12	40	\N	\N	\N	\N
2729	4	12	41	\N	\N	\N	\N
2730	4	12	42	\N	\N	\N	\N
2731	4	12	43	\N	\N	\N	\N
2732	4	12	44	\N	\N	\N	\N
2733	4	12	45	\N	\N	\N	\N
2734	4	12	46	\N	\N	\N	\N
2735	4	12	47	\N	\N	\N	\N
2736	4	12	48	\N	\N	\N	\N
2737	4	13	1	\N	\N	\N	\N
2738	4	13	2	\N	\N	\N	\N
2739	4	13	3	\N	\N	\N	\N
2740	4	13	4	\N	\N	\N	\N
2741	4	13	5	\N	\N	\N	\N
2742	4	13	6	\N	\N	\N	\N
2743	4	13	7	\N	\N	\N	\N
2744	4	13	8	\N	\N	\N	\N
2745	4	13	9	\N	\N	\N	\N
2746	4	13	10	\N	\N	\N	\N
2747	4	13	11	\N	\N	\N	\N
2748	4	13	12	\N	\N	\N	\N
2749	4	13	13	\N	\N	\N	\N
2750	4	13	14	\N	\N	\N	\N
2751	4	13	15	\N	\N	\N	\N
2752	4	13	16	\N	\N	\N	\N
2753	4	13	17	\N	\N	\N	\N
2754	4	13	18	\N	\N	\N	\N
2755	4	13	19	\N	\N	\N	\N
2756	4	13	20	\N	\N	\N	\N
2757	4	13	21	\N	\N	\N	\N
2758	4	13	22	\N	\N	\N	\N
2759	4	13	23	\N	\N	\N	\N
2760	4	13	24	\N	\N	\N	\N
2761	4	13	25	\N	\N	\N	\N
2762	4	13	26	\N	\N	\N	\N
2763	4	13	27	\N	\N	\N	\N
2764	4	13	28	\N	\N	\N	\N
2765	4	13	29	\N	\N	\N	\N
2766	4	13	30	\N	\N	\N	\N
2767	4	13	31	\N	\N	\N	\N
2768	4	13	32	\N	\N	\N	\N
2769	4	13	33	\N	\N	\N	\N
2770	4	13	34	\N	\N	\N	\N
2771	4	13	35	\N	\N	\N	\N
2772	4	13	36	\N	\N	\N	\N
2773	4	13	37	\N	\N	\N	\N
2774	4	13	38	\N	\N	\N	\N
2775	4	13	39	\N	\N	\N	\N
2776	4	13	40	\N	\N	\N	\N
2777	4	13	41	\N	\N	\N	\N
2778	4	13	42	\N	\N	\N	\N
2779	4	13	43	\N	\N	\N	\N
2780	4	13	44	\N	\N	\N	\N
2781	4	13	45	\N	\N	\N	\N
2782	4	13	46	\N	\N	\N	\N
2783	4	13	47	\N	\N	\N	\N
2784	4	13	48	\N	\N	\N	\N
2785	4	14	1	\N	\N	\N	\N
2786	4	14	2	\N	\N	\N	\N
2787	4	14	3	\N	\N	\N	\N
2788	4	14	4	\N	\N	\N	\N
2789	4	14	5	\N	\N	\N	\N
2790	4	14	6	\N	\N	\N	\N
2791	4	14	7	\N	\N	\N	\N
2792	4	14	8	\N	\N	\N	\N
2793	4	14	9	\N	\N	\N	\N
2794	4	14	10	\N	\N	\N	\N
2795	4	14	11	\N	\N	\N	\N
2796	4	14	12	\N	\N	\N	\N
2797	4	14	13	\N	\N	\N	\N
2798	4	14	14	\N	\N	\N	\N
2799	4	14	15	\N	\N	\N	\N
2800	4	14	16	\N	\N	\N	\N
2801	4	14	17	\N	\N	\N	\N
2802	4	14	18	\N	\N	\N	\N
2803	4	14	19	\N	\N	\N	\N
2804	4	14	20	\N	\N	\N	\N
2805	4	14	21	\N	\N	\N	\N
2806	4	14	22	\N	\N	\N	\N
2807	4	14	23	\N	\N	\N	\N
2808	4	14	24	\N	\N	\N	\N
2809	4	14	25	\N	\N	\N	\N
2810	4	14	26	\N	\N	\N	\N
2811	4	14	27	\N	\N	\N	\N
2812	4	14	28	\N	\N	\N	\N
2813	4	14	29	\N	\N	\N	\N
2814	4	14	30	\N	\N	\N	\N
2815	4	14	31	\N	\N	\N	\N
2816	4	14	32	\N	\N	\N	\N
2817	4	14	33	\N	\N	\N	\N
2818	4	14	34	\N	\N	\N	\N
2819	4	14	35	\N	\N	\N	\N
2820	4	14	36	\N	\N	\N	\N
2821	4	14	37	\N	\N	\N	\N
2822	4	14	38	\N	\N	\N	\N
2823	4	14	39	\N	\N	\N	\N
2824	4	14	40	\N	\N	\N	\N
2825	4	14	41	\N	\N	\N	\N
2826	4	14	42	\N	\N	\N	\N
2827	4	14	43	\N	\N	\N	\N
2828	4	14	44	\N	\N	\N	\N
2829	4	14	45	\N	\N	\N	\N
2830	4	14	46	\N	\N	\N	\N
2831	4	14	47	\N	\N	\N	\N
2832	4	14	48	\N	\N	\N	\N
2833	4	15	1	\N	\N	\N	\N
2834	4	15	2	\N	\N	\N	\N
2835	4	15	3	\N	\N	\N	\N
2836	4	15	4	\N	\N	\N	\N
2837	4	15	5	\N	\N	\N	\N
2838	4	15	6	\N	\N	\N	\N
2839	4	15	7	\N	\N	\N	\N
2840	4	15	8	\N	\N	\N	\N
2841	4	15	9	\N	\N	\N	\N
2842	4	15	10	\N	\N	\N	\N
2843	4	15	11	\N	\N	\N	\N
2844	4	15	12	\N	\N	\N	\N
2845	4	15	13	\N	\N	\N	\N
2846	4	15	14	\N	\N	\N	\N
2847	4	15	15	\N	\N	\N	\N
2848	4	15	16	\N	\N	\N	\N
2849	4	15	17	\N	\N	\N	\N
2850	4	15	18	\N	\N	\N	\N
2851	4	15	19	\N	\N	\N	\N
2852	4	15	20	\N	\N	\N	\N
2853	4	15	21	\N	\N	\N	\N
2854	4	15	22	\N	\N	\N	\N
2855	4	15	23	\N	\N	\N	\N
2856	4	15	24	\N	\N	\N	\N
2857	4	15	25	\N	\N	\N	\N
2858	4	15	26	\N	\N	\N	\N
2859	4	15	27	\N	\N	\N	\N
2860	4	15	28	\N	\N	\N	\N
2861	4	15	29	\N	\N	\N	\N
2862	4	15	30	\N	\N	\N	\N
2863	4	15	31	\N	\N	\N	\N
2864	4	15	32	\N	\N	\N	\N
2865	4	15	33	\N	\N	\N	\N
2866	4	15	34	\N	\N	\N	\N
2867	4	15	35	\N	\N	\N	\N
2868	4	15	36	\N	\N	\N	\N
2869	4	15	37	\N	\N	\N	\N
2870	4	15	38	\N	\N	\N	\N
2871	4	15	39	\N	\N	\N	\N
2872	4	15	40	\N	\N	\N	\N
2873	4	15	41	\N	\N	\N	\N
2874	4	15	42	\N	\N	\N	\N
2875	4	15	43	\N	\N	\N	\N
2876	4	15	44	\N	\N	\N	\N
2877	4	15	45	\N	\N	\N	\N
2878	4	15	46	\N	\N	\N	\N
2879	4	15	47	\N	\N	\N	\N
2880	4	15	48	\N	\N	\N	\N
2881	5	1	1	\N	\N	\N	\N
2882	5	1	2	\N	\N	\N	\N
2883	5	1	3	\N	\N	\N	\N
2884	5	1	4	\N	\N	\N	\N
2885	5	1	5	\N	\N	\N	\N
2886	5	1	6	\N	\N	\N	\N
2887	5	1	7	\N	\N	\N	\N
2888	5	1	8	\N	\N	\N	\N
2889	5	1	9	\N	\N	\N	\N
2890	5	1	10	\N	\N	\N	\N
2891	5	1	11	\N	\N	\N	\N
2892	5	1	12	\N	\N	\N	\N
2893	5	1	13	\N	\N	\N	\N
2894	5	1	14	\N	\N	\N	\N
2895	5	1	15	\N	\N	\N	\N
2896	5	1	16	\N	\N	\N	\N
2897	5	1	17	\N	\N	\N	\N
2898	5	1	18	\N	\N	\N	\N
2899	5	1	19	\N	\N	\N	\N
2900	5	1	20	\N	\N	\N	\N
2901	5	1	21	\N	\N	\N	\N
2902	5	1	22	\N	\N	\N	\N
2903	5	1	23	\N	\N	\N	\N
2904	5	1	24	\N	\N	\N	\N
2905	5	1	25	\N	\N	\N	\N
2906	5	1	26	\N	\N	\N	\N
2907	5	1	27	\N	\N	\N	\N
2908	5	1	28	\N	\N	\N	\N
2909	5	1	29	\N	\N	\N	\N
2910	5	1	30	\N	\N	\N	\N
2911	5	1	31	\N	\N	\N	\N
2912	5	1	32	\N	\N	\N	\N
2913	5	1	33	\N	\N	\N	\N
2914	5	1	34	\N	\N	\N	\N
2915	5	1	35	\N	\N	\N	\N
2916	5	1	36	\N	\N	\N	\N
2917	5	1	37	\N	\N	\N	\N
2918	5	1	38	\N	\N	\N	\N
2919	5	1	39	\N	\N	\N	\N
2920	5	1	40	\N	\N	\N	\N
2921	5	1	41	\N	\N	\N	\N
2922	5	1	42	\N	\N	\N	\N
2923	5	1	43	\N	\N	\N	\N
2924	5	1	44	\N	\N	\N	\N
2925	5	1	45	\N	\N	\N	\N
2926	5	1	46	\N	\N	\N	\N
2927	5	1	47	\N	\N	\N	\N
2928	5	1	48	\N	\N	\N	\N
2929	5	2	1	\N	\N	\N	\N
2930	5	2	2	\N	\N	\N	\N
2931	5	2	3	\N	\N	\N	\N
2932	5	2	4	\N	\N	\N	\N
2933	5	2	5	\N	\N	\N	\N
2934	5	2	6	\N	\N	\N	\N
2935	5	2	7	\N	\N	\N	\N
2936	5	2	8	\N	\N	\N	\N
2937	5	2	9	\N	\N	\N	\N
2938	5	2	10	\N	\N	\N	\N
2939	5	2	11	\N	\N	\N	\N
2940	5	2	12	\N	\N	\N	\N
2941	5	2	13	\N	\N	\N	\N
2942	5	2	14	\N	\N	\N	\N
2943	5	2	15	\N	\N	\N	\N
2944	5	2	16	\N	\N	\N	\N
2945	5	2	17	\N	\N	\N	\N
2946	5	2	18	\N	\N	\N	\N
2947	5	2	19	\N	\N	\N	\N
2948	5	2	20	\N	\N	\N	\N
2949	5	2	21	\N	\N	\N	\N
2950	5	2	22	\N	\N	\N	\N
2951	5	2	23	\N	\N	\N	\N
2952	5	2	24	\N	\N	\N	\N
2953	5	2	25	\N	\N	\N	\N
2954	5	2	26	\N	\N	\N	\N
2955	5	2	27	\N	\N	\N	\N
2956	5	2	28	\N	\N	\N	\N
2957	5	2	29	\N	\N	\N	\N
2958	5	2	30	\N	\N	\N	\N
2959	5	2	31	\N	\N	\N	\N
2960	5	2	32	\N	\N	\N	\N
2961	5	2	33	\N	\N	\N	\N
2962	5	2	34	\N	\N	\N	\N
2963	5	2	35	\N	\N	\N	\N
2964	5	2	36	\N	\N	\N	\N
2965	5	2	37	\N	\N	\N	\N
2966	5	2	38	\N	\N	\N	\N
2967	5	2	39	\N	\N	\N	\N
2968	5	2	40	\N	\N	\N	\N
2969	5	2	41	\N	\N	\N	\N
2970	5	2	42	\N	\N	\N	\N
2971	5	2	43	\N	\N	\N	\N
2972	5	2	44	\N	\N	\N	\N
2973	5	2	45	\N	\N	\N	\N
2974	5	2	46	\N	\N	\N	\N
2975	5	2	47	\N	\N	\N	\N
2976	5	2	48	\N	\N	\N	\N
2977	5	3	1	\N	\N	\N	\N
2978	5	3	2	\N	\N	\N	\N
2979	5	3	3	\N	\N	\N	\N
2980	5	3	4	\N	\N	\N	\N
2981	5	3	5	\N	\N	\N	\N
2982	5	3	6	\N	\N	\N	\N
2983	5	3	7	\N	\N	\N	\N
2984	5	3	8	\N	\N	\N	\N
2985	5	3	9	\N	\N	\N	\N
2986	5	3	10	\N	\N	\N	\N
2987	5	3	11	\N	\N	\N	\N
2988	5	3	12	\N	\N	\N	\N
2989	5	3	13	\N	\N	\N	\N
2990	5	3	14	\N	\N	\N	\N
2991	5	3	15	\N	\N	\N	\N
2992	5	3	16	\N	\N	\N	\N
2993	5	3	17	\N	\N	\N	\N
2994	5	3	18	\N	\N	\N	\N
2995	5	3	19	\N	\N	\N	\N
2996	5	3	20	\N	\N	\N	\N
2997	5	3	21	\N	\N	\N	\N
2998	5	3	22	\N	\N	\N	\N
2999	5	3	23	\N	\N	\N	\N
3000	5	3	24	\N	\N	\N	\N
3001	5	3	25	\N	\N	\N	\N
3002	5	3	26	\N	\N	\N	\N
3003	5	3	27	\N	\N	\N	\N
3004	5	3	28	\N	\N	\N	\N
3005	5	3	29	\N	\N	\N	\N
3006	5	3	30	\N	\N	\N	\N
3007	5	3	31	\N	\N	\N	\N
3008	5	3	32	\N	\N	\N	\N
3009	5	3	33	\N	\N	\N	\N
3010	5	3	34	\N	\N	\N	\N
3011	5	3	35	\N	\N	\N	\N
3012	5	3	36	\N	\N	\N	\N
3013	5	3	37	\N	\N	\N	\N
3014	5	3	38	\N	\N	\N	\N
3015	5	3	39	\N	\N	\N	\N
3016	5	3	40	\N	\N	\N	\N
3017	5	3	41	\N	\N	\N	\N
3018	5	3	42	\N	\N	\N	\N
3019	5	3	43	\N	\N	\N	\N
3020	5	3	44	\N	\N	\N	\N
3021	5	3	45	\N	\N	\N	\N
3022	5	3	46	\N	\N	\N	\N
3023	5	3	47	\N	\N	\N	\N
3024	5	3	48	\N	\N	\N	\N
3025	5	4	1	\N	\N	\N	\N
3026	5	4	2	\N	\N	\N	\N
3027	5	4	3	\N	\N	\N	\N
3028	5	4	4	\N	\N	\N	\N
3029	5	4	5	\N	\N	\N	\N
3030	5	4	6	\N	\N	\N	\N
3031	5	4	7	\N	\N	\N	\N
3032	5	4	8	\N	\N	\N	\N
3033	5	4	9	\N	\N	\N	\N
3034	5	4	10	\N	\N	\N	\N
3035	5	4	11	\N	\N	\N	\N
3036	5	4	12	\N	\N	\N	\N
3037	5	4	13	\N	\N	\N	\N
3038	5	4	14	\N	\N	\N	\N
3039	5	4	15	\N	\N	\N	\N
3040	5	4	16	\N	\N	\N	\N
3041	5	4	17	\N	\N	\N	\N
3042	5	4	18	\N	\N	\N	\N
3043	5	4	19	\N	\N	\N	\N
3044	5	4	20	\N	\N	\N	\N
3045	5	4	21	\N	\N	\N	\N
3046	5	4	22	\N	\N	\N	\N
3047	5	4	23	\N	\N	\N	\N
3048	5	4	24	\N	\N	\N	\N
3049	5	4	25	\N	\N	\N	\N
3050	5	4	26	\N	\N	\N	\N
3051	5	4	27	\N	\N	\N	\N
3052	5	4	28	\N	\N	\N	\N
3053	5	4	29	\N	\N	\N	\N
3054	5	4	30	\N	\N	\N	\N
3055	5	4	31	\N	\N	\N	\N
3056	5	4	32	\N	\N	\N	\N
3057	5	4	33	\N	\N	\N	\N
3058	5	4	34	\N	\N	\N	\N
3059	5	4	35	\N	\N	\N	\N
3060	5	4	36	\N	\N	\N	\N
3061	5	4	37	\N	\N	\N	\N
3062	5	4	38	\N	\N	\N	\N
3063	5	4	39	\N	\N	\N	\N
3064	5	4	40	\N	\N	\N	\N
3065	5	4	41	\N	\N	\N	\N
3066	5	4	42	\N	\N	\N	\N
3067	5	4	43	\N	\N	\N	\N
3068	5	4	44	\N	\N	\N	\N
3069	5	4	45	\N	\N	\N	\N
3070	5	4	46	\N	\N	\N	\N
3071	5	4	47	\N	\N	\N	\N
3072	5	4	48	\N	\N	\N	\N
3073	5	5	1	\N	\N	\N	\N
3074	5	5	2	\N	\N	\N	\N
3075	5	5	3	\N	\N	\N	\N
3076	5	5	4	\N	\N	\N	\N
3077	5	5	5	\N	\N	\N	\N
3078	5	5	6	\N	\N	\N	\N
3079	5	5	7	\N	\N	\N	\N
3080	5	5	8	\N	\N	\N	\N
3081	5	5	9	\N	\N	\N	\N
3082	5	5	10	\N	\N	\N	\N
3083	5	5	11	\N	\N	\N	\N
3084	5	5	12	\N	\N	\N	\N
3085	5	5	13	\N	\N	\N	\N
3086	5	5	14	\N	\N	\N	\N
3087	5	5	15	\N	\N	\N	\N
3088	5	5	16	\N	\N	\N	\N
3089	5	5	17	\N	\N	\N	\N
3090	5	5	18	\N	\N	\N	\N
3091	5	5	19	\N	\N	\N	\N
3092	5	5	20	\N	\N	\N	\N
3093	5	5	21	\N	\N	\N	\N
3094	5	5	22	\N	\N	\N	\N
3095	5	5	23	\N	\N	\N	\N
3096	5	5	24	\N	\N	\N	\N
3097	5	5	25	\N	\N	\N	\N
3098	5	5	26	\N	\N	\N	\N
3099	5	5	27	\N	\N	\N	\N
3100	5	5	28	\N	\N	\N	\N
3101	5	5	29	\N	\N	\N	\N
3102	5	5	30	\N	\N	\N	\N
3103	5	5	31	\N	\N	\N	\N
3104	5	5	32	\N	\N	\N	\N
3105	5	5	33	\N	\N	\N	\N
3106	5	5	34	\N	\N	\N	\N
3107	5	5	35	\N	\N	\N	\N
3108	5	5	36	\N	\N	\N	\N
3109	5	5	37	\N	\N	\N	\N
3110	5	5	38	\N	\N	\N	\N
3111	5	5	39	\N	\N	\N	\N
3112	5	5	40	\N	\N	\N	\N
3113	5	5	41	\N	\N	\N	\N
3114	5	5	42	\N	\N	\N	\N
3115	5	5	43	\N	\N	\N	\N
3116	5	5	44	\N	\N	\N	\N
3117	5	5	45	\N	\N	\N	\N
3118	5	5	46	\N	\N	\N	\N
3119	5	5	47	\N	\N	\N	\N
3120	5	5	48	\N	\N	\N	\N
3121	5	6	1	\N	\N	\N	\N
3122	5	6	2	\N	\N	\N	\N
3123	5	6	3	\N	\N	\N	\N
3124	5	6	4	\N	\N	\N	\N
3125	5	6	5	\N	\N	\N	\N
3126	5	6	6	\N	\N	\N	\N
3127	5	6	7	\N	\N	\N	\N
3128	5	6	8	\N	\N	\N	\N
3129	5	6	9	\N	\N	\N	\N
3130	5	6	10	\N	\N	\N	\N
3131	5	6	11	\N	\N	\N	\N
3132	5	6	12	\N	\N	\N	\N
3133	5	6	13	\N	\N	\N	\N
3134	5	6	14	\N	\N	\N	\N
3135	5	6	15	\N	\N	\N	\N
3136	5	6	16	\N	\N	\N	\N
3137	5	6	17	\N	\N	\N	\N
3138	5	6	18	\N	\N	\N	\N
3139	5	6	19	\N	\N	\N	\N
3140	5	6	20	\N	\N	\N	\N
3141	5	6	21	\N	\N	\N	\N
3142	5	6	22	\N	\N	\N	\N
3143	5	6	23	\N	\N	\N	\N
3144	5	6	24	\N	\N	\N	\N
3145	5	6	25	\N	\N	\N	\N
3146	5	6	26	\N	\N	\N	\N
3147	5	6	27	\N	\N	\N	\N
3148	5	6	28	\N	\N	\N	\N
3149	5	6	29	\N	\N	\N	\N
3150	5	6	30	\N	\N	\N	\N
3151	5	6	31	\N	\N	\N	\N
3152	5	6	32	\N	\N	\N	\N
3153	5	6	33	\N	\N	\N	\N
3154	5	6	34	\N	\N	\N	\N
3155	5	6	35	\N	\N	\N	\N
3156	5	6	36	\N	\N	\N	\N
3157	5	6	37	\N	\N	\N	\N
3158	5	6	38	\N	\N	\N	\N
3159	5	6	39	\N	\N	\N	\N
3160	5	6	40	\N	\N	\N	\N
3161	5	6	41	\N	\N	\N	\N
3162	5	6	42	\N	\N	\N	\N
3163	5	6	43	\N	\N	\N	\N
3164	5	6	44	\N	\N	\N	\N
3165	5	6	45	\N	\N	\N	\N
3166	5	6	46	\N	\N	\N	\N
3167	5	6	47	\N	\N	\N	\N
3168	5	6	48	\N	\N	\N	\N
3169	5	7	1	\N	\N	\N	\N
3170	5	7	2	\N	\N	\N	\N
3171	5	7	3	\N	\N	\N	\N
3172	5	7	4	\N	\N	\N	\N
3173	5	7	5	\N	\N	\N	\N
3174	5	7	6	\N	\N	\N	\N
3175	5	7	7	\N	\N	\N	\N
3176	5	7	8	\N	\N	\N	\N
3177	5	7	9	\N	\N	\N	\N
3178	5	7	10	\N	\N	\N	\N
3179	5	7	11	\N	\N	\N	\N
3180	5	7	12	\N	\N	\N	\N
3181	5	7	13	\N	\N	\N	\N
3182	5	7	14	\N	\N	\N	\N
3183	5	7	15	\N	\N	\N	\N
3184	5	7	16	\N	\N	\N	\N
3185	5	7	17	\N	\N	\N	\N
3186	5	7	18	\N	\N	\N	\N
3187	5	7	19	\N	\N	\N	\N
3188	5	7	20	\N	\N	\N	\N
3189	5	7	21	\N	\N	\N	\N
3190	5	7	22	\N	\N	\N	\N
3191	5	7	23	\N	\N	\N	\N
3192	5	7	24	\N	\N	\N	\N
3193	5	7	25	\N	\N	\N	\N
3194	5	7	26	\N	\N	\N	\N
3195	5	7	27	\N	\N	\N	\N
3196	5	7	28	\N	\N	\N	\N
3197	5	7	29	\N	\N	\N	\N
3198	5	7	30	\N	\N	\N	\N
3199	5	7	31	\N	\N	\N	\N
3200	5	7	32	\N	\N	\N	\N
3201	5	7	33	\N	\N	\N	\N
3202	5	7	34	\N	\N	\N	\N
3203	5	7	35	\N	\N	\N	\N
3204	5	7	36	\N	\N	\N	\N
3205	5	7	37	\N	\N	\N	\N
3206	5	7	38	\N	\N	\N	\N
3207	5	7	39	\N	\N	\N	\N
3208	5	7	40	\N	\N	\N	\N
3209	5	7	41	\N	\N	\N	\N
3210	5	7	42	\N	\N	\N	\N
3211	5	7	43	\N	\N	\N	\N
3212	5	7	44	\N	\N	\N	\N
3213	5	7	45	\N	\N	\N	\N
3214	5	7	46	\N	\N	\N	\N
3215	5	7	47	\N	\N	\N	\N
3216	5	7	48	\N	\N	\N	\N
3217	5	8	1	\N	\N	\N	\N
3218	5	8	2	\N	\N	\N	\N
3219	5	8	3	\N	\N	\N	\N
3220	5	8	4	\N	\N	\N	\N
3221	5	8	5	\N	\N	\N	\N
3222	5	8	6	\N	\N	\N	\N
3223	5	8	7	\N	\N	\N	\N
3224	5	8	8	\N	\N	\N	\N
3225	5	8	9	\N	\N	\N	\N
3226	5	8	10	\N	\N	\N	\N
3227	5	8	11	\N	\N	\N	\N
3228	5	8	12	\N	\N	\N	\N
3229	5	8	13	\N	\N	\N	\N
3230	5	8	14	\N	\N	\N	\N
3231	5	8	15	\N	\N	\N	\N
3232	5	8	16	\N	\N	\N	\N
3233	5	8	17	\N	\N	\N	\N
3234	5	8	18	\N	\N	\N	\N
3235	5	8	19	\N	\N	\N	\N
3236	5	8	20	\N	\N	\N	\N
3237	5	8	21	\N	\N	\N	\N
3238	5	8	22	\N	\N	\N	\N
3239	5	8	23	\N	\N	\N	\N
3240	5	8	24	\N	\N	\N	\N
3241	5	8	25	\N	\N	\N	\N
3242	5	8	26	\N	\N	\N	\N
3243	5	8	27	\N	\N	\N	\N
3244	5	8	28	\N	\N	\N	\N
3245	5	8	29	\N	\N	\N	\N
3246	5	8	30	\N	\N	\N	\N
3247	5	8	31	\N	\N	\N	\N
3248	5	8	32	\N	\N	\N	\N
3249	5	8	33	\N	\N	\N	\N
3250	5	8	34	\N	\N	\N	\N
3251	5	8	35	\N	\N	\N	\N
3252	5	8	36	\N	\N	\N	\N
3253	5	8	37	\N	\N	\N	\N
3254	5	8	38	\N	\N	\N	\N
3255	5	8	39	\N	\N	\N	\N
3256	5	8	40	\N	\N	\N	\N
3257	5	8	41	\N	\N	\N	\N
3258	5	8	42	\N	\N	\N	\N
3259	5	8	43	\N	\N	\N	\N
3260	5	8	44	\N	\N	\N	\N
3261	5	8	45	\N	\N	\N	\N
3262	5	8	46	\N	\N	\N	\N
3263	5	8	47	\N	\N	\N	\N
3264	5	8	48	\N	\N	\N	\N
3265	5	9	1	\N	\N	\N	\N
3266	5	9	2	\N	\N	\N	\N
3267	5	9	3	\N	\N	\N	\N
3268	5	9	4	\N	\N	\N	\N
3269	5	9	5	\N	\N	\N	\N
3270	5	9	6	\N	\N	\N	\N
3271	5	9	7	\N	\N	\N	\N
3272	5	9	8	\N	\N	\N	\N
3273	5	9	9	\N	\N	\N	\N
3274	5	9	10	\N	\N	\N	\N
3275	5	9	11	\N	\N	\N	\N
3276	5	9	12	\N	\N	\N	\N
3277	5	9	13	\N	\N	\N	\N
3278	5	9	14	\N	\N	\N	\N
3279	5	9	15	\N	\N	\N	\N
3280	5	9	16	\N	\N	\N	\N
3281	5	9	17	\N	\N	\N	\N
3282	5	9	18	\N	\N	\N	\N
3283	5	9	19	\N	\N	\N	\N
3284	5	9	20	\N	\N	\N	\N
3285	5	9	21	\N	\N	\N	\N
3286	5	9	22	\N	\N	\N	\N
3287	5	9	23	\N	\N	\N	\N
3288	5	9	24	\N	\N	\N	\N
3289	5	9	25	\N	\N	\N	\N
3290	5	9	26	\N	\N	\N	\N
3291	5	9	27	\N	\N	\N	\N
3292	5	9	28	\N	\N	\N	\N
3293	5	9	29	\N	\N	\N	\N
3294	5	9	30	\N	\N	\N	\N
3295	5	9	31	\N	\N	\N	\N
3296	5	9	32	\N	\N	\N	\N
3297	5	9	33	\N	\N	\N	\N
3298	5	9	34	\N	\N	\N	\N
3299	5	9	35	\N	\N	\N	\N
3300	5	9	36	\N	\N	\N	\N
3301	5	9	37	\N	\N	\N	\N
3302	5	9	38	\N	\N	\N	\N
3303	5	9	39	\N	\N	\N	\N
3304	5	9	40	\N	\N	\N	\N
3305	5	9	41	\N	\N	\N	\N
3306	5	9	42	\N	\N	\N	\N
3307	5	9	43	\N	\N	\N	\N
3308	5	9	44	\N	\N	\N	\N
3309	5	9	45	\N	\N	\N	\N
3310	5	9	46	\N	\N	\N	\N
3311	5	9	47	\N	\N	\N	\N
3312	5	9	48	\N	\N	\N	\N
3313	5	10	1	\N	\N	\N	\N
3314	5	10	2	\N	\N	\N	\N
3315	5	10	3	\N	\N	\N	\N
3316	5	10	4	\N	\N	\N	\N
3317	5	10	5	\N	\N	\N	\N
3318	5	10	6	\N	\N	\N	\N
3319	5	10	7	\N	\N	\N	\N
3320	5	10	8	\N	\N	\N	\N
3321	5	10	9	\N	\N	\N	\N
3322	5	10	10	\N	\N	\N	\N
3323	5	10	11	\N	\N	\N	\N
3324	5	10	12	\N	\N	\N	\N
3325	5	10	13	\N	\N	\N	\N
3326	5	10	14	\N	\N	\N	\N
3327	5	10	15	\N	\N	\N	\N
3328	5	10	16	\N	\N	\N	\N
3329	5	10	17	\N	\N	\N	\N
3330	5	10	18	\N	\N	\N	\N
3331	5	10	19	\N	\N	\N	\N
3332	5	10	20	\N	\N	\N	\N
3333	5	10	21	\N	\N	\N	\N
3334	5	10	22	\N	\N	\N	\N
3335	5	10	23	\N	\N	\N	\N
3336	5	10	24	\N	\N	\N	\N
3337	5	10	25	\N	\N	\N	\N
3338	5	10	26	\N	\N	\N	\N
3339	5	10	27	\N	\N	\N	\N
3340	5	10	28	\N	\N	\N	\N
3341	5	10	29	\N	\N	\N	\N
3342	5	10	30	\N	\N	\N	\N
3343	5	10	31	\N	\N	\N	\N
3344	5	10	32	\N	\N	\N	\N
3345	5	10	33	\N	\N	\N	\N
3346	5	10	34	\N	\N	\N	\N
3347	5	10	35	\N	\N	\N	\N
3348	5	10	36	\N	\N	\N	\N
3349	5	10	37	\N	\N	\N	\N
3350	5	10	38	\N	\N	\N	\N
3351	5	10	39	\N	\N	\N	\N
3352	5	10	40	\N	\N	\N	\N
3353	5	10	41	\N	\N	\N	\N
3354	5	10	42	\N	\N	\N	\N
3355	5	10	43	\N	\N	\N	\N
3356	5	10	44	\N	\N	\N	\N
3357	5	10	45	\N	\N	\N	\N
3358	5	10	46	\N	\N	\N	\N
3359	5	10	47	\N	\N	\N	\N
3360	5	10	48	\N	\N	\N	\N
3361	5	11	1	\N	\N	\N	\N
3362	5	11	2	\N	\N	\N	\N
3363	5	11	3	\N	\N	\N	\N
3364	5	11	4	\N	\N	\N	\N
3365	5	11	5	\N	\N	\N	\N
3366	5	11	6	\N	\N	\N	\N
3367	5	11	7	\N	\N	\N	\N
3368	5	11	8	\N	\N	\N	\N
3369	5	11	9	\N	\N	\N	\N
3370	5	11	10	\N	\N	\N	\N
3371	5	11	11	\N	\N	\N	\N
3372	5	11	12	\N	\N	\N	\N
3373	5	11	13	\N	\N	\N	\N
3374	5	11	14	\N	\N	\N	\N
3375	5	11	15	\N	\N	\N	\N
3376	5	11	16	\N	\N	\N	\N
3377	5	11	17	\N	\N	\N	\N
3378	5	11	18	\N	\N	\N	\N
3379	5	11	19	\N	\N	\N	\N
3380	5	11	20	\N	\N	\N	\N
3381	5	11	21	\N	\N	\N	\N
3382	5	11	22	\N	\N	\N	\N
3383	5	11	23	\N	\N	\N	\N
3384	5	11	24	\N	\N	\N	\N
3385	5	11	25	\N	\N	\N	\N
3386	5	11	26	\N	\N	\N	\N
3387	5	11	27	\N	\N	\N	\N
3388	5	11	28	\N	\N	\N	\N
3389	5	11	29	\N	\N	\N	\N
3390	5	11	30	\N	\N	\N	\N
3391	5	11	31	\N	\N	\N	\N
3392	5	11	32	\N	\N	\N	\N
3393	5	11	33	\N	\N	\N	\N
3394	5	11	34	\N	\N	\N	\N
3395	5	11	35	\N	\N	\N	\N
3396	5	11	36	\N	\N	\N	\N
3397	5	11	37	\N	\N	\N	\N
3398	5	11	38	\N	\N	\N	\N
3399	5	11	39	\N	\N	\N	\N
3400	5	11	40	\N	\N	\N	\N
3401	5	11	41	\N	\N	\N	\N
3402	5	11	42	\N	\N	\N	\N
3403	5	11	43	\N	\N	\N	\N
3404	5	11	44	\N	\N	\N	\N
3405	5	11	45	\N	\N	\N	\N
3406	5	11	46	\N	\N	\N	\N
3407	5	11	47	\N	\N	\N	\N
3408	5	11	48	\N	\N	\N	\N
3409	5	12	1	\N	\N	\N	\N
3410	5	12	2	\N	\N	\N	\N
3411	5	12	3	\N	\N	\N	\N
3412	5	12	4	\N	\N	\N	\N
3413	5	12	5	\N	\N	\N	\N
3414	5	12	6	\N	\N	\N	\N
3415	5	12	7	\N	\N	\N	\N
3416	5	12	8	\N	\N	\N	\N
3417	5	12	9	\N	\N	\N	\N
3418	5	12	10	\N	\N	\N	\N
3419	5	12	11	\N	\N	\N	\N
3420	5	12	12	\N	\N	\N	\N
3421	5	12	13	\N	\N	\N	\N
3422	5	12	14	\N	\N	\N	\N
3423	5	12	15	\N	\N	\N	\N
3424	5	12	16	\N	\N	\N	\N
3425	5	12	17	\N	\N	\N	\N
3426	5	12	18	\N	\N	\N	\N
3427	5	12	19	\N	\N	\N	\N
3428	5	12	20	\N	\N	\N	\N
3429	5	12	21	\N	\N	\N	\N
3430	5	12	22	\N	\N	\N	\N
3431	5	12	23	\N	\N	\N	\N
3432	5	12	24	\N	\N	\N	\N
3433	5	12	25	\N	\N	\N	\N
3434	5	12	26	\N	\N	\N	\N
3435	5	12	27	\N	\N	\N	\N
3436	5	12	28	\N	\N	\N	\N
3437	5	12	29	\N	\N	\N	\N
3438	5	12	30	\N	\N	\N	\N
3439	5	12	31	\N	\N	\N	\N
3440	5	12	32	\N	\N	\N	\N
3441	5	12	33	\N	\N	\N	\N
3442	5	12	34	\N	\N	\N	\N
3443	5	12	35	\N	\N	\N	\N
3444	5	12	36	\N	\N	\N	\N
3445	5	12	37	\N	\N	\N	\N
3446	5	12	38	\N	\N	\N	\N
3447	5	12	39	\N	\N	\N	\N
3448	5	12	40	\N	\N	\N	\N
3449	5	12	41	\N	\N	\N	\N
3450	5	12	42	\N	\N	\N	\N
3451	5	12	43	\N	\N	\N	\N
3452	5	12	44	\N	\N	\N	\N
3453	5	12	45	\N	\N	\N	\N
3454	5	12	46	\N	\N	\N	\N
3455	5	12	47	\N	\N	\N	\N
3456	5	12	48	\N	\N	\N	\N
3457	5	13	1	\N	\N	\N	\N
3458	5	13	2	\N	\N	\N	\N
3459	5	13	3	\N	\N	\N	\N
3460	5	13	4	\N	\N	\N	\N
3461	5	13	5	\N	\N	\N	\N
3462	5	13	6	\N	\N	\N	\N
3463	5	13	7	\N	\N	\N	\N
3464	5	13	8	\N	\N	\N	\N
3465	5	13	9	\N	\N	\N	\N
3466	5	13	10	\N	\N	\N	\N
3467	5	13	11	\N	\N	\N	\N
3468	5	13	12	\N	\N	\N	\N
3469	5	13	13	\N	\N	\N	\N
3470	5	13	14	\N	\N	\N	\N
3471	5	13	15	\N	\N	\N	\N
3472	5	13	16	\N	\N	\N	\N
3473	5	13	17	\N	\N	\N	\N
3474	5	13	18	\N	\N	\N	\N
3475	5	13	19	\N	\N	\N	\N
3476	5	13	20	\N	\N	\N	\N
3477	5	13	21	\N	\N	\N	\N
3478	5	13	22	\N	\N	\N	\N
3479	5	13	23	\N	\N	\N	\N
3480	5	13	24	\N	\N	\N	\N
3481	5	13	25	\N	\N	\N	\N
3482	5	13	26	\N	\N	\N	\N
3483	5	13	27	\N	\N	\N	\N
3484	5	13	28	\N	\N	\N	\N
3485	5	13	29	\N	\N	\N	\N
3486	5	13	30	\N	\N	\N	\N
3487	5	13	31	\N	\N	\N	\N
3488	5	13	32	\N	\N	\N	\N
3489	5	13	33	\N	\N	\N	\N
3490	5	13	34	\N	\N	\N	\N
3491	5	13	35	\N	\N	\N	\N
3492	5	13	36	\N	\N	\N	\N
3493	5	13	37	\N	\N	\N	\N
3494	5	13	38	\N	\N	\N	\N
3495	5	13	39	\N	\N	\N	\N
3496	5	13	40	\N	\N	\N	\N
3497	5	13	41	\N	\N	\N	\N
3498	5	13	42	\N	\N	\N	\N
3499	5	13	43	\N	\N	\N	\N
3500	5	13	44	\N	\N	\N	\N
3501	5	13	45	\N	\N	\N	\N
3502	5	13	46	\N	\N	\N	\N
3503	5	13	47	\N	\N	\N	\N
3504	5	13	48	\N	\N	\N	\N
3505	5	14	1	\N	\N	\N	\N
3506	5	14	2	\N	\N	\N	\N
3507	5	14	3	\N	\N	\N	\N
3508	5	14	4	\N	\N	\N	\N
3509	5	14	5	\N	\N	\N	\N
3510	5	14	6	\N	\N	\N	\N
3511	5	14	7	\N	\N	\N	\N
3512	5	14	8	\N	\N	\N	\N
3513	5	14	9	\N	\N	\N	\N
3514	5	14	10	\N	\N	\N	\N
3515	5	14	11	\N	\N	\N	\N
3516	5	14	12	\N	\N	\N	\N
3517	5	14	13	\N	\N	\N	\N
3518	5	14	14	\N	\N	\N	\N
3519	5	14	15	\N	\N	\N	\N
3520	5	14	16	\N	\N	\N	\N
3521	5	14	17	\N	\N	\N	\N
3522	5	14	18	\N	\N	\N	\N
3523	5	14	19	\N	\N	\N	\N
3524	5	14	20	\N	\N	\N	\N
3525	5	14	21	\N	\N	\N	\N
3526	5	14	22	\N	\N	\N	\N
3527	5	14	23	\N	\N	\N	\N
3528	5	14	24	\N	\N	\N	\N
3529	5	14	25	\N	\N	\N	\N
3530	5	14	26	\N	\N	\N	\N
3531	5	14	27	\N	\N	\N	\N
3532	5	14	28	\N	\N	\N	\N
3533	5	14	29	\N	\N	\N	\N
3534	5	14	30	\N	\N	\N	\N
3535	5	14	31	\N	\N	\N	\N
3536	5	14	32	\N	\N	\N	\N
3537	5	14	33	\N	\N	\N	\N
3538	5	14	34	\N	\N	\N	\N
3539	5	14	35	\N	\N	\N	\N
3540	5	14	36	\N	\N	\N	\N
3541	5	14	37	\N	\N	\N	\N
3542	5	14	38	\N	\N	\N	\N
3543	5	14	39	\N	\N	\N	\N
3544	5	14	40	\N	\N	\N	\N
3545	5	14	41	\N	\N	\N	\N
3546	5	14	42	\N	\N	\N	\N
3547	5	14	43	\N	\N	\N	\N
3548	5	14	44	\N	\N	\N	\N
3549	5	14	45	\N	\N	\N	\N
3550	5	14	46	\N	\N	\N	\N
3551	5	14	47	\N	\N	\N	\N
3552	5	14	48	\N	\N	\N	\N
3553	5	15	1	\N	\N	\N	\N
3554	5	15	2	\N	\N	\N	\N
3555	5	15	3	\N	\N	\N	\N
3556	5	15	4	\N	\N	\N	\N
3557	5	15	5	\N	\N	\N	\N
3558	5	15	6	\N	\N	\N	\N
3559	5	15	7	\N	\N	\N	\N
3560	5	15	8	\N	\N	\N	\N
3561	5	15	9	\N	\N	\N	\N
3562	5	15	10	\N	\N	\N	\N
3563	5	15	11	\N	\N	\N	\N
3564	5	15	12	\N	\N	\N	\N
3565	5	15	13	\N	\N	\N	\N
3566	5	15	14	\N	\N	\N	\N
3567	5	15	15	\N	\N	\N	\N
3568	5	15	16	\N	\N	\N	\N
3569	5	15	17	\N	\N	\N	\N
3570	5	15	18	\N	\N	\N	\N
3571	5	15	19	\N	\N	\N	\N
3572	5	15	20	\N	\N	\N	\N
3573	5	15	21	\N	\N	\N	\N
3574	5	15	22	\N	\N	\N	\N
3575	5	15	23	\N	\N	\N	\N
3576	5	15	24	\N	\N	\N	\N
3577	5	15	25	\N	\N	\N	\N
3578	5	15	26	\N	\N	\N	\N
3579	5	15	27	\N	\N	\N	\N
3580	5	15	28	\N	\N	\N	\N
3581	5	15	29	\N	\N	\N	\N
3582	5	15	30	\N	\N	\N	\N
3583	5	15	31	\N	\N	\N	\N
3584	5	15	32	\N	\N	\N	\N
3585	5	15	33	\N	\N	\N	\N
3586	5	15	34	\N	\N	\N	\N
3587	5	15	35	\N	\N	\N	\N
3588	5	15	36	\N	\N	\N	\N
3589	5	15	37	\N	\N	\N	\N
3590	5	15	38	\N	\N	\N	\N
3591	5	15	39	\N	\N	\N	\N
3592	5	15	40	\N	\N	\N	\N
3593	5	15	41	\N	\N	\N	\N
3594	5	15	42	\N	\N	\N	\N
3595	5	15	43	\N	\N	\N	\N
3596	5	15	44	\N	\N	\N	\N
3597	5	15	45	\N	\N	\N	\N
3598	5	15	46	\N	\N	\N	\N
3599	5	15	47	\N	\N	\N	\N
3600	5	15	48	\N	\N	\N	\N
3601	6	1	1	\N	\N	\N	\N
3602	6	1	2	\N	\N	\N	\N
3603	6	1	3	\N	\N	\N	\N
3604	6	1	4	\N	\N	\N	\N
3605	6	1	5	\N	\N	\N	\N
3606	6	1	6	\N	\N	\N	\N
3607	6	1	7	\N	\N	\N	\N
3608	6	1	8	\N	\N	\N	\N
3609	6	1	9	\N	\N	\N	\N
3610	6	1	10	\N	\N	\N	\N
3611	6	1	11	\N	\N	\N	\N
3612	6	1	12	\N	\N	\N	\N
3613	6	1	13	\N	\N	\N	\N
3614	6	1	14	\N	\N	\N	\N
3615	6	1	15	\N	\N	\N	\N
3616	6	1	16	\N	\N	\N	\N
3617	6	1	17	\N	\N	\N	\N
3618	6	1	18	\N	\N	\N	\N
3619	6	1	19	\N	\N	\N	\N
3620	6	1	20	\N	\N	\N	\N
3621	6	1	21	\N	\N	\N	\N
3622	6	1	22	\N	\N	\N	\N
3623	6	1	23	\N	\N	\N	\N
3624	6	1	24	\N	\N	\N	\N
3625	6	1	25	\N	\N	\N	\N
3626	6	1	26	\N	\N	\N	\N
3627	6	1	27	\N	\N	\N	\N
3628	6	1	28	\N	\N	\N	\N
3629	6	1	29	\N	\N	\N	\N
3630	6	1	30	\N	\N	\N	\N
3631	6	1	31	\N	\N	\N	\N
3632	6	1	32	\N	\N	\N	\N
3633	6	1	33	\N	\N	\N	\N
3634	6	1	34	\N	\N	\N	\N
3635	6	1	35	\N	\N	\N	\N
3636	6	1	36	\N	\N	\N	\N
3637	6	1	37	\N	\N	\N	\N
3638	6	1	38	\N	\N	\N	\N
3639	6	1	39	\N	\N	\N	\N
3640	6	1	40	\N	\N	\N	\N
3641	6	1	41	\N	\N	\N	\N
3642	6	1	42	\N	\N	\N	\N
3643	6	1	43	\N	\N	\N	\N
3644	6	1	44	\N	\N	\N	\N
3645	6	1	45	\N	\N	\N	\N
3646	6	1	46	\N	\N	\N	\N
3647	6	1	47	\N	\N	\N	\N
3648	6	1	48	\N	\N	\N	\N
3649	6	2	1	\N	\N	\N	\N
3650	6	2	2	\N	\N	\N	\N
3651	6	2	3	\N	\N	\N	\N
3652	6	2	4	\N	\N	\N	\N
3653	6	2	5	\N	\N	\N	\N
3654	6	2	6	\N	\N	\N	\N
3655	6	2	7	\N	\N	\N	\N
3656	6	2	8	\N	\N	\N	\N
3657	6	2	9	\N	\N	\N	\N
3658	6	2	10	\N	\N	\N	\N
3659	6	2	11	\N	\N	\N	\N
3660	6	2	12	\N	\N	\N	\N
3661	6	2	13	\N	\N	\N	\N
3662	6	2	14	\N	\N	\N	\N
3663	6	2	15	\N	\N	\N	\N
3664	6	2	16	\N	\N	\N	\N
3665	6	2	17	\N	\N	\N	\N
3666	6	2	18	\N	\N	\N	\N
3667	6	2	19	\N	\N	\N	\N
3668	6	2	20	\N	\N	\N	\N
3669	6	2	21	\N	\N	\N	\N
3670	6	2	22	\N	\N	\N	\N
3671	6	2	23	\N	\N	\N	\N
3672	6	2	24	\N	\N	\N	\N
3673	6	2	25	\N	\N	\N	\N
3674	6	2	26	\N	\N	\N	\N
3675	6	2	27	\N	\N	\N	\N
3676	6	2	28	\N	\N	\N	\N
3677	6	2	29	\N	\N	\N	\N
3678	6	2	30	\N	\N	\N	\N
3679	6	2	31	\N	\N	\N	\N
3680	6	2	32	\N	\N	\N	\N
3681	6	2	33	\N	\N	\N	\N
3682	6	2	34	\N	\N	\N	\N
3683	6	2	35	\N	\N	\N	\N
3684	6	2	36	\N	\N	\N	\N
3685	6	2	37	\N	\N	\N	\N
3686	6	2	38	\N	\N	\N	\N
3687	6	2	39	\N	\N	\N	\N
3688	6	2	40	\N	\N	\N	\N
3689	6	2	41	\N	\N	\N	\N
3690	6	2	42	\N	\N	\N	\N
3691	6	2	43	\N	\N	\N	\N
3692	6	2	44	\N	\N	\N	\N
3693	6	2	45	\N	\N	\N	\N
3694	6	2	46	\N	\N	\N	\N
3695	6	2	47	\N	\N	\N	\N
3696	6	2	48	\N	\N	\N	\N
3697	6	3	1	\N	\N	\N	\N
3698	6	3	2	\N	\N	\N	\N
3699	6	3	3	\N	\N	\N	\N
3700	6	3	4	\N	\N	\N	\N
3701	6	3	5	\N	\N	\N	\N
3702	6	3	6	\N	\N	\N	\N
3703	6	3	7	\N	\N	\N	\N
3704	6	3	8	\N	\N	\N	\N
3705	6	3	9	\N	\N	\N	\N
3706	6	3	10	\N	\N	\N	\N
3707	6	3	11	\N	\N	\N	\N
3708	6	3	12	\N	\N	\N	\N
3709	6	3	13	\N	\N	\N	\N
3710	6	3	14	\N	\N	\N	\N
3711	6	3	15	\N	\N	\N	\N
3712	6	3	16	\N	\N	\N	\N
3713	6	3	17	\N	\N	\N	\N
3714	6	3	18	\N	\N	\N	\N
3715	6	3	19	\N	\N	\N	\N
3716	6	3	20	\N	\N	\N	\N
3717	6	3	21	\N	\N	\N	\N
3718	6	3	22	\N	\N	\N	\N
3719	6	3	23	\N	\N	\N	\N
3720	6	3	24	\N	\N	\N	\N
3721	6	3	25	\N	\N	\N	\N
3722	6	3	26	\N	\N	\N	\N
3723	6	3	27	\N	\N	\N	\N
3724	6	3	28	\N	\N	\N	\N
3725	6	3	29	\N	\N	\N	\N
3726	6	3	30	\N	\N	\N	\N
3727	6	3	31	\N	\N	\N	\N
3728	6	3	32	\N	\N	\N	\N
3729	6	3	33	\N	\N	\N	\N
3730	6	3	34	\N	\N	\N	\N
3731	6	3	35	\N	\N	\N	\N
3732	6	3	36	\N	\N	\N	\N
3733	6	3	37	\N	\N	\N	\N
3734	6	3	38	\N	\N	\N	\N
3735	6	3	39	\N	\N	\N	\N
3736	6	3	40	\N	\N	\N	\N
3737	6	3	41	\N	\N	\N	\N
3738	6	3	42	\N	\N	\N	\N
3739	6	3	43	\N	\N	\N	\N
3740	6	3	44	\N	\N	\N	\N
3741	6	3	45	\N	\N	\N	\N
3742	6	3	46	\N	\N	\N	\N
3743	6	3	47	\N	\N	\N	\N
3744	6	3	48	\N	\N	\N	\N
3745	6	4	1	\N	\N	\N	\N
3746	6	4	2	\N	\N	\N	\N
3747	6	4	3	\N	\N	\N	\N
3748	6	4	4	\N	\N	\N	\N
3749	6	4	5	\N	\N	\N	\N
3750	6	4	6	\N	\N	\N	\N
3751	6	4	7	\N	\N	\N	\N
3752	6	4	8	\N	\N	\N	\N
3753	6	4	9	\N	\N	\N	\N
3754	6	4	10	\N	\N	\N	\N
3755	6	4	11	\N	\N	\N	\N
3756	6	4	12	\N	\N	\N	\N
3757	6	4	13	\N	\N	\N	\N
3758	6	4	14	\N	\N	\N	\N
3759	6	4	15	\N	\N	\N	\N
3760	6	4	16	\N	\N	\N	\N
3761	6	4	17	\N	\N	\N	\N
3762	6	4	18	\N	\N	\N	\N
3763	6	4	19	\N	\N	\N	\N
3764	6	4	20	\N	\N	\N	\N
3765	6	4	21	\N	\N	\N	\N
3766	6	4	22	\N	\N	\N	\N
3767	6	4	23	\N	\N	\N	\N
3768	6	4	24	\N	\N	\N	\N
3769	6	4	25	\N	\N	\N	\N
3770	6	4	26	\N	\N	\N	\N
3771	6	4	27	\N	\N	\N	\N
3772	6	4	28	\N	\N	\N	\N
3773	6	4	29	\N	\N	\N	\N
3774	6	4	30	\N	\N	\N	\N
3775	6	4	31	\N	\N	\N	\N
3776	6	4	32	\N	\N	\N	\N
3777	6	4	33	\N	\N	\N	\N
3778	6	4	34	\N	\N	\N	\N
3779	6	4	35	\N	\N	\N	\N
3780	6	4	36	\N	\N	\N	\N
3781	6	4	37	\N	\N	\N	\N
3782	6	4	38	\N	\N	\N	\N
3783	6	4	39	\N	\N	\N	\N
3784	6	4	40	\N	\N	\N	\N
3785	6	4	41	\N	\N	\N	\N
3786	6	4	42	\N	\N	\N	\N
3787	6	4	43	\N	\N	\N	\N
3788	6	4	44	\N	\N	\N	\N
3789	6	4	45	\N	\N	\N	\N
3790	6	4	46	\N	\N	\N	\N
3791	6	4	47	\N	\N	\N	\N
3792	6	4	48	\N	\N	\N	\N
3793	6	5	1	\N	\N	\N	\N
3794	6	5	2	\N	\N	\N	\N
3795	6	5	3	\N	\N	\N	\N
3796	6	5	4	\N	\N	\N	\N
3797	6	5	5	\N	\N	\N	\N
3798	6	5	6	\N	\N	\N	\N
3799	6	5	7	\N	\N	\N	\N
3800	6	5	8	\N	\N	\N	\N
3801	6	5	9	\N	\N	\N	\N
3802	6	5	10	\N	\N	\N	\N
3803	6	5	11	\N	\N	\N	\N
3804	6	5	12	\N	\N	\N	\N
3805	6	5	13	\N	\N	\N	\N
3806	6	5	14	\N	\N	\N	\N
3807	6	5	15	\N	\N	\N	\N
3808	6	5	16	\N	\N	\N	\N
3809	6	5	17	\N	\N	\N	\N
3810	6	5	18	\N	\N	\N	\N
3811	6	5	19	\N	\N	\N	\N
3812	6	5	20	\N	\N	\N	\N
3813	6	5	21	\N	\N	\N	\N
3814	6	5	22	\N	\N	\N	\N
3815	6	5	23	\N	\N	\N	\N
3816	6	5	24	\N	\N	\N	\N
3817	6	5	25	\N	\N	\N	\N
3818	6	5	26	\N	\N	\N	\N
3819	6	5	27	\N	\N	\N	\N
3820	6	5	28	\N	\N	\N	\N
3821	6	5	29	\N	\N	\N	\N
3822	6	5	30	\N	\N	\N	\N
3823	6	5	31	\N	\N	\N	\N
3824	6	5	32	\N	\N	\N	\N
3825	6	5	33	\N	\N	\N	\N
3826	6	5	34	\N	\N	\N	\N
3827	6	5	35	\N	\N	\N	\N
3828	6	5	36	\N	\N	\N	\N
3829	6	5	37	\N	\N	\N	\N
3830	6	5	38	\N	\N	\N	\N
3831	6	5	39	\N	\N	\N	\N
3832	6	5	40	\N	\N	\N	\N
3833	6	5	41	\N	\N	\N	\N
3834	6	5	42	\N	\N	\N	\N
3835	6	5	43	\N	\N	\N	\N
3836	6	5	44	\N	\N	\N	\N
3837	6	5	45	\N	\N	\N	\N
3838	6	5	46	\N	\N	\N	\N
3839	6	5	47	\N	\N	\N	\N
3840	6	5	48	\N	\N	\N	\N
3841	6	6	1	\N	\N	\N	\N
3842	6	6	2	\N	\N	\N	\N
3843	6	6	3	\N	\N	\N	\N
3844	6	6	4	\N	\N	\N	\N
3845	6	6	5	\N	\N	\N	\N
3846	6	6	6	\N	\N	\N	\N
3847	6	6	7	\N	\N	\N	\N
3848	6	6	8	\N	\N	\N	\N
3849	6	6	9	\N	\N	\N	\N
3850	6	6	10	\N	\N	\N	\N
3851	6	6	11	\N	\N	\N	\N
3852	6	6	12	\N	\N	\N	\N
3853	6	6	13	\N	\N	\N	\N
3854	6	6	14	\N	\N	\N	\N
3855	6	6	15	\N	\N	\N	\N
3856	6	6	16	\N	\N	\N	\N
3857	6	6	17	\N	\N	\N	\N
3858	6	6	18	\N	\N	\N	\N
3859	6	6	19	\N	\N	\N	\N
3860	6	6	20	\N	\N	\N	\N
3861	6	6	21	\N	\N	\N	\N
3862	6	6	22	\N	\N	\N	\N
3863	6	6	23	\N	\N	\N	\N
3864	6	6	24	\N	\N	\N	\N
3865	6	6	25	\N	\N	\N	\N
3866	6	6	26	\N	\N	\N	\N
3867	6	6	27	\N	\N	\N	\N
3868	6	6	28	\N	\N	\N	\N
3869	6	6	29	\N	\N	\N	\N
3870	6	6	30	\N	\N	\N	\N
3871	6	6	31	\N	\N	\N	\N
3872	6	6	32	\N	\N	\N	\N
3873	6	6	33	\N	\N	\N	\N
3874	6	6	34	\N	\N	\N	\N
3875	6	6	35	\N	\N	\N	\N
3876	6	6	36	\N	\N	\N	\N
3877	6	6	37	\N	\N	\N	\N
3878	6	6	38	\N	\N	\N	\N
3879	6	6	39	\N	\N	\N	\N
3880	6	6	40	\N	\N	\N	\N
3881	6	6	41	\N	\N	\N	\N
3882	6	6	42	\N	\N	\N	\N
3883	6	6	43	\N	\N	\N	\N
3884	6	6	44	\N	\N	\N	\N
3885	6	6	45	\N	\N	\N	\N
3886	6	6	46	\N	\N	\N	\N
3887	6	6	47	\N	\N	\N	\N
3888	6	6	48	\N	\N	\N	\N
3889	6	7	1	\N	\N	\N	\N
3890	6	7	2	\N	\N	\N	\N
3891	6	7	3	\N	\N	\N	\N
3892	6	7	4	\N	\N	\N	\N
3893	6	7	5	\N	\N	\N	\N
3894	6	7	6	\N	\N	\N	\N
3895	6	7	7	\N	\N	\N	\N
3896	6	7	8	\N	\N	\N	\N
3897	6	7	9	\N	\N	\N	\N
3898	6	7	10	\N	\N	\N	\N
3899	6	7	11	\N	\N	\N	\N
3900	6	7	12	\N	\N	\N	\N
3901	6	7	13	\N	\N	\N	\N
3902	6	7	14	\N	\N	\N	\N
3903	6	7	15	\N	\N	\N	\N
3904	6	7	16	\N	\N	\N	\N
3905	6	7	17	\N	\N	\N	\N
3906	6	7	18	\N	\N	\N	\N
3907	6	7	19	\N	\N	\N	\N
3908	6	7	20	\N	\N	\N	\N
3909	6	7	21	\N	\N	\N	\N
3910	6	7	22	\N	\N	\N	\N
3911	6	7	23	\N	\N	\N	\N
3912	6	7	24	\N	\N	\N	\N
3913	6	7	25	\N	\N	\N	\N
3914	6	7	26	\N	\N	\N	\N
3915	6	7	27	\N	\N	\N	\N
3916	6	7	28	\N	\N	\N	\N
3917	6	7	29	\N	\N	\N	\N
3918	6	7	30	\N	\N	\N	\N
3919	6	7	31	\N	\N	\N	\N
3920	6	7	32	\N	\N	\N	\N
3921	6	7	33	\N	\N	\N	\N
3922	6	7	34	\N	\N	\N	\N
3923	6	7	35	\N	\N	\N	\N
3924	6	7	36	\N	\N	\N	\N
3925	6	7	37	\N	\N	\N	\N
3926	6	7	38	\N	\N	\N	\N
3927	6	7	39	\N	\N	\N	\N
3928	6	7	40	\N	\N	\N	\N
3929	6	7	41	\N	\N	\N	\N
3930	6	7	42	\N	\N	\N	\N
3931	6	7	43	\N	\N	\N	\N
3932	6	7	44	\N	\N	\N	\N
3933	6	7	45	\N	\N	\N	\N
3934	6	7	46	\N	\N	\N	\N
3935	6	7	47	\N	\N	\N	\N
3936	6	7	48	\N	\N	\N	\N
3937	6	8	1	\N	\N	\N	\N
3938	6	8	2	\N	\N	\N	\N
3939	6	8	3	\N	\N	\N	\N
3940	6	8	4	\N	\N	\N	\N
3941	6	8	5	\N	\N	\N	\N
3942	6	8	6	\N	\N	\N	\N
3943	6	8	7	\N	\N	\N	\N
3944	6	8	8	\N	\N	\N	\N
3945	6	8	9	\N	\N	\N	\N
3946	6	8	10	\N	\N	\N	\N
3947	6	8	11	\N	\N	\N	\N
3948	6	8	12	\N	\N	\N	\N
3949	6	8	13	\N	\N	\N	\N
3950	6	8	14	\N	\N	\N	\N
3951	6	8	15	\N	\N	\N	\N
3952	6	8	16	\N	\N	\N	\N
3953	6	8	17	\N	\N	\N	\N
3954	6	8	18	\N	\N	\N	\N
3955	6	8	19	\N	\N	\N	\N
3956	6	8	20	\N	\N	\N	\N
3957	6	8	21	\N	\N	\N	\N
3958	6	8	22	\N	\N	\N	\N
3959	6	8	23	\N	\N	\N	\N
3960	6	8	24	\N	\N	\N	\N
3961	6	8	25	\N	\N	\N	\N
3962	6	8	26	\N	\N	\N	\N
3963	6	8	27	\N	\N	\N	\N
3964	6	8	28	\N	\N	\N	\N
3965	6	8	29	\N	\N	\N	\N
3966	6	8	30	\N	\N	\N	\N
3967	6	8	31	\N	\N	\N	\N
3968	6	8	32	\N	\N	\N	\N
3969	6	8	33	\N	\N	\N	\N
3970	6	8	34	\N	\N	\N	\N
3971	6	8	35	\N	\N	\N	\N
3972	6	8	36	\N	\N	\N	\N
3973	6	8	37	\N	\N	\N	\N
3974	6	8	38	\N	\N	\N	\N
3975	6	8	39	\N	\N	\N	\N
3976	6	8	40	\N	\N	\N	\N
3977	6	8	41	\N	\N	\N	\N
3978	6	8	42	\N	\N	\N	\N
3979	6	8	43	\N	\N	\N	\N
3980	6	8	44	\N	\N	\N	\N
3981	6	8	45	\N	\N	\N	\N
3982	6	8	46	\N	\N	\N	\N
3983	6	8	47	\N	\N	\N	\N
3984	6	8	48	\N	\N	\N	\N
3985	6	9	1	\N	\N	\N	\N
3986	6	9	2	\N	\N	\N	\N
3987	6	9	3	\N	\N	\N	\N
3988	6	9	4	\N	\N	\N	\N
3989	6	9	5	\N	\N	\N	\N
3990	6	9	6	\N	\N	\N	\N
3991	6	9	7	\N	\N	\N	\N
3992	6	9	8	\N	\N	\N	\N
3993	6	9	9	\N	\N	\N	\N
3994	6	9	10	\N	\N	\N	\N
3995	6	9	11	\N	\N	\N	\N
3996	6	9	12	\N	\N	\N	\N
3997	6	9	13	\N	\N	\N	\N
3998	6	9	14	\N	\N	\N	\N
3999	6	9	15	\N	\N	\N	\N
4000	6	9	16	\N	\N	\N	\N
4001	6	9	17	\N	\N	\N	\N
4002	6	9	18	\N	\N	\N	\N
4003	6	9	19	\N	\N	\N	\N
4004	6	9	20	\N	\N	\N	\N
4005	6	9	21	\N	\N	\N	\N
4006	6	9	22	\N	\N	\N	\N
4007	6	9	23	\N	\N	\N	\N
4008	6	9	24	\N	\N	\N	\N
4009	6	9	25	\N	\N	\N	\N
4010	6	9	26	\N	\N	\N	\N
4011	6	9	27	\N	\N	\N	\N
4012	6	9	28	\N	\N	\N	\N
4013	6	9	29	\N	\N	\N	\N
4014	6	9	30	\N	\N	\N	\N
4015	6	9	31	\N	\N	\N	\N
4016	6	9	32	\N	\N	\N	\N
4017	6	9	33	\N	\N	\N	\N
4018	6	9	34	\N	\N	\N	\N
4019	6	9	35	\N	\N	\N	\N
4020	6	9	36	\N	\N	\N	\N
4021	6	9	37	\N	\N	\N	\N
4022	6	9	38	\N	\N	\N	\N
4023	6	9	39	\N	\N	\N	\N
4024	6	9	40	\N	\N	\N	\N
4025	6	9	41	\N	\N	\N	\N
4026	6	9	42	\N	\N	\N	\N
4027	6	9	43	\N	\N	\N	\N
4028	6	9	44	\N	\N	\N	\N
4029	6	9	45	\N	\N	\N	\N
4030	6	9	46	\N	\N	\N	\N
4031	6	9	47	\N	\N	\N	\N
4032	6	9	48	\N	\N	\N	\N
4033	6	10	1	\N	\N	\N	\N
4034	6	10	2	\N	\N	\N	\N
4035	6	10	3	\N	\N	\N	\N
4036	6	10	4	\N	\N	\N	\N
4037	6	10	5	\N	\N	\N	\N
4038	6	10	6	\N	\N	\N	\N
4039	6	10	7	\N	\N	\N	\N
4040	6	10	8	\N	\N	\N	\N
4041	6	10	9	\N	\N	\N	\N
4042	6	10	10	\N	\N	\N	\N
4043	6	10	11	\N	\N	\N	\N
4044	6	10	12	\N	\N	\N	\N
4045	6	10	13	\N	\N	\N	\N
4046	6	10	14	\N	\N	\N	\N
4047	6	10	15	\N	\N	\N	\N
4048	6	10	16	\N	\N	\N	\N
4049	6	10	17	\N	\N	\N	\N
4050	6	10	18	\N	\N	\N	\N
4051	6	10	19	\N	\N	\N	\N
4052	6	10	20	\N	\N	\N	\N
4053	6	10	21	\N	\N	\N	\N
4054	6	10	22	\N	\N	\N	\N
4055	6	10	23	\N	\N	\N	\N
4056	6	10	24	\N	\N	\N	\N
4057	6	10	25	\N	\N	\N	\N
4058	6	10	26	\N	\N	\N	\N
4059	6	10	27	\N	\N	\N	\N
4060	6	10	28	\N	\N	\N	\N
4061	6	10	29	\N	\N	\N	\N
4062	6	10	30	\N	\N	\N	\N
4063	6	10	31	\N	\N	\N	\N
4064	6	10	32	\N	\N	\N	\N
4065	6	10	33	\N	\N	\N	\N
4066	6	10	34	\N	\N	\N	\N
4067	6	10	35	\N	\N	\N	\N
4068	6	10	36	\N	\N	\N	\N
4069	6	10	37	\N	\N	\N	\N
4070	6	10	38	\N	\N	\N	\N
4071	6	10	39	\N	\N	\N	\N
4072	6	10	40	\N	\N	\N	\N
4073	6	10	41	\N	\N	\N	\N
4074	6	10	42	\N	\N	\N	\N
4075	6	10	43	\N	\N	\N	\N
4076	6	10	44	\N	\N	\N	\N
4077	6	10	45	\N	\N	\N	\N
4078	6	10	46	\N	\N	\N	\N
4079	6	10	47	\N	\N	\N	\N
4080	6	10	48	\N	\N	\N	\N
4081	6	11	1	\N	\N	\N	\N
4082	6	11	2	\N	\N	\N	\N
4083	6	11	3	\N	\N	\N	\N
4084	6	11	4	\N	\N	\N	\N
4085	6	11	5	\N	\N	\N	\N
4086	6	11	6	\N	\N	\N	\N
4087	6	11	7	\N	\N	\N	\N
4088	6	11	8	\N	\N	\N	\N
4089	6	11	9	\N	\N	\N	\N
4090	6	11	10	\N	\N	\N	\N
4091	6	11	11	\N	\N	\N	\N
4092	6	11	12	\N	\N	\N	\N
4093	6	11	13	\N	\N	\N	\N
4094	6	11	14	\N	\N	\N	\N
4095	6	11	15	\N	\N	\N	\N
4096	6	11	16	\N	\N	\N	\N
4097	6	11	17	\N	\N	\N	\N
4098	6	11	18	\N	\N	\N	\N
4099	6	11	19	\N	\N	\N	\N
4100	6	11	20	\N	\N	\N	\N
4101	6	11	21	\N	\N	\N	\N
4102	6	11	22	\N	\N	\N	\N
4103	6	11	23	\N	\N	\N	\N
4104	6	11	24	\N	\N	\N	\N
4105	6	11	25	\N	\N	\N	\N
4106	6	11	26	\N	\N	\N	\N
4107	6	11	27	\N	\N	\N	\N
4108	6	11	28	\N	\N	\N	\N
4109	6	11	29	\N	\N	\N	\N
4110	6	11	30	\N	\N	\N	\N
4111	6	11	31	\N	\N	\N	\N
4112	6	11	32	\N	\N	\N	\N
4113	6	11	33	\N	\N	\N	\N
4114	6	11	34	\N	\N	\N	\N
4115	6	11	35	\N	\N	\N	\N
4116	6	11	36	\N	\N	\N	\N
4117	6	11	37	\N	\N	\N	\N
4118	6	11	38	\N	\N	\N	\N
4119	6	11	39	\N	\N	\N	\N
4120	6	11	40	\N	\N	\N	\N
4121	6	11	41	\N	\N	\N	\N
4122	6	11	42	\N	\N	\N	\N
4123	6	11	43	\N	\N	\N	\N
4124	6	11	44	\N	\N	\N	\N
4125	6	11	45	\N	\N	\N	\N
4126	6	11	46	\N	\N	\N	\N
4127	6	11	47	\N	\N	\N	\N
4128	6	11	48	\N	\N	\N	\N
4129	6	12	1	\N	\N	\N	\N
4130	6	12	2	\N	\N	\N	\N
4131	6	12	3	\N	\N	\N	\N
4132	6	12	4	\N	\N	\N	\N
4133	6	12	5	\N	\N	\N	\N
4134	6	12	6	\N	\N	\N	\N
4135	6	12	7	\N	\N	\N	\N
4136	6	12	8	\N	\N	\N	\N
4137	6	12	9	\N	\N	\N	\N
4138	6	12	10	\N	\N	\N	\N
4139	6	12	11	\N	\N	\N	\N
4140	6	12	12	\N	\N	\N	\N
4141	6	12	13	\N	\N	\N	\N
4142	6	12	14	\N	\N	\N	\N
4143	6	12	15	\N	\N	\N	\N
4144	6	12	16	\N	\N	\N	\N
4145	6	12	17	\N	\N	\N	\N
4146	6	12	18	\N	\N	\N	\N
4147	6	12	19	\N	\N	\N	\N
4148	6	12	20	\N	\N	\N	\N
4149	6	12	21	\N	\N	\N	\N
4150	6	12	22	\N	\N	\N	\N
4151	6	12	23	\N	\N	\N	\N
4152	6	12	24	\N	\N	\N	\N
4153	6	12	25	\N	\N	\N	\N
4154	6	12	26	\N	\N	\N	\N
4155	6	12	27	\N	\N	\N	\N
4156	6	12	28	\N	\N	\N	\N
4157	6	12	29	\N	\N	\N	\N
4158	6	12	30	\N	\N	\N	\N
4159	6	12	31	\N	\N	\N	\N
4160	6	12	32	\N	\N	\N	\N
4161	6	12	33	\N	\N	\N	\N
4162	6	12	34	\N	\N	\N	\N
4163	6	12	35	\N	\N	\N	\N
4164	6	12	36	\N	\N	\N	\N
4165	6	12	37	\N	\N	\N	\N
4166	6	12	38	\N	\N	\N	\N
4167	6	12	39	\N	\N	\N	\N
4168	6	12	40	\N	\N	\N	\N
4169	6	12	41	\N	\N	\N	\N
4170	6	12	42	\N	\N	\N	\N
4171	6	12	43	\N	\N	\N	\N
4172	6	12	44	\N	\N	\N	\N
4173	6	12	45	\N	\N	\N	\N
4174	6	12	46	\N	\N	\N	\N
4175	6	12	47	\N	\N	\N	\N
4176	6	12	48	\N	\N	\N	\N
4177	6	13	1	\N	\N	\N	\N
4178	6	13	2	\N	\N	\N	\N
4179	6	13	3	\N	\N	\N	\N
4180	6	13	4	\N	\N	\N	\N
4181	6	13	5	\N	\N	\N	\N
4182	6	13	6	\N	\N	\N	\N
4183	6	13	7	\N	\N	\N	\N
4184	6	13	8	\N	\N	\N	\N
4185	6	13	9	\N	\N	\N	\N
4186	6	13	10	\N	\N	\N	\N
4187	6	13	11	\N	\N	\N	\N
4188	6	13	12	\N	\N	\N	\N
4189	6	13	13	\N	\N	\N	\N
4190	6	13	14	\N	\N	\N	\N
4191	6	13	15	\N	\N	\N	\N
4192	6	13	16	\N	\N	\N	\N
4193	6	13	17	\N	\N	\N	\N
4194	6	13	18	\N	\N	\N	\N
4195	6	13	19	\N	\N	\N	\N
4196	6	13	20	\N	\N	\N	\N
4197	6	13	21	\N	\N	\N	\N
4198	6	13	22	\N	\N	\N	\N
4199	6	13	23	\N	\N	\N	\N
4200	6	13	24	\N	\N	\N	\N
4201	6	13	25	\N	\N	\N	\N
4202	6	13	26	\N	\N	\N	\N
4203	6	13	27	\N	\N	\N	\N
4204	6	13	28	\N	\N	\N	\N
4205	6	13	29	\N	\N	\N	\N
4206	6	13	30	\N	\N	\N	\N
4207	6	13	31	\N	\N	\N	\N
4208	6	13	32	\N	\N	\N	\N
4209	6	13	33	\N	\N	\N	\N
4210	6	13	34	\N	\N	\N	\N
4211	6	13	35	\N	\N	\N	\N
4212	6	13	36	\N	\N	\N	\N
4213	6	13	37	\N	\N	\N	\N
4214	6	13	38	\N	\N	\N	\N
4215	6	13	39	\N	\N	\N	\N
4216	6	13	40	\N	\N	\N	\N
4217	6	13	41	\N	\N	\N	\N
4218	6	13	42	\N	\N	\N	\N
4219	6	13	43	\N	\N	\N	\N
4220	6	13	44	\N	\N	\N	\N
4221	6	13	45	\N	\N	\N	\N
4222	6	13	46	\N	\N	\N	\N
4223	6	13	47	\N	\N	\N	\N
4224	6	13	48	\N	\N	\N	\N
4225	6	14	1	\N	\N	\N	\N
4226	6	14	2	\N	\N	\N	\N
4227	6	14	3	\N	\N	\N	\N
4228	6	14	4	\N	\N	\N	\N
4229	6	14	5	\N	\N	\N	\N
4230	6	14	6	\N	\N	\N	\N
4231	6	14	7	\N	\N	\N	\N
4232	6	14	8	\N	\N	\N	\N
4233	6	14	9	\N	\N	\N	\N
4234	6	14	10	\N	\N	\N	\N
4235	6	14	11	\N	\N	\N	\N
4236	6	14	12	\N	\N	\N	\N
4237	6	14	13	\N	\N	\N	\N
4238	6	14	14	\N	\N	\N	\N
4239	6	14	15	\N	\N	\N	\N
4240	6	14	16	\N	\N	\N	\N
4241	6	14	17	\N	\N	\N	\N
4242	6	14	18	\N	\N	\N	\N
4243	6	14	19	\N	\N	\N	\N
4244	6	14	20	\N	\N	\N	\N
4245	6	14	21	\N	\N	\N	\N
4246	6	14	22	\N	\N	\N	\N
4247	6	14	23	\N	\N	\N	\N
4248	6	14	24	\N	\N	\N	\N
4249	6	14	25	\N	\N	\N	\N
4250	6	14	26	\N	\N	\N	\N
4251	6	14	27	\N	\N	\N	\N
4252	6	14	28	\N	\N	\N	\N
4253	6	14	29	\N	\N	\N	\N
4254	6	14	30	\N	\N	\N	\N
4255	6	14	31	\N	\N	\N	\N
4256	6	14	32	\N	\N	\N	\N
4257	6	14	33	\N	\N	\N	\N
4258	6	14	34	\N	\N	\N	\N
4259	6	14	35	\N	\N	\N	\N
4260	6	14	36	\N	\N	\N	\N
4261	6	14	37	\N	\N	\N	\N
4262	6	14	38	\N	\N	\N	\N
4263	6	14	39	\N	\N	\N	\N
4264	6	14	40	\N	\N	\N	\N
4265	6	14	41	\N	\N	\N	\N
4266	6	14	42	\N	\N	\N	\N
4267	6	14	43	\N	\N	\N	\N
4268	6	14	44	\N	\N	\N	\N
4269	6	14	45	\N	\N	\N	\N
4270	6	14	46	\N	\N	\N	\N
4271	6	14	47	\N	\N	\N	\N
4272	6	14	48	\N	\N	\N	\N
4273	6	15	1	\N	\N	\N	\N
4274	6	15	2	\N	\N	\N	\N
4275	6	15	3	\N	\N	\N	\N
4276	6	15	4	\N	\N	\N	\N
4277	6	15	5	\N	\N	\N	\N
4278	6	15	6	\N	\N	\N	\N
4279	6	15	7	\N	\N	\N	\N
4280	6	15	8	\N	\N	\N	\N
4281	6	15	9	\N	\N	\N	\N
4282	6	15	10	\N	\N	\N	\N
4283	6	15	11	\N	\N	\N	\N
4284	6	15	12	\N	\N	\N	\N
4285	6	15	13	\N	\N	\N	\N
4286	6	15	14	\N	\N	\N	\N
4287	6	15	15	\N	\N	\N	\N
4288	6	15	16	\N	\N	\N	\N
4289	6	15	17	\N	\N	\N	\N
4290	6	15	18	\N	\N	\N	\N
4291	6	15	19	\N	\N	\N	\N
4292	6	15	20	\N	\N	\N	\N
4293	6	15	21	\N	\N	\N	\N
4294	6	15	22	\N	\N	\N	\N
4295	6	15	23	\N	\N	\N	\N
4296	6	15	24	\N	\N	\N	\N
4297	6	15	25	\N	\N	\N	\N
4298	6	15	26	\N	\N	\N	\N
4299	6	15	27	\N	\N	\N	\N
4300	6	15	28	\N	\N	\N	\N
4301	6	15	29	\N	\N	\N	\N
4302	6	15	30	\N	\N	\N	\N
4303	6	15	31	\N	\N	\N	\N
4304	6	15	32	\N	\N	\N	\N
4305	6	15	33	\N	\N	\N	\N
4306	6	15	34	\N	\N	\N	\N
4307	6	15	35	\N	\N	\N	\N
4308	6	15	36	\N	\N	\N	\N
4309	6	15	37	\N	\N	\N	\N
4310	6	15	38	\N	\N	\N	\N
4311	6	15	39	\N	\N	\N	\N
4312	6	15	40	\N	\N	\N	\N
4313	6	15	41	\N	\N	\N	\N
4314	6	15	42	\N	\N	\N	\N
4315	6	15	43	\N	\N	\N	\N
4316	6	15	44	\N	\N	\N	\N
4317	6	15	45	\N	\N	\N	\N
4318	6	15	46	\N	\N	\N	\N
4319	6	15	47	\N	\N	\N	\N
4320	6	15	48	\N	\N	\N	\N
4321	7	1	1	\N	\N	\N	\N
4322	7	1	2	\N	\N	\N	\N
4323	7	1	3	\N	\N	\N	\N
4324	7	1	4	\N	\N	\N	\N
4325	7	1	5	\N	\N	\N	\N
4326	7	1	6	\N	\N	\N	\N
4327	7	1	7	\N	\N	\N	\N
4328	7	1	8	\N	\N	\N	\N
4329	7	1	9	\N	\N	\N	\N
4330	7	1	10	\N	\N	\N	\N
4331	7	1	11	\N	\N	\N	\N
4332	7	1	12	\N	\N	\N	\N
4333	7	1	13	\N	\N	\N	\N
4334	7	1	14	\N	\N	\N	\N
4335	7	1	15	\N	\N	\N	\N
4336	7	1	16	\N	\N	\N	\N
4337	7	1	17	\N	\N	\N	\N
4338	7	1	18	\N	\N	\N	\N
4339	7	1	19	\N	\N	\N	\N
4340	7	1	20	\N	\N	\N	\N
4341	7	1	21	\N	\N	\N	\N
4342	7	1	22	\N	\N	\N	\N
4343	7	1	23	\N	\N	\N	\N
4344	7	1	24	\N	\N	\N	\N
4345	7	1	25	\N	\N	\N	\N
4346	7	1	26	\N	\N	\N	\N
4347	7	1	27	\N	\N	\N	\N
4348	7	1	28	\N	\N	\N	\N
4349	7	1	29	\N	\N	\N	\N
4350	7	1	30	\N	\N	\N	\N
4351	7	1	31	\N	\N	\N	\N
4352	7	1	32	\N	\N	\N	\N
4353	7	1	33	\N	\N	\N	\N
4354	7	1	34	\N	\N	\N	\N
4355	7	1	35	\N	\N	\N	\N
4356	7	1	36	\N	\N	\N	\N
4357	7	1	37	\N	\N	\N	\N
4358	7	1	38	\N	\N	\N	\N
4359	7	1	39	\N	\N	\N	\N
4360	7	1	40	\N	\N	\N	\N
4361	7	1	41	\N	\N	\N	\N
4362	7	1	42	\N	\N	\N	\N
4363	7	1	43	\N	\N	\N	\N
4364	7	1	44	\N	\N	\N	\N
4365	7	1	45	\N	\N	\N	\N
4366	7	1	46	\N	\N	\N	\N
4367	7	1	47	\N	\N	\N	\N
4368	7	1	48	\N	\N	\N	\N
4369	7	2	1	\N	\N	\N	\N
4370	7	2	2	\N	\N	\N	\N
4371	7	2	3	\N	\N	\N	\N
4372	7	2	4	\N	\N	\N	\N
4373	7	2	5	\N	\N	\N	\N
4374	7	2	6	\N	\N	\N	\N
4375	7	2	7	\N	\N	\N	\N
4376	7	2	8	\N	\N	\N	\N
4377	7	2	9	\N	\N	\N	\N
4378	7	2	10	\N	\N	\N	\N
4379	7	2	11	\N	\N	\N	\N
4380	7	2	12	\N	\N	\N	\N
4381	7	2	13	\N	\N	\N	\N
4382	7	2	14	\N	\N	\N	\N
4383	7	2	15	\N	\N	\N	\N
4384	7	2	16	\N	\N	\N	\N
4385	7	2	17	\N	\N	\N	\N
4386	7	2	18	\N	\N	\N	\N
4387	7	2	19	\N	\N	\N	\N
4388	7	2	20	\N	\N	\N	\N
4389	7	2	21	\N	\N	\N	\N
4390	7	2	22	\N	\N	\N	\N
4391	7	2	23	\N	\N	\N	\N
4392	7	2	24	\N	\N	\N	\N
4393	7	2	25	\N	\N	\N	\N
4394	7	2	26	\N	\N	\N	\N
4395	7	2	27	\N	\N	\N	\N
4396	7	2	28	\N	\N	\N	\N
4397	7	2	29	\N	\N	\N	\N
4398	7	2	30	\N	\N	\N	\N
4399	7	2	31	\N	\N	\N	\N
4400	7	2	32	\N	\N	\N	\N
4401	7	2	33	\N	\N	\N	\N
4402	7	2	34	\N	\N	\N	\N
4403	7	2	35	\N	\N	\N	\N
4404	7	2	36	\N	\N	\N	\N
4405	7	2	37	\N	\N	\N	\N
4406	7	2	38	\N	\N	\N	\N
4407	7	2	39	\N	\N	\N	\N
4408	7	2	40	\N	\N	\N	\N
4409	7	2	41	\N	\N	\N	\N
4410	7	2	42	\N	\N	\N	\N
4411	7	2	43	\N	\N	\N	\N
4412	7	2	44	\N	\N	\N	\N
4413	7	2	45	\N	\N	\N	\N
4414	7	2	46	\N	\N	\N	\N
4415	7	2	47	\N	\N	\N	\N
4416	7	2	48	\N	\N	\N	\N
4417	7	3	1	\N	\N	\N	\N
4418	7	3	2	\N	\N	\N	\N
4419	7	3	3	\N	\N	\N	\N
4420	7	3	4	\N	\N	\N	\N
4421	7	3	5	\N	\N	\N	\N
4422	7	3	6	\N	\N	\N	\N
4423	7	3	7	\N	\N	\N	\N
4424	7	3	8	\N	\N	\N	\N
4425	7	3	9	\N	\N	\N	\N
4426	7	3	10	\N	\N	\N	\N
4427	7	3	11	\N	\N	\N	\N
4428	7	3	12	\N	\N	\N	\N
4429	7	3	13	\N	\N	\N	\N
4430	7	3	14	\N	\N	\N	\N
4431	7	3	15	\N	\N	\N	\N
4432	7	3	16	\N	\N	\N	\N
4433	7	3	17	\N	\N	\N	\N
4434	7	3	18	\N	\N	\N	\N
4435	7	3	19	\N	\N	\N	\N
4436	7	3	20	\N	\N	\N	\N
4437	7	3	21	\N	\N	\N	\N
4438	7	3	22	\N	\N	\N	\N
4439	7	3	23	\N	\N	\N	\N
4440	7	3	24	\N	\N	\N	\N
4441	7	3	25	\N	\N	\N	\N
4442	7	3	26	\N	\N	\N	\N
4443	7	3	27	\N	\N	\N	\N
4444	7	3	28	\N	\N	\N	\N
4445	7	3	29	\N	\N	\N	\N
4446	7	3	30	\N	\N	\N	\N
4447	7	3	31	\N	\N	\N	\N
4448	7	3	32	\N	\N	\N	\N
4449	7	3	33	\N	\N	\N	\N
4450	7	3	34	\N	\N	\N	\N
4451	7	3	35	\N	\N	\N	\N
4452	7	3	36	\N	\N	\N	\N
4453	7	3	37	\N	\N	\N	\N
4454	7	3	38	\N	\N	\N	\N
4455	7	3	39	\N	\N	\N	\N
4456	7	3	40	\N	\N	\N	\N
4457	7	3	41	\N	\N	\N	\N
4458	7	3	42	\N	\N	\N	\N
4459	7	3	43	\N	\N	\N	\N
4460	7	3	44	\N	\N	\N	\N
4461	7	3	45	\N	\N	\N	\N
4462	7	3	46	\N	\N	\N	\N
4463	7	3	47	\N	\N	\N	\N
4464	7	3	48	\N	\N	\N	\N
4465	7	4	1	\N	\N	\N	\N
4466	7	4	2	\N	\N	\N	\N
4467	7	4	3	\N	\N	\N	\N
4468	7	4	4	\N	\N	\N	\N
4469	7	4	5	\N	\N	\N	\N
4470	7	4	6	\N	\N	\N	\N
4471	7	4	7	\N	\N	\N	\N
4472	7	4	8	\N	\N	\N	\N
4473	7	4	9	\N	\N	\N	\N
4474	7	4	10	\N	\N	\N	\N
4475	7	4	11	\N	\N	\N	\N
4476	7	4	12	\N	\N	\N	\N
4477	7	4	13	\N	\N	\N	\N
4478	7	4	14	\N	\N	\N	\N
4479	7	4	15	\N	\N	\N	\N
4480	7	4	16	\N	\N	\N	\N
4481	7	4	17	\N	\N	\N	\N
4482	7	4	18	\N	\N	\N	\N
4483	7	4	19	\N	\N	\N	\N
4484	7	4	20	\N	\N	\N	\N
4485	7	4	21	\N	\N	\N	\N
4486	7	4	22	\N	\N	\N	\N
4487	7	4	23	\N	\N	\N	\N
4488	7	4	24	\N	\N	\N	\N
4489	7	4	25	\N	\N	\N	\N
4490	7	4	26	\N	\N	\N	\N
4491	7	4	27	\N	\N	\N	\N
4492	7	4	28	\N	\N	\N	\N
4493	7	4	29	\N	\N	\N	\N
4494	7	4	30	\N	\N	\N	\N
4495	7	4	31	\N	\N	\N	\N
4496	7	4	32	\N	\N	\N	\N
4497	7	4	33	\N	\N	\N	\N
4498	7	4	34	\N	\N	\N	\N
4499	7	4	35	\N	\N	\N	\N
4500	7	4	36	\N	\N	\N	\N
4501	7	4	37	\N	\N	\N	\N
4502	7	4	38	\N	\N	\N	\N
4503	7	4	39	\N	\N	\N	\N
4504	7	4	40	\N	\N	\N	\N
4505	7	4	41	\N	\N	\N	\N
4506	7	4	42	\N	\N	\N	\N
4507	7	4	43	\N	\N	\N	\N
4508	7	4	44	\N	\N	\N	\N
4509	7	4	45	\N	\N	\N	\N
4510	7	4	46	\N	\N	\N	\N
4511	7	4	47	\N	\N	\N	\N
4512	7	4	48	\N	\N	\N	\N
4513	7	5	1	\N	\N	\N	\N
4514	7	5	2	\N	\N	\N	\N
4515	7	5	3	\N	\N	\N	\N
4516	7	5	4	\N	\N	\N	\N
4517	7	5	5	\N	\N	\N	\N
4518	7	5	6	\N	\N	\N	\N
4519	7	5	7	\N	\N	\N	\N
4520	7	5	8	\N	\N	\N	\N
4521	7	5	9	\N	\N	\N	\N
4522	7	5	10	\N	\N	\N	\N
4523	7	5	11	\N	\N	\N	\N
4524	7	5	12	\N	\N	\N	\N
4525	7	5	13	\N	\N	\N	\N
4526	7	5	14	\N	\N	\N	\N
4527	7	5	15	\N	\N	\N	\N
4528	7	5	16	\N	\N	\N	\N
4529	7	5	17	\N	\N	\N	\N
4530	7	5	18	\N	\N	\N	\N
4531	7	5	19	\N	\N	\N	\N
4532	7	5	20	\N	\N	\N	\N
4533	7	5	21	\N	\N	\N	\N
4534	7	5	22	\N	\N	\N	\N
4535	7	5	23	\N	\N	\N	\N
4536	7	5	24	\N	\N	\N	\N
4537	7	5	25	\N	\N	\N	\N
4538	7	5	26	\N	\N	\N	\N
4539	7	5	27	\N	\N	\N	\N
4540	7	5	28	\N	\N	\N	\N
4541	7	5	29	\N	\N	\N	\N
4542	7	5	30	\N	\N	\N	\N
4543	7	5	31	\N	\N	\N	\N
4544	7	5	32	\N	\N	\N	\N
4545	7	5	33	\N	\N	\N	\N
4546	7	5	34	\N	\N	\N	\N
4547	7	5	35	\N	\N	\N	\N
4548	7	5	36	\N	\N	\N	\N
4549	7	5	37	\N	\N	\N	\N
4550	7	5	38	\N	\N	\N	\N
4551	7	5	39	\N	\N	\N	\N
4552	7	5	40	\N	\N	\N	\N
4553	7	5	41	\N	\N	\N	\N
4554	7	5	42	\N	\N	\N	\N
4555	7	5	43	\N	\N	\N	\N
4556	7	5	44	\N	\N	\N	\N
4557	7	5	45	\N	\N	\N	\N
4558	7	5	46	\N	\N	\N	\N
4559	7	5	47	\N	\N	\N	\N
4560	7	5	48	\N	\N	\N	\N
4561	7	6	1	\N	\N	\N	\N
4562	7	6	2	\N	\N	\N	\N
4563	7	6	3	\N	\N	\N	\N
4564	7	6	4	\N	\N	\N	\N
4565	7	6	5	\N	\N	\N	\N
4566	7	6	6	\N	\N	\N	\N
4567	7	6	7	\N	\N	\N	\N
4568	7	6	8	\N	\N	\N	\N
4569	7	6	9	\N	\N	\N	\N
4570	7	6	10	\N	\N	\N	\N
4571	7	6	11	\N	\N	\N	\N
4572	7	6	12	\N	\N	\N	\N
4573	7	6	13	\N	\N	\N	\N
4574	7	6	14	\N	\N	\N	\N
4575	7	6	15	\N	\N	\N	\N
4576	7	6	16	\N	\N	\N	\N
4577	7	6	17	\N	\N	\N	\N
4578	7	6	18	\N	\N	\N	\N
4579	7	6	19	\N	\N	\N	\N
4580	7	6	20	\N	\N	\N	\N
4581	7	6	21	\N	\N	\N	\N
4582	7	6	22	\N	\N	\N	\N
4583	7	6	23	\N	\N	\N	\N
4584	7	6	24	\N	\N	\N	\N
4585	7	6	25	\N	\N	\N	\N
4586	7	6	26	\N	\N	\N	\N
4587	7	6	27	\N	\N	\N	\N
4588	7	6	28	\N	\N	\N	\N
4589	7	6	29	\N	\N	\N	\N
4590	7	6	30	\N	\N	\N	\N
4591	7	6	31	\N	\N	\N	\N
4592	7	6	32	\N	\N	\N	\N
4593	7	6	33	\N	\N	\N	\N
4594	7	6	34	\N	\N	\N	\N
4595	7	6	35	\N	\N	\N	\N
4596	7	6	36	\N	\N	\N	\N
4597	7	6	37	\N	\N	\N	\N
4598	7	6	38	\N	\N	\N	\N
4599	7	6	39	\N	\N	\N	\N
4600	7	6	40	\N	\N	\N	\N
4601	7	6	41	\N	\N	\N	\N
4602	7	6	42	\N	\N	\N	\N
4603	7	6	43	\N	\N	\N	\N
4604	7	6	44	\N	\N	\N	\N
4605	7	6	45	\N	\N	\N	\N
4606	7	6	46	\N	\N	\N	\N
4607	7	6	47	\N	\N	\N	\N
4608	7	6	48	\N	\N	\N	\N
4609	7	7	1	\N	\N	\N	\N
4610	7	7	2	\N	\N	\N	\N
4611	7	7	3	\N	\N	\N	\N
4612	7	7	4	\N	\N	\N	\N
4613	7	7	5	\N	\N	\N	\N
4614	7	7	6	\N	\N	\N	\N
4615	7	7	7	\N	\N	\N	\N
4616	7	7	8	\N	\N	\N	\N
4617	7	7	9	\N	\N	\N	\N
4618	7	7	10	\N	\N	\N	\N
4619	7	7	11	\N	\N	\N	\N
4620	7	7	12	\N	\N	\N	\N
4621	7	7	13	\N	\N	\N	\N
4622	7	7	14	\N	\N	\N	\N
4623	7	7	15	\N	\N	\N	\N
4624	7	7	16	\N	\N	\N	\N
4625	7	7	17	\N	\N	\N	\N
4626	7	7	18	\N	\N	\N	\N
4627	7	7	19	\N	\N	\N	\N
4628	7	7	20	\N	\N	\N	\N
4629	7	7	21	\N	\N	\N	\N
4630	7	7	22	\N	\N	\N	\N
4631	7	7	23	\N	\N	\N	\N
4632	7	7	24	\N	\N	\N	\N
4633	7	7	25	\N	\N	\N	\N
4634	7	7	26	\N	\N	\N	\N
4635	7	7	27	\N	\N	\N	\N
4636	7	7	28	\N	\N	\N	\N
4637	7	7	29	\N	\N	\N	\N
4638	7	7	30	\N	\N	\N	\N
4639	7	7	31	\N	\N	\N	\N
4640	7	7	32	\N	\N	\N	\N
4641	7	7	33	\N	\N	\N	\N
4642	7	7	34	\N	\N	\N	\N
4643	7	7	35	\N	\N	\N	\N
4644	7	7	36	\N	\N	\N	\N
4645	7	7	37	\N	\N	\N	\N
4646	7	7	38	\N	\N	\N	\N
4647	7	7	39	\N	\N	\N	\N
4648	7	7	40	\N	\N	\N	\N
4649	7	7	41	\N	\N	\N	\N
4650	7	7	42	\N	\N	\N	\N
4651	7	7	43	\N	\N	\N	\N
4652	7	7	44	\N	\N	\N	\N
4653	7	7	45	\N	\N	\N	\N
4654	7	7	46	\N	\N	\N	\N
4655	7	7	47	\N	\N	\N	\N
4656	7	7	48	\N	\N	\N	\N
4657	7	8	1	\N	\N	\N	\N
4658	7	8	2	\N	\N	\N	\N
4659	7	8	3	\N	\N	\N	\N
4660	7	8	4	\N	\N	\N	\N
4661	7	8	5	\N	\N	\N	\N
4662	7	8	6	\N	\N	\N	\N
4663	7	8	7	\N	\N	\N	\N
4664	7	8	8	\N	\N	\N	\N
4665	7	8	9	\N	\N	\N	\N
4666	7	8	10	\N	\N	\N	\N
4667	7	8	11	\N	\N	\N	\N
4668	7	8	12	\N	\N	\N	\N
4669	7	8	13	\N	\N	\N	\N
4670	7	8	14	\N	\N	\N	\N
4671	7	8	15	\N	\N	\N	\N
4672	7	8	16	\N	\N	\N	\N
4673	7	8	17	\N	\N	\N	\N
4674	7	8	18	\N	\N	\N	\N
4675	7	8	19	\N	\N	\N	\N
4676	7	8	20	\N	\N	\N	\N
4677	7	8	21	\N	\N	\N	\N
4678	7	8	22	\N	\N	\N	\N
4679	7	8	23	\N	\N	\N	\N
4680	7	8	24	\N	\N	\N	\N
4681	7	8	25	\N	\N	\N	\N
4682	7	8	26	\N	\N	\N	\N
4683	7	8	27	\N	\N	\N	\N
4684	7	8	28	\N	\N	\N	\N
4685	7	8	29	\N	\N	\N	\N
4686	7	8	30	\N	\N	\N	\N
4687	7	8	31	\N	\N	\N	\N
4688	7	8	32	\N	\N	\N	\N
4689	7	8	33	\N	\N	\N	\N
4690	7	8	34	\N	\N	\N	\N
4691	7	8	35	\N	\N	\N	\N
4692	7	8	36	\N	\N	\N	\N
4693	7	8	37	\N	\N	\N	\N
4694	7	8	38	\N	\N	\N	\N
4695	7	8	39	\N	\N	\N	\N
4696	7	8	40	\N	\N	\N	\N
4697	7	8	41	\N	\N	\N	\N
4698	7	8	42	\N	\N	\N	\N
4699	7	8	43	\N	\N	\N	\N
4700	7	8	44	\N	\N	\N	\N
4701	7	8	45	\N	\N	\N	\N
4702	7	8	46	\N	\N	\N	\N
4703	7	8	47	\N	\N	\N	\N
4704	7	8	48	\N	\N	\N	\N
4705	7	9	1	\N	\N	\N	\N
4706	7	9	2	\N	\N	\N	\N
4707	7	9	3	\N	\N	\N	\N
4708	7	9	4	\N	\N	\N	\N
4709	7	9	5	\N	\N	\N	\N
4710	7	9	6	\N	\N	\N	\N
4711	7	9	7	\N	\N	\N	\N
4712	7	9	8	\N	\N	\N	\N
4713	7	9	9	\N	\N	\N	\N
4714	7	9	10	\N	\N	\N	\N
4715	7	9	11	\N	\N	\N	\N
4716	7	9	12	\N	\N	\N	\N
4717	7	9	13	\N	\N	\N	\N
4718	7	9	14	\N	\N	\N	\N
4719	7	9	15	\N	\N	\N	\N
4720	7	9	16	\N	\N	\N	\N
4721	7	9	17	\N	\N	\N	\N
4722	7	9	18	\N	\N	\N	\N
4723	7	9	19	\N	\N	\N	\N
4724	7	9	20	\N	\N	\N	\N
4725	7	9	21	\N	\N	\N	\N
4726	7	9	22	\N	\N	\N	\N
4727	7	9	23	\N	\N	\N	\N
4728	7	9	24	\N	\N	\N	\N
4729	7	9	25	\N	\N	\N	\N
4730	7	9	26	\N	\N	\N	\N
4731	7	9	27	\N	\N	\N	\N
4732	7	9	28	\N	\N	\N	\N
4733	7	9	29	\N	\N	\N	\N
4734	7	9	30	\N	\N	\N	\N
4735	7	9	31	\N	\N	\N	\N
4736	7	9	32	\N	\N	\N	\N
4737	7	9	33	\N	\N	\N	\N
4738	7	9	34	\N	\N	\N	\N
4739	7	9	35	\N	\N	\N	\N
4740	7	9	36	\N	\N	\N	\N
4741	7	9	37	\N	\N	\N	\N
4742	7	9	38	\N	\N	\N	\N
4743	7	9	39	\N	\N	\N	\N
4744	7	9	40	\N	\N	\N	\N
4745	7	9	41	\N	\N	\N	\N
4746	7	9	42	\N	\N	\N	\N
4747	7	9	43	\N	\N	\N	\N
4748	7	9	44	\N	\N	\N	\N
4749	7	9	45	\N	\N	\N	\N
4750	7	9	46	\N	\N	\N	\N
4751	7	9	47	\N	\N	\N	\N
4752	7	9	48	\N	\N	\N	\N
4753	7	10	1	\N	\N	\N	\N
4754	7	10	2	\N	\N	\N	\N
4755	7	10	3	\N	\N	\N	\N
4756	7	10	4	\N	\N	\N	\N
4757	7	10	5	\N	\N	\N	\N
4758	7	10	6	\N	\N	\N	\N
4759	7	10	7	\N	\N	\N	\N
4760	7	10	8	\N	\N	\N	\N
4761	7	10	9	\N	\N	\N	\N
4762	7	10	10	\N	\N	\N	\N
4763	7	10	11	\N	\N	\N	\N
4764	7	10	12	\N	\N	\N	\N
4765	7	10	13	\N	\N	\N	\N
4766	7	10	14	\N	\N	\N	\N
4767	7	10	15	\N	\N	\N	\N
4768	7	10	16	\N	\N	\N	\N
4769	7	10	17	\N	\N	\N	\N
4770	7	10	18	\N	\N	\N	\N
4771	7	10	19	\N	\N	\N	\N
4772	7	10	20	\N	\N	\N	\N
4773	7	10	21	\N	\N	\N	\N
4774	7	10	22	\N	\N	\N	\N
4775	7	10	23	\N	\N	\N	\N
4776	7	10	24	\N	\N	\N	\N
4777	7	10	25	\N	\N	\N	\N
4778	7	10	26	\N	\N	\N	\N
4779	7	10	27	\N	\N	\N	\N
4780	7	10	28	\N	\N	\N	\N
4781	7	10	29	\N	\N	\N	\N
4782	7	10	30	\N	\N	\N	\N
4783	7	10	31	\N	\N	\N	\N
4784	7	10	32	\N	\N	\N	\N
4785	7	10	33	\N	\N	\N	\N
4786	7	10	34	\N	\N	\N	\N
4787	7	10	35	\N	\N	\N	\N
4788	7	10	36	\N	\N	\N	\N
4789	7	10	37	\N	\N	\N	\N
4790	7	10	38	\N	\N	\N	\N
4791	7	10	39	\N	\N	\N	\N
4792	7	10	40	\N	\N	\N	\N
4793	7	10	41	\N	\N	\N	\N
4794	7	10	42	\N	\N	\N	\N
4795	7	10	43	\N	\N	\N	\N
4796	7	10	44	\N	\N	\N	\N
4797	7	10	45	\N	\N	\N	\N
4798	7	10	46	\N	\N	\N	\N
4799	7	10	47	\N	\N	\N	\N
4800	7	10	48	\N	\N	\N	\N
4801	7	11	1	\N	\N	\N	\N
4802	7	11	2	\N	\N	\N	\N
4803	7	11	3	\N	\N	\N	\N
4804	7	11	4	\N	\N	\N	\N
4805	7	11	5	\N	\N	\N	\N
4806	7	11	6	\N	\N	\N	\N
4807	7	11	7	\N	\N	\N	\N
4808	7	11	8	\N	\N	\N	\N
4809	7	11	9	\N	\N	\N	\N
4810	7	11	10	\N	\N	\N	\N
4811	7	11	11	\N	\N	\N	\N
4812	7	11	12	\N	\N	\N	\N
4813	7	11	13	\N	\N	\N	\N
4814	7	11	14	\N	\N	\N	\N
4815	7	11	15	\N	\N	\N	\N
4816	7	11	16	\N	\N	\N	\N
4817	7	11	17	\N	\N	\N	\N
4818	7	11	18	\N	\N	\N	\N
4819	7	11	19	\N	\N	\N	\N
4820	7	11	20	\N	\N	\N	\N
4821	7	11	21	\N	\N	\N	\N
4822	7	11	22	\N	\N	\N	\N
4823	7	11	23	\N	\N	\N	\N
4824	7	11	24	\N	\N	\N	\N
4825	7	11	25	\N	\N	\N	\N
4826	7	11	26	\N	\N	\N	\N
4827	7	11	27	\N	\N	\N	\N
4828	7	11	28	\N	\N	\N	\N
4829	7	11	29	\N	\N	\N	\N
4830	7	11	30	\N	\N	\N	\N
4831	7	11	31	\N	\N	\N	\N
4832	7	11	32	\N	\N	\N	\N
4833	7	11	33	\N	\N	\N	\N
4834	7	11	34	\N	\N	\N	\N
4835	7	11	35	\N	\N	\N	\N
4836	7	11	36	\N	\N	\N	\N
4837	7	11	37	\N	\N	\N	\N
4838	7	11	38	\N	\N	\N	\N
4839	7	11	39	\N	\N	\N	\N
4840	7	11	40	\N	\N	\N	\N
4841	7	11	41	\N	\N	\N	\N
4842	7	11	42	\N	\N	\N	\N
4843	7	11	43	\N	\N	\N	\N
4844	7	11	44	\N	\N	\N	\N
4845	7	11	45	\N	\N	\N	\N
4846	7	11	46	\N	\N	\N	\N
4847	7	11	47	\N	\N	\N	\N
4848	7	11	48	\N	\N	\N	\N
4849	7	12	1	\N	\N	\N	\N
4850	7	12	2	\N	\N	\N	\N
4851	7	12	3	\N	\N	\N	\N
4852	7	12	4	\N	\N	\N	\N
4853	7	12	5	\N	\N	\N	\N
4854	7	12	6	\N	\N	\N	\N
4855	7	12	7	\N	\N	\N	\N
4856	7	12	8	\N	\N	\N	\N
4857	7	12	9	\N	\N	\N	\N
4858	7	12	10	\N	\N	\N	\N
4859	7	12	11	\N	\N	\N	\N
4860	7	12	12	\N	\N	\N	\N
4861	7	12	13	\N	\N	\N	\N
4862	7	12	14	\N	\N	\N	\N
4863	7	12	15	\N	\N	\N	\N
4864	7	12	16	\N	\N	\N	\N
4865	7	12	17	\N	\N	\N	\N
4866	7	12	18	\N	\N	\N	\N
4867	7	12	19	\N	\N	\N	\N
4868	7	12	20	\N	\N	\N	\N
4869	7	12	21	\N	\N	\N	\N
4870	7	12	22	\N	\N	\N	\N
4871	7	12	23	\N	\N	\N	\N
4872	7	12	24	\N	\N	\N	\N
4873	7	12	25	\N	\N	\N	\N
4874	7	12	26	\N	\N	\N	\N
4875	7	12	27	\N	\N	\N	\N
4876	7	12	28	\N	\N	\N	\N
4877	7	12	29	\N	\N	\N	\N
4878	7	12	30	\N	\N	\N	\N
4879	7	12	31	\N	\N	\N	\N
4880	7	12	32	\N	\N	\N	\N
4881	7	12	33	\N	\N	\N	\N
4882	7	12	34	\N	\N	\N	\N
4883	7	12	35	\N	\N	\N	\N
4884	7	12	36	\N	\N	\N	\N
4885	7	12	37	\N	\N	\N	\N
4886	7	12	38	\N	\N	\N	\N
4887	7	12	39	\N	\N	\N	\N
4888	7	12	40	\N	\N	\N	\N
4889	7	12	41	\N	\N	\N	\N
4890	7	12	42	\N	\N	\N	\N
4891	7	12	43	\N	\N	\N	\N
4892	7	12	44	\N	\N	\N	\N
4893	7	12	45	\N	\N	\N	\N
4894	7	12	46	\N	\N	\N	\N
4895	7	12	47	\N	\N	\N	\N
4896	7	12	48	\N	\N	\N	\N
4897	7	13	1	\N	\N	\N	\N
4898	7	13	2	\N	\N	\N	\N
4899	7	13	3	\N	\N	\N	\N
4900	7	13	4	\N	\N	\N	\N
4901	7	13	5	\N	\N	\N	\N
4902	7	13	6	\N	\N	\N	\N
4903	7	13	7	\N	\N	\N	\N
4904	7	13	8	\N	\N	\N	\N
4905	7	13	9	\N	\N	\N	\N
4906	7	13	10	\N	\N	\N	\N
4907	7	13	11	\N	\N	\N	\N
4908	7	13	12	\N	\N	\N	\N
4909	7	13	13	\N	\N	\N	\N
4910	7	13	14	\N	\N	\N	\N
4911	7	13	15	\N	\N	\N	\N
4912	7	13	16	\N	\N	\N	\N
4913	7	13	17	\N	\N	\N	\N
4914	7	13	18	\N	\N	\N	\N
4915	7	13	19	\N	\N	\N	\N
4916	7	13	20	\N	\N	\N	\N
4917	7	13	21	\N	\N	\N	\N
4918	7	13	22	\N	\N	\N	\N
4919	7	13	23	\N	\N	\N	\N
4920	7	13	24	\N	\N	\N	\N
4921	7	13	25	\N	\N	\N	\N
4922	7	13	26	\N	\N	\N	\N
4923	7	13	27	\N	\N	\N	\N
4924	7	13	28	\N	\N	\N	\N
4925	7	13	29	\N	\N	\N	\N
4926	7	13	30	\N	\N	\N	\N
4927	7	13	31	\N	\N	\N	\N
4928	7	13	32	\N	\N	\N	\N
4929	7	13	33	\N	\N	\N	\N
4930	7	13	34	\N	\N	\N	\N
4931	7	13	35	\N	\N	\N	\N
4932	7	13	36	\N	\N	\N	\N
4933	7	13	37	\N	\N	\N	\N
4934	7	13	38	\N	\N	\N	\N
4935	7	13	39	\N	\N	\N	\N
4936	7	13	40	\N	\N	\N	\N
4937	7	13	41	\N	\N	\N	\N
4938	7	13	42	\N	\N	\N	\N
4939	7	13	43	\N	\N	\N	\N
4940	7	13	44	\N	\N	\N	\N
4941	7	13	45	\N	\N	\N	\N
4942	7	13	46	\N	\N	\N	\N
4943	7	13	47	\N	\N	\N	\N
4944	7	13	48	\N	\N	\N	\N
4945	7	14	1	\N	\N	\N	\N
4946	7	14	2	\N	\N	\N	\N
4947	7	14	3	\N	\N	\N	\N
4948	7	14	4	\N	\N	\N	\N
4949	7	14	5	\N	\N	\N	\N
4950	7	14	6	\N	\N	\N	\N
4951	7	14	7	\N	\N	\N	\N
4952	7	14	8	\N	\N	\N	\N
4953	7	14	9	\N	\N	\N	\N
4954	7	14	10	\N	\N	\N	\N
4955	7	14	11	\N	\N	\N	\N
4956	7	14	12	\N	\N	\N	\N
4957	7	14	13	\N	\N	\N	\N
4958	7	14	14	\N	\N	\N	\N
4959	7	14	15	\N	\N	\N	\N
4960	7	14	16	\N	\N	\N	\N
4961	7	14	17	\N	\N	\N	\N
4962	7	14	18	\N	\N	\N	\N
4963	7	14	19	\N	\N	\N	\N
4964	7	14	20	\N	\N	\N	\N
4965	7	14	21	\N	\N	\N	\N
4966	7	14	22	\N	\N	\N	\N
4967	7	14	23	\N	\N	\N	\N
4968	7	14	24	\N	\N	\N	\N
4969	7	14	25	\N	\N	\N	\N
4970	7	14	26	\N	\N	\N	\N
4971	7	14	27	\N	\N	\N	\N
4972	7	14	28	\N	\N	\N	\N
4973	7	14	29	\N	\N	\N	\N
4974	7	14	30	\N	\N	\N	\N
4975	7	14	31	\N	\N	\N	\N
4976	7	14	32	\N	\N	\N	\N
4977	7	14	33	\N	\N	\N	\N
4978	7	14	34	\N	\N	\N	\N
4979	7	14	35	\N	\N	\N	\N
4980	7	14	36	\N	\N	\N	\N
4981	7	14	37	\N	\N	\N	\N
4982	7	14	38	\N	\N	\N	\N
4983	7	14	39	\N	\N	\N	\N
4984	7	14	40	\N	\N	\N	\N
4985	7	14	41	\N	\N	\N	\N
4986	7	14	42	\N	\N	\N	\N
4987	7	14	43	\N	\N	\N	\N
4988	7	14	44	\N	\N	\N	\N
4989	7	14	45	\N	\N	\N	\N
4990	7	14	46	\N	\N	\N	\N
4991	7	14	47	\N	\N	\N	\N
4992	7	14	48	\N	\N	\N	\N
4993	7	15	1	\N	\N	\N	\N
4994	7	15	2	\N	\N	\N	\N
4995	7	15	3	\N	\N	\N	\N
4996	7	15	4	\N	\N	\N	\N
4997	7	15	5	\N	\N	\N	\N
4998	7	15	6	\N	\N	\N	\N
4999	7	15	7	\N	\N	\N	\N
5000	7	15	8	\N	\N	\N	\N
5001	7	15	9	\N	\N	\N	\N
5002	7	15	10	\N	\N	\N	\N
5003	7	15	11	\N	\N	\N	\N
5004	7	15	12	\N	\N	\N	\N
5005	7	15	13	\N	\N	\N	\N
5006	7	15	14	\N	\N	\N	\N
5007	7	15	15	\N	\N	\N	\N
5008	7	15	16	\N	\N	\N	\N
5009	7	15	17	\N	\N	\N	\N
5010	7	15	18	\N	\N	\N	\N
5011	7	15	19	\N	\N	\N	\N
5012	7	15	20	\N	\N	\N	\N
5013	7	15	21	\N	\N	\N	\N
5014	7	15	22	\N	\N	\N	\N
5015	7	15	23	\N	\N	\N	\N
5016	7	15	24	\N	\N	\N	\N
5017	7	15	25	\N	\N	\N	\N
5018	7	15	26	\N	\N	\N	\N
5019	7	15	27	\N	\N	\N	\N
5020	7	15	28	\N	\N	\N	\N
5021	7	15	29	\N	\N	\N	\N
5022	7	15	30	\N	\N	\N	\N
5023	7	15	31	\N	\N	\N	\N
5024	7	15	32	\N	\N	\N	\N
5025	7	15	33	\N	\N	\N	\N
5026	7	15	34	\N	\N	\N	\N
5027	7	15	35	\N	\N	\N	\N
5028	7	15	36	\N	\N	\N	\N
5029	7	15	37	\N	\N	\N	\N
5030	7	15	38	\N	\N	\N	\N
5031	7	15	39	\N	\N	\N	\N
5032	7	15	40	\N	\N	\N	\N
5033	7	15	41	\N	\N	\N	\N
5034	7	15	42	\N	\N	\N	\N
5035	7	15	43	\N	\N	\N	\N
5036	7	15	44	\N	\N	\N	\N
5037	7	15	45	\N	\N	\N	\N
5038	7	15	46	\N	\N	\N	\N
5039	7	15	47	\N	\N	\N	\N
5040	7	15	48	\N	\N	\N	\N
5041	8	1	1	\N	\N	\N	\N
5042	8	1	2	\N	\N	\N	\N
5043	8	1	3	\N	\N	\N	\N
5044	8	1	4	\N	\N	\N	\N
5045	8	1	5	\N	\N	\N	\N
5046	8	1	6	\N	\N	\N	\N
5047	8	1	7	\N	\N	\N	\N
5048	8	1	8	\N	\N	\N	\N
5049	8	1	9	\N	\N	\N	\N
5050	8	1	10	\N	\N	\N	\N
5051	8	1	11	\N	\N	\N	\N
5052	8	1	12	\N	\N	\N	\N
5053	8	1	13	\N	\N	\N	\N
5054	8	1	14	\N	\N	\N	\N
5055	8	1	15	\N	\N	\N	\N
5056	8	1	16	\N	\N	\N	\N
5057	8	1	17	\N	\N	\N	\N
5058	8	1	18	\N	\N	\N	\N
5059	8	1	19	\N	\N	\N	\N
5060	8	1	20	\N	\N	\N	\N
5061	8	1	21	\N	\N	\N	\N
5062	8	1	22	\N	\N	\N	\N
5063	8	1	23	\N	\N	\N	\N
5064	8	1	24	\N	\N	\N	\N
5065	8	1	25	\N	\N	\N	\N
5066	8	1	26	\N	\N	\N	\N
5067	8	1	27	\N	\N	\N	\N
5068	8	1	28	\N	\N	\N	\N
5069	8	1	29	\N	\N	\N	\N
5070	8	1	30	\N	\N	\N	\N
5071	8	1	31	\N	\N	\N	\N
5072	8	1	32	\N	\N	\N	\N
5073	8	1	33	\N	\N	\N	\N
5074	8	1	34	\N	\N	\N	\N
5075	8	1	35	\N	\N	\N	\N
5076	8	1	36	\N	\N	\N	\N
5077	8	1	37	\N	\N	\N	\N
5078	8	1	38	\N	\N	\N	\N
5079	8	1	39	\N	\N	\N	\N
5080	8	1	40	\N	\N	\N	\N
5081	8	1	41	\N	\N	\N	\N
5082	8	1	42	\N	\N	\N	\N
5083	8	1	43	\N	\N	\N	\N
5084	8	1	44	\N	\N	\N	\N
5085	8	1	45	\N	\N	\N	\N
5086	8	1	46	\N	\N	\N	\N
5087	8	1	47	\N	\N	\N	\N
5088	8	1	48	\N	\N	\N	\N
5089	8	2	1	\N	\N	\N	\N
5090	8	2	2	\N	\N	\N	\N
5091	8	2	3	\N	\N	\N	\N
5092	8	2	4	\N	\N	\N	\N
5093	8	2	5	\N	\N	\N	\N
5094	8	2	6	\N	\N	\N	\N
5095	8	2	7	\N	\N	\N	\N
5096	8	2	8	\N	\N	\N	\N
5097	8	2	9	\N	\N	\N	\N
5098	8	2	10	\N	\N	\N	\N
5099	8	2	11	\N	\N	\N	\N
5100	8	2	12	\N	\N	\N	\N
5101	8	2	13	\N	\N	\N	\N
5102	8	2	14	\N	\N	\N	\N
5103	8	2	15	\N	\N	\N	\N
5104	8	2	16	\N	\N	\N	\N
5105	8	2	17	\N	\N	\N	\N
5106	8	2	18	\N	\N	\N	\N
5107	8	2	19	\N	\N	\N	\N
5108	8	2	20	\N	\N	\N	\N
5109	8	2	21	\N	\N	\N	\N
5110	8	2	22	\N	\N	\N	\N
5111	8	2	23	\N	\N	\N	\N
5112	8	2	24	\N	\N	\N	\N
5113	8	2	25	\N	\N	\N	\N
5114	8	2	26	\N	\N	\N	\N
5115	8	2	27	\N	\N	\N	\N
5116	8	2	28	\N	\N	\N	\N
5117	8	2	29	\N	\N	\N	\N
5118	8	2	30	\N	\N	\N	\N
5119	8	2	31	\N	\N	\N	\N
5120	8	2	32	\N	\N	\N	\N
5121	8	2	33	\N	\N	\N	\N
5122	8	2	34	\N	\N	\N	\N
5123	8	2	35	\N	\N	\N	\N
5124	8	2	36	\N	\N	\N	\N
5125	8	2	37	\N	\N	\N	\N
5126	8	2	38	\N	\N	\N	\N
5127	8	2	39	\N	\N	\N	\N
5128	8	2	40	\N	\N	\N	\N
5129	8	2	41	\N	\N	\N	\N
5130	8	2	42	\N	\N	\N	\N
5131	8	2	43	\N	\N	\N	\N
5132	8	2	44	\N	\N	\N	\N
5133	8	2	45	\N	\N	\N	\N
5134	8	2	46	\N	\N	\N	\N
5135	8	2	47	\N	\N	\N	\N
5136	8	2	48	\N	\N	\N	\N
5137	8	3	1	\N	\N	\N	\N
5138	8	3	2	\N	\N	\N	\N
5139	8	3	3	\N	\N	\N	\N
5140	8	3	4	\N	\N	\N	\N
5141	8	3	5	\N	\N	\N	\N
5142	8	3	6	\N	\N	\N	\N
5143	8	3	7	\N	\N	\N	\N
5144	8	3	8	\N	\N	\N	\N
5145	8	3	9	\N	\N	\N	\N
5146	8	3	10	\N	\N	\N	\N
5147	8	3	11	\N	\N	\N	\N
5148	8	3	12	\N	\N	\N	\N
5149	8	3	13	\N	\N	\N	\N
5150	8	3	14	\N	\N	\N	\N
5151	8	3	15	\N	\N	\N	\N
5152	8	3	16	\N	\N	\N	\N
5153	8	3	17	\N	\N	\N	\N
5154	8	3	18	\N	\N	\N	\N
5155	8	3	19	\N	\N	\N	\N
5156	8	3	20	\N	\N	\N	\N
5157	8	3	21	\N	\N	\N	\N
5158	8	3	22	\N	\N	\N	\N
5159	8	3	23	\N	\N	\N	\N
5160	8	3	24	\N	\N	\N	\N
5161	8	3	25	\N	\N	\N	\N
5162	8	3	26	\N	\N	\N	\N
5163	8	3	27	\N	\N	\N	\N
5164	8	3	28	\N	\N	\N	\N
5165	8	3	29	\N	\N	\N	\N
5166	8	3	30	\N	\N	\N	\N
5167	8	3	31	\N	\N	\N	\N
5168	8	3	32	\N	\N	\N	\N
5169	8	3	33	\N	\N	\N	\N
5170	8	3	34	\N	\N	\N	\N
5171	8	3	35	\N	\N	\N	\N
5172	8	3	36	\N	\N	\N	\N
5173	8	3	37	\N	\N	\N	\N
5174	8	3	38	\N	\N	\N	\N
5175	8	3	39	\N	\N	\N	\N
5176	8	3	40	\N	\N	\N	\N
5177	8	3	41	\N	\N	\N	\N
5178	8	3	42	\N	\N	\N	\N
5179	8	3	43	\N	\N	\N	\N
5180	8	3	44	\N	\N	\N	\N
5181	8	3	45	\N	\N	\N	\N
5182	8	3	46	\N	\N	\N	\N
5183	8	3	47	\N	\N	\N	\N
5184	8	3	48	\N	\N	\N	\N
5185	8	4	1	\N	\N	\N	\N
5186	8	4	2	\N	\N	\N	\N
5187	8	4	3	\N	\N	\N	\N
5188	8	4	4	\N	\N	\N	\N
5189	8	4	5	\N	\N	\N	\N
5190	8	4	6	\N	\N	\N	\N
5191	8	4	7	\N	\N	\N	\N
5192	8	4	8	\N	\N	\N	\N
5193	8	4	9	\N	\N	\N	\N
5194	8	4	10	\N	\N	\N	\N
5195	8	4	11	\N	\N	\N	\N
5196	8	4	12	\N	\N	\N	\N
5197	8	4	13	\N	\N	\N	\N
5198	8	4	14	\N	\N	\N	\N
5199	8	4	15	\N	\N	\N	\N
5200	8	4	16	\N	\N	\N	\N
5201	8	4	17	\N	\N	\N	\N
5202	8	4	18	\N	\N	\N	\N
5203	8	4	19	\N	\N	\N	\N
5204	8	4	20	\N	\N	\N	\N
5205	8	4	21	\N	\N	\N	\N
5206	8	4	22	\N	\N	\N	\N
5207	8	4	23	\N	\N	\N	\N
5208	8	4	24	\N	\N	\N	\N
5209	8	4	25	\N	\N	\N	\N
5210	8	4	26	\N	\N	\N	\N
5211	8	4	27	\N	\N	\N	\N
5212	8	4	28	\N	\N	\N	\N
5213	8	4	29	\N	\N	\N	\N
5214	8	4	30	\N	\N	\N	\N
5215	8	4	31	\N	\N	\N	\N
5216	8	4	32	\N	\N	\N	\N
5217	8	4	33	\N	\N	\N	\N
5218	8	4	34	\N	\N	\N	\N
5219	8	4	35	\N	\N	\N	\N
5220	8	4	36	\N	\N	\N	\N
5221	8	4	37	\N	\N	\N	\N
5222	8	4	38	\N	\N	\N	\N
5223	8	4	39	\N	\N	\N	\N
5224	8	4	40	\N	\N	\N	\N
5225	8	4	41	\N	\N	\N	\N
5226	8	4	42	\N	\N	\N	\N
5227	8	4	43	\N	\N	\N	\N
5228	8	4	44	\N	\N	\N	\N
5229	8	4	45	\N	\N	\N	\N
5230	8	4	46	\N	\N	\N	\N
5231	8	4	47	\N	\N	\N	\N
5232	8	4	48	\N	\N	\N	\N
5233	8	5	1	\N	\N	\N	\N
5234	8	5	2	\N	\N	\N	\N
5235	8	5	3	\N	\N	\N	\N
5236	8	5	4	\N	\N	\N	\N
5237	8	5	5	\N	\N	\N	\N
5238	8	5	6	\N	\N	\N	\N
5239	8	5	7	\N	\N	\N	\N
5240	8	5	8	\N	\N	\N	\N
5241	8	5	9	\N	\N	\N	\N
5242	8	5	10	\N	\N	\N	\N
5243	8	5	11	\N	\N	\N	\N
5244	8	5	12	\N	\N	\N	\N
5245	8	5	13	\N	\N	\N	\N
5246	8	5	14	\N	\N	\N	\N
5247	8	5	15	\N	\N	\N	\N
5248	8	5	16	\N	\N	\N	\N
5249	8	5	17	\N	\N	\N	\N
5250	8	5	18	\N	\N	\N	\N
5251	8	5	19	\N	\N	\N	\N
5252	8	5	20	\N	\N	\N	\N
5253	8	5	21	\N	\N	\N	\N
5254	8	5	22	\N	\N	\N	\N
5255	8	5	23	\N	\N	\N	\N
5256	8	5	24	\N	\N	\N	\N
5257	8	5	25	\N	\N	\N	\N
5258	8	5	26	\N	\N	\N	\N
5259	8	5	27	\N	\N	\N	\N
5260	8	5	28	\N	\N	\N	\N
5261	8	5	29	\N	\N	\N	\N
5262	8	5	30	\N	\N	\N	\N
5263	8	5	31	\N	\N	\N	\N
5264	8	5	32	\N	\N	\N	\N
5265	8	5	33	\N	\N	\N	\N
5266	8	5	34	\N	\N	\N	\N
5267	8	5	35	\N	\N	\N	\N
5268	8	5	36	\N	\N	\N	\N
5269	8	5	37	\N	\N	\N	\N
5270	8	5	38	\N	\N	\N	\N
5271	8	5	39	\N	\N	\N	\N
5272	8	5	40	\N	\N	\N	\N
5273	8	5	41	\N	\N	\N	\N
5274	8	5	42	\N	\N	\N	\N
5275	8	5	43	\N	\N	\N	\N
5276	8	5	44	\N	\N	\N	\N
5277	8	5	45	\N	\N	\N	\N
5278	8	5	46	\N	\N	\N	\N
5279	8	5	47	\N	\N	\N	\N
5280	8	5	48	\N	\N	\N	\N
5281	8	6	1	\N	\N	\N	\N
5282	8	6	2	\N	\N	\N	\N
5283	8	6	3	\N	\N	\N	\N
5284	8	6	4	\N	\N	\N	\N
5285	8	6	5	\N	\N	\N	\N
5286	8	6	6	\N	\N	\N	\N
5287	8	6	7	\N	\N	\N	\N
5288	8	6	8	\N	\N	\N	\N
5289	8	6	9	\N	\N	\N	\N
5290	8	6	10	\N	\N	\N	\N
5291	8	6	11	\N	\N	\N	\N
5292	8	6	12	\N	\N	\N	\N
5293	8	6	13	\N	\N	\N	\N
5294	8	6	14	\N	\N	\N	\N
5295	8	6	15	\N	\N	\N	\N
5296	8	6	16	\N	\N	\N	\N
5297	8	6	17	\N	\N	\N	\N
5298	8	6	18	\N	\N	\N	\N
5299	8	6	19	\N	\N	\N	\N
5300	8	6	20	\N	\N	\N	\N
5301	8	6	21	\N	\N	\N	\N
5302	8	6	22	\N	\N	\N	\N
5303	8	6	23	\N	\N	\N	\N
5304	8	6	24	\N	\N	\N	\N
5305	8	6	25	\N	\N	\N	\N
5306	8	6	26	\N	\N	\N	\N
5307	8	6	27	\N	\N	\N	\N
5308	8	6	28	\N	\N	\N	\N
5309	8	6	29	\N	\N	\N	\N
5310	8	6	30	\N	\N	\N	\N
5311	8	6	31	\N	\N	\N	\N
5312	8	6	32	\N	\N	\N	\N
5313	8	6	33	\N	\N	\N	\N
5314	8	6	34	\N	\N	\N	\N
5315	8	6	35	\N	\N	\N	\N
5316	8	6	36	\N	\N	\N	\N
5317	8	6	37	\N	\N	\N	\N
5318	8	6	38	\N	\N	\N	\N
5319	8	6	39	\N	\N	\N	\N
5320	8	6	40	\N	\N	\N	\N
5321	8	6	41	\N	\N	\N	\N
5322	8	6	42	\N	\N	\N	\N
5323	8	6	43	\N	\N	\N	\N
5324	8	6	44	\N	\N	\N	\N
5325	8	6	45	\N	\N	\N	\N
5326	8	6	46	\N	\N	\N	\N
5327	8	6	47	\N	\N	\N	\N
5328	8	6	48	\N	\N	\N	\N
5329	8	7	1	\N	\N	\N	\N
5330	8	7	2	\N	\N	\N	\N
5331	8	7	3	\N	\N	\N	\N
5332	8	7	4	\N	\N	\N	\N
5333	8	7	5	\N	\N	\N	\N
5334	8	7	6	\N	\N	\N	\N
5335	8	7	7	\N	\N	\N	\N
5336	8	7	8	\N	\N	\N	\N
5337	8	7	9	\N	\N	\N	\N
5338	8	7	10	\N	\N	\N	\N
5339	8	7	11	\N	\N	\N	\N
5340	8	7	12	\N	\N	\N	\N
5341	8	7	13	\N	\N	\N	\N
5342	8	7	14	\N	\N	\N	\N
5343	8	7	15	\N	\N	\N	\N
5344	8	7	16	\N	\N	\N	\N
5345	8	7	17	\N	\N	\N	\N
5346	8	7	18	\N	\N	\N	\N
5347	8	7	19	\N	\N	\N	\N
5348	8	7	20	\N	\N	\N	\N
5349	8	7	21	\N	\N	\N	\N
5350	8	7	22	\N	\N	\N	\N
5351	8	7	23	\N	\N	\N	\N
5352	8	7	24	\N	\N	\N	\N
5353	8	7	25	\N	\N	\N	\N
5354	8	7	26	\N	\N	\N	\N
5355	8	7	27	\N	\N	\N	\N
5356	8	7	28	\N	\N	\N	\N
5357	8	7	29	\N	\N	\N	\N
5358	8	7	30	\N	\N	\N	\N
5359	8	7	31	\N	\N	\N	\N
5360	8	7	32	\N	\N	\N	\N
5361	8	7	33	\N	\N	\N	\N
5362	8	7	34	\N	\N	\N	\N
5363	8	7	35	\N	\N	\N	\N
5364	8	7	36	\N	\N	\N	\N
5365	8	7	37	\N	\N	\N	\N
5366	8	7	38	\N	\N	\N	\N
5367	8	7	39	\N	\N	\N	\N
5368	8	7	40	\N	\N	\N	\N
5369	8	7	41	\N	\N	\N	\N
5370	8	7	42	\N	\N	\N	\N
5371	8	7	43	\N	\N	\N	\N
5372	8	7	44	\N	\N	\N	\N
5373	8	7	45	\N	\N	\N	\N
5374	8	7	46	\N	\N	\N	\N
5375	8	7	47	\N	\N	\N	\N
5376	8	7	48	\N	\N	\N	\N
5377	8	8	1	\N	\N	\N	\N
5378	8	8	2	\N	\N	\N	\N
5379	8	8	3	\N	\N	\N	\N
5380	8	8	4	\N	\N	\N	\N
5381	8	8	5	\N	\N	\N	\N
5382	8	8	6	\N	\N	\N	\N
5383	8	8	7	\N	\N	\N	\N
5384	8	8	8	\N	\N	\N	\N
5385	8	8	9	\N	\N	\N	\N
5386	8	8	10	\N	\N	\N	\N
5387	8	8	11	\N	\N	\N	\N
5388	8	8	12	\N	\N	\N	\N
5389	8	8	13	\N	\N	\N	\N
5390	8	8	14	\N	\N	\N	\N
5391	8	8	15	\N	\N	\N	\N
5392	8	8	16	\N	\N	\N	\N
5393	8	8	17	\N	\N	\N	\N
5394	8	8	18	\N	\N	\N	\N
5395	8	8	19	\N	\N	\N	\N
5396	8	8	20	\N	\N	\N	\N
5397	8	8	21	\N	\N	\N	\N
5398	8	8	22	\N	\N	\N	\N
5399	8	8	23	\N	\N	\N	\N
5400	8	8	24	\N	\N	\N	\N
5401	8	8	25	\N	\N	\N	\N
5402	8	8	26	\N	\N	\N	\N
5403	8	8	27	\N	\N	\N	\N
5404	8	8	28	\N	\N	\N	\N
5405	8	8	29	\N	\N	\N	\N
5406	8	8	30	\N	\N	\N	\N
5407	8	8	31	\N	\N	\N	\N
5408	8	8	32	\N	\N	\N	\N
5409	8	8	33	\N	\N	\N	\N
5410	8	8	34	\N	\N	\N	\N
5411	8	8	35	\N	\N	\N	\N
5412	8	8	36	\N	\N	\N	\N
5413	8	8	37	\N	\N	\N	\N
5414	8	8	38	\N	\N	\N	\N
5415	8	8	39	\N	\N	\N	\N
5416	8	8	40	\N	\N	\N	\N
5417	8	8	41	\N	\N	\N	\N
5418	8	8	42	\N	\N	\N	\N
5419	8	8	43	\N	\N	\N	\N
5420	8	8	44	\N	\N	\N	\N
5421	8	8	45	\N	\N	\N	\N
5422	8	8	46	\N	\N	\N	\N
5423	8	8	47	\N	\N	\N	\N
5424	8	8	48	\N	\N	\N	\N
5425	8	9	1	\N	\N	\N	\N
5426	8	9	2	\N	\N	\N	\N
5427	8	9	3	\N	\N	\N	\N
5428	8	9	4	\N	\N	\N	\N
5429	8	9	5	\N	\N	\N	\N
5430	8	9	6	\N	\N	\N	\N
5431	8	9	7	\N	\N	\N	\N
5432	8	9	8	\N	\N	\N	\N
5433	8	9	9	\N	\N	\N	\N
5434	8	9	10	\N	\N	\N	\N
5435	8	9	11	\N	\N	\N	\N
5436	8	9	12	\N	\N	\N	\N
5437	8	9	13	\N	\N	\N	\N
5438	8	9	14	\N	\N	\N	\N
5439	8	9	15	\N	\N	\N	\N
5440	8	9	16	\N	\N	\N	\N
5441	8	9	17	\N	\N	\N	\N
5442	8	9	18	\N	\N	\N	\N
5443	8	9	19	\N	\N	\N	\N
5444	8	9	20	\N	\N	\N	\N
5445	8	9	21	\N	\N	\N	\N
5446	8	9	22	\N	\N	\N	\N
5447	8	9	23	\N	\N	\N	\N
5448	8	9	24	\N	\N	\N	\N
5449	8	9	25	\N	\N	\N	\N
5450	8	9	26	\N	\N	\N	\N
5451	8	9	27	\N	\N	\N	\N
5452	8	9	28	\N	\N	\N	\N
5453	8	9	29	\N	\N	\N	\N
5454	8	9	30	\N	\N	\N	\N
5455	8	9	31	\N	\N	\N	\N
5456	8	9	32	\N	\N	\N	\N
5457	8	9	33	\N	\N	\N	\N
5458	8	9	34	\N	\N	\N	\N
5459	8	9	35	\N	\N	\N	\N
5460	8	9	36	\N	\N	\N	\N
5461	8	9	37	\N	\N	\N	\N
5462	8	9	38	\N	\N	\N	\N
5463	8	9	39	\N	\N	\N	\N
5464	8	9	40	\N	\N	\N	\N
5465	8	9	41	\N	\N	\N	\N
5466	8	9	42	\N	\N	\N	\N
5467	8	9	43	\N	\N	\N	\N
5468	8	9	44	\N	\N	\N	\N
5469	8	9	45	\N	\N	\N	\N
5470	8	9	46	\N	\N	\N	\N
5471	8	9	47	\N	\N	\N	\N
5472	8	9	48	\N	\N	\N	\N
5473	8	10	1	\N	\N	\N	\N
5474	8	10	2	\N	\N	\N	\N
5475	8	10	3	\N	\N	\N	\N
5476	8	10	4	\N	\N	\N	\N
5477	8	10	5	\N	\N	\N	\N
5478	8	10	6	\N	\N	\N	\N
5479	8	10	7	\N	\N	\N	\N
5480	8	10	8	\N	\N	\N	\N
5481	8	10	9	\N	\N	\N	\N
5482	8	10	10	\N	\N	\N	\N
5483	8	10	11	\N	\N	\N	\N
5484	8	10	12	\N	\N	\N	\N
5485	8	10	13	\N	\N	\N	\N
5486	8	10	14	\N	\N	\N	\N
5487	8	10	15	\N	\N	\N	\N
5488	8	10	16	\N	\N	\N	\N
5489	8	10	17	\N	\N	\N	\N
5490	8	10	18	\N	\N	\N	\N
5491	8	10	19	\N	\N	\N	\N
5492	8	10	20	\N	\N	\N	\N
5493	8	10	21	\N	\N	\N	\N
5494	8	10	22	\N	\N	\N	\N
5495	8	10	23	\N	\N	\N	\N
5496	8	10	24	\N	\N	\N	\N
5497	8	10	25	\N	\N	\N	\N
5498	8	10	26	\N	\N	\N	\N
5499	8	10	27	\N	\N	\N	\N
5500	8	10	28	\N	\N	\N	\N
5501	8	10	29	\N	\N	\N	\N
5502	8	10	30	\N	\N	\N	\N
5503	8	10	31	\N	\N	\N	\N
5504	8	10	32	\N	\N	\N	\N
5505	8	10	33	\N	\N	\N	\N
5506	8	10	34	\N	\N	\N	\N
5507	8	10	35	\N	\N	\N	\N
5508	8	10	36	\N	\N	\N	\N
5509	8	10	37	\N	\N	\N	\N
5510	8	10	38	\N	\N	\N	\N
5511	8	10	39	\N	\N	\N	\N
5512	8	10	40	\N	\N	\N	\N
5513	8	10	41	\N	\N	\N	\N
5514	8	10	42	\N	\N	\N	\N
5515	8	10	43	\N	\N	\N	\N
5516	8	10	44	\N	\N	\N	\N
5517	8	10	45	\N	\N	\N	\N
5518	8	10	46	\N	\N	\N	\N
5519	8	10	47	\N	\N	\N	\N
5520	8	10	48	\N	\N	\N	\N
5521	8	11	1	\N	\N	\N	\N
5522	8	11	2	\N	\N	\N	\N
5523	8	11	3	\N	\N	\N	\N
5524	8	11	4	\N	\N	\N	\N
5525	8	11	5	\N	\N	\N	\N
5526	8	11	6	\N	\N	\N	\N
5527	8	11	7	\N	\N	\N	\N
5528	8	11	8	\N	\N	\N	\N
5529	8	11	9	\N	\N	\N	\N
5530	8	11	10	\N	\N	\N	\N
5531	8	11	11	\N	\N	\N	\N
5532	8	11	12	\N	\N	\N	\N
5533	8	11	13	\N	\N	\N	\N
5534	8	11	14	\N	\N	\N	\N
5535	8	11	15	\N	\N	\N	\N
5536	8	11	16	\N	\N	\N	\N
5537	8	11	17	\N	\N	\N	\N
5538	8	11	18	\N	\N	\N	\N
5539	8	11	19	\N	\N	\N	\N
5540	8	11	20	\N	\N	\N	\N
5541	8	11	21	\N	\N	\N	\N
5542	8	11	22	\N	\N	\N	\N
5543	8	11	23	\N	\N	\N	\N
5544	8	11	24	\N	\N	\N	\N
5545	8	11	25	\N	\N	\N	\N
5546	8	11	26	\N	\N	\N	\N
5547	8	11	27	\N	\N	\N	\N
5548	8	11	28	\N	\N	\N	\N
5549	8	11	29	\N	\N	\N	\N
5550	8	11	30	\N	\N	\N	\N
5551	8	11	31	\N	\N	\N	\N
5552	8	11	32	\N	\N	\N	\N
5553	8	11	33	\N	\N	\N	\N
5554	8	11	34	\N	\N	\N	\N
5555	8	11	35	\N	\N	\N	\N
5556	8	11	36	\N	\N	\N	\N
5557	8	11	37	\N	\N	\N	\N
5558	8	11	38	\N	\N	\N	\N
5559	8	11	39	\N	\N	\N	\N
5560	8	11	40	\N	\N	\N	\N
5561	8	11	41	\N	\N	\N	\N
5562	8	11	42	\N	\N	\N	\N
5563	8	11	43	\N	\N	\N	\N
5564	8	11	44	\N	\N	\N	\N
5565	8	11	45	\N	\N	\N	\N
5566	8	11	46	\N	\N	\N	\N
5567	8	11	47	\N	\N	\N	\N
5568	8	11	48	\N	\N	\N	\N
5569	8	12	1	\N	\N	\N	\N
5570	8	12	2	\N	\N	\N	\N
5571	8	12	3	\N	\N	\N	\N
5572	8	12	4	\N	\N	\N	\N
5573	8	12	5	\N	\N	\N	\N
5574	8	12	6	\N	\N	\N	\N
5575	8	12	7	\N	\N	\N	\N
5576	8	12	8	\N	\N	\N	\N
5577	8	12	9	\N	\N	\N	\N
5578	8	12	10	\N	\N	\N	\N
5579	8	12	11	\N	\N	\N	\N
5580	8	12	12	\N	\N	\N	\N
5581	8	12	13	\N	\N	\N	\N
5582	8	12	14	\N	\N	\N	\N
5583	8	12	15	\N	\N	\N	\N
5584	8	12	16	\N	\N	\N	\N
5585	8	12	17	\N	\N	\N	\N
5586	8	12	18	\N	\N	\N	\N
5587	8	12	19	\N	\N	\N	\N
5588	8	12	20	\N	\N	\N	\N
5589	8	12	21	\N	\N	\N	\N
5590	8	12	22	\N	\N	\N	\N
5591	8	12	23	\N	\N	\N	\N
5592	8	12	24	\N	\N	\N	\N
5593	8	12	25	\N	\N	\N	\N
5594	8	12	26	\N	\N	\N	\N
5595	8	12	27	\N	\N	\N	\N
5596	8	12	28	\N	\N	\N	\N
5597	8	12	29	\N	\N	\N	\N
5598	8	12	30	\N	\N	\N	\N
5599	8	12	31	\N	\N	\N	\N
5600	8	12	32	\N	\N	\N	\N
5601	8	12	33	\N	\N	\N	\N
5602	8	12	34	\N	\N	\N	\N
5603	8	12	35	\N	\N	\N	\N
5604	8	12	36	\N	\N	\N	\N
5605	8	12	37	\N	\N	\N	\N
5606	8	12	38	\N	\N	\N	\N
5607	8	12	39	\N	\N	\N	\N
5608	8	12	40	\N	\N	\N	\N
5609	8	12	41	\N	\N	\N	\N
5610	8	12	42	\N	\N	\N	\N
5611	8	12	43	\N	\N	\N	\N
5612	8	12	44	\N	\N	\N	\N
5613	8	12	45	\N	\N	\N	\N
5614	8	12	46	\N	\N	\N	\N
5615	8	12	47	\N	\N	\N	\N
5616	8	12	48	\N	\N	\N	\N
5617	8	13	1	\N	\N	\N	\N
5618	8	13	2	\N	\N	\N	\N
5619	8	13	3	\N	\N	\N	\N
5620	8	13	4	\N	\N	\N	\N
5621	8	13	5	\N	\N	\N	\N
5622	8	13	6	\N	\N	\N	\N
5623	8	13	7	\N	\N	\N	\N
5624	8	13	8	\N	\N	\N	\N
5625	8	13	9	\N	\N	\N	\N
5626	8	13	10	\N	\N	\N	\N
5627	8	13	11	\N	\N	\N	\N
5628	8	13	12	\N	\N	\N	\N
5629	8	13	13	\N	\N	\N	\N
5630	8	13	14	\N	\N	\N	\N
5631	8	13	15	\N	\N	\N	\N
5632	8	13	16	\N	\N	\N	\N
5633	8	13	17	\N	\N	\N	\N
5634	8	13	18	\N	\N	\N	\N
5635	8	13	19	\N	\N	\N	\N
5636	8	13	20	\N	\N	\N	\N
5637	8	13	21	\N	\N	\N	\N
5638	8	13	22	\N	\N	\N	\N
5639	8	13	23	\N	\N	\N	\N
5640	8	13	24	\N	\N	\N	\N
5641	8	13	25	\N	\N	\N	\N
5642	8	13	26	\N	\N	\N	\N
5643	8	13	27	\N	\N	\N	\N
5644	8	13	28	\N	\N	\N	\N
5645	8	13	29	\N	\N	\N	\N
5646	8	13	30	\N	\N	\N	\N
5647	8	13	31	\N	\N	\N	\N
5648	8	13	32	\N	\N	\N	\N
5649	8	13	33	\N	\N	\N	\N
5650	8	13	34	\N	\N	\N	\N
5651	8	13	35	\N	\N	\N	\N
5652	8	13	36	\N	\N	\N	\N
5653	8	13	37	\N	\N	\N	\N
5654	8	13	38	\N	\N	\N	\N
5655	8	13	39	\N	\N	\N	\N
5656	8	13	40	\N	\N	\N	\N
5657	8	13	41	\N	\N	\N	\N
5658	8	13	42	\N	\N	\N	\N
5659	8	13	43	\N	\N	\N	\N
5660	8	13	44	\N	\N	\N	\N
5661	8	13	45	\N	\N	\N	\N
5662	8	13	46	\N	\N	\N	\N
5663	8	13	47	\N	\N	\N	\N
5664	8	13	48	\N	\N	\N	\N
5665	8	14	1	\N	\N	\N	\N
5666	8	14	2	\N	\N	\N	\N
5667	8	14	3	\N	\N	\N	\N
5668	8	14	4	\N	\N	\N	\N
5669	8	14	5	\N	\N	\N	\N
5670	8	14	6	\N	\N	\N	\N
5671	8	14	7	\N	\N	\N	\N
5672	8	14	8	\N	\N	\N	\N
5673	8	14	9	\N	\N	\N	\N
5674	8	14	10	\N	\N	\N	\N
5675	8	14	11	\N	\N	\N	\N
5676	8	14	12	\N	\N	\N	\N
5677	8	14	13	\N	\N	\N	\N
5678	8	14	14	\N	\N	\N	\N
5679	8	14	15	\N	\N	\N	\N
5680	8	14	16	\N	\N	\N	\N
5681	8	14	17	\N	\N	\N	\N
5682	8	14	18	\N	\N	\N	\N
5683	8	14	19	\N	\N	\N	\N
5684	8	14	20	\N	\N	\N	\N
5685	8	14	21	\N	\N	\N	\N
5686	8	14	22	\N	\N	\N	\N
5687	8	14	23	\N	\N	\N	\N
5688	8	14	24	\N	\N	\N	\N
5689	8	14	25	\N	\N	\N	\N
5690	8	14	26	\N	\N	\N	\N
5691	8	14	27	\N	\N	\N	\N
5692	8	14	28	\N	\N	\N	\N
5693	8	14	29	\N	\N	\N	\N
5694	8	14	30	\N	\N	\N	\N
5695	8	14	31	\N	\N	\N	\N
5696	8	14	32	\N	\N	\N	\N
5697	8	14	33	\N	\N	\N	\N
5698	8	14	34	\N	\N	\N	\N
5699	8	14	35	\N	\N	\N	\N
5700	8	14	36	\N	\N	\N	\N
5701	8	14	37	\N	\N	\N	\N
5702	8	14	38	\N	\N	\N	\N
5703	8	14	39	\N	\N	\N	\N
5704	8	14	40	\N	\N	\N	\N
5705	8	14	41	\N	\N	\N	\N
5706	8	14	42	\N	\N	\N	\N
5707	8	14	43	\N	\N	\N	\N
5708	8	14	44	\N	\N	\N	\N
5709	8	14	45	\N	\N	\N	\N
5710	8	14	46	\N	\N	\N	\N
5711	8	14	47	\N	\N	\N	\N
5712	8	14	48	\N	\N	\N	\N
5713	8	15	1	\N	\N	\N	\N
5714	8	15	2	\N	\N	\N	\N
5715	8	15	3	\N	\N	\N	\N
5716	8	15	4	\N	\N	\N	\N
5717	8	15	5	\N	\N	\N	\N
5718	8	15	6	\N	\N	\N	\N
5719	8	15	7	\N	\N	\N	\N
5720	8	15	8	\N	\N	\N	\N
5721	8	15	9	\N	\N	\N	\N
5722	8	15	10	\N	\N	\N	\N
5723	8	15	11	\N	\N	\N	\N
5724	8	15	12	\N	\N	\N	\N
5725	8	15	13	\N	\N	\N	\N
5726	8	15	14	\N	\N	\N	\N
5727	8	15	15	\N	\N	\N	\N
5728	8	15	16	\N	\N	\N	\N
5729	8	15	17	\N	\N	\N	\N
5730	8	15	18	\N	\N	\N	\N
5731	8	15	19	\N	\N	\N	\N
5732	8	15	20	\N	\N	\N	\N
5733	8	15	21	\N	\N	\N	\N
5734	8	15	22	\N	\N	\N	\N
5735	8	15	23	\N	\N	\N	\N
5736	8	15	24	\N	\N	\N	\N
5737	8	15	25	\N	\N	\N	\N
5738	8	15	26	\N	\N	\N	\N
5739	8	15	27	\N	\N	\N	\N
5740	8	15	28	\N	\N	\N	\N
5741	8	15	29	\N	\N	\N	\N
5742	8	15	30	\N	\N	\N	\N
5743	8	15	31	\N	\N	\N	\N
5744	8	15	32	\N	\N	\N	\N
5745	8	15	33	\N	\N	\N	\N
5746	8	15	34	\N	\N	\N	\N
5747	8	15	35	\N	\N	\N	\N
5748	8	15	36	\N	\N	\N	\N
5749	8	15	37	\N	\N	\N	\N
5750	8	15	38	\N	\N	\N	\N
5751	8	15	39	\N	\N	\N	\N
5752	8	15	40	\N	\N	\N	\N
5753	8	15	41	\N	\N	\N	\N
5754	8	15	42	\N	\N	\N	\N
5755	8	15	43	\N	\N	\N	\N
5756	8	15	44	\N	\N	\N	\N
5757	8	15	45	\N	\N	\N	\N
5758	8	15	46	\N	\N	\N	\N
5759	8	15	47	\N	\N	\N	\N
5760	8	15	48	\N	\N	\N	\N
5761	9	1	1	\N	\N	\N	\N
5762	9	1	2	\N	\N	\N	\N
5763	9	1	3	\N	\N	\N	\N
5764	9	1	4	\N	\N	\N	\N
5765	9	1	5	\N	\N	\N	\N
5766	9	1	6	\N	\N	\N	\N
5767	9	1	7	\N	\N	\N	\N
5768	9	1	8	\N	\N	\N	\N
5769	9	1	9	\N	\N	\N	\N
5770	9	1	10	\N	\N	\N	\N
5771	9	1	11	\N	\N	\N	\N
5772	9	1	12	\N	\N	\N	\N
5773	9	1	13	\N	\N	\N	\N
5774	9	1	14	\N	\N	\N	\N
5775	9	1	15	\N	\N	\N	\N
5776	9	1	16	\N	\N	\N	\N
5777	9	1	17	\N	\N	\N	\N
5778	9	1	18	\N	\N	\N	\N
5779	9	1	19	\N	\N	\N	\N
5780	9	1	20	\N	\N	\N	\N
5781	9	1	21	\N	\N	\N	\N
5782	9	1	22	\N	\N	\N	\N
5783	9	1	23	\N	\N	\N	\N
5784	9	1	24	\N	\N	\N	\N
5785	9	1	25	\N	\N	\N	\N
5786	9	1	26	\N	\N	\N	\N
5787	9	1	27	\N	\N	\N	\N
5788	9	1	28	\N	\N	\N	\N
5789	9	1	29	\N	\N	\N	\N
5790	9	1	30	\N	\N	\N	\N
5791	9	1	31	\N	\N	\N	\N
5792	9	1	32	\N	\N	\N	\N
5793	9	1	33	\N	\N	\N	\N
5794	9	1	34	\N	\N	\N	\N
5795	9	1	35	\N	\N	\N	\N
5796	9	1	36	\N	\N	\N	\N
5797	9	1	37	\N	\N	\N	\N
5798	9	1	38	\N	\N	\N	\N
5799	9	1	39	\N	\N	\N	\N
5800	9	1	40	\N	\N	\N	\N
5801	9	1	41	\N	\N	\N	\N
5802	9	1	42	\N	\N	\N	\N
5803	9	1	43	\N	\N	\N	\N
5804	9	1	44	\N	\N	\N	\N
5805	9	1	45	\N	\N	\N	\N
5806	9	1	46	\N	\N	\N	\N
5807	9	1	47	\N	\N	\N	\N
5808	9	1	48	\N	\N	\N	\N
5809	9	2	1	\N	\N	\N	\N
5810	9	2	2	\N	\N	\N	\N
5811	9	2	3	\N	\N	\N	\N
5812	9	2	4	\N	\N	\N	\N
5813	9	2	5	\N	\N	\N	\N
5814	9	2	6	\N	\N	\N	\N
5815	9	2	7	\N	\N	\N	\N
5816	9	2	8	\N	\N	\N	\N
5817	9	2	9	\N	\N	\N	\N
5818	9	2	10	\N	\N	\N	\N
5819	9	2	11	\N	\N	\N	\N
5820	9	2	12	\N	\N	\N	\N
5821	9	2	13	\N	\N	\N	\N
5822	9	2	14	\N	\N	\N	\N
5823	9	2	15	\N	\N	\N	\N
5824	9	2	16	\N	\N	\N	\N
5825	9	2	17	\N	\N	\N	\N
5826	9	2	18	\N	\N	\N	\N
5827	9	2	19	\N	\N	\N	\N
5828	9	2	20	\N	\N	\N	\N
5829	9	2	21	\N	\N	\N	\N
5830	9	2	22	\N	\N	\N	\N
5831	9	2	23	\N	\N	\N	\N
5832	9	2	24	\N	\N	\N	\N
5833	9	2	25	\N	\N	\N	\N
5834	9	2	26	\N	\N	\N	\N
5835	9	2	27	\N	\N	\N	\N
5836	9	2	28	\N	\N	\N	\N
5837	9	2	29	\N	\N	\N	\N
5838	9	2	30	\N	\N	\N	\N
5839	9	2	31	\N	\N	\N	\N
5840	9	2	32	\N	\N	\N	\N
5841	9	2	33	\N	\N	\N	\N
5842	9	2	34	\N	\N	\N	\N
5843	9	2	35	\N	\N	\N	\N
5844	9	2	36	\N	\N	\N	\N
5845	9	2	37	\N	\N	\N	\N
5846	9	2	38	\N	\N	\N	\N
5847	9	2	39	\N	\N	\N	\N
5848	9	2	40	\N	\N	\N	\N
5849	9	2	41	\N	\N	\N	\N
5850	9	2	42	\N	\N	\N	\N
5851	9	2	43	\N	\N	\N	\N
5852	9	2	44	\N	\N	\N	\N
5853	9	2	45	\N	\N	\N	\N
5854	9	2	46	\N	\N	\N	\N
5855	9	2	47	\N	\N	\N	\N
5856	9	2	48	\N	\N	\N	\N
5857	9	3	1	\N	\N	\N	\N
5858	9	3	2	\N	\N	\N	\N
5859	9	3	3	\N	\N	\N	\N
5860	9	3	4	\N	\N	\N	\N
5861	9	3	5	\N	\N	\N	\N
5862	9	3	6	\N	\N	\N	\N
5863	9	3	7	\N	\N	\N	\N
5864	9	3	8	\N	\N	\N	\N
5865	9	3	9	\N	\N	\N	\N
5866	9	3	10	\N	\N	\N	\N
5867	9	3	11	\N	\N	\N	\N
5868	9	3	12	\N	\N	\N	\N
5869	9	3	13	\N	\N	\N	\N
5870	9	3	14	\N	\N	\N	\N
5871	9	3	15	\N	\N	\N	\N
5872	9	3	16	\N	\N	\N	\N
5873	9	3	17	\N	\N	\N	\N
5874	9	3	18	\N	\N	\N	\N
5875	9	3	19	\N	\N	\N	\N
5876	9	3	20	\N	\N	\N	\N
5877	9	3	21	\N	\N	\N	\N
5878	9	3	22	\N	\N	\N	\N
5879	9	3	23	\N	\N	\N	\N
5880	9	3	24	\N	\N	\N	\N
5881	9	3	25	\N	\N	\N	\N
5882	9	3	26	\N	\N	\N	\N
5883	9	3	27	\N	\N	\N	\N
5884	9	3	28	\N	\N	\N	\N
5885	9	3	29	\N	\N	\N	\N
5886	9	3	30	\N	\N	\N	\N
5887	9	3	31	\N	\N	\N	\N
5888	9	3	32	\N	\N	\N	\N
5889	9	3	33	\N	\N	\N	\N
5890	9	3	34	\N	\N	\N	\N
5891	9	3	35	\N	\N	\N	\N
5892	9	3	36	\N	\N	\N	\N
5893	9	3	37	\N	\N	\N	\N
5894	9	3	38	\N	\N	\N	\N
5895	9	3	39	\N	\N	\N	\N
5896	9	3	40	\N	\N	\N	\N
5897	9	3	41	\N	\N	\N	\N
5898	9	3	42	\N	\N	\N	\N
5899	9	3	43	\N	\N	\N	\N
5900	9	3	44	\N	\N	\N	\N
5901	9	3	45	\N	\N	\N	\N
5902	9	3	46	\N	\N	\N	\N
5903	9	3	47	\N	\N	\N	\N
5904	9	3	48	\N	\N	\N	\N
5905	9	4	1	\N	\N	\N	\N
5906	9	4	2	\N	\N	\N	\N
5907	9	4	3	\N	\N	\N	\N
5908	9	4	4	\N	\N	\N	\N
5909	9	4	5	\N	\N	\N	\N
5910	9	4	6	\N	\N	\N	\N
5911	9	4	7	\N	\N	\N	\N
5912	9	4	8	\N	\N	\N	\N
5913	9	4	9	\N	\N	\N	\N
5914	9	4	10	\N	\N	\N	\N
5915	9	4	11	\N	\N	\N	\N
5916	9	4	12	\N	\N	\N	\N
5917	9	4	13	\N	\N	\N	\N
5918	9	4	14	\N	\N	\N	\N
5919	9	4	15	\N	\N	\N	\N
5920	9	4	16	\N	\N	\N	\N
5921	9	4	17	\N	\N	\N	\N
5922	9	4	18	\N	\N	\N	\N
5923	9	4	19	\N	\N	\N	\N
5924	9	4	20	\N	\N	\N	\N
5925	9	4	21	\N	\N	\N	\N
5926	9	4	22	\N	\N	\N	\N
5927	9	4	23	\N	\N	\N	\N
5928	9	4	24	\N	\N	\N	\N
5929	9	4	25	\N	\N	\N	\N
5930	9	4	26	\N	\N	\N	\N
5931	9	4	27	\N	\N	\N	\N
5932	9	4	28	\N	\N	\N	\N
5933	9	4	29	\N	\N	\N	\N
5934	9	4	30	\N	\N	\N	\N
5935	9	4	31	\N	\N	\N	\N
5936	9	4	32	\N	\N	\N	\N
5937	9	4	33	\N	\N	\N	\N
5938	9	4	34	\N	\N	\N	\N
5939	9	4	35	\N	\N	\N	\N
5940	9	4	36	\N	\N	\N	\N
5941	9	4	37	\N	\N	\N	\N
5942	9	4	38	\N	\N	\N	\N
5943	9	4	39	\N	\N	\N	\N
5944	9	4	40	\N	\N	\N	\N
5945	9	4	41	\N	\N	\N	\N
5946	9	4	42	\N	\N	\N	\N
5947	9	4	43	\N	\N	\N	\N
5948	9	4	44	\N	\N	\N	\N
5949	9	4	45	\N	\N	\N	\N
5950	9	4	46	\N	\N	\N	\N
5951	9	4	47	\N	\N	\N	\N
5952	9	4	48	\N	\N	\N	\N
5953	9	5	1	\N	\N	\N	\N
5954	9	5	2	\N	\N	\N	\N
5955	9	5	3	\N	\N	\N	\N
5956	9	5	4	\N	\N	\N	\N
5957	9	5	5	\N	\N	\N	\N
5958	9	5	6	\N	\N	\N	\N
5959	9	5	7	\N	\N	\N	\N
5960	9	5	8	\N	\N	\N	\N
5961	9	5	9	\N	\N	\N	\N
5962	9	5	10	\N	\N	\N	\N
5963	9	5	11	\N	\N	\N	\N
5964	9	5	12	\N	\N	\N	\N
5965	9	5	13	\N	\N	\N	\N
5966	9	5	14	\N	\N	\N	\N
5967	9	5	15	\N	\N	\N	\N
5968	9	5	16	\N	\N	\N	\N
5969	9	5	17	\N	\N	\N	\N
5970	9	5	18	\N	\N	\N	\N
5971	9	5	19	\N	\N	\N	\N
5972	9	5	20	\N	\N	\N	\N
5973	9	5	21	\N	\N	\N	\N
5974	9	5	22	\N	\N	\N	\N
5975	9	5	23	\N	\N	\N	\N
5976	9	5	24	\N	\N	\N	\N
5977	9	5	25	\N	\N	\N	\N
5978	9	5	26	\N	\N	\N	\N
5979	9	5	27	\N	\N	\N	\N
5980	9	5	28	\N	\N	\N	\N
5981	9	5	29	\N	\N	\N	\N
5982	9	5	30	\N	\N	\N	\N
5983	9	5	31	\N	\N	\N	\N
5984	9	5	32	\N	\N	\N	\N
5985	9	5	33	\N	\N	\N	\N
5986	9	5	34	\N	\N	\N	\N
5987	9	5	35	\N	\N	\N	\N
5988	9	5	36	\N	\N	\N	\N
5989	9	5	37	\N	\N	\N	\N
5990	9	5	38	\N	\N	\N	\N
5991	9	5	39	\N	\N	\N	\N
5992	9	5	40	\N	\N	\N	\N
5993	9	5	41	\N	\N	\N	\N
5994	9	5	42	\N	\N	\N	\N
5995	9	5	43	\N	\N	\N	\N
5996	9	5	44	\N	\N	\N	\N
5997	9	5	45	\N	\N	\N	\N
5998	9	5	46	\N	\N	\N	\N
5999	9	5	47	\N	\N	\N	\N
6000	9	5	48	\N	\N	\N	\N
6001	9	6	1	\N	\N	\N	\N
6002	9	6	2	\N	\N	\N	\N
6003	9	6	3	\N	\N	\N	\N
6004	9	6	4	\N	\N	\N	\N
6005	9	6	5	\N	\N	\N	\N
6006	9	6	6	\N	\N	\N	\N
6007	9	6	7	\N	\N	\N	\N
6008	9	6	8	\N	\N	\N	\N
6009	9	6	9	\N	\N	\N	\N
6010	9	6	10	\N	\N	\N	\N
6011	9	6	11	\N	\N	\N	\N
6012	9	6	12	\N	\N	\N	\N
6013	9	6	13	\N	\N	\N	\N
6014	9	6	14	\N	\N	\N	\N
6015	9	6	15	\N	\N	\N	\N
6016	9	6	16	\N	\N	\N	\N
6017	9	6	17	\N	\N	\N	\N
6018	9	6	18	\N	\N	\N	\N
6019	9	6	19	\N	\N	\N	\N
6020	9	6	20	\N	\N	\N	\N
6021	9	6	21	\N	\N	\N	\N
6022	9	6	22	\N	\N	\N	\N
6023	9	6	23	\N	\N	\N	\N
6024	9	6	24	\N	\N	\N	\N
6025	9	6	25	\N	\N	\N	\N
6026	9	6	26	\N	\N	\N	\N
6027	9	6	27	\N	\N	\N	\N
6028	9	6	28	\N	\N	\N	\N
6029	9	6	29	\N	\N	\N	\N
6030	9	6	30	\N	\N	\N	\N
6031	9	6	31	\N	\N	\N	\N
6032	9	6	32	\N	\N	\N	\N
6033	9	6	33	\N	\N	\N	\N
6034	9	6	34	\N	\N	\N	\N
6035	9	6	35	\N	\N	\N	\N
6036	9	6	36	\N	\N	\N	\N
6037	9	6	37	\N	\N	\N	\N
6038	9	6	38	\N	\N	\N	\N
6039	9	6	39	\N	\N	\N	\N
6040	9	6	40	\N	\N	\N	\N
6041	9	6	41	\N	\N	\N	\N
6042	9	6	42	\N	\N	\N	\N
6043	9	6	43	\N	\N	\N	\N
6044	9	6	44	\N	\N	\N	\N
6045	9	6	45	\N	\N	\N	\N
6046	9	6	46	\N	\N	\N	\N
6047	9	6	47	\N	\N	\N	\N
6048	9	6	48	\N	\N	\N	\N
6049	9	7	1	\N	\N	\N	\N
6050	9	7	2	\N	\N	\N	\N
6051	9	7	3	\N	\N	\N	\N
6052	9	7	4	\N	\N	\N	\N
6053	9	7	5	\N	\N	\N	\N
6054	9	7	6	\N	\N	\N	\N
6055	9	7	7	\N	\N	\N	\N
6056	9	7	8	\N	\N	\N	\N
6057	9	7	9	\N	\N	\N	\N
6058	9	7	10	\N	\N	\N	\N
6059	9	7	11	\N	\N	\N	\N
6060	9	7	12	\N	\N	\N	\N
6061	9	7	13	\N	\N	\N	\N
6062	9	7	14	\N	\N	\N	\N
6063	9	7	15	\N	\N	\N	\N
6064	9	7	16	\N	\N	\N	\N
6065	9	7	17	\N	\N	\N	\N
6066	9	7	18	\N	\N	\N	\N
6067	9	7	19	\N	\N	\N	\N
6068	9	7	20	\N	\N	\N	\N
6069	9	7	21	\N	\N	\N	\N
6070	9	7	22	\N	\N	\N	\N
6071	9	7	23	\N	\N	\N	\N
6072	9	7	24	\N	\N	\N	\N
6073	9	7	25	\N	\N	\N	\N
6074	9	7	26	\N	\N	\N	\N
6075	9	7	27	\N	\N	\N	\N
6076	9	7	28	\N	\N	\N	\N
6077	9	7	29	\N	\N	\N	\N
6078	9	7	30	\N	\N	\N	\N
6079	9	7	31	\N	\N	\N	\N
6080	9	7	32	\N	\N	\N	\N
6081	9	7	33	\N	\N	\N	\N
6082	9	7	34	\N	\N	\N	\N
6083	9	7	35	\N	\N	\N	\N
6084	9	7	36	\N	\N	\N	\N
6085	9	7	37	\N	\N	\N	\N
6086	9	7	38	\N	\N	\N	\N
6087	9	7	39	\N	\N	\N	\N
6088	9	7	40	\N	\N	\N	\N
6089	9	7	41	\N	\N	\N	\N
6090	9	7	42	\N	\N	\N	\N
6091	9	7	43	\N	\N	\N	\N
6092	9	7	44	\N	\N	\N	\N
6093	9	7	45	\N	\N	\N	\N
6094	9	7	46	\N	\N	\N	\N
6095	9	7	47	\N	\N	\N	\N
6096	9	7	48	\N	\N	\N	\N
6097	9	8	1	\N	\N	\N	\N
6098	9	8	2	\N	\N	\N	\N
6099	9	8	3	\N	\N	\N	\N
6100	9	8	4	\N	\N	\N	\N
6101	9	8	5	\N	\N	\N	\N
6102	9	8	6	\N	\N	\N	\N
6103	9	8	7	\N	\N	\N	\N
6104	9	8	8	\N	\N	\N	\N
6105	9	8	9	\N	\N	\N	\N
6106	9	8	10	\N	\N	\N	\N
6107	9	8	11	\N	\N	\N	\N
6108	9	8	12	\N	\N	\N	\N
6109	9	8	13	\N	\N	\N	\N
6110	9	8	14	\N	\N	\N	\N
6111	9	8	15	\N	\N	\N	\N
6112	9	8	16	\N	\N	\N	\N
6113	9	8	17	\N	\N	\N	\N
6114	9	8	18	\N	\N	\N	\N
6115	9	8	19	\N	\N	\N	\N
6116	9	8	20	\N	\N	\N	\N
6117	9	8	21	\N	\N	\N	\N
6118	9	8	22	\N	\N	\N	\N
6119	9	8	23	\N	\N	\N	\N
6120	9	8	24	\N	\N	\N	\N
6121	9	8	25	\N	\N	\N	\N
6122	9	8	26	\N	\N	\N	\N
6123	9	8	27	\N	\N	\N	\N
6124	9	8	28	\N	\N	\N	\N
6125	9	8	29	\N	\N	\N	\N
6126	9	8	30	\N	\N	\N	\N
6127	9	8	31	\N	\N	\N	\N
6128	9	8	32	\N	\N	\N	\N
6129	9	8	33	\N	\N	\N	\N
6130	9	8	34	\N	\N	\N	\N
6131	9	8	35	\N	\N	\N	\N
6132	9	8	36	\N	\N	\N	\N
6133	9	8	37	\N	\N	\N	\N
6134	9	8	38	\N	\N	\N	\N
6135	9	8	39	\N	\N	\N	\N
6136	9	8	40	\N	\N	\N	\N
6137	9	8	41	\N	\N	\N	\N
6138	9	8	42	\N	\N	\N	\N
6139	9	8	43	\N	\N	\N	\N
6140	9	8	44	\N	\N	\N	\N
6141	9	8	45	\N	\N	\N	\N
6142	9	8	46	\N	\N	\N	\N
6143	9	8	47	\N	\N	\N	\N
6144	9	8	48	\N	\N	\N	\N
6145	9	9	1	\N	\N	\N	\N
6146	9	9	2	\N	\N	\N	\N
6147	9	9	3	\N	\N	\N	\N
6148	9	9	4	\N	\N	\N	\N
6149	9	9	5	\N	\N	\N	\N
6150	9	9	6	\N	\N	\N	\N
6151	9	9	7	\N	\N	\N	\N
6152	9	9	8	\N	\N	\N	\N
6153	9	9	9	\N	\N	\N	\N
6154	9	9	10	\N	\N	\N	\N
6155	9	9	11	\N	\N	\N	\N
6156	9	9	12	\N	\N	\N	\N
6157	9	9	13	\N	\N	\N	\N
6158	9	9	14	\N	\N	\N	\N
6159	9	9	15	\N	\N	\N	\N
6160	9	9	16	\N	\N	\N	\N
6161	9	9	17	\N	\N	\N	\N
6162	9	9	18	\N	\N	\N	\N
6163	9	9	19	\N	\N	\N	\N
6164	9	9	20	\N	\N	\N	\N
6165	9	9	21	\N	\N	\N	\N
6166	9	9	22	\N	\N	\N	\N
6167	9	9	23	\N	\N	\N	\N
6168	9	9	24	\N	\N	\N	\N
6169	9	9	25	\N	\N	\N	\N
6170	9	9	26	\N	\N	\N	\N
6171	9	9	27	\N	\N	\N	\N
6172	9	9	28	\N	\N	\N	\N
6173	9	9	29	\N	\N	\N	\N
6174	9	9	30	\N	\N	\N	\N
6175	9	9	31	\N	\N	\N	\N
6176	9	9	32	\N	\N	\N	\N
6177	9	9	33	\N	\N	\N	\N
6178	9	9	34	\N	\N	\N	\N
6179	9	9	35	\N	\N	\N	\N
6180	9	9	36	\N	\N	\N	\N
6181	9	9	37	\N	\N	\N	\N
6182	9	9	38	\N	\N	\N	\N
6183	9	9	39	\N	\N	\N	\N
6184	9	9	40	\N	\N	\N	\N
6185	9	9	41	\N	\N	\N	\N
6186	9	9	42	\N	\N	\N	\N
6187	9	9	43	\N	\N	\N	\N
6188	9	9	44	\N	\N	\N	\N
6189	9	9	45	\N	\N	\N	\N
6190	9	9	46	\N	\N	\N	\N
6191	9	9	47	\N	\N	\N	\N
6192	9	9	48	\N	\N	\N	\N
6193	9	10	1	\N	\N	\N	\N
6194	9	10	2	\N	\N	\N	\N
6195	9	10	3	\N	\N	\N	\N
6196	9	10	4	\N	\N	\N	\N
6197	9	10	5	\N	\N	\N	\N
6198	9	10	6	\N	\N	\N	\N
6199	9	10	7	\N	\N	\N	\N
6200	9	10	8	\N	\N	\N	\N
6201	9	10	9	\N	\N	\N	\N
6202	9	10	10	\N	\N	\N	\N
6203	9	10	11	\N	\N	\N	\N
6204	9	10	12	\N	\N	\N	\N
6205	9	10	13	\N	\N	\N	\N
6206	9	10	14	\N	\N	\N	\N
6207	9	10	15	\N	\N	\N	\N
6208	9	10	16	\N	\N	\N	\N
6209	9	10	17	\N	\N	\N	\N
6210	9	10	18	\N	\N	\N	\N
6211	9	10	19	\N	\N	\N	\N
6212	9	10	20	\N	\N	\N	\N
6213	9	10	21	\N	\N	\N	\N
6214	9	10	22	\N	\N	\N	\N
6215	9	10	23	\N	\N	\N	\N
6216	9	10	24	\N	\N	\N	\N
6217	9	10	25	\N	\N	\N	\N
6218	9	10	26	\N	\N	\N	\N
6219	9	10	27	\N	\N	\N	\N
6220	9	10	28	\N	\N	\N	\N
6221	9	10	29	\N	\N	\N	\N
6222	9	10	30	\N	\N	\N	\N
6223	9	10	31	\N	\N	\N	\N
6224	9	10	32	\N	\N	\N	\N
6225	9	10	33	\N	\N	\N	\N
6226	9	10	34	\N	\N	\N	\N
6227	9	10	35	\N	\N	\N	\N
6228	9	10	36	\N	\N	\N	\N
6229	9	10	37	\N	\N	\N	\N
6230	9	10	38	\N	\N	\N	\N
6231	9	10	39	\N	\N	\N	\N
6232	9	10	40	\N	\N	\N	\N
6233	9	10	41	\N	\N	\N	\N
6234	9	10	42	\N	\N	\N	\N
6235	9	10	43	\N	\N	\N	\N
6236	9	10	44	\N	\N	\N	\N
6237	9	10	45	\N	\N	\N	\N
6238	9	10	46	\N	\N	\N	\N
6239	9	10	47	\N	\N	\N	\N
6240	9	10	48	\N	\N	\N	\N
6241	9	11	1	\N	\N	\N	\N
6242	9	11	2	\N	\N	\N	\N
6243	9	11	3	\N	\N	\N	\N
6244	9	11	4	\N	\N	\N	\N
6245	9	11	5	\N	\N	\N	\N
6246	9	11	6	\N	\N	\N	\N
6247	9	11	7	\N	\N	\N	\N
6248	9	11	8	\N	\N	\N	\N
6249	9	11	9	\N	\N	\N	\N
6250	9	11	10	\N	\N	\N	\N
6251	9	11	11	\N	\N	\N	\N
6252	9	11	12	\N	\N	\N	\N
6253	9	11	13	\N	\N	\N	\N
6254	9	11	14	\N	\N	\N	\N
6255	9	11	15	\N	\N	\N	\N
6256	9	11	16	\N	\N	\N	\N
6257	9	11	17	\N	\N	\N	\N
6258	9	11	18	\N	\N	\N	\N
6259	9	11	19	\N	\N	\N	\N
6260	9	11	20	\N	\N	\N	\N
6261	9	11	21	\N	\N	\N	\N
6262	9	11	22	\N	\N	\N	\N
6263	9	11	23	\N	\N	\N	\N
6264	9	11	24	\N	\N	\N	\N
6265	9	11	25	\N	\N	\N	\N
6266	9	11	26	\N	\N	\N	\N
6267	9	11	27	\N	\N	\N	\N
6268	9	11	28	\N	\N	\N	\N
6269	9	11	29	\N	\N	\N	\N
6270	9	11	30	\N	\N	\N	\N
6271	9	11	31	\N	\N	\N	\N
6272	9	11	32	\N	\N	\N	\N
6273	9	11	33	\N	\N	\N	\N
6274	9	11	34	\N	\N	\N	\N
6275	9	11	35	\N	\N	\N	\N
6276	9	11	36	\N	\N	\N	\N
6277	9	11	37	\N	\N	\N	\N
6278	9	11	38	\N	\N	\N	\N
6279	9	11	39	\N	\N	\N	\N
6280	9	11	40	\N	\N	\N	\N
6281	9	11	41	\N	\N	\N	\N
6282	9	11	42	\N	\N	\N	\N
6283	9	11	43	\N	\N	\N	\N
6284	9	11	44	\N	\N	\N	\N
6285	9	11	45	\N	\N	\N	\N
6286	9	11	46	\N	\N	\N	\N
6287	9	11	47	\N	\N	\N	\N
6288	9	11	48	\N	\N	\N	\N
6289	9	12	1	\N	\N	\N	\N
6290	9	12	2	\N	\N	\N	\N
6291	9	12	3	\N	\N	\N	\N
6292	9	12	4	\N	\N	\N	\N
6293	9	12	5	\N	\N	\N	\N
6294	9	12	6	\N	\N	\N	\N
6295	9	12	7	\N	\N	\N	\N
6296	9	12	8	\N	\N	\N	\N
6297	9	12	9	\N	\N	\N	\N
6298	9	12	10	\N	\N	\N	\N
6299	9	12	11	\N	\N	\N	\N
6300	9	12	12	\N	\N	\N	\N
6301	9	12	13	\N	\N	\N	\N
6302	9	12	14	\N	\N	\N	\N
6303	9	12	15	\N	\N	\N	\N
6304	9	12	16	\N	\N	\N	\N
6305	9	12	17	\N	\N	\N	\N
6306	9	12	18	\N	\N	\N	\N
6307	9	12	19	\N	\N	\N	\N
6308	9	12	20	\N	\N	\N	\N
6309	9	12	21	\N	\N	\N	\N
6310	9	12	22	\N	\N	\N	\N
6311	9	12	23	\N	\N	\N	\N
6312	9	12	24	\N	\N	\N	\N
6313	9	12	25	\N	\N	\N	\N
6314	9	12	26	\N	\N	\N	\N
6315	9	12	27	\N	\N	\N	\N
6316	9	12	28	\N	\N	\N	\N
6317	9	12	29	\N	\N	\N	\N
6318	9	12	30	\N	\N	\N	\N
6319	9	12	31	\N	\N	\N	\N
6320	9	12	32	\N	\N	\N	\N
6321	9	12	33	\N	\N	\N	\N
6322	9	12	34	\N	\N	\N	\N
6323	9	12	35	\N	\N	\N	\N
6324	9	12	36	\N	\N	\N	\N
6325	9	12	37	\N	\N	\N	\N
6326	9	12	38	\N	\N	\N	\N
6327	9	12	39	\N	\N	\N	\N
6328	9	12	40	\N	\N	\N	\N
6329	9	12	41	\N	\N	\N	\N
6330	9	12	42	\N	\N	\N	\N
6331	9	12	43	\N	\N	\N	\N
6332	9	12	44	\N	\N	\N	\N
6333	9	12	45	\N	\N	\N	\N
6334	9	12	46	\N	\N	\N	\N
6335	9	12	47	\N	\N	\N	\N
6336	9	12	48	\N	\N	\N	\N
6337	9	13	1	\N	\N	\N	\N
6338	9	13	2	\N	\N	\N	\N
6339	9	13	3	\N	\N	\N	\N
6340	9	13	4	\N	\N	\N	\N
6341	9	13	5	\N	\N	\N	\N
6342	9	13	6	\N	\N	\N	\N
6343	9	13	7	\N	\N	\N	\N
6344	9	13	8	\N	\N	\N	\N
6345	9	13	9	\N	\N	\N	\N
6346	9	13	10	\N	\N	\N	\N
6347	9	13	11	\N	\N	\N	\N
6348	9	13	12	\N	\N	\N	\N
6349	9	13	13	\N	\N	\N	\N
6350	9	13	14	\N	\N	\N	\N
6351	9	13	15	\N	\N	\N	\N
6352	9	13	16	\N	\N	\N	\N
6353	9	13	17	\N	\N	\N	\N
6354	9	13	18	\N	\N	\N	\N
6355	9	13	19	\N	\N	\N	\N
6356	9	13	20	\N	\N	\N	\N
6357	9	13	21	\N	\N	\N	\N
6358	9	13	22	\N	\N	\N	\N
6359	9	13	23	\N	\N	\N	\N
6360	9	13	24	\N	\N	\N	\N
6361	9	13	25	\N	\N	\N	\N
6362	9	13	26	\N	\N	\N	\N
6363	9	13	27	\N	\N	\N	\N
6364	9	13	28	\N	\N	\N	\N
6365	9	13	29	\N	\N	\N	\N
6366	9	13	30	\N	\N	\N	\N
6367	9	13	31	\N	\N	\N	\N
6368	9	13	32	\N	\N	\N	\N
6369	9	13	33	\N	\N	\N	\N
6370	9	13	34	\N	\N	\N	\N
6371	9	13	35	\N	\N	\N	\N
6372	9	13	36	\N	\N	\N	\N
6373	9	13	37	\N	\N	\N	\N
6374	9	13	38	\N	\N	\N	\N
6375	9	13	39	\N	\N	\N	\N
6376	9	13	40	\N	\N	\N	\N
6377	9	13	41	\N	\N	\N	\N
6378	9	13	42	\N	\N	\N	\N
6379	9	13	43	\N	\N	\N	\N
6380	9	13	44	\N	\N	\N	\N
6381	9	13	45	\N	\N	\N	\N
6382	9	13	46	\N	\N	\N	\N
6383	9	13	47	\N	\N	\N	\N
6384	9	13	48	\N	\N	\N	\N
6385	9	14	1	\N	\N	\N	\N
6386	9	14	2	\N	\N	\N	\N
6387	9	14	3	\N	\N	\N	\N
6388	9	14	4	\N	\N	\N	\N
6389	9	14	5	\N	\N	\N	\N
6390	9	14	6	\N	\N	\N	\N
6391	9	14	7	\N	\N	\N	\N
6392	9	14	8	\N	\N	\N	\N
6393	9	14	9	\N	\N	\N	\N
6394	9	14	10	\N	\N	\N	\N
6395	9	14	11	\N	\N	\N	\N
6396	9	14	12	\N	\N	\N	\N
6397	9	14	13	\N	\N	\N	\N
6398	9	14	14	\N	\N	\N	\N
6399	9	14	15	\N	\N	\N	\N
6400	9	14	16	\N	\N	\N	\N
6401	9	14	17	\N	\N	\N	\N
6402	9	14	18	\N	\N	\N	\N
6403	9	14	19	\N	\N	\N	\N
6404	9	14	20	\N	\N	\N	\N
6405	9	14	21	\N	\N	\N	\N
6406	9	14	22	\N	\N	\N	\N
6407	9	14	23	\N	\N	\N	\N
6408	9	14	24	\N	\N	\N	\N
6409	9	14	25	\N	\N	\N	\N
6410	9	14	26	\N	\N	\N	\N
6411	9	14	27	\N	\N	\N	\N
6412	9	14	28	\N	\N	\N	\N
6413	9	14	29	\N	\N	\N	\N
6414	9	14	30	\N	\N	\N	\N
6415	9	14	31	\N	\N	\N	\N
6416	9	14	32	\N	\N	\N	\N
6417	9	14	33	\N	\N	\N	\N
6418	9	14	34	\N	\N	\N	\N
6419	9	14	35	\N	\N	\N	\N
6420	9	14	36	\N	\N	\N	\N
6421	9	14	37	\N	\N	\N	\N
6422	9	14	38	\N	\N	\N	\N
6423	9	14	39	\N	\N	\N	\N
6424	9	14	40	\N	\N	\N	\N
6425	9	14	41	\N	\N	\N	\N
6426	9	14	42	\N	\N	\N	\N
6427	9	14	43	\N	\N	\N	\N
6428	9	14	44	\N	\N	\N	\N
6429	9	14	45	\N	\N	\N	\N
6430	9	14	46	\N	\N	\N	\N
6431	9	14	47	\N	\N	\N	\N
6432	9	14	48	\N	\N	\N	\N
6433	9	15	1	\N	\N	\N	\N
6434	9	15	2	\N	\N	\N	\N
6435	9	15	3	\N	\N	\N	\N
6436	9	15	4	\N	\N	\N	\N
6437	9	15	5	\N	\N	\N	\N
6438	9	15	6	\N	\N	\N	\N
6439	9	15	7	\N	\N	\N	\N
6440	9	15	8	\N	\N	\N	\N
6441	9	15	9	\N	\N	\N	\N
6442	9	15	10	\N	\N	\N	\N
6443	9	15	11	\N	\N	\N	\N
6444	9	15	12	\N	\N	\N	\N
6445	9	15	13	\N	\N	\N	\N
6446	9	15	14	\N	\N	\N	\N
6447	9	15	15	\N	\N	\N	\N
6448	9	15	16	\N	\N	\N	\N
6449	9	15	17	\N	\N	\N	\N
6450	9	15	18	\N	\N	\N	\N
6451	9	15	19	\N	\N	\N	\N
6452	9	15	20	\N	\N	\N	\N
6453	9	15	21	\N	\N	\N	\N
6454	9	15	22	\N	\N	\N	\N
6455	9	15	23	\N	\N	\N	\N
6456	9	15	24	\N	\N	\N	\N
6457	9	15	25	\N	\N	\N	\N
6458	9	15	26	\N	\N	\N	\N
6459	9	15	27	\N	\N	\N	\N
6460	9	15	28	\N	\N	\N	\N
6461	9	15	29	\N	\N	\N	\N
6462	9	15	30	\N	\N	\N	\N
6463	9	15	31	\N	\N	\N	\N
6464	9	15	32	\N	\N	\N	\N
6465	9	15	33	\N	\N	\N	\N
6466	9	15	34	\N	\N	\N	\N
6467	9	15	35	\N	\N	\N	\N
6468	9	15	36	\N	\N	\N	\N
6469	9	15	37	\N	\N	\N	\N
6470	9	15	38	\N	\N	\N	\N
6471	9	15	39	\N	\N	\N	\N
6472	9	15	40	\N	\N	\N	\N
6473	9	15	41	\N	\N	\N	\N
6474	9	15	42	\N	\N	\N	\N
6475	9	15	43	\N	\N	\N	\N
6476	9	15	44	\N	\N	\N	\N
6477	9	15	45	\N	\N	\N	\N
6478	9	15	46	\N	\N	\N	\N
6479	9	15	47	\N	\N	\N	\N
6480	9	15	48	\N	\N	\N	\N
6481	10	1	1	\N	\N	\N	\N
6482	10	1	2	\N	\N	\N	\N
6483	10	1	3	\N	\N	\N	\N
6484	10	1	4	\N	\N	\N	\N
6485	10	1	5	\N	\N	\N	\N
6486	10	1	6	\N	\N	\N	\N
6487	10	1	7	\N	\N	\N	\N
6488	10	1	8	\N	\N	\N	\N
6489	10	1	9	\N	\N	\N	\N
6490	10	1	10	\N	\N	\N	\N
6491	10	1	11	\N	\N	\N	\N
6492	10	1	12	\N	\N	\N	\N
6493	10	1	13	\N	\N	\N	\N
6494	10	1	14	\N	\N	\N	\N
6495	10	1	15	\N	\N	\N	\N
6496	10	1	16	\N	\N	\N	\N
6497	10	1	17	\N	\N	\N	\N
6498	10	1	18	\N	\N	\N	\N
6499	10	1	19	\N	\N	\N	\N
6500	10	1	20	\N	\N	\N	\N
6501	10	1	21	\N	\N	\N	\N
6502	10	1	22	\N	\N	\N	\N
6503	10	1	23	\N	\N	\N	\N
6504	10	1	24	\N	\N	\N	\N
6505	10	1	25	\N	\N	\N	\N
6506	10	1	26	\N	\N	\N	\N
6507	10	1	27	\N	\N	\N	\N
6508	10	1	28	\N	\N	\N	\N
6509	10	1	29	\N	\N	\N	\N
6510	10	1	30	\N	\N	\N	\N
6511	10	1	31	\N	\N	\N	\N
6512	10	1	32	\N	\N	\N	\N
6513	10	1	33	\N	\N	\N	\N
6514	10	1	34	\N	\N	\N	\N
6515	10	1	35	\N	\N	\N	\N
6516	10	1	36	\N	\N	\N	\N
6517	10	1	37	\N	\N	\N	\N
6518	10	1	38	\N	\N	\N	\N
6519	10	1	39	\N	\N	\N	\N
6520	10	1	40	\N	\N	\N	\N
6521	10	1	41	\N	\N	\N	\N
6522	10	1	42	\N	\N	\N	\N
6523	10	1	43	\N	\N	\N	\N
6524	10	1	44	\N	\N	\N	\N
6525	10	1	45	\N	\N	\N	\N
6526	10	1	46	\N	\N	\N	\N
6527	10	1	47	\N	\N	\N	\N
6528	10	1	48	\N	\N	\N	\N
6529	10	2	1	\N	\N	\N	\N
6530	10	2	2	\N	\N	\N	\N
6531	10	2	3	\N	\N	\N	\N
6532	10	2	4	\N	\N	\N	\N
6533	10	2	5	\N	\N	\N	\N
6534	10	2	6	\N	\N	\N	\N
6535	10	2	7	\N	\N	\N	\N
6536	10	2	8	\N	\N	\N	\N
6537	10	2	9	\N	\N	\N	\N
6538	10	2	10	\N	\N	\N	\N
6539	10	2	11	\N	\N	\N	\N
6540	10	2	12	\N	\N	\N	\N
6541	10	2	13	\N	\N	\N	\N
6542	10	2	14	\N	\N	\N	\N
6543	10	2	15	\N	\N	\N	\N
6544	10	2	16	\N	\N	\N	\N
6545	10	2	17	\N	\N	\N	\N
6546	10	2	18	\N	\N	\N	\N
6547	10	2	19	\N	\N	\N	\N
6548	10	2	20	\N	\N	\N	\N
6549	10	2	21	\N	\N	\N	\N
6550	10	2	22	\N	\N	\N	\N
6551	10	2	23	\N	\N	\N	\N
6552	10	2	24	\N	\N	\N	\N
6553	10	2	25	\N	\N	\N	\N
6554	10	2	26	\N	\N	\N	\N
6555	10	2	27	\N	\N	\N	\N
6556	10	2	28	\N	\N	\N	\N
6557	10	2	29	\N	\N	\N	\N
6558	10	2	30	\N	\N	\N	\N
6559	10	2	31	\N	\N	\N	\N
6560	10	2	32	\N	\N	\N	\N
6561	10	2	33	\N	\N	\N	\N
6562	10	2	34	\N	\N	\N	\N
6563	10	2	35	\N	\N	\N	\N
6564	10	2	36	\N	\N	\N	\N
6565	10	2	37	\N	\N	\N	\N
6566	10	2	38	\N	\N	\N	\N
6567	10	2	39	\N	\N	\N	\N
6568	10	2	40	\N	\N	\N	\N
6569	10	2	41	\N	\N	\N	\N
6570	10	2	42	\N	\N	\N	\N
6571	10	2	43	\N	\N	\N	\N
6572	10	2	44	\N	\N	\N	\N
6573	10	2	45	\N	\N	\N	\N
6574	10	2	46	\N	\N	\N	\N
6575	10	2	47	\N	\N	\N	\N
6576	10	2	48	\N	\N	\N	\N
6577	10	3	1	\N	\N	\N	\N
6578	10	3	2	\N	\N	\N	\N
6579	10	3	3	\N	\N	\N	\N
6580	10	3	4	\N	\N	\N	\N
6581	10	3	5	\N	\N	\N	\N
6582	10	3	6	\N	\N	\N	\N
6583	10	3	7	\N	\N	\N	\N
6584	10	3	8	\N	\N	\N	\N
6585	10	3	9	\N	\N	\N	\N
6586	10	3	10	\N	\N	\N	\N
6587	10	3	11	\N	\N	\N	\N
6588	10	3	12	\N	\N	\N	\N
6589	10	3	13	\N	\N	\N	\N
6590	10	3	14	\N	\N	\N	\N
6591	10	3	15	\N	\N	\N	\N
6592	10	3	16	\N	\N	\N	\N
6593	10	3	17	\N	\N	\N	\N
6594	10	3	18	\N	\N	\N	\N
6595	10	3	19	\N	\N	\N	\N
6596	10	3	20	\N	\N	\N	\N
6597	10	3	21	\N	\N	\N	\N
6598	10	3	22	\N	\N	\N	\N
6599	10	3	23	\N	\N	\N	\N
6600	10	3	24	\N	\N	\N	\N
6601	10	3	25	\N	\N	\N	\N
6602	10	3	26	\N	\N	\N	\N
6603	10	3	27	\N	\N	\N	\N
6604	10	3	28	\N	\N	\N	\N
6605	10	3	29	\N	\N	\N	\N
6606	10	3	30	\N	\N	\N	\N
6607	10	3	31	\N	\N	\N	\N
6608	10	3	32	\N	\N	\N	\N
6609	10	3	33	\N	\N	\N	\N
6610	10	3	34	\N	\N	\N	\N
6611	10	3	35	\N	\N	\N	\N
6612	10	3	36	\N	\N	\N	\N
6613	10	3	37	\N	\N	\N	\N
6614	10	3	38	\N	\N	\N	\N
6615	10	3	39	\N	\N	\N	\N
6616	10	3	40	\N	\N	\N	\N
6617	10	3	41	\N	\N	\N	\N
6618	10	3	42	\N	\N	\N	\N
6619	10	3	43	\N	\N	\N	\N
6620	10	3	44	\N	\N	\N	\N
6621	10	3	45	\N	\N	\N	\N
6622	10	3	46	\N	\N	\N	\N
6623	10	3	47	\N	\N	\N	\N
6624	10	3	48	\N	\N	\N	\N
6625	10	4	1	\N	\N	\N	\N
6626	10	4	2	\N	\N	\N	\N
6627	10	4	3	\N	\N	\N	\N
6628	10	4	4	\N	\N	\N	\N
6629	10	4	5	\N	\N	\N	\N
6630	10	4	6	\N	\N	\N	\N
6631	10	4	7	\N	\N	\N	\N
6632	10	4	8	\N	\N	\N	\N
6633	10	4	9	\N	\N	\N	\N
6634	10	4	10	\N	\N	\N	\N
6635	10	4	11	\N	\N	\N	\N
6636	10	4	12	\N	\N	\N	\N
6637	10	4	13	\N	\N	\N	\N
6638	10	4	14	\N	\N	\N	\N
6639	10	4	15	\N	\N	\N	\N
6640	10	4	16	\N	\N	\N	\N
6641	10	4	17	\N	\N	\N	\N
6642	10	4	18	\N	\N	\N	\N
6643	10	4	19	\N	\N	\N	\N
6644	10	4	20	\N	\N	\N	\N
6645	10	4	21	\N	\N	\N	\N
6646	10	4	22	\N	\N	\N	\N
6647	10	4	23	\N	\N	\N	\N
6648	10	4	24	\N	\N	\N	\N
6649	10	4	25	\N	\N	\N	\N
6650	10	4	26	\N	\N	\N	\N
6651	10	4	27	\N	\N	\N	\N
6652	10	4	28	\N	\N	\N	\N
6653	10	4	29	\N	\N	\N	\N
6654	10	4	30	\N	\N	\N	\N
6655	10	4	31	\N	\N	\N	\N
6656	10	4	32	\N	\N	\N	\N
6657	10	4	33	\N	\N	\N	\N
6658	10	4	34	\N	\N	\N	\N
6659	10	4	35	\N	\N	\N	\N
6660	10	4	36	\N	\N	\N	\N
6661	10	4	37	\N	\N	\N	\N
6662	10	4	38	\N	\N	\N	\N
6663	10	4	39	\N	\N	\N	\N
6664	10	4	40	\N	\N	\N	\N
6665	10	4	41	\N	\N	\N	\N
6666	10	4	42	\N	\N	\N	\N
6667	10	4	43	\N	\N	\N	\N
6668	10	4	44	\N	\N	\N	\N
6669	10	4	45	\N	\N	\N	\N
6670	10	4	46	\N	\N	\N	\N
6671	10	4	47	\N	\N	\N	\N
6672	10	4	48	\N	\N	\N	\N
6673	10	5	1	\N	\N	\N	\N
6674	10	5	2	\N	\N	\N	\N
6675	10	5	3	\N	\N	\N	\N
6676	10	5	4	\N	\N	\N	\N
6677	10	5	5	\N	\N	\N	\N
6678	10	5	6	\N	\N	\N	\N
6679	10	5	7	\N	\N	\N	\N
6680	10	5	8	\N	\N	\N	\N
6681	10	5	9	\N	\N	\N	\N
6682	10	5	10	\N	\N	\N	\N
6683	10	5	11	\N	\N	\N	\N
6684	10	5	12	\N	\N	\N	\N
6685	10	5	13	\N	\N	\N	\N
6686	10	5	14	\N	\N	\N	\N
6687	10	5	15	\N	\N	\N	\N
6688	10	5	16	\N	\N	\N	\N
6689	10	5	17	\N	\N	\N	\N
6690	10	5	18	\N	\N	\N	\N
6691	10	5	19	\N	\N	\N	\N
6692	10	5	20	\N	\N	\N	\N
6693	10	5	21	\N	\N	\N	\N
6694	10	5	22	\N	\N	\N	\N
6695	10	5	23	\N	\N	\N	\N
6696	10	5	24	\N	\N	\N	\N
6697	10	5	25	\N	\N	\N	\N
6698	10	5	26	\N	\N	\N	\N
6699	10	5	27	\N	\N	\N	\N
6700	10	5	28	\N	\N	\N	\N
6701	10	5	29	\N	\N	\N	\N
6702	10	5	30	\N	\N	\N	\N
6703	10	5	31	\N	\N	\N	\N
6704	10	5	32	\N	\N	\N	\N
6705	10	5	33	\N	\N	\N	\N
6706	10	5	34	\N	\N	\N	\N
6707	10	5	35	\N	\N	\N	\N
6708	10	5	36	\N	\N	\N	\N
6709	10	5	37	\N	\N	\N	\N
6710	10	5	38	\N	\N	\N	\N
6711	10	5	39	\N	\N	\N	\N
6712	10	5	40	\N	\N	\N	\N
6713	10	5	41	\N	\N	\N	\N
6714	10	5	42	\N	\N	\N	\N
6715	10	5	43	\N	\N	\N	\N
6716	10	5	44	\N	\N	\N	\N
6717	10	5	45	\N	\N	\N	\N
6718	10	5	46	\N	\N	\N	\N
6719	10	5	47	\N	\N	\N	\N
6720	10	5	48	\N	\N	\N	\N
6721	10	6	1	\N	\N	\N	\N
6722	10	6	2	\N	\N	\N	\N
6723	10	6	3	\N	\N	\N	\N
6724	10	6	4	\N	\N	\N	\N
6725	10	6	5	\N	\N	\N	\N
6726	10	6	6	\N	\N	\N	\N
6727	10	6	7	\N	\N	\N	\N
6728	10	6	8	\N	\N	\N	\N
6729	10	6	9	\N	\N	\N	\N
6730	10	6	10	\N	\N	\N	\N
6731	10	6	11	\N	\N	\N	\N
6732	10	6	12	\N	\N	\N	\N
6733	10	6	13	\N	\N	\N	\N
6734	10	6	14	\N	\N	\N	\N
6735	10	6	15	\N	\N	\N	\N
6736	10	6	16	\N	\N	\N	\N
6737	10	6	17	\N	\N	\N	\N
6738	10	6	18	\N	\N	\N	\N
6739	10	6	19	\N	\N	\N	\N
6740	10	6	20	\N	\N	\N	\N
6741	10	6	21	\N	\N	\N	\N
6742	10	6	22	\N	\N	\N	\N
6743	10	6	23	\N	\N	\N	\N
6744	10	6	24	\N	\N	\N	\N
6745	10	6	25	\N	\N	\N	\N
6746	10	6	26	\N	\N	\N	\N
6747	10	6	27	\N	\N	\N	\N
6748	10	6	28	\N	\N	\N	\N
6749	10	6	29	\N	\N	\N	\N
6750	10	6	30	\N	\N	\N	\N
6751	10	6	31	\N	\N	\N	\N
6752	10	6	32	\N	\N	\N	\N
6753	10	6	33	\N	\N	\N	\N
6754	10	6	34	\N	\N	\N	\N
6755	10	6	35	\N	\N	\N	\N
6756	10	6	36	\N	\N	\N	\N
6757	10	6	37	\N	\N	\N	\N
6758	10	6	38	\N	\N	\N	\N
6759	10	6	39	\N	\N	\N	\N
6760	10	6	40	\N	\N	\N	\N
6761	10	6	41	\N	\N	\N	\N
6762	10	6	42	\N	\N	\N	\N
6763	10	6	43	\N	\N	\N	\N
6764	10	6	44	\N	\N	\N	\N
6765	10	6	45	\N	\N	\N	\N
6766	10	6	46	\N	\N	\N	\N
6767	10	6	47	\N	\N	\N	\N
6768	10	6	48	\N	\N	\N	\N
6769	10	7	1	\N	\N	\N	\N
6770	10	7	2	\N	\N	\N	\N
6771	10	7	3	\N	\N	\N	\N
6772	10	7	4	\N	\N	\N	\N
6773	10	7	5	\N	\N	\N	\N
6774	10	7	6	\N	\N	\N	\N
6775	10	7	7	\N	\N	\N	\N
6776	10	7	8	\N	\N	\N	\N
6777	10	7	9	\N	\N	\N	\N
6778	10	7	10	\N	\N	\N	\N
6779	10	7	11	\N	\N	\N	\N
6780	10	7	12	\N	\N	\N	\N
6781	10	7	13	\N	\N	\N	\N
6782	10	7	14	\N	\N	\N	\N
6783	10	7	15	\N	\N	\N	\N
6784	10	7	16	\N	\N	\N	\N
6785	10	7	17	\N	\N	\N	\N
6786	10	7	18	\N	\N	\N	\N
6787	10	7	19	\N	\N	\N	\N
6788	10	7	20	\N	\N	\N	\N
6789	10	7	21	\N	\N	\N	\N
6790	10	7	22	\N	\N	\N	\N
6791	10	7	23	\N	\N	\N	\N
6792	10	7	24	\N	\N	\N	\N
6793	10	7	25	\N	\N	\N	\N
6794	10	7	26	\N	\N	\N	\N
6795	10	7	27	\N	\N	\N	\N
6796	10	7	28	\N	\N	\N	\N
6797	10	7	29	\N	\N	\N	\N
6798	10	7	30	\N	\N	\N	\N
6799	10	7	31	\N	\N	\N	\N
6800	10	7	32	\N	\N	\N	\N
6801	10	7	33	\N	\N	\N	\N
6802	10	7	34	\N	\N	\N	\N
6803	10	7	35	\N	\N	\N	\N
6804	10	7	36	\N	\N	\N	\N
6805	10	7	37	\N	\N	\N	\N
6806	10	7	38	\N	\N	\N	\N
6807	10	7	39	\N	\N	\N	\N
6808	10	7	40	\N	\N	\N	\N
6809	10	7	41	\N	\N	\N	\N
6810	10	7	42	\N	\N	\N	\N
6811	10	7	43	\N	\N	\N	\N
6812	10	7	44	\N	\N	\N	\N
6813	10	7	45	\N	\N	\N	\N
6814	10	7	46	\N	\N	\N	\N
6815	10	7	47	\N	\N	\N	\N
6816	10	7	48	\N	\N	\N	\N
6817	10	8	1	\N	\N	\N	\N
6818	10	8	2	\N	\N	\N	\N
6819	10	8	3	\N	\N	\N	\N
6820	10	8	4	\N	\N	\N	\N
6821	10	8	5	\N	\N	\N	\N
6822	10	8	6	\N	\N	\N	\N
6823	10	8	7	\N	\N	\N	\N
6824	10	8	8	\N	\N	\N	\N
6825	10	8	9	\N	\N	\N	\N
6826	10	8	10	\N	\N	\N	\N
6827	10	8	11	\N	\N	\N	\N
6828	10	8	12	\N	\N	\N	\N
6829	10	8	13	\N	\N	\N	\N
6830	10	8	14	\N	\N	\N	\N
6831	10	8	15	\N	\N	\N	\N
6832	10	8	16	\N	\N	\N	\N
6833	10	8	17	\N	\N	\N	\N
6834	10	8	18	\N	\N	\N	\N
6835	10	8	19	\N	\N	\N	\N
6836	10	8	20	\N	\N	\N	\N
6837	10	8	21	\N	\N	\N	\N
6838	10	8	22	\N	\N	\N	\N
6839	10	8	23	\N	\N	\N	\N
6840	10	8	24	\N	\N	\N	\N
6841	10	8	25	\N	\N	\N	\N
6842	10	8	26	\N	\N	\N	\N
6843	10	8	27	\N	\N	\N	\N
6844	10	8	28	\N	\N	\N	\N
6845	10	8	29	\N	\N	\N	\N
6846	10	8	30	\N	\N	\N	\N
6847	10	8	31	\N	\N	\N	\N
6848	10	8	32	\N	\N	\N	\N
6849	10	8	33	\N	\N	\N	\N
6850	10	8	34	\N	\N	\N	\N
6851	10	8	35	\N	\N	\N	\N
6852	10	8	36	\N	\N	\N	\N
6853	10	8	37	\N	\N	\N	\N
6854	10	8	38	\N	\N	\N	\N
6855	10	8	39	\N	\N	\N	\N
6856	10	8	40	\N	\N	\N	\N
6857	10	8	41	\N	\N	\N	\N
6858	10	8	42	\N	\N	\N	\N
6859	10	8	43	\N	\N	\N	\N
6860	10	8	44	\N	\N	\N	\N
6861	10	8	45	\N	\N	\N	\N
6862	10	8	46	\N	\N	\N	\N
6863	10	8	47	\N	\N	\N	\N
6864	10	8	48	\N	\N	\N	\N
6865	10	9	1	\N	\N	\N	\N
6866	10	9	2	\N	\N	\N	\N
6867	10	9	3	\N	\N	\N	\N
6868	10	9	4	\N	\N	\N	\N
6869	10	9	5	\N	\N	\N	\N
6870	10	9	6	\N	\N	\N	\N
6871	10	9	7	\N	\N	\N	\N
6872	10	9	8	\N	\N	\N	\N
6873	10	9	9	\N	\N	\N	\N
6874	10	9	10	\N	\N	\N	\N
6875	10	9	11	\N	\N	\N	\N
6876	10	9	12	\N	\N	\N	\N
6877	10	9	13	\N	\N	\N	\N
6878	10	9	14	\N	\N	\N	\N
6879	10	9	15	\N	\N	\N	\N
6880	10	9	16	\N	\N	\N	\N
6881	10	9	17	\N	\N	\N	\N
6882	10	9	18	\N	\N	\N	\N
6883	10	9	19	\N	\N	\N	\N
6884	10	9	20	\N	\N	\N	\N
6885	10	9	21	\N	\N	\N	\N
6886	10	9	22	\N	\N	\N	\N
6887	10	9	23	\N	\N	\N	\N
6888	10	9	24	\N	\N	\N	\N
6889	10	9	25	\N	\N	\N	\N
6890	10	9	26	\N	\N	\N	\N
6891	10	9	27	\N	\N	\N	\N
6892	10	9	28	\N	\N	\N	\N
6893	10	9	29	\N	\N	\N	\N
6894	10	9	30	\N	\N	\N	\N
6895	10	9	31	\N	\N	\N	\N
6896	10	9	32	\N	\N	\N	\N
6897	10	9	33	\N	\N	\N	\N
6898	10	9	34	\N	\N	\N	\N
6899	10	9	35	\N	\N	\N	\N
6900	10	9	36	\N	\N	\N	\N
6901	10	9	37	\N	\N	\N	\N
6902	10	9	38	\N	\N	\N	\N
6903	10	9	39	\N	\N	\N	\N
6904	10	9	40	\N	\N	\N	\N
6905	10	9	41	\N	\N	\N	\N
6906	10	9	42	\N	\N	\N	\N
6907	10	9	43	\N	\N	\N	\N
6908	10	9	44	\N	\N	\N	\N
6909	10	9	45	\N	\N	\N	\N
6910	10	9	46	\N	\N	\N	\N
6911	10	9	47	\N	\N	\N	\N
6912	10	9	48	\N	\N	\N	\N
6913	10	10	1	\N	\N	\N	\N
6914	10	10	2	\N	\N	\N	\N
6915	10	10	3	\N	\N	\N	\N
6916	10	10	4	\N	\N	\N	\N
6917	10	10	5	\N	\N	\N	\N
6918	10	10	6	\N	\N	\N	\N
6919	10	10	7	\N	\N	\N	\N
6920	10	10	8	\N	\N	\N	\N
6921	10	10	9	\N	\N	\N	\N
6922	10	10	10	\N	\N	\N	\N
6923	10	10	11	\N	\N	\N	\N
6924	10	10	12	\N	\N	\N	\N
6925	10	10	13	\N	\N	\N	\N
6926	10	10	14	\N	\N	\N	\N
6927	10	10	15	\N	\N	\N	\N
6928	10	10	16	\N	\N	\N	\N
6929	10	10	17	\N	\N	\N	\N
6930	10	10	18	\N	\N	\N	\N
6931	10	10	19	\N	\N	\N	\N
6932	10	10	20	\N	\N	\N	\N
6933	10	10	21	\N	\N	\N	\N
6934	10	10	22	\N	\N	\N	\N
6935	10	10	23	\N	\N	\N	\N
6936	10	10	24	\N	\N	\N	\N
6937	10	10	25	\N	\N	\N	\N
6938	10	10	26	\N	\N	\N	\N
6939	10	10	27	\N	\N	\N	\N
6940	10	10	28	\N	\N	\N	\N
6941	10	10	29	\N	\N	\N	\N
6942	10	10	30	\N	\N	\N	\N
6943	10	10	31	\N	\N	\N	\N
6944	10	10	32	\N	\N	\N	\N
6945	10	10	33	\N	\N	\N	\N
6946	10	10	34	\N	\N	\N	\N
6947	10	10	35	\N	\N	\N	\N
6948	10	10	36	\N	\N	\N	\N
6949	10	10	37	\N	\N	\N	\N
6950	10	10	38	\N	\N	\N	\N
6951	10	10	39	\N	\N	\N	\N
6952	10	10	40	\N	\N	\N	\N
6953	10	10	41	\N	\N	\N	\N
6954	10	10	42	\N	\N	\N	\N
6955	10	10	43	\N	\N	\N	\N
6956	10	10	44	\N	\N	\N	\N
6957	10	10	45	\N	\N	\N	\N
6958	10	10	46	\N	\N	\N	\N
6959	10	10	47	\N	\N	\N	\N
6960	10	10	48	\N	\N	\N	\N
6961	10	11	1	\N	\N	\N	\N
6962	10	11	2	\N	\N	\N	\N
6963	10	11	3	\N	\N	\N	\N
6964	10	11	4	\N	\N	\N	\N
6965	10	11	5	\N	\N	\N	\N
6966	10	11	6	\N	\N	\N	\N
6967	10	11	7	\N	\N	\N	\N
6968	10	11	8	\N	\N	\N	\N
6969	10	11	9	\N	\N	\N	\N
6970	10	11	10	\N	\N	\N	\N
6971	10	11	11	\N	\N	\N	\N
6972	10	11	12	\N	\N	\N	\N
6973	10	11	13	\N	\N	\N	\N
6974	10	11	14	\N	\N	\N	\N
6975	10	11	15	\N	\N	\N	\N
6976	10	11	16	\N	\N	\N	\N
6977	10	11	17	\N	\N	\N	\N
6978	10	11	18	\N	\N	\N	\N
6979	10	11	19	\N	\N	\N	\N
6980	10	11	20	\N	\N	\N	\N
6981	10	11	21	\N	\N	\N	\N
6982	10	11	22	\N	\N	\N	\N
6983	10	11	23	\N	\N	\N	\N
6984	10	11	24	\N	\N	\N	\N
6985	10	11	25	\N	\N	\N	\N
6986	10	11	26	\N	\N	\N	\N
6987	10	11	27	\N	\N	\N	\N
6988	10	11	28	\N	\N	\N	\N
6989	10	11	29	\N	\N	\N	\N
6990	10	11	30	\N	\N	\N	\N
6991	10	11	31	\N	\N	\N	\N
6992	10	11	32	\N	\N	\N	\N
6993	10	11	33	\N	\N	\N	\N
6994	10	11	34	\N	\N	\N	\N
6995	10	11	35	\N	\N	\N	\N
6996	10	11	36	\N	\N	\N	\N
6997	10	11	37	\N	\N	\N	\N
6998	10	11	38	\N	\N	\N	\N
6999	10	11	39	\N	\N	\N	\N
7000	10	11	40	\N	\N	\N	\N
7001	10	11	41	\N	\N	\N	\N
7002	10	11	42	\N	\N	\N	\N
7003	10	11	43	\N	\N	\N	\N
7004	10	11	44	\N	\N	\N	\N
7005	10	11	45	\N	\N	\N	\N
7006	10	11	46	\N	\N	\N	\N
7007	10	11	47	\N	\N	\N	\N
7008	10	11	48	\N	\N	\N	\N
7009	10	12	1	\N	\N	\N	\N
7010	10	12	2	\N	\N	\N	\N
7011	10	12	3	\N	\N	\N	\N
7012	10	12	4	\N	\N	\N	\N
7013	10	12	5	\N	\N	\N	\N
7014	10	12	6	\N	\N	\N	\N
7015	10	12	7	\N	\N	\N	\N
7016	10	12	8	\N	\N	\N	\N
7017	10	12	9	\N	\N	\N	\N
7018	10	12	10	\N	\N	\N	\N
7019	10	12	11	\N	\N	\N	\N
7020	10	12	12	\N	\N	\N	\N
7021	10	12	13	\N	\N	\N	\N
7022	10	12	14	\N	\N	\N	\N
7023	10	12	15	\N	\N	\N	\N
7024	10	12	16	\N	\N	\N	\N
7025	10	12	17	\N	\N	\N	\N
7026	10	12	18	\N	\N	\N	\N
7027	10	12	19	\N	\N	\N	\N
7028	10	12	20	\N	\N	\N	\N
7029	10	12	21	\N	\N	\N	\N
7030	10	12	22	\N	\N	\N	\N
7031	10	12	23	\N	\N	\N	\N
7032	10	12	24	\N	\N	\N	\N
7033	10	12	25	\N	\N	\N	\N
7034	10	12	26	\N	\N	\N	\N
7035	10	12	27	\N	\N	\N	\N
7036	10	12	28	\N	\N	\N	\N
7037	10	12	29	\N	\N	\N	\N
7038	10	12	30	\N	\N	\N	\N
7039	10	12	31	\N	\N	\N	\N
7040	10	12	32	\N	\N	\N	\N
7041	10	12	33	\N	\N	\N	\N
7042	10	12	34	\N	\N	\N	\N
7043	10	12	35	\N	\N	\N	\N
7044	10	12	36	\N	\N	\N	\N
7045	10	12	37	\N	\N	\N	\N
7046	10	12	38	\N	\N	\N	\N
7047	10	12	39	\N	\N	\N	\N
7048	10	12	40	\N	\N	\N	\N
7049	10	12	41	\N	\N	\N	\N
7050	10	12	42	\N	\N	\N	\N
7051	10	12	43	\N	\N	\N	\N
7052	10	12	44	\N	\N	\N	\N
7053	10	12	45	\N	\N	\N	\N
7054	10	12	46	\N	\N	\N	\N
7055	10	12	47	\N	\N	\N	\N
7056	10	12	48	\N	\N	\N	\N
7057	10	13	1	\N	\N	\N	\N
7058	10	13	2	\N	\N	\N	\N
7059	10	13	3	\N	\N	\N	\N
7060	10	13	4	\N	\N	\N	\N
7061	10	13	5	\N	\N	\N	\N
7062	10	13	6	\N	\N	\N	\N
7063	10	13	7	\N	\N	\N	\N
7064	10	13	8	\N	\N	\N	\N
7065	10	13	9	\N	\N	\N	\N
7066	10	13	10	\N	\N	\N	\N
7067	10	13	11	\N	\N	\N	\N
7068	10	13	12	\N	\N	\N	\N
7069	10	13	13	\N	\N	\N	\N
7070	10	13	14	\N	\N	\N	\N
7071	10	13	15	\N	\N	\N	\N
7072	10	13	16	\N	\N	\N	\N
7073	10	13	17	\N	\N	\N	\N
7074	10	13	18	\N	\N	\N	\N
7075	10	13	19	\N	\N	\N	\N
7076	10	13	20	\N	\N	\N	\N
7077	10	13	21	\N	\N	\N	\N
7078	10	13	22	\N	\N	\N	\N
7079	10	13	23	\N	\N	\N	\N
7080	10	13	24	\N	\N	\N	\N
7081	10	13	25	\N	\N	\N	\N
7082	10	13	26	\N	\N	\N	\N
7083	10	13	27	\N	\N	\N	\N
7084	10	13	28	\N	\N	\N	\N
7085	10	13	29	\N	\N	\N	\N
7086	10	13	30	\N	\N	\N	\N
7087	10	13	31	\N	\N	\N	\N
7088	10	13	32	\N	\N	\N	\N
7089	10	13	33	\N	\N	\N	\N
7090	10	13	34	\N	\N	\N	\N
7091	10	13	35	\N	\N	\N	\N
7092	10	13	36	\N	\N	\N	\N
7093	10	13	37	\N	\N	\N	\N
7094	10	13	38	\N	\N	\N	\N
7095	10	13	39	\N	\N	\N	\N
7096	10	13	40	\N	\N	\N	\N
7097	10	13	41	\N	\N	\N	\N
7098	10	13	42	\N	\N	\N	\N
7099	10	13	43	\N	\N	\N	\N
7100	10	13	44	\N	\N	\N	\N
7101	10	13	45	\N	\N	\N	\N
7102	10	13	46	\N	\N	\N	\N
7103	10	13	47	\N	\N	\N	\N
7104	10	13	48	\N	\N	\N	\N
7105	10	14	1	\N	\N	\N	\N
7106	10	14	2	\N	\N	\N	\N
7107	10	14	3	\N	\N	\N	\N
7108	10	14	4	\N	\N	\N	\N
7109	10	14	5	\N	\N	\N	\N
7110	10	14	6	\N	\N	\N	\N
7111	10	14	7	\N	\N	\N	\N
7112	10	14	8	\N	\N	\N	\N
7113	10	14	9	\N	\N	\N	\N
7114	10	14	10	\N	\N	\N	\N
7115	10	14	11	\N	\N	\N	\N
7116	10	14	12	\N	\N	\N	\N
7117	10	14	13	\N	\N	\N	\N
7118	10	14	14	\N	\N	\N	\N
7119	10	14	15	\N	\N	\N	\N
7120	10	14	16	\N	\N	\N	\N
7121	10	14	17	\N	\N	\N	\N
7122	10	14	18	\N	\N	\N	\N
7123	10	14	19	\N	\N	\N	\N
7124	10	14	20	\N	\N	\N	\N
7125	10	14	21	\N	\N	\N	\N
7126	10	14	22	\N	\N	\N	\N
7127	10	14	23	\N	\N	\N	\N
7128	10	14	24	\N	\N	\N	\N
7129	10	14	25	\N	\N	\N	\N
7130	10	14	26	\N	\N	\N	\N
7131	10	14	27	\N	\N	\N	\N
7132	10	14	28	\N	\N	\N	\N
7133	10	14	29	\N	\N	\N	\N
7134	10	14	30	\N	\N	\N	\N
7135	10	14	31	\N	\N	\N	\N
7136	10	14	32	\N	\N	\N	\N
7137	10	14	33	\N	\N	\N	\N
7138	10	14	34	\N	\N	\N	\N
7139	10	14	35	\N	\N	\N	\N
7140	10	14	36	\N	\N	\N	\N
7141	10	14	37	\N	\N	\N	\N
7142	10	14	38	\N	\N	\N	\N
7143	10	14	39	\N	\N	\N	\N
7144	10	14	40	\N	\N	\N	\N
7145	10	14	41	\N	\N	\N	\N
7146	10	14	42	\N	\N	\N	\N
7147	10	14	43	\N	\N	\N	\N
7148	10	14	44	\N	\N	\N	\N
7149	10	14	45	\N	\N	\N	\N
7150	10	14	46	\N	\N	\N	\N
7151	10	14	47	\N	\N	\N	\N
7152	10	14	48	\N	\N	\N	\N
7153	10	15	1	\N	\N	\N	\N
7154	10	15	2	\N	\N	\N	\N
7155	10	15	3	\N	\N	\N	\N
7156	10	15	4	\N	\N	\N	\N
7157	10	15	5	\N	\N	\N	\N
7158	10	15	6	\N	\N	\N	\N
7159	10	15	7	\N	\N	\N	\N
7160	10	15	8	\N	\N	\N	\N
7161	10	15	9	\N	\N	\N	\N
7162	10	15	10	\N	\N	\N	\N
7163	10	15	11	\N	\N	\N	\N
7164	10	15	12	\N	\N	\N	\N
7165	10	15	13	\N	\N	\N	\N
7166	10	15	14	\N	\N	\N	\N
7167	10	15	15	\N	\N	\N	\N
7168	10	15	16	\N	\N	\N	\N
7169	10	15	17	\N	\N	\N	\N
7170	10	15	18	\N	\N	\N	\N
7171	10	15	19	\N	\N	\N	\N
7172	10	15	20	\N	\N	\N	\N
7173	10	15	21	\N	\N	\N	\N
7174	10	15	22	\N	\N	\N	\N
7175	10	15	23	\N	\N	\N	\N
7176	10	15	24	\N	\N	\N	\N
7177	10	15	25	\N	\N	\N	\N
7178	10	15	26	\N	\N	\N	\N
7179	10	15	27	\N	\N	\N	\N
7180	10	15	28	\N	\N	\N	\N
7181	10	15	29	\N	\N	\N	\N
7182	10	15	30	\N	\N	\N	\N
7183	10	15	31	\N	\N	\N	\N
7184	10	15	32	\N	\N	\N	\N
7185	10	15	33	\N	\N	\N	\N
7186	10	15	34	\N	\N	\N	\N
7187	10	15	35	\N	\N	\N	\N
7188	10	15	36	\N	\N	\N	\N
7189	10	15	37	\N	\N	\N	\N
7190	10	15	38	\N	\N	\N	\N
7191	10	15	39	\N	\N	\N	\N
7192	10	15	40	\N	\N	\N	\N
7193	10	15	41	\N	\N	\N	\N
7194	10	15	42	\N	\N	\N	\N
7195	10	15	43	\N	\N	\N	\N
7196	10	15	44	\N	\N	\N	\N
7197	10	15	45	\N	\N	\N	\N
7198	10	15	46	\N	\N	\N	\N
7199	10	15	47	\N	\N	\N	\N
7200	10	15	48	\N	\N	\N	\N
7201	11	1	1	\N	\N	\N	\N
7202	11	1	2	\N	\N	\N	\N
7203	11	1	3	\N	\N	\N	\N
7204	11	1	4	\N	\N	\N	\N
7205	11	1	5	\N	\N	\N	\N
7206	11	1	6	\N	\N	\N	\N
7207	11	1	7	\N	\N	\N	\N
7208	11	1	8	\N	\N	\N	\N
7209	11	1	9	\N	\N	\N	\N
7210	11	1	10	\N	\N	\N	\N
7211	11	1	11	\N	\N	\N	\N
7212	11	1	12	\N	\N	\N	\N
7213	11	1	13	\N	\N	\N	\N
7214	11	1	14	\N	\N	\N	\N
7215	11	1	15	\N	\N	\N	\N
7216	11	1	16	\N	\N	\N	\N
7217	11	1	17	\N	\N	\N	\N
7218	11	1	18	\N	\N	\N	\N
7219	11	1	19	\N	\N	\N	\N
7220	11	1	20	\N	\N	\N	\N
7221	11	1	21	\N	\N	\N	\N
7222	11	1	22	\N	\N	\N	\N
7223	11	1	23	\N	\N	\N	\N
7224	11	1	24	\N	\N	\N	\N
7225	11	1	25	\N	\N	\N	\N
7226	11	1	26	\N	\N	\N	\N
7227	11	1	27	\N	\N	\N	\N
7228	11	1	28	\N	\N	\N	\N
7229	11	1	29	\N	\N	\N	\N
7230	11	1	30	\N	\N	\N	\N
7231	11	1	31	\N	\N	\N	\N
7232	11	1	32	\N	\N	\N	\N
7233	11	1	33	\N	\N	\N	\N
7234	11	1	34	\N	\N	\N	\N
7235	11	1	35	\N	\N	\N	\N
7236	11	1	36	\N	\N	\N	\N
7237	11	1	37	\N	\N	\N	\N
7238	11	1	38	\N	\N	\N	\N
7239	11	1	39	\N	\N	\N	\N
7240	11	1	40	\N	\N	\N	\N
7241	11	1	41	\N	\N	\N	\N
7242	11	1	42	\N	\N	\N	\N
7243	11	1	43	\N	\N	\N	\N
7244	11	1	44	\N	\N	\N	\N
7245	11	1	45	\N	\N	\N	\N
7246	11	1	46	\N	\N	\N	\N
7247	11	1	47	\N	\N	\N	\N
7248	11	1	48	\N	\N	\N	\N
7249	11	2	1	\N	\N	\N	\N
7250	11	2	2	\N	\N	\N	\N
7251	11	2	3	\N	\N	\N	\N
7252	11	2	4	\N	\N	\N	\N
7253	11	2	5	\N	\N	\N	\N
7254	11	2	6	\N	\N	\N	\N
7255	11	2	7	\N	\N	\N	\N
7256	11	2	8	\N	\N	\N	\N
7257	11	2	9	\N	\N	\N	\N
7258	11	2	10	\N	\N	\N	\N
7259	11	2	11	\N	\N	\N	\N
7260	11	2	12	\N	\N	\N	\N
7261	11	2	13	\N	\N	\N	\N
7262	11	2	14	\N	\N	\N	\N
7263	11	2	15	\N	\N	\N	\N
7264	11	2	16	\N	\N	\N	\N
7265	11	2	17	\N	\N	\N	\N
7266	11	2	18	\N	\N	\N	\N
7267	11	2	19	\N	\N	\N	\N
7268	11	2	20	\N	\N	\N	\N
7269	11	2	21	\N	\N	\N	\N
7270	11	2	22	\N	\N	\N	\N
7271	11	2	23	\N	\N	\N	\N
7272	11	2	24	\N	\N	\N	\N
7273	11	2	25	\N	\N	\N	\N
7274	11	2	26	\N	\N	\N	\N
7275	11	2	27	\N	\N	\N	\N
7276	11	2	28	\N	\N	\N	\N
7277	11	2	29	\N	\N	\N	\N
7278	11	2	30	\N	\N	\N	\N
7279	11	2	31	\N	\N	\N	\N
7280	11	2	32	\N	\N	\N	\N
7281	11	2	33	\N	\N	\N	\N
7282	11	2	34	\N	\N	\N	\N
7283	11	2	35	\N	\N	\N	\N
7284	11	2	36	\N	\N	\N	\N
7285	11	2	37	\N	\N	\N	\N
7286	11	2	38	\N	\N	\N	\N
7287	11	2	39	\N	\N	\N	\N
7288	11	2	40	\N	\N	\N	\N
7289	11	2	41	\N	\N	\N	\N
7290	11	2	42	\N	\N	\N	\N
7291	11	2	43	\N	\N	\N	\N
7292	11	2	44	\N	\N	\N	\N
7293	11	2	45	\N	\N	\N	\N
7294	11	2	46	\N	\N	\N	\N
7295	11	2	47	\N	\N	\N	\N
7296	11	2	48	\N	\N	\N	\N
7297	11	3	1	\N	\N	\N	\N
7298	11	3	2	\N	\N	\N	\N
7299	11	3	3	\N	\N	\N	\N
7300	11	3	4	\N	\N	\N	\N
7301	11	3	5	\N	\N	\N	\N
7302	11	3	6	\N	\N	\N	\N
7303	11	3	7	\N	\N	\N	\N
7304	11	3	8	\N	\N	\N	\N
7305	11	3	9	\N	\N	\N	\N
7306	11	3	10	\N	\N	\N	\N
7307	11	3	11	\N	\N	\N	\N
7308	11	3	12	\N	\N	\N	\N
7309	11	3	13	\N	\N	\N	\N
7310	11	3	14	\N	\N	\N	\N
7311	11	3	15	\N	\N	\N	\N
7312	11	3	16	\N	\N	\N	\N
7313	11	3	17	\N	\N	\N	\N
7314	11	3	18	\N	\N	\N	\N
7315	11	3	19	\N	\N	\N	\N
7316	11	3	20	\N	\N	\N	\N
7317	11	3	21	\N	\N	\N	\N
7318	11	3	22	\N	\N	\N	\N
7319	11	3	23	\N	\N	\N	\N
7320	11	3	24	\N	\N	\N	\N
7321	11	3	25	\N	\N	\N	\N
7322	11	3	26	\N	\N	\N	\N
7323	11	3	27	\N	\N	\N	\N
7324	11	3	28	\N	\N	\N	\N
7325	11	3	29	\N	\N	\N	\N
7326	11	3	30	\N	\N	\N	\N
7327	11	3	31	\N	\N	\N	\N
7328	11	3	32	\N	\N	\N	\N
7329	11	3	33	\N	\N	\N	\N
7330	11	3	34	\N	\N	\N	\N
7331	11	3	35	\N	\N	\N	\N
7332	11	3	36	\N	\N	\N	\N
7333	11	3	37	\N	\N	\N	\N
7334	11	3	38	\N	\N	\N	\N
7335	11	3	39	\N	\N	\N	\N
7336	11	3	40	\N	\N	\N	\N
7337	11	3	41	\N	\N	\N	\N
7338	11	3	42	\N	\N	\N	\N
7339	11	3	43	\N	\N	\N	\N
7340	11	3	44	\N	\N	\N	\N
7341	11	3	45	\N	\N	\N	\N
7342	11	3	46	\N	\N	\N	\N
7343	11	3	47	\N	\N	\N	\N
7344	11	3	48	\N	\N	\N	\N
7345	11	4	1	\N	\N	\N	\N
7346	11	4	2	\N	\N	\N	\N
7347	11	4	3	\N	\N	\N	\N
7348	11	4	4	\N	\N	\N	\N
7349	11	4	5	\N	\N	\N	\N
7350	11	4	6	\N	\N	\N	\N
7351	11	4	7	\N	\N	\N	\N
7352	11	4	8	\N	\N	\N	\N
7353	11	4	9	\N	\N	\N	\N
7354	11	4	10	\N	\N	\N	\N
7355	11	4	11	\N	\N	\N	\N
7356	11	4	12	\N	\N	\N	\N
7357	11	4	13	\N	\N	\N	\N
7358	11	4	14	\N	\N	\N	\N
7359	11	4	15	\N	\N	\N	\N
7360	11	4	16	\N	\N	\N	\N
7361	11	4	17	\N	\N	\N	\N
7362	11	4	18	\N	\N	\N	\N
7363	11	4	19	\N	\N	\N	\N
7364	11	4	20	\N	\N	\N	\N
7365	11	4	21	\N	\N	\N	\N
7366	11	4	22	\N	\N	\N	\N
7367	11	4	23	\N	\N	\N	\N
7368	11	4	24	\N	\N	\N	\N
7369	11	4	25	\N	\N	\N	\N
7370	11	4	26	\N	\N	\N	\N
7371	11	4	27	\N	\N	\N	\N
7372	11	4	28	\N	\N	\N	\N
7373	11	4	29	\N	\N	\N	\N
7374	11	4	30	\N	\N	\N	\N
7375	11	4	31	\N	\N	\N	\N
7376	11	4	32	\N	\N	\N	\N
7377	11	4	33	\N	\N	\N	\N
7378	11	4	34	\N	\N	\N	\N
7379	11	4	35	\N	\N	\N	\N
7380	11	4	36	\N	\N	\N	\N
7381	11	4	37	\N	\N	\N	\N
7382	11	4	38	\N	\N	\N	\N
7383	11	4	39	\N	\N	\N	\N
7384	11	4	40	\N	\N	\N	\N
7385	11	4	41	\N	\N	\N	\N
7386	11	4	42	\N	\N	\N	\N
7387	11	4	43	\N	\N	\N	\N
7388	11	4	44	\N	\N	\N	\N
7389	11	4	45	\N	\N	\N	\N
7390	11	4	46	\N	\N	\N	\N
7391	11	4	47	\N	\N	\N	\N
7392	11	4	48	\N	\N	\N	\N
7393	11	5	1	\N	\N	\N	\N
7394	11	5	2	\N	\N	\N	\N
7395	11	5	3	\N	\N	\N	\N
7396	11	5	4	\N	\N	\N	\N
7397	11	5	5	\N	\N	\N	\N
7398	11	5	6	\N	\N	\N	\N
7399	11	5	7	\N	\N	\N	\N
7400	11	5	8	\N	\N	\N	\N
7401	11	5	9	\N	\N	\N	\N
7402	11	5	10	\N	\N	\N	\N
7403	11	5	11	\N	\N	\N	\N
7404	11	5	12	\N	\N	\N	\N
7405	11	5	13	\N	\N	\N	\N
7406	11	5	14	\N	\N	\N	\N
7407	11	5	15	\N	\N	\N	\N
7408	11	5	16	\N	\N	\N	\N
7409	11	5	17	\N	\N	\N	\N
7410	11	5	18	\N	\N	\N	\N
7411	11	5	19	\N	\N	\N	\N
7412	11	5	20	\N	\N	\N	\N
7413	11	5	21	\N	\N	\N	\N
7414	11	5	22	\N	\N	\N	\N
7415	11	5	23	\N	\N	\N	\N
7416	11	5	24	\N	\N	\N	\N
7417	11	5	25	\N	\N	\N	\N
7418	11	5	26	\N	\N	\N	\N
7419	11	5	27	\N	\N	\N	\N
7420	11	5	28	\N	\N	\N	\N
7421	11	5	29	\N	\N	\N	\N
7422	11	5	30	\N	\N	\N	\N
7423	11	5	31	\N	\N	\N	\N
7424	11	5	32	\N	\N	\N	\N
7425	11	5	33	\N	\N	\N	\N
7426	11	5	34	\N	\N	\N	\N
7427	11	5	35	\N	\N	\N	\N
7428	11	5	36	\N	\N	\N	\N
7429	11	5	37	\N	\N	\N	\N
7430	11	5	38	\N	\N	\N	\N
7431	11	5	39	\N	\N	\N	\N
7432	11	5	40	\N	\N	\N	\N
7433	11	5	41	\N	\N	\N	\N
7434	11	5	42	\N	\N	\N	\N
7435	11	5	43	\N	\N	\N	\N
7436	11	5	44	\N	\N	\N	\N
7437	11	5	45	\N	\N	\N	\N
7438	11	5	46	\N	\N	\N	\N
7439	11	5	47	\N	\N	\N	\N
7440	11	5	48	\N	\N	\N	\N
7441	11	6	1	\N	\N	\N	\N
7442	11	6	2	\N	\N	\N	\N
7443	11	6	3	\N	\N	\N	\N
7444	11	6	4	\N	\N	\N	\N
7445	11	6	5	\N	\N	\N	\N
7446	11	6	6	\N	\N	\N	\N
7447	11	6	7	\N	\N	\N	\N
7448	11	6	8	\N	\N	\N	\N
7449	11	6	9	\N	\N	\N	\N
7450	11	6	10	\N	\N	\N	\N
7451	11	6	11	\N	\N	\N	\N
7452	11	6	12	\N	\N	\N	\N
7453	11	6	13	\N	\N	\N	\N
7454	11	6	14	\N	\N	\N	\N
7455	11	6	15	\N	\N	\N	\N
7456	11	6	16	\N	\N	\N	\N
7457	11	6	17	\N	\N	\N	\N
7458	11	6	18	\N	\N	\N	\N
7459	11	6	19	\N	\N	\N	\N
7460	11	6	20	\N	\N	\N	\N
7461	11	6	21	\N	\N	\N	\N
7462	11	6	22	\N	\N	\N	\N
7463	11	6	23	\N	\N	\N	\N
7464	11	6	24	\N	\N	\N	\N
7465	11	6	25	\N	\N	\N	\N
7466	11	6	26	\N	\N	\N	\N
7467	11	6	27	\N	\N	\N	\N
7468	11	6	28	\N	\N	\N	\N
7469	11	6	29	\N	\N	\N	\N
7470	11	6	30	\N	\N	\N	\N
7471	11	6	31	\N	\N	\N	\N
7472	11	6	32	\N	\N	\N	\N
7473	11	6	33	\N	\N	\N	\N
7474	11	6	34	\N	\N	\N	\N
7475	11	6	35	\N	\N	\N	\N
7476	11	6	36	\N	\N	\N	\N
7477	11	6	37	\N	\N	\N	\N
7478	11	6	38	\N	\N	\N	\N
7479	11	6	39	\N	\N	\N	\N
7480	11	6	40	\N	\N	\N	\N
7481	11	6	41	\N	\N	\N	\N
7482	11	6	42	\N	\N	\N	\N
7483	11	6	43	\N	\N	\N	\N
7484	11	6	44	\N	\N	\N	\N
7485	11	6	45	\N	\N	\N	\N
7486	11	6	46	\N	\N	\N	\N
7487	11	6	47	\N	\N	\N	\N
7488	11	6	48	\N	\N	\N	\N
7489	11	7	1	\N	\N	\N	\N
7490	11	7	2	\N	\N	\N	\N
7491	11	7	3	\N	\N	\N	\N
7492	11	7	4	\N	\N	\N	\N
7493	11	7	5	\N	\N	\N	\N
7494	11	7	6	\N	\N	\N	\N
7495	11	7	7	\N	\N	\N	\N
7496	11	7	8	\N	\N	\N	\N
7497	11	7	9	\N	\N	\N	\N
7498	11	7	10	\N	\N	\N	\N
7499	11	7	11	\N	\N	\N	\N
7500	11	7	12	\N	\N	\N	\N
7501	11	7	13	\N	\N	\N	\N
7502	11	7	14	\N	\N	\N	\N
7503	11	7	15	\N	\N	\N	\N
7504	11	7	16	\N	\N	\N	\N
7505	11	7	17	\N	\N	\N	\N
7506	11	7	18	\N	\N	\N	\N
7507	11	7	19	\N	\N	\N	\N
7508	11	7	20	\N	\N	\N	\N
7509	11	7	21	\N	\N	\N	\N
7510	11	7	22	\N	\N	\N	\N
7511	11	7	23	\N	\N	\N	\N
7512	11	7	24	\N	\N	\N	\N
7513	11	7	25	\N	\N	\N	\N
7514	11	7	26	\N	\N	\N	\N
7515	11	7	27	\N	\N	\N	\N
7516	11	7	28	\N	\N	\N	\N
7517	11	7	29	\N	\N	\N	\N
7518	11	7	30	\N	\N	\N	\N
7519	11	7	31	\N	\N	\N	\N
7520	11	7	32	\N	\N	\N	\N
7521	11	7	33	\N	\N	\N	\N
7522	11	7	34	\N	\N	\N	\N
7523	11	7	35	\N	\N	\N	\N
7524	11	7	36	\N	\N	\N	\N
7525	11	7	37	\N	\N	\N	\N
7526	11	7	38	\N	\N	\N	\N
7527	11	7	39	\N	\N	\N	\N
7528	11	7	40	\N	\N	\N	\N
7529	11	7	41	\N	\N	\N	\N
7530	11	7	42	\N	\N	\N	\N
7531	11	7	43	\N	\N	\N	\N
7532	11	7	44	\N	\N	\N	\N
7533	11	7	45	\N	\N	\N	\N
7534	11	7	46	\N	\N	\N	\N
7535	11	7	47	\N	\N	\N	\N
7536	11	7	48	\N	\N	\N	\N
7537	11	8	1	\N	\N	\N	\N
7538	11	8	2	\N	\N	\N	\N
7539	11	8	3	\N	\N	\N	\N
7540	11	8	4	\N	\N	\N	\N
7541	11	8	5	\N	\N	\N	\N
7542	11	8	6	\N	\N	\N	\N
7543	11	8	7	\N	\N	\N	\N
7544	11	8	8	\N	\N	\N	\N
7545	11	8	9	\N	\N	\N	\N
7546	11	8	10	\N	\N	\N	\N
7547	11	8	11	\N	\N	\N	\N
7548	11	8	12	\N	\N	\N	\N
7549	11	8	13	\N	\N	\N	\N
7550	11	8	14	\N	\N	\N	\N
7551	11	8	15	\N	\N	\N	\N
7552	11	8	16	\N	\N	\N	\N
7553	11	8	17	\N	\N	\N	\N
7554	11	8	18	\N	\N	\N	\N
7555	11	8	19	\N	\N	\N	\N
7556	11	8	20	\N	\N	\N	\N
7557	11	8	21	\N	\N	\N	\N
7558	11	8	22	\N	\N	\N	\N
7559	11	8	23	\N	\N	\N	\N
7560	11	8	24	\N	\N	\N	\N
7561	11	8	25	\N	\N	\N	\N
7562	11	8	26	\N	\N	\N	\N
7563	11	8	27	\N	\N	\N	\N
7564	11	8	28	\N	\N	\N	\N
7565	11	8	29	\N	\N	\N	\N
7566	11	8	30	\N	\N	\N	\N
7567	11	8	31	\N	\N	\N	\N
7568	11	8	32	\N	\N	\N	\N
7569	11	8	33	\N	\N	\N	\N
7570	11	8	34	\N	\N	\N	\N
7571	11	8	35	\N	\N	\N	\N
7572	11	8	36	\N	\N	\N	\N
7573	11	8	37	\N	\N	\N	\N
7574	11	8	38	\N	\N	\N	\N
7575	11	8	39	\N	\N	\N	\N
7576	11	8	40	\N	\N	\N	\N
7577	11	8	41	\N	\N	\N	\N
7578	11	8	42	\N	\N	\N	\N
7579	11	8	43	\N	\N	\N	\N
7580	11	8	44	\N	\N	\N	\N
7581	11	8	45	\N	\N	\N	\N
7582	11	8	46	\N	\N	\N	\N
7583	11	8	47	\N	\N	\N	\N
7584	11	8	48	\N	\N	\N	\N
7585	11	9	1	\N	\N	\N	\N
7586	11	9	2	\N	\N	\N	\N
7587	11	9	3	\N	\N	\N	\N
7588	11	9	4	\N	\N	\N	\N
7589	11	9	5	\N	\N	\N	\N
7590	11	9	6	\N	\N	\N	\N
7591	11	9	7	\N	\N	\N	\N
7592	11	9	8	\N	\N	\N	\N
7593	11	9	9	\N	\N	\N	\N
7594	11	9	10	\N	\N	\N	\N
7595	11	9	11	\N	\N	\N	\N
7596	11	9	12	\N	\N	\N	\N
7597	11	9	13	\N	\N	\N	\N
7598	11	9	14	\N	\N	\N	\N
7599	11	9	15	\N	\N	\N	\N
7600	11	9	16	\N	\N	\N	\N
7601	11	9	17	\N	\N	\N	\N
7602	11	9	18	\N	\N	\N	\N
7603	11	9	19	\N	\N	\N	\N
7604	11	9	20	\N	\N	\N	\N
7605	11	9	21	\N	\N	\N	\N
7606	11	9	22	\N	\N	\N	\N
7607	11	9	23	\N	\N	\N	\N
7608	11	9	24	\N	\N	\N	\N
7609	11	9	25	\N	\N	\N	\N
7610	11	9	26	\N	\N	\N	\N
7611	11	9	27	\N	\N	\N	\N
7612	11	9	28	\N	\N	\N	\N
7613	11	9	29	\N	\N	\N	\N
7614	11	9	30	\N	\N	\N	\N
7615	11	9	31	\N	\N	\N	\N
7616	11	9	32	\N	\N	\N	\N
7617	11	9	33	\N	\N	\N	\N
7618	11	9	34	\N	\N	\N	\N
7619	11	9	35	\N	\N	\N	\N
7620	11	9	36	\N	\N	\N	\N
7621	11	9	37	\N	\N	\N	\N
7622	11	9	38	\N	\N	\N	\N
7623	11	9	39	\N	\N	\N	\N
7624	11	9	40	\N	\N	\N	\N
7625	11	9	41	\N	\N	\N	\N
7626	11	9	42	\N	\N	\N	\N
7627	11	9	43	\N	\N	\N	\N
7628	11	9	44	\N	\N	\N	\N
7629	11	9	45	\N	\N	\N	\N
7630	11	9	46	\N	\N	\N	\N
7631	11	9	47	\N	\N	\N	\N
7632	11	9	48	\N	\N	\N	\N
7633	11	10	1	\N	\N	\N	\N
7634	11	10	2	\N	\N	\N	\N
7635	11	10	3	\N	\N	\N	\N
7636	11	10	4	\N	\N	\N	\N
7637	11	10	5	\N	\N	\N	\N
7638	11	10	6	\N	\N	\N	\N
7639	11	10	7	\N	\N	\N	\N
7640	11	10	8	\N	\N	\N	\N
7641	11	10	9	\N	\N	\N	\N
7642	11	10	10	\N	\N	\N	\N
7643	11	10	11	\N	\N	\N	\N
7644	11	10	12	\N	\N	\N	\N
7645	11	10	13	\N	\N	\N	\N
7646	11	10	14	\N	\N	\N	\N
7647	11	10	15	\N	\N	\N	\N
7648	11	10	16	\N	\N	\N	\N
7649	11	10	17	\N	\N	\N	\N
7650	11	10	18	\N	\N	\N	\N
7651	11	10	19	\N	\N	\N	\N
7652	11	10	20	\N	\N	\N	\N
7653	11	10	21	\N	\N	\N	\N
7654	11	10	22	\N	\N	\N	\N
7655	11	10	23	\N	\N	\N	\N
7656	11	10	24	\N	\N	\N	\N
7657	11	10	25	\N	\N	\N	\N
7658	11	10	26	\N	\N	\N	\N
7659	11	10	27	\N	\N	\N	\N
7660	11	10	28	\N	\N	\N	\N
7661	11	10	29	\N	\N	\N	\N
7662	11	10	30	\N	\N	\N	\N
7663	11	10	31	\N	\N	\N	\N
7664	11	10	32	\N	\N	\N	\N
7665	11	10	33	\N	\N	\N	\N
7666	11	10	34	\N	\N	\N	\N
7667	11	10	35	\N	\N	\N	\N
7668	11	10	36	\N	\N	\N	\N
7669	11	10	37	\N	\N	\N	\N
7670	11	10	38	\N	\N	\N	\N
7671	11	10	39	\N	\N	\N	\N
7672	11	10	40	\N	\N	\N	\N
7673	11	10	41	\N	\N	\N	\N
7674	11	10	42	\N	\N	\N	\N
7675	11	10	43	\N	\N	\N	\N
7676	11	10	44	\N	\N	\N	\N
7677	11	10	45	\N	\N	\N	\N
7678	11	10	46	\N	\N	\N	\N
7679	11	10	47	\N	\N	\N	\N
7680	11	10	48	\N	\N	\N	\N
7681	11	11	1	\N	\N	\N	\N
7682	11	11	2	\N	\N	\N	\N
7683	11	11	3	\N	\N	\N	\N
7684	11	11	4	\N	\N	\N	\N
7685	11	11	5	\N	\N	\N	\N
7686	11	11	6	\N	\N	\N	\N
7687	11	11	7	\N	\N	\N	\N
7688	11	11	8	\N	\N	\N	\N
7689	11	11	9	\N	\N	\N	\N
7690	11	11	10	\N	\N	\N	\N
7691	11	11	11	\N	\N	\N	\N
7692	11	11	12	\N	\N	\N	\N
7693	11	11	13	\N	\N	\N	\N
7694	11	11	14	\N	\N	\N	\N
7695	11	11	15	\N	\N	\N	\N
7696	11	11	16	\N	\N	\N	\N
7697	11	11	17	\N	\N	\N	\N
7698	11	11	18	\N	\N	\N	\N
7699	11	11	19	\N	\N	\N	\N
7700	11	11	20	\N	\N	\N	\N
7701	11	11	21	\N	\N	\N	\N
7702	11	11	22	\N	\N	\N	\N
7703	11	11	23	\N	\N	\N	\N
7704	11	11	24	\N	\N	\N	\N
7705	11	11	25	\N	\N	\N	\N
7706	11	11	26	\N	\N	\N	\N
7707	11	11	27	\N	\N	\N	\N
7708	11	11	28	\N	\N	\N	\N
7709	11	11	29	\N	\N	\N	\N
7710	11	11	30	\N	\N	\N	\N
7711	11	11	31	\N	\N	\N	\N
7712	11	11	32	\N	\N	\N	\N
7713	11	11	33	\N	\N	\N	\N
7714	11	11	34	\N	\N	\N	\N
7715	11	11	35	\N	\N	\N	\N
7716	11	11	36	\N	\N	\N	\N
7717	11	11	37	\N	\N	\N	\N
7718	11	11	38	\N	\N	\N	\N
7719	11	11	39	\N	\N	\N	\N
7720	11	11	40	\N	\N	\N	\N
7721	11	11	41	\N	\N	\N	\N
7722	11	11	42	\N	\N	\N	\N
7723	11	11	43	\N	\N	\N	\N
7724	11	11	44	\N	\N	\N	\N
7725	11	11	45	\N	\N	\N	\N
7726	11	11	46	\N	\N	\N	\N
7727	11	11	47	\N	\N	\N	\N
7728	11	11	48	\N	\N	\N	\N
7729	11	12	1	\N	\N	\N	\N
7730	11	12	2	\N	\N	\N	\N
7731	11	12	3	\N	\N	\N	\N
7732	11	12	4	\N	\N	\N	\N
7733	11	12	5	\N	\N	\N	\N
7734	11	12	6	\N	\N	\N	\N
7735	11	12	7	\N	\N	\N	\N
7736	11	12	8	\N	\N	\N	\N
7737	11	12	9	\N	\N	\N	\N
7738	11	12	10	\N	\N	\N	\N
7739	11	12	11	\N	\N	\N	\N
7740	11	12	12	\N	\N	\N	\N
7741	11	12	13	\N	\N	\N	\N
7742	11	12	14	\N	\N	\N	\N
7743	11	12	15	\N	\N	\N	\N
7744	11	12	16	\N	\N	\N	\N
7745	11	12	17	\N	\N	\N	\N
7746	11	12	18	\N	\N	\N	\N
7747	11	12	19	\N	\N	\N	\N
7748	11	12	20	\N	\N	\N	\N
7749	11	12	21	\N	\N	\N	\N
7750	11	12	22	\N	\N	\N	\N
7751	11	12	23	\N	\N	\N	\N
7752	11	12	24	\N	\N	\N	\N
7753	11	12	25	\N	\N	\N	\N
7754	11	12	26	\N	\N	\N	\N
7755	11	12	27	\N	\N	\N	\N
7756	11	12	28	\N	\N	\N	\N
7757	11	12	29	\N	\N	\N	\N
7758	11	12	30	\N	\N	\N	\N
7759	11	12	31	\N	\N	\N	\N
7760	11	12	32	\N	\N	\N	\N
7761	11	12	33	\N	\N	\N	\N
7762	11	12	34	\N	\N	\N	\N
7763	11	12	35	\N	\N	\N	\N
7764	11	12	36	\N	\N	\N	\N
7765	11	12	37	\N	\N	\N	\N
7766	11	12	38	\N	\N	\N	\N
7767	11	12	39	\N	\N	\N	\N
7768	11	12	40	\N	\N	\N	\N
7769	11	12	41	\N	\N	\N	\N
7770	11	12	42	\N	\N	\N	\N
7771	11	12	43	\N	\N	\N	\N
7772	11	12	44	\N	\N	\N	\N
7773	11	12	45	\N	\N	\N	\N
7774	11	12	46	\N	\N	\N	\N
7775	11	12	47	\N	\N	\N	\N
7776	11	12	48	\N	\N	\N	\N
7777	11	13	1	\N	\N	\N	\N
7778	11	13	2	\N	\N	\N	\N
7779	11	13	3	\N	\N	\N	\N
7780	11	13	4	\N	\N	\N	\N
7781	11	13	5	\N	\N	\N	\N
7782	11	13	6	\N	\N	\N	\N
7783	11	13	7	\N	\N	\N	\N
7784	11	13	8	\N	\N	\N	\N
7785	11	13	9	\N	\N	\N	\N
7786	11	13	10	\N	\N	\N	\N
7787	11	13	11	\N	\N	\N	\N
7788	11	13	12	\N	\N	\N	\N
7789	11	13	13	\N	\N	\N	\N
7790	11	13	14	\N	\N	\N	\N
7791	11	13	15	\N	\N	\N	\N
7792	11	13	16	\N	\N	\N	\N
7793	11	13	17	\N	\N	\N	\N
7794	11	13	18	\N	\N	\N	\N
7795	11	13	19	\N	\N	\N	\N
7796	11	13	20	\N	\N	\N	\N
7797	11	13	21	\N	\N	\N	\N
7798	11	13	22	\N	\N	\N	\N
7799	11	13	23	\N	\N	\N	\N
7800	11	13	24	\N	\N	\N	\N
7801	11	13	25	\N	\N	\N	\N
7802	11	13	26	\N	\N	\N	\N
7803	11	13	27	\N	\N	\N	\N
7804	11	13	28	\N	\N	\N	\N
7805	11	13	29	\N	\N	\N	\N
7806	11	13	30	\N	\N	\N	\N
7807	11	13	31	\N	\N	\N	\N
7808	11	13	32	\N	\N	\N	\N
7809	11	13	33	\N	\N	\N	\N
7810	11	13	34	\N	\N	\N	\N
7811	11	13	35	\N	\N	\N	\N
7812	11	13	36	\N	\N	\N	\N
7813	11	13	37	\N	\N	\N	\N
7814	11	13	38	\N	\N	\N	\N
7815	11	13	39	\N	\N	\N	\N
7816	11	13	40	\N	\N	\N	\N
7817	11	13	41	\N	\N	\N	\N
7818	11	13	42	\N	\N	\N	\N
7819	11	13	43	\N	\N	\N	\N
7820	11	13	44	\N	\N	\N	\N
7821	11	13	45	\N	\N	\N	\N
7822	11	13	46	\N	\N	\N	\N
7823	11	13	47	\N	\N	\N	\N
7824	11	13	48	\N	\N	\N	\N
7825	11	14	1	\N	\N	\N	\N
7826	11	14	2	\N	\N	\N	\N
7827	11	14	3	\N	\N	\N	\N
7828	11	14	4	\N	\N	\N	\N
7829	11	14	5	\N	\N	\N	\N
7830	11	14	6	\N	\N	\N	\N
7831	11	14	7	\N	\N	\N	\N
7832	11	14	8	\N	\N	\N	\N
7833	11	14	9	\N	\N	\N	\N
7834	11	14	10	\N	\N	\N	\N
7835	11	14	11	\N	\N	\N	\N
7836	11	14	12	\N	\N	\N	\N
7837	11	14	13	\N	\N	\N	\N
7838	11	14	14	\N	\N	\N	\N
7839	11	14	15	\N	\N	\N	\N
7840	11	14	16	\N	\N	\N	\N
7841	11	14	17	\N	\N	\N	\N
7842	11	14	18	\N	\N	\N	\N
7843	11	14	19	\N	\N	\N	\N
7844	11	14	20	\N	\N	\N	\N
7845	11	14	21	\N	\N	\N	\N
7846	11	14	22	\N	\N	\N	\N
7847	11	14	23	\N	\N	\N	\N
7848	11	14	24	\N	\N	\N	\N
7849	11	14	25	\N	\N	\N	\N
7850	11	14	26	\N	\N	\N	\N
7851	11	14	27	\N	\N	\N	\N
7852	11	14	28	\N	\N	\N	\N
7853	11	14	29	\N	\N	\N	\N
7854	11	14	30	\N	\N	\N	\N
7855	11	14	31	\N	\N	\N	\N
7856	11	14	32	\N	\N	\N	\N
7857	11	14	33	\N	\N	\N	\N
7858	11	14	34	\N	\N	\N	\N
7859	11	14	35	\N	\N	\N	\N
7860	11	14	36	\N	\N	\N	\N
7861	11	14	37	\N	\N	\N	\N
7862	11	14	38	\N	\N	\N	\N
7863	11	14	39	\N	\N	\N	\N
7864	11	14	40	\N	\N	\N	\N
7865	11	14	41	\N	\N	\N	\N
7866	11	14	42	\N	\N	\N	\N
7867	11	14	43	\N	\N	\N	\N
7868	11	14	44	\N	\N	\N	\N
7869	11	14	45	\N	\N	\N	\N
7870	11	14	46	\N	\N	\N	\N
7871	11	14	47	\N	\N	\N	\N
7872	11	14	48	\N	\N	\N	\N
7873	11	15	1	\N	\N	\N	\N
7874	11	15	2	\N	\N	\N	\N
7875	11	15	3	\N	\N	\N	\N
7876	11	15	4	\N	\N	\N	\N
7877	11	15	5	\N	\N	\N	\N
7878	11	15	6	\N	\N	\N	\N
7879	11	15	7	\N	\N	\N	\N
7880	11	15	8	\N	\N	\N	\N
7881	11	15	9	\N	\N	\N	\N
7882	11	15	10	\N	\N	\N	\N
7883	11	15	11	\N	\N	\N	\N
7884	11	15	12	\N	\N	\N	\N
7885	11	15	13	\N	\N	\N	\N
7886	11	15	14	\N	\N	\N	\N
7887	11	15	15	\N	\N	\N	\N
7888	11	15	16	\N	\N	\N	\N
7889	11	15	17	\N	\N	\N	\N
7890	11	15	18	\N	\N	\N	\N
7891	11	15	19	\N	\N	\N	\N
7892	11	15	20	\N	\N	\N	\N
7893	11	15	21	\N	\N	\N	\N
7894	11	15	22	\N	\N	\N	\N
7895	11	15	23	\N	\N	\N	\N
7896	11	15	24	\N	\N	\N	\N
7897	11	15	25	\N	\N	\N	\N
7898	11	15	26	\N	\N	\N	\N
7899	11	15	27	\N	\N	\N	\N
7900	11	15	28	\N	\N	\N	\N
7901	11	15	29	\N	\N	\N	\N
7902	11	15	30	\N	\N	\N	\N
7903	11	15	31	\N	\N	\N	\N
7904	11	15	32	\N	\N	\N	\N
7905	11	15	33	\N	\N	\N	\N
7906	11	15	34	\N	\N	\N	\N
7907	11	15	35	\N	\N	\N	\N
7908	11	15	36	\N	\N	\N	\N
7909	11	15	37	\N	\N	\N	\N
7910	11	15	38	\N	\N	\N	\N
7911	11	15	39	\N	\N	\N	\N
7912	11	15	40	\N	\N	\N	\N
7913	11	15	41	\N	\N	\N	\N
7914	11	15	42	\N	\N	\N	\N
7915	11	15	43	\N	\N	\N	\N
7916	11	15	44	\N	\N	\N	\N
7917	11	15	45	\N	\N	\N	\N
7918	11	15	46	\N	\N	\N	\N
7919	11	15	47	\N	\N	\N	\N
7920	11	15	48	\N	\N	\N	\N
7921	12	1	1	\N	\N	\N	\N
7922	12	1	2	\N	\N	\N	\N
7923	12	1	3	\N	\N	\N	\N
7924	12	1	4	\N	\N	\N	\N
7925	12	1	5	\N	\N	\N	\N
7926	12	1	6	\N	\N	\N	\N
7927	12	1	7	\N	\N	\N	\N
7928	12	1	8	\N	\N	\N	\N
7929	12	1	9	\N	\N	\N	\N
7930	12	1	10	\N	\N	\N	\N
7931	12	1	11	\N	\N	\N	\N
7932	12	1	12	\N	\N	\N	\N
7933	12	1	13	\N	\N	\N	\N
7934	12	1	14	\N	\N	\N	\N
7935	12	1	15	\N	\N	\N	\N
7936	12	1	16	\N	\N	\N	\N
7937	12	1	17	\N	\N	\N	\N
7938	12	1	18	\N	\N	\N	\N
7939	12	1	19	\N	\N	\N	\N
7940	12	1	20	\N	\N	\N	\N
7941	12	1	21	\N	\N	\N	\N
7942	12	1	22	\N	\N	\N	\N
7943	12	1	23	\N	\N	\N	\N
7944	12	1	24	\N	\N	\N	\N
7945	12	1	25	\N	\N	\N	\N
7946	12	1	26	\N	\N	\N	\N
7947	12	1	27	\N	\N	\N	\N
7948	12	1	28	\N	\N	\N	\N
7949	12	1	29	\N	\N	\N	\N
7950	12	1	30	\N	\N	\N	\N
7951	12	1	31	\N	\N	\N	\N
7952	12	1	32	\N	\N	\N	\N
7953	12	1	33	\N	\N	\N	\N
7954	12	1	34	\N	\N	\N	\N
7955	12	1	35	\N	\N	\N	\N
7956	12	1	36	\N	\N	\N	\N
7957	12	1	37	\N	\N	\N	\N
7958	12	1	38	\N	\N	\N	\N
7959	12	1	39	\N	\N	\N	\N
7960	12	1	40	\N	\N	\N	\N
7961	12	1	41	\N	\N	\N	\N
7962	12	1	42	\N	\N	\N	\N
7963	12	1	43	\N	\N	\N	\N
7964	12	1	44	\N	\N	\N	\N
7965	12	1	45	\N	\N	\N	\N
7966	12	1	46	\N	\N	\N	\N
7967	12	1	47	\N	\N	\N	\N
7968	12	1	48	\N	\N	\N	\N
7969	12	2	1	\N	\N	\N	\N
7970	12	2	2	\N	\N	\N	\N
7971	12	2	3	\N	\N	\N	\N
7972	12	2	4	\N	\N	\N	\N
7973	12	2	5	\N	\N	\N	\N
7974	12	2	6	\N	\N	\N	\N
7975	12	2	7	\N	\N	\N	\N
7976	12	2	8	\N	\N	\N	\N
7977	12	2	9	\N	\N	\N	\N
7978	12	2	10	\N	\N	\N	\N
7979	12	2	11	\N	\N	\N	\N
7980	12	2	12	\N	\N	\N	\N
7981	12	2	13	\N	\N	\N	\N
7982	12	2	14	\N	\N	\N	\N
7983	12	2	15	\N	\N	\N	\N
7984	12	2	16	\N	\N	\N	\N
7985	12	2	17	\N	\N	\N	\N
7986	12	2	18	\N	\N	\N	\N
7987	12	2	19	\N	\N	\N	\N
7988	12	2	20	\N	\N	\N	\N
7989	12	2	21	\N	\N	\N	\N
7990	12	2	22	\N	\N	\N	\N
7991	12	2	23	\N	\N	\N	\N
7992	12	2	24	\N	\N	\N	\N
7993	12	2	25	\N	\N	\N	\N
7994	12	2	26	\N	\N	\N	\N
7995	12	2	27	\N	\N	\N	\N
7996	12	2	28	\N	\N	\N	\N
7997	12	2	29	\N	\N	\N	\N
7998	12	2	30	\N	\N	\N	\N
7999	12	2	31	\N	\N	\N	\N
8000	12	2	32	\N	\N	\N	\N
8001	12	2	33	\N	\N	\N	\N
8002	12	2	34	\N	\N	\N	\N
8003	12	2	35	\N	\N	\N	\N
8004	12	2	36	\N	\N	\N	\N
8005	12	2	37	\N	\N	\N	\N
8006	12	2	38	\N	\N	\N	\N
8007	12	2	39	\N	\N	\N	\N
8008	12	2	40	\N	\N	\N	\N
8009	12	2	41	\N	\N	\N	\N
8010	12	2	42	\N	\N	\N	\N
8011	12	2	43	\N	\N	\N	\N
8012	12	2	44	\N	\N	\N	\N
8013	12	2	45	\N	\N	\N	\N
8014	12	2	46	\N	\N	\N	\N
8015	12	2	47	\N	\N	\N	\N
8016	12	2	48	\N	\N	\N	\N
8017	12	3	1	\N	\N	\N	\N
8018	12	3	2	\N	\N	\N	\N
8019	12	3	3	\N	\N	\N	\N
8020	12	3	4	\N	\N	\N	\N
8021	12	3	5	\N	\N	\N	\N
8022	12	3	6	\N	\N	\N	\N
8023	12	3	7	\N	\N	\N	\N
8024	12	3	8	\N	\N	\N	\N
8025	12	3	9	\N	\N	\N	\N
8026	12	3	10	\N	\N	\N	\N
8027	12	3	11	\N	\N	\N	\N
8028	12	3	12	\N	\N	\N	\N
8029	12	3	13	\N	\N	\N	\N
8030	12	3	14	\N	\N	\N	\N
8031	12	3	15	\N	\N	\N	\N
8032	12	3	16	\N	\N	\N	\N
8033	12	3	17	\N	\N	\N	\N
8034	12	3	18	\N	\N	\N	\N
8035	12	3	19	\N	\N	\N	\N
8036	12	3	20	\N	\N	\N	\N
8037	12	3	21	\N	\N	\N	\N
8038	12	3	22	\N	\N	\N	\N
8039	12	3	23	\N	\N	\N	\N
8040	12	3	24	\N	\N	\N	\N
8041	12	3	25	\N	\N	\N	\N
8042	12	3	26	\N	\N	\N	\N
8043	12	3	27	\N	\N	\N	\N
8044	12	3	28	\N	\N	\N	\N
8045	12	3	29	\N	\N	\N	\N
8046	12	3	30	\N	\N	\N	\N
8047	12	3	31	\N	\N	\N	\N
8048	12	3	32	\N	\N	\N	\N
8049	12	3	33	\N	\N	\N	\N
8050	12	3	34	\N	\N	\N	\N
8051	12	3	35	\N	\N	\N	\N
8052	12	3	36	\N	\N	\N	\N
8053	12	3	37	\N	\N	\N	\N
8054	12	3	38	\N	\N	\N	\N
8055	12	3	39	\N	\N	\N	\N
8056	12	3	40	\N	\N	\N	\N
8057	12	3	41	\N	\N	\N	\N
8058	12	3	42	\N	\N	\N	\N
8059	12	3	43	\N	\N	\N	\N
8060	12	3	44	\N	\N	\N	\N
8061	12	3	45	\N	\N	\N	\N
8062	12	3	46	\N	\N	\N	\N
8063	12	3	47	\N	\N	\N	\N
8064	12	3	48	\N	\N	\N	\N
8065	12	4	1	\N	\N	\N	\N
8066	12	4	2	\N	\N	\N	\N
8067	12	4	3	\N	\N	\N	\N
8068	12	4	4	\N	\N	\N	\N
8069	12	4	5	\N	\N	\N	\N
8070	12	4	6	\N	\N	\N	\N
8071	12	4	7	\N	\N	\N	\N
8072	12	4	8	\N	\N	\N	\N
8073	12	4	9	\N	\N	\N	\N
8074	12	4	10	\N	\N	\N	\N
8075	12	4	11	\N	\N	\N	\N
8076	12	4	12	\N	\N	\N	\N
8077	12	4	13	\N	\N	\N	\N
8078	12	4	14	\N	\N	\N	\N
8079	12	4	15	\N	\N	\N	\N
8080	12	4	16	\N	\N	\N	\N
8081	12	4	17	\N	\N	\N	\N
8082	12	4	18	\N	\N	\N	\N
8083	12	4	19	\N	\N	\N	\N
8084	12	4	20	\N	\N	\N	\N
8085	12	4	21	\N	\N	\N	\N
8086	12	4	22	\N	\N	\N	\N
8087	12	4	23	\N	\N	\N	\N
8088	12	4	24	\N	\N	\N	\N
8089	12	4	25	\N	\N	\N	\N
8090	12	4	26	\N	\N	\N	\N
8091	12	4	27	\N	\N	\N	\N
8092	12	4	28	\N	\N	\N	\N
8093	12	4	29	\N	\N	\N	\N
8094	12	4	30	\N	\N	\N	\N
8095	12	4	31	\N	\N	\N	\N
8096	12	4	32	\N	\N	\N	\N
8097	12	4	33	\N	\N	\N	\N
8098	12	4	34	\N	\N	\N	\N
8099	12	4	35	\N	\N	\N	\N
8100	12	4	36	\N	\N	\N	\N
8101	12	4	37	\N	\N	\N	\N
8102	12	4	38	\N	\N	\N	\N
8103	12	4	39	\N	\N	\N	\N
8104	12	4	40	\N	\N	\N	\N
8105	12	4	41	\N	\N	\N	\N
8106	12	4	42	\N	\N	\N	\N
8107	12	4	43	\N	\N	\N	\N
8108	12	4	44	\N	\N	\N	\N
8109	12	4	45	\N	\N	\N	\N
8110	12	4	46	\N	\N	\N	\N
8111	12	4	47	\N	\N	\N	\N
8112	12	4	48	\N	\N	\N	\N
8113	12	5	1	\N	\N	\N	\N
8114	12	5	2	\N	\N	\N	\N
8115	12	5	3	\N	\N	\N	\N
8116	12	5	4	\N	\N	\N	\N
8117	12	5	5	\N	\N	\N	\N
8118	12	5	6	\N	\N	\N	\N
8119	12	5	7	\N	\N	\N	\N
8120	12	5	8	\N	\N	\N	\N
8121	12	5	9	\N	\N	\N	\N
8122	12	5	10	\N	\N	\N	\N
8123	12	5	11	\N	\N	\N	\N
8124	12	5	12	\N	\N	\N	\N
8125	12	5	13	\N	\N	\N	\N
8126	12	5	14	\N	\N	\N	\N
8127	12	5	15	\N	\N	\N	\N
8128	12	5	16	\N	\N	\N	\N
8129	12	5	17	\N	\N	\N	\N
8130	12	5	18	\N	\N	\N	\N
8131	12	5	19	\N	\N	\N	\N
8132	12	5	20	\N	\N	\N	\N
8133	12	5	21	\N	\N	\N	\N
8134	12	5	22	\N	\N	\N	\N
8135	12	5	23	\N	\N	\N	\N
8136	12	5	24	\N	\N	\N	\N
8137	12	5	25	\N	\N	\N	\N
8138	12	5	26	\N	\N	\N	\N
8139	12	5	27	\N	\N	\N	\N
8140	12	5	28	\N	\N	\N	\N
8141	12	5	29	\N	\N	\N	\N
8142	12	5	30	\N	\N	\N	\N
8143	12	5	31	\N	\N	\N	\N
8144	12	5	32	\N	\N	\N	\N
8145	12	5	33	\N	\N	\N	\N
8146	12	5	34	\N	\N	\N	\N
8147	12	5	35	\N	\N	\N	\N
8148	12	5	36	\N	\N	\N	\N
8149	12	5	37	\N	\N	\N	\N
8150	12	5	38	\N	\N	\N	\N
8151	12	5	39	\N	\N	\N	\N
8152	12	5	40	\N	\N	\N	\N
8153	12	5	41	\N	\N	\N	\N
8154	12	5	42	\N	\N	\N	\N
8155	12	5	43	\N	\N	\N	\N
8156	12	5	44	\N	\N	\N	\N
8157	12	5	45	\N	\N	\N	\N
8158	12	5	46	\N	\N	\N	\N
8159	12	5	47	\N	\N	\N	\N
8160	12	5	48	\N	\N	\N	\N
8161	12	6	1	\N	\N	\N	\N
8162	12	6	2	\N	\N	\N	\N
8163	12	6	3	\N	\N	\N	\N
8164	12	6	4	\N	\N	\N	\N
8165	12	6	5	\N	\N	\N	\N
8166	12	6	6	\N	\N	\N	\N
8167	12	6	7	\N	\N	\N	\N
8168	12	6	8	\N	\N	\N	\N
8169	12	6	9	\N	\N	\N	\N
8170	12	6	10	\N	\N	\N	\N
8171	12	6	11	\N	\N	\N	\N
8172	12	6	12	\N	\N	\N	\N
8173	12	6	13	\N	\N	\N	\N
8174	12	6	14	\N	\N	\N	\N
8175	12	6	15	\N	\N	\N	\N
8176	12	6	16	\N	\N	\N	\N
8177	12	6	17	\N	\N	\N	\N
8178	12	6	18	\N	\N	\N	\N
8179	12	6	19	\N	\N	\N	\N
8180	12	6	20	\N	\N	\N	\N
8181	12	6	21	\N	\N	\N	\N
8182	12	6	22	\N	\N	\N	\N
8183	12	6	23	\N	\N	\N	\N
8184	12	6	24	\N	\N	\N	\N
8185	12	6	25	\N	\N	\N	\N
8186	12	6	26	\N	\N	\N	\N
8187	12	6	27	\N	\N	\N	\N
8188	12	6	28	\N	\N	\N	\N
8189	12	6	29	\N	\N	\N	\N
8190	12	6	30	\N	\N	\N	\N
8191	12	6	31	\N	\N	\N	\N
8192	12	6	32	\N	\N	\N	\N
8193	12	6	33	\N	\N	\N	\N
8194	12	6	34	\N	\N	\N	\N
8195	12	6	35	\N	\N	\N	\N
8196	12	6	36	\N	\N	\N	\N
8197	12	6	37	\N	\N	\N	\N
8198	12	6	38	\N	\N	\N	\N
8199	12	6	39	\N	\N	\N	\N
8200	12	6	40	\N	\N	\N	\N
8201	12	6	41	\N	\N	\N	\N
8202	12	6	42	\N	\N	\N	\N
8203	12	6	43	\N	\N	\N	\N
8204	12	6	44	\N	\N	\N	\N
8205	12	6	45	\N	\N	\N	\N
8206	12	6	46	\N	\N	\N	\N
8207	12	6	47	\N	\N	\N	\N
8208	12	6	48	\N	\N	\N	\N
8209	12	7	1	\N	\N	\N	\N
8210	12	7	2	\N	\N	\N	\N
8211	12	7	3	\N	\N	\N	\N
8212	12	7	4	\N	\N	\N	\N
8213	12	7	5	\N	\N	\N	\N
8214	12	7	6	\N	\N	\N	\N
8215	12	7	7	\N	\N	\N	\N
8216	12	7	8	\N	\N	\N	\N
8217	12	7	9	\N	\N	\N	\N
8218	12	7	10	\N	\N	\N	\N
8219	12	7	11	\N	\N	\N	\N
8220	12	7	12	\N	\N	\N	\N
8221	12	7	13	\N	\N	\N	\N
8222	12	7	14	\N	\N	\N	\N
8223	12	7	15	\N	\N	\N	\N
8224	12	7	16	\N	\N	\N	\N
8225	12	7	17	\N	\N	\N	\N
8226	12	7	18	\N	\N	\N	\N
8227	12	7	19	\N	\N	\N	\N
8228	12	7	20	\N	\N	\N	\N
8229	12	7	21	\N	\N	\N	\N
8230	12	7	22	\N	\N	\N	\N
8231	12	7	23	\N	\N	\N	\N
8232	12	7	24	\N	\N	\N	\N
8233	12	7	25	\N	\N	\N	\N
8234	12	7	26	\N	\N	\N	\N
8235	12	7	27	\N	\N	\N	\N
8236	12	7	28	\N	\N	\N	\N
8237	12	7	29	\N	\N	\N	\N
8238	12	7	30	\N	\N	\N	\N
8239	12	7	31	\N	\N	\N	\N
8240	12	7	32	\N	\N	\N	\N
8241	12	7	33	\N	\N	\N	\N
8242	12	7	34	\N	\N	\N	\N
8243	12	7	35	\N	\N	\N	\N
8244	12	7	36	\N	\N	\N	\N
8245	12	7	37	\N	\N	\N	\N
8246	12	7	38	\N	\N	\N	\N
8247	12	7	39	\N	\N	\N	\N
8248	12	7	40	\N	\N	\N	\N
8249	12	7	41	\N	\N	\N	\N
8250	12	7	42	\N	\N	\N	\N
8251	12	7	43	\N	\N	\N	\N
8252	12	7	44	\N	\N	\N	\N
8253	12	7	45	\N	\N	\N	\N
8254	12	7	46	\N	\N	\N	\N
8255	12	7	47	\N	\N	\N	\N
8256	12	7	48	\N	\N	\N	\N
8257	12	8	1	\N	\N	\N	\N
8258	12	8	2	\N	\N	\N	\N
8259	12	8	3	\N	\N	\N	\N
8260	12	8	4	\N	\N	\N	\N
8261	12	8	5	\N	\N	\N	\N
8262	12	8	6	\N	\N	\N	\N
8263	12	8	7	\N	\N	\N	\N
8264	12	8	8	\N	\N	\N	\N
8265	12	8	9	\N	\N	\N	\N
8266	12	8	10	\N	\N	\N	\N
8267	12	8	11	\N	\N	\N	\N
8268	12	8	12	\N	\N	\N	\N
8269	12	8	13	\N	\N	\N	\N
8270	12	8	14	\N	\N	\N	\N
8271	12	8	15	\N	\N	\N	\N
8272	12	8	16	\N	\N	\N	\N
8273	12	8	17	\N	\N	\N	\N
8274	12	8	18	\N	\N	\N	\N
8275	12	8	19	\N	\N	\N	\N
8276	12	8	20	\N	\N	\N	\N
8277	12	8	21	\N	\N	\N	\N
8278	12	8	22	\N	\N	\N	\N
8279	12	8	23	\N	\N	\N	\N
8280	12	8	24	\N	\N	\N	\N
8281	12	8	25	\N	\N	\N	\N
8282	12	8	26	\N	\N	\N	\N
8283	12	8	27	\N	\N	\N	\N
8284	12	8	28	\N	\N	\N	\N
8285	12	8	29	\N	\N	\N	\N
8286	12	8	30	\N	\N	\N	\N
8287	12	8	31	\N	\N	\N	\N
8288	12	8	32	\N	\N	\N	\N
8289	12	8	33	\N	\N	\N	\N
8290	12	8	34	\N	\N	\N	\N
8291	12	8	35	\N	\N	\N	\N
8292	12	8	36	\N	\N	\N	\N
8293	12	8	37	\N	\N	\N	\N
8294	12	8	38	\N	\N	\N	\N
8295	12	8	39	\N	\N	\N	\N
8296	12	8	40	\N	\N	\N	\N
8297	12	8	41	\N	\N	\N	\N
8298	12	8	42	\N	\N	\N	\N
8299	12	8	43	\N	\N	\N	\N
8300	12	8	44	\N	\N	\N	\N
8301	12	8	45	\N	\N	\N	\N
8302	12	8	46	\N	\N	\N	\N
8303	12	8	47	\N	\N	\N	\N
8304	12	8	48	\N	\N	\N	\N
8305	12	9	1	\N	\N	\N	\N
8306	12	9	2	\N	\N	\N	\N
8307	12	9	3	\N	\N	\N	\N
8308	12	9	4	\N	\N	\N	\N
8309	12	9	5	\N	\N	\N	\N
8310	12	9	6	\N	\N	\N	\N
8311	12	9	7	\N	\N	\N	\N
8312	12	9	8	\N	\N	\N	\N
8313	12	9	9	\N	\N	\N	\N
8314	12	9	10	\N	\N	\N	\N
8315	12	9	11	\N	\N	\N	\N
8316	12	9	12	\N	\N	\N	\N
8317	12	9	13	\N	\N	\N	\N
8318	12	9	14	\N	\N	\N	\N
8319	12	9	15	\N	\N	\N	\N
8320	12	9	16	\N	\N	\N	\N
8321	12	9	17	\N	\N	\N	\N
8322	12	9	18	\N	\N	\N	\N
8323	12	9	19	\N	\N	\N	\N
8324	12	9	20	\N	\N	\N	\N
8325	12	9	21	\N	\N	\N	\N
8326	12	9	22	\N	\N	\N	\N
8327	12	9	23	\N	\N	\N	\N
8328	12	9	24	\N	\N	\N	\N
8329	12	9	25	\N	\N	\N	\N
8330	12	9	26	\N	\N	\N	\N
8331	12	9	27	\N	\N	\N	\N
8332	12	9	28	\N	\N	\N	\N
8333	12	9	29	\N	\N	\N	\N
8334	12	9	30	\N	\N	\N	\N
8335	12	9	31	\N	\N	\N	\N
8336	12	9	32	\N	\N	\N	\N
8337	12	9	33	\N	\N	\N	\N
8338	12	9	34	\N	\N	\N	\N
8339	12	9	35	\N	\N	\N	\N
8340	12	9	36	\N	\N	\N	\N
8341	12	9	37	\N	\N	\N	\N
8342	12	9	38	\N	\N	\N	\N
8343	12	9	39	\N	\N	\N	\N
8344	12	9	40	\N	\N	\N	\N
8345	12	9	41	\N	\N	\N	\N
8346	12	9	42	\N	\N	\N	\N
8347	12	9	43	\N	\N	\N	\N
8348	12	9	44	\N	\N	\N	\N
8349	12	9	45	\N	\N	\N	\N
8350	12	9	46	\N	\N	\N	\N
8351	12	9	47	\N	\N	\N	\N
8352	12	9	48	\N	\N	\N	\N
8353	12	10	1	\N	\N	\N	\N
8354	12	10	2	\N	\N	\N	\N
8355	12	10	3	\N	\N	\N	\N
8356	12	10	4	\N	\N	\N	\N
8357	12	10	5	\N	\N	\N	\N
8358	12	10	6	\N	\N	\N	\N
8359	12	10	7	\N	\N	\N	\N
8360	12	10	8	\N	\N	\N	\N
8361	12	10	9	\N	\N	\N	\N
8362	12	10	10	\N	\N	\N	\N
8363	12	10	11	\N	\N	\N	\N
8364	12	10	12	\N	\N	\N	\N
8365	12	10	13	\N	\N	\N	\N
8366	12	10	14	\N	\N	\N	\N
8367	12	10	15	\N	\N	\N	\N
8368	12	10	16	\N	\N	\N	\N
8369	12	10	17	\N	\N	\N	\N
8370	12	10	18	\N	\N	\N	\N
8371	12	10	19	\N	\N	\N	\N
8372	12	10	20	\N	\N	\N	\N
8373	12	10	21	\N	\N	\N	\N
8374	12	10	22	\N	\N	\N	\N
8375	12	10	23	\N	\N	\N	\N
8376	12	10	24	\N	\N	\N	\N
8377	12	10	25	\N	\N	\N	\N
8378	12	10	26	\N	\N	\N	\N
8379	12	10	27	\N	\N	\N	\N
8380	12	10	28	\N	\N	\N	\N
8381	12	10	29	\N	\N	\N	\N
8382	12	10	30	\N	\N	\N	\N
8383	12	10	31	\N	\N	\N	\N
8384	12	10	32	\N	\N	\N	\N
8385	12	10	33	\N	\N	\N	\N
8386	12	10	34	\N	\N	\N	\N
8387	12	10	35	\N	\N	\N	\N
8388	12	10	36	\N	\N	\N	\N
8389	12	10	37	\N	\N	\N	\N
8390	12	10	38	\N	\N	\N	\N
8391	12	10	39	\N	\N	\N	\N
8392	12	10	40	\N	\N	\N	\N
8393	12	10	41	\N	\N	\N	\N
8394	12	10	42	\N	\N	\N	\N
8395	12	10	43	\N	\N	\N	\N
8396	12	10	44	\N	\N	\N	\N
8397	12	10	45	\N	\N	\N	\N
8398	12	10	46	\N	\N	\N	\N
8399	12	10	47	\N	\N	\N	\N
8400	12	10	48	\N	\N	\N	\N
8401	12	11	1	\N	\N	\N	\N
8402	12	11	2	\N	\N	\N	\N
8403	12	11	3	\N	\N	\N	\N
8404	12	11	4	\N	\N	\N	\N
8405	12	11	5	\N	\N	\N	\N
8406	12	11	6	\N	\N	\N	\N
8407	12	11	7	\N	\N	\N	\N
8408	12	11	8	\N	\N	\N	\N
8409	12	11	9	\N	\N	\N	\N
8410	12	11	10	\N	\N	\N	\N
8411	12	11	11	\N	\N	\N	\N
8412	12	11	12	\N	\N	\N	\N
8413	12	11	13	\N	\N	\N	\N
8414	12	11	14	\N	\N	\N	\N
8415	12	11	15	\N	\N	\N	\N
8416	12	11	16	\N	\N	\N	\N
8417	12	11	17	\N	\N	\N	\N
8418	12	11	18	\N	\N	\N	\N
8419	12	11	19	\N	\N	\N	\N
8420	12	11	20	\N	\N	\N	\N
8421	12	11	21	\N	\N	\N	\N
8422	12	11	22	\N	\N	\N	\N
8423	12	11	23	\N	\N	\N	\N
8424	12	11	24	\N	\N	\N	\N
8425	12	11	25	\N	\N	\N	\N
8426	12	11	26	\N	\N	\N	\N
8427	12	11	27	\N	\N	\N	\N
8428	12	11	28	\N	\N	\N	\N
8429	12	11	29	\N	\N	\N	\N
8430	12	11	30	\N	\N	\N	\N
8431	12	11	31	\N	\N	\N	\N
8432	12	11	32	\N	\N	\N	\N
8433	12	11	33	\N	\N	\N	\N
8434	12	11	34	\N	\N	\N	\N
8435	12	11	35	\N	\N	\N	\N
8436	12	11	36	\N	\N	\N	\N
8437	12	11	37	\N	\N	\N	\N
8438	12	11	38	\N	\N	\N	\N
8439	12	11	39	\N	\N	\N	\N
8440	12	11	40	\N	\N	\N	\N
8441	12	11	41	\N	\N	\N	\N
8442	12	11	42	\N	\N	\N	\N
8443	12	11	43	\N	\N	\N	\N
8444	12	11	44	\N	\N	\N	\N
8445	12	11	45	\N	\N	\N	\N
8446	12	11	46	\N	\N	\N	\N
8447	12	11	47	\N	\N	\N	\N
8448	12	11	48	\N	\N	\N	\N
8449	12	12	1	\N	\N	\N	\N
8450	12	12	2	\N	\N	\N	\N
8451	12	12	3	\N	\N	\N	\N
8452	12	12	4	\N	\N	\N	\N
8453	12	12	5	\N	\N	\N	\N
8454	12	12	6	\N	\N	\N	\N
8455	12	12	7	\N	\N	\N	\N
8456	12	12	8	\N	\N	\N	\N
8457	12	12	9	\N	\N	\N	\N
8458	12	12	10	\N	\N	\N	\N
8459	12	12	11	\N	\N	\N	\N
8460	12	12	12	\N	\N	\N	\N
8461	12	12	13	\N	\N	\N	\N
8462	12	12	14	\N	\N	\N	\N
8463	12	12	15	\N	\N	\N	\N
8464	12	12	16	\N	\N	\N	\N
8465	12	12	17	\N	\N	\N	\N
8466	12	12	18	\N	\N	\N	\N
8467	12	12	19	\N	\N	\N	\N
8468	12	12	20	\N	\N	\N	\N
8469	12	12	21	\N	\N	\N	\N
8470	12	12	22	\N	\N	\N	\N
8471	12	12	23	\N	\N	\N	\N
8472	12	12	24	\N	\N	\N	\N
8473	12	12	25	\N	\N	\N	\N
8474	12	12	26	\N	\N	\N	\N
8475	12	12	27	\N	\N	\N	\N
8476	12	12	28	\N	\N	\N	\N
8477	12	12	29	\N	\N	\N	\N
8478	12	12	30	\N	\N	\N	\N
8479	12	12	31	\N	\N	\N	\N
8480	12	12	32	\N	\N	\N	\N
8481	12	12	33	\N	\N	\N	\N
8482	12	12	34	\N	\N	\N	\N
8483	12	12	35	\N	\N	\N	\N
8484	12	12	36	\N	\N	\N	\N
8485	12	12	37	\N	\N	\N	\N
8486	12	12	38	\N	\N	\N	\N
8487	12	12	39	\N	\N	\N	\N
8488	12	12	40	\N	\N	\N	\N
8489	12	12	41	\N	\N	\N	\N
8490	12	12	42	\N	\N	\N	\N
8491	12	12	43	\N	\N	\N	\N
8492	12	12	44	\N	\N	\N	\N
8493	12	12	45	\N	\N	\N	\N
8494	12	12	46	\N	\N	\N	\N
8495	12	12	47	\N	\N	\N	\N
8496	12	12	48	\N	\N	\N	\N
8497	12	13	1	\N	\N	\N	\N
8498	12	13	2	\N	\N	\N	\N
8499	12	13	3	\N	\N	\N	\N
8500	12	13	4	\N	\N	\N	\N
8501	12	13	5	\N	\N	\N	\N
8502	12	13	6	\N	\N	\N	\N
8503	12	13	7	\N	\N	\N	\N
8504	12	13	8	\N	\N	\N	\N
8505	12	13	9	\N	\N	\N	\N
8506	12	13	10	\N	\N	\N	\N
8507	12	13	11	\N	\N	\N	\N
8508	12	13	12	\N	\N	\N	\N
8509	12	13	13	\N	\N	\N	\N
8510	12	13	14	\N	\N	\N	\N
8511	12	13	15	\N	\N	\N	\N
8512	12	13	16	\N	\N	\N	\N
8513	12	13	17	\N	\N	\N	\N
8514	12	13	18	\N	\N	\N	\N
8515	12	13	19	\N	\N	\N	\N
8516	12	13	20	\N	\N	\N	\N
8517	12	13	21	\N	\N	\N	\N
8518	12	13	22	\N	\N	\N	\N
8519	12	13	23	\N	\N	\N	\N
8520	12	13	24	\N	\N	\N	\N
8521	12	13	25	\N	\N	\N	\N
8522	12	13	26	\N	\N	\N	\N
8523	12	13	27	\N	\N	\N	\N
8524	12	13	28	\N	\N	\N	\N
8525	12	13	29	\N	\N	\N	\N
8526	12	13	30	\N	\N	\N	\N
8527	12	13	31	\N	\N	\N	\N
8528	12	13	32	\N	\N	\N	\N
8529	12	13	33	\N	\N	\N	\N
8530	12	13	34	\N	\N	\N	\N
8531	12	13	35	\N	\N	\N	\N
8532	12	13	36	\N	\N	\N	\N
8533	12	13	37	\N	\N	\N	\N
8534	12	13	38	\N	\N	\N	\N
8535	12	13	39	\N	\N	\N	\N
8536	12	13	40	\N	\N	\N	\N
8537	12	13	41	\N	\N	\N	\N
8538	12	13	42	\N	\N	\N	\N
8539	12	13	43	\N	\N	\N	\N
8540	12	13	44	\N	\N	\N	\N
8541	12	13	45	\N	\N	\N	\N
8542	12	13	46	\N	\N	\N	\N
8543	12	13	47	\N	\N	\N	\N
8544	12	13	48	\N	\N	\N	\N
8545	12	14	1	\N	\N	\N	\N
8546	12	14	2	\N	\N	\N	\N
8547	12	14	3	\N	\N	\N	\N
8548	12	14	4	\N	\N	\N	\N
8549	12	14	5	\N	\N	\N	\N
8550	12	14	6	\N	\N	\N	\N
8551	12	14	7	\N	\N	\N	\N
8552	12	14	8	\N	\N	\N	\N
8553	12	14	9	\N	\N	\N	\N
8554	12	14	10	\N	\N	\N	\N
8555	12	14	11	\N	\N	\N	\N
8556	12	14	12	\N	\N	\N	\N
8557	12	14	13	\N	\N	\N	\N
8558	12	14	14	\N	\N	\N	\N
8559	12	14	15	\N	\N	\N	\N
8560	12	14	16	\N	\N	\N	\N
8561	12	14	17	\N	\N	\N	\N
8562	12	14	18	\N	\N	\N	\N
8563	12	14	19	\N	\N	\N	\N
8564	12	14	20	\N	\N	\N	\N
8565	12	14	21	\N	\N	\N	\N
8566	12	14	22	\N	\N	\N	\N
8567	12	14	23	\N	\N	\N	\N
8568	12	14	24	\N	\N	\N	\N
8569	12	14	25	\N	\N	\N	\N
8570	12	14	26	\N	\N	\N	\N
8571	12	14	27	\N	\N	\N	\N
8572	12	14	28	\N	\N	\N	\N
8573	12	14	29	\N	\N	\N	\N
8574	12	14	30	\N	\N	\N	\N
8575	12	14	31	\N	\N	\N	\N
8576	12	14	32	\N	\N	\N	\N
8577	12	14	33	\N	\N	\N	\N
8578	12	14	34	\N	\N	\N	\N
8579	12	14	35	\N	\N	\N	\N
8580	12	14	36	\N	\N	\N	\N
8581	12	14	37	\N	\N	\N	\N
8582	12	14	38	\N	\N	\N	\N
8583	12	14	39	\N	\N	\N	\N
8584	12	14	40	\N	\N	\N	\N
8585	12	14	41	\N	\N	\N	\N
8586	12	14	42	\N	\N	\N	\N
8587	12	14	43	\N	\N	\N	\N
8588	12	14	44	\N	\N	\N	\N
8589	12	14	45	\N	\N	\N	\N
8590	12	14	46	\N	\N	\N	\N
8591	12	14	47	\N	\N	\N	\N
8592	12	14	48	\N	\N	\N	\N
8593	12	15	1	\N	\N	\N	\N
8594	12	15	2	\N	\N	\N	\N
8595	12	15	3	\N	\N	\N	\N
8596	12	15	4	\N	\N	\N	\N
8597	12	15	5	\N	\N	\N	\N
8598	12	15	6	\N	\N	\N	\N
8599	12	15	7	\N	\N	\N	\N
8600	12	15	8	\N	\N	\N	\N
8601	12	15	9	\N	\N	\N	\N
8602	12	15	10	\N	\N	\N	\N
8603	12	15	11	\N	\N	\N	\N
8604	12	15	12	\N	\N	\N	\N
8605	12	15	13	\N	\N	\N	\N
8606	12	15	14	\N	\N	\N	\N
8607	12	15	15	\N	\N	\N	\N
8608	12	15	16	\N	\N	\N	\N
8609	12	15	17	\N	\N	\N	\N
8610	12	15	18	\N	\N	\N	\N
8611	12	15	19	\N	\N	\N	\N
8612	12	15	20	\N	\N	\N	\N
8613	12	15	21	\N	\N	\N	\N
8614	12	15	22	\N	\N	\N	\N
8615	12	15	23	\N	\N	\N	\N
8616	12	15	24	\N	\N	\N	\N
8617	12	15	25	\N	\N	\N	\N
8618	12	15	26	\N	\N	\N	\N
8619	12	15	27	\N	\N	\N	\N
8620	12	15	28	\N	\N	\N	\N
8621	12	15	29	\N	\N	\N	\N
8622	12	15	30	\N	\N	\N	\N
8623	12	15	31	\N	\N	\N	\N
8624	12	15	32	\N	\N	\N	\N
8625	12	15	33	\N	\N	\N	\N
8626	12	15	34	\N	\N	\N	\N
8627	12	15	35	\N	\N	\N	\N
8628	12	15	36	\N	\N	\N	\N
8629	12	15	37	\N	\N	\N	\N
8630	12	15	38	\N	\N	\N	\N
8631	12	15	39	\N	\N	\N	\N
8632	12	15	40	\N	\N	\N	\N
8633	12	15	41	\N	\N	\N	\N
8634	12	15	42	\N	\N	\N	\N
8635	12	15	43	\N	\N	\N	\N
8636	12	15	44	\N	\N	\N	\N
8637	12	15	45	\N	\N	\N	\N
8638	12	15	46	\N	\N	\N	\N
8639	12	15	47	\N	\N	\N	\N
8640	12	15	48	\N	\N	\N	\N
8641	13	1	1	\N	\N	\N	\N
8642	13	1	2	\N	\N	\N	\N
8643	13	1	3	\N	\N	\N	\N
8644	13	1	4	\N	\N	\N	\N
8645	13	1	5	\N	\N	\N	\N
8646	13	1	6	\N	\N	\N	\N
8647	13	1	7	\N	\N	\N	\N
8648	13	1	8	\N	\N	\N	\N
8649	13	1	9	\N	\N	\N	\N
8650	13	1	10	\N	\N	\N	\N
8651	13	1	11	\N	\N	\N	\N
8652	13	1	12	\N	\N	\N	\N
8653	13	1	13	\N	\N	\N	\N
8654	13	1	14	\N	\N	\N	\N
8655	13	1	15	\N	\N	\N	\N
8656	13	1	16	\N	\N	\N	\N
8657	13	1	17	\N	\N	\N	\N
8658	13	1	18	\N	\N	\N	\N
8659	13	1	19	\N	\N	\N	\N
8660	13	1	20	\N	\N	\N	\N
8661	13	1	21	\N	\N	\N	\N
8662	13	1	22	\N	\N	\N	\N
8663	13	1	23	\N	\N	\N	\N
8664	13	1	24	\N	\N	\N	\N
8665	13	1	25	\N	\N	\N	\N
8666	13	1	26	\N	\N	\N	\N
8667	13	1	27	\N	\N	\N	\N
8668	13	1	28	\N	\N	\N	\N
8669	13	1	29	\N	\N	\N	\N
8670	13	1	30	\N	\N	\N	\N
8671	13	1	31	\N	\N	\N	\N
8672	13	1	32	\N	\N	\N	\N
8673	13	1	33	\N	\N	\N	\N
8674	13	1	34	\N	\N	\N	\N
8675	13	1	35	\N	\N	\N	\N
8676	13	1	36	\N	\N	\N	\N
8677	13	1	37	\N	\N	\N	\N
8678	13	1	38	\N	\N	\N	\N
8679	13	1	39	\N	\N	\N	\N
8680	13	1	40	\N	\N	\N	\N
8681	13	1	41	\N	\N	\N	\N
8682	13	1	42	\N	\N	\N	\N
8683	13	1	43	\N	\N	\N	\N
8684	13	1	44	\N	\N	\N	\N
8685	13	1	45	\N	\N	\N	\N
8686	13	1	46	\N	\N	\N	\N
8687	13	1	47	\N	\N	\N	\N
8688	13	1	48	\N	\N	\N	\N
8689	13	2	1	\N	\N	\N	\N
8690	13	2	2	\N	\N	\N	\N
8691	13	2	3	\N	\N	\N	\N
8692	13	2	4	\N	\N	\N	\N
8693	13	2	5	\N	\N	\N	\N
8694	13	2	6	\N	\N	\N	\N
8695	13	2	7	\N	\N	\N	\N
8696	13	2	8	\N	\N	\N	\N
8697	13	2	9	\N	\N	\N	\N
8698	13	2	10	\N	\N	\N	\N
8699	13	2	11	\N	\N	\N	\N
8700	13	2	12	\N	\N	\N	\N
8701	13	2	13	\N	\N	\N	\N
8702	13	2	14	\N	\N	\N	\N
8703	13	2	15	\N	\N	\N	\N
8704	13	2	16	\N	\N	\N	\N
8705	13	2	17	\N	\N	\N	\N
8706	13	2	18	\N	\N	\N	\N
8707	13	2	19	\N	\N	\N	\N
8708	13	2	20	\N	\N	\N	\N
8709	13	2	21	\N	\N	\N	\N
8710	13	2	22	\N	\N	\N	\N
8711	13	2	23	\N	\N	\N	\N
8712	13	2	24	\N	\N	\N	\N
8713	13	2	25	\N	\N	\N	\N
8714	13	2	26	\N	\N	\N	\N
8715	13	2	27	\N	\N	\N	\N
8716	13	2	28	\N	\N	\N	\N
8717	13	2	29	\N	\N	\N	\N
8718	13	2	30	\N	\N	\N	\N
8719	13	2	31	\N	\N	\N	\N
8720	13	2	32	\N	\N	\N	\N
8721	13	2	33	\N	\N	\N	\N
8722	13	2	34	\N	\N	\N	\N
8723	13	2	35	\N	\N	\N	\N
8724	13	2	36	\N	\N	\N	\N
8725	13	2	37	\N	\N	\N	\N
8726	13	2	38	\N	\N	\N	\N
8727	13	2	39	\N	\N	\N	\N
8728	13	2	40	\N	\N	\N	\N
8729	13	2	41	\N	\N	\N	\N
8730	13	2	42	\N	\N	\N	\N
8731	13	2	43	\N	\N	\N	\N
8732	13	2	44	\N	\N	\N	\N
8733	13	2	45	\N	\N	\N	\N
8734	13	2	46	\N	\N	\N	\N
8735	13	2	47	\N	\N	\N	\N
8736	13	2	48	\N	\N	\N	\N
8737	13	3	1	\N	\N	\N	\N
8738	13	3	2	\N	\N	\N	\N
8739	13	3	3	\N	\N	\N	\N
8740	13	3	4	\N	\N	\N	\N
8741	13	3	5	\N	\N	\N	\N
8742	13	3	6	\N	\N	\N	\N
8743	13	3	7	\N	\N	\N	\N
8744	13	3	8	\N	\N	\N	\N
8745	13	3	9	\N	\N	\N	\N
8746	13	3	10	\N	\N	\N	\N
8747	13	3	11	\N	\N	\N	\N
8748	13	3	12	\N	\N	\N	\N
8749	13	3	13	\N	\N	\N	\N
8750	13	3	14	\N	\N	\N	\N
8751	13	3	15	\N	\N	\N	\N
8752	13	3	16	\N	\N	\N	\N
8753	13	3	17	\N	\N	\N	\N
8754	13	3	18	\N	\N	\N	\N
8755	13	3	19	\N	\N	\N	\N
8756	13	3	20	\N	\N	\N	\N
8757	13	3	21	\N	\N	\N	\N
8758	13	3	22	\N	\N	\N	\N
8759	13	3	23	\N	\N	\N	\N
8760	13	3	24	\N	\N	\N	\N
8761	13	3	25	\N	\N	\N	\N
8762	13	3	26	\N	\N	\N	\N
8763	13	3	27	\N	\N	\N	\N
8764	13	3	28	\N	\N	\N	\N
8765	13	3	29	\N	\N	\N	\N
8766	13	3	30	\N	\N	\N	\N
8767	13	3	31	\N	\N	\N	\N
8768	13	3	32	\N	\N	\N	\N
8769	13	3	33	\N	\N	\N	\N
8770	13	3	34	\N	\N	\N	\N
8771	13	3	35	\N	\N	\N	\N
8772	13	3	36	\N	\N	\N	\N
8773	13	3	37	\N	\N	\N	\N
8774	13	3	38	\N	\N	\N	\N
8775	13	3	39	\N	\N	\N	\N
8776	13	3	40	\N	\N	\N	\N
8777	13	3	41	\N	\N	\N	\N
8778	13	3	42	\N	\N	\N	\N
8779	13	3	43	\N	\N	\N	\N
8780	13	3	44	\N	\N	\N	\N
8781	13	3	45	\N	\N	\N	\N
8782	13	3	46	\N	\N	\N	\N
8783	13	3	47	\N	\N	\N	\N
8784	13	3	48	\N	\N	\N	\N
8785	13	4	1	\N	\N	\N	\N
8786	13	4	2	\N	\N	\N	\N
8787	13	4	3	\N	\N	\N	\N
8788	13	4	4	\N	\N	\N	\N
8789	13	4	5	\N	\N	\N	\N
8790	13	4	6	\N	\N	\N	\N
8791	13	4	7	\N	\N	\N	\N
8792	13	4	8	\N	\N	\N	\N
8793	13	4	9	\N	\N	\N	\N
8794	13	4	10	\N	\N	\N	\N
8795	13	4	11	\N	\N	\N	\N
8796	13	4	12	\N	\N	\N	\N
8797	13	4	13	\N	\N	\N	\N
8798	13	4	14	\N	\N	\N	\N
8799	13	4	15	\N	\N	\N	\N
8800	13	4	16	\N	\N	\N	\N
8801	13	4	17	\N	\N	\N	\N
8802	13	4	18	\N	\N	\N	\N
8803	13	4	19	\N	\N	\N	\N
8804	13	4	20	\N	\N	\N	\N
8805	13	4	21	\N	\N	\N	\N
8806	13	4	22	\N	\N	\N	\N
8807	13	4	23	\N	\N	\N	\N
8808	13	4	24	\N	\N	\N	\N
8809	13	4	25	\N	\N	\N	\N
8810	13	4	26	\N	\N	\N	\N
8811	13	4	27	\N	\N	\N	\N
8812	13	4	28	\N	\N	\N	\N
8813	13	4	29	\N	\N	\N	\N
8814	13	4	30	\N	\N	\N	\N
8815	13	4	31	\N	\N	\N	\N
8816	13	4	32	\N	\N	\N	\N
8817	13	4	33	\N	\N	\N	\N
8818	13	4	34	\N	\N	\N	\N
8819	13	4	35	\N	\N	\N	\N
8820	13	4	36	\N	\N	\N	\N
8821	13	4	37	\N	\N	\N	\N
8822	13	4	38	\N	\N	\N	\N
8823	13	4	39	\N	\N	\N	\N
8824	13	4	40	\N	\N	\N	\N
8825	13	4	41	\N	\N	\N	\N
8826	13	4	42	\N	\N	\N	\N
8827	13	4	43	\N	\N	\N	\N
8828	13	4	44	\N	\N	\N	\N
8829	13	4	45	\N	\N	\N	\N
8830	13	4	46	\N	\N	\N	\N
8831	13	4	47	\N	\N	\N	\N
8832	13	4	48	\N	\N	\N	\N
8833	13	5	1	\N	\N	\N	\N
8834	13	5	2	\N	\N	\N	\N
8835	13	5	3	\N	\N	\N	\N
8836	13	5	4	\N	\N	\N	\N
8837	13	5	5	\N	\N	\N	\N
8838	13	5	6	\N	\N	\N	\N
8839	13	5	7	\N	\N	\N	\N
8840	13	5	8	\N	\N	\N	\N
8841	13	5	9	\N	\N	\N	\N
8842	13	5	10	\N	\N	\N	\N
8843	13	5	11	\N	\N	\N	\N
8844	13	5	12	\N	\N	\N	\N
8845	13	5	13	\N	\N	\N	\N
8846	13	5	14	\N	\N	\N	\N
8847	13	5	15	\N	\N	\N	\N
8848	13	5	16	\N	\N	\N	\N
8849	13	5	17	\N	\N	\N	\N
8850	13	5	18	\N	\N	\N	\N
8851	13	5	19	\N	\N	\N	\N
8852	13	5	20	\N	\N	\N	\N
8853	13	5	21	\N	\N	\N	\N
8854	13	5	22	\N	\N	\N	\N
8855	13	5	23	\N	\N	\N	\N
8856	13	5	24	\N	\N	\N	\N
8857	13	5	25	\N	\N	\N	\N
8858	13	5	26	\N	\N	\N	\N
8859	13	5	27	\N	\N	\N	\N
8860	13	5	28	\N	\N	\N	\N
8861	13	5	29	\N	\N	\N	\N
8862	13	5	30	\N	\N	\N	\N
8863	13	5	31	\N	\N	\N	\N
8864	13	5	32	\N	\N	\N	\N
8865	13	5	33	\N	\N	\N	\N
8866	13	5	34	\N	\N	\N	\N
8867	13	5	35	\N	\N	\N	\N
8868	13	5	36	\N	\N	\N	\N
8869	13	5	37	\N	\N	\N	\N
8870	13	5	38	\N	\N	\N	\N
8871	13	5	39	\N	\N	\N	\N
8872	13	5	40	\N	\N	\N	\N
8873	13	5	41	\N	\N	\N	\N
8874	13	5	42	\N	\N	\N	\N
8875	13	5	43	\N	\N	\N	\N
8876	13	5	44	\N	\N	\N	\N
8877	13	5	45	\N	\N	\N	\N
8878	13	5	46	\N	\N	\N	\N
8879	13	5	47	\N	\N	\N	\N
8880	13	5	48	\N	\N	\N	\N
8881	13	6	1	\N	\N	\N	\N
8882	13	6	2	\N	\N	\N	\N
8883	13	6	3	\N	\N	\N	\N
8884	13	6	4	\N	\N	\N	\N
8885	13	6	5	\N	\N	\N	\N
8886	13	6	6	\N	\N	\N	\N
8887	13	6	7	\N	\N	\N	\N
8888	13	6	8	\N	\N	\N	\N
8889	13	6	9	\N	\N	\N	\N
8890	13	6	10	\N	\N	\N	\N
8891	13	6	11	\N	\N	\N	\N
8892	13	6	12	\N	\N	\N	\N
8893	13	6	13	\N	\N	\N	\N
8894	13	6	14	\N	\N	\N	\N
8895	13	6	15	\N	\N	\N	\N
8896	13	6	16	\N	\N	\N	\N
8897	13	6	17	\N	\N	\N	\N
8898	13	6	18	\N	\N	\N	\N
8899	13	6	19	\N	\N	\N	\N
8900	13	6	20	\N	\N	\N	\N
8901	13	6	21	\N	\N	\N	\N
8902	13	6	22	\N	\N	\N	\N
8903	13	6	23	\N	\N	\N	\N
8904	13	6	24	\N	\N	\N	\N
8905	13	6	25	\N	\N	\N	\N
8906	13	6	26	\N	\N	\N	\N
8907	13	6	27	\N	\N	\N	\N
8908	13	6	28	\N	\N	\N	\N
8909	13	6	29	\N	\N	\N	\N
8910	13	6	30	\N	\N	\N	\N
8911	13	6	31	\N	\N	\N	\N
8912	13	6	32	\N	\N	\N	\N
8913	13	6	33	\N	\N	\N	\N
8914	13	6	34	\N	\N	\N	\N
8915	13	6	35	\N	\N	\N	\N
8916	13	6	36	\N	\N	\N	\N
8917	13	6	37	\N	\N	\N	\N
8918	13	6	38	\N	\N	\N	\N
8919	13	6	39	\N	\N	\N	\N
8920	13	6	40	\N	\N	\N	\N
8921	13	6	41	\N	\N	\N	\N
8922	13	6	42	\N	\N	\N	\N
8923	13	6	43	\N	\N	\N	\N
8924	13	6	44	\N	\N	\N	\N
8925	13	6	45	\N	\N	\N	\N
8926	13	6	46	\N	\N	\N	\N
8927	13	6	47	\N	\N	\N	\N
8928	13	6	48	\N	\N	\N	\N
8929	13	7	1	\N	\N	\N	\N
8930	13	7	2	\N	\N	\N	\N
8931	13	7	3	\N	\N	\N	\N
8932	13	7	4	\N	\N	\N	\N
8933	13	7	5	\N	\N	\N	\N
8934	13	7	6	\N	\N	\N	\N
8935	13	7	7	\N	\N	\N	\N
8936	13	7	8	\N	\N	\N	\N
8937	13	7	9	\N	\N	\N	\N
8938	13	7	10	\N	\N	\N	\N
8939	13	7	11	\N	\N	\N	\N
8940	13	7	12	\N	\N	\N	\N
8941	13	7	13	\N	\N	\N	\N
8942	13	7	14	\N	\N	\N	\N
8943	13	7	15	\N	\N	\N	\N
8944	13	7	16	\N	\N	\N	\N
8945	13	7	17	\N	\N	\N	\N
8946	13	7	18	\N	\N	\N	\N
8947	13	7	19	\N	\N	\N	\N
8948	13	7	20	\N	\N	\N	\N
8949	13	7	21	\N	\N	\N	\N
8950	13	7	22	\N	\N	\N	\N
8951	13	7	23	\N	\N	\N	\N
8952	13	7	24	\N	\N	\N	\N
8953	13	7	25	\N	\N	\N	\N
8954	13	7	26	\N	\N	\N	\N
8955	13	7	27	\N	\N	\N	\N
8956	13	7	28	\N	\N	\N	\N
8957	13	7	29	\N	\N	\N	\N
8958	13	7	30	\N	\N	\N	\N
8959	13	7	31	\N	\N	\N	\N
8960	13	7	32	\N	\N	\N	\N
8961	13	7	33	\N	\N	\N	\N
8962	13	7	34	\N	\N	\N	\N
8963	13	7	35	\N	\N	\N	\N
8964	13	7	36	\N	\N	\N	\N
8965	13	7	37	\N	\N	\N	\N
8966	13	7	38	\N	\N	\N	\N
8967	13	7	39	\N	\N	\N	\N
8968	13	7	40	\N	\N	\N	\N
8969	13	7	41	\N	\N	\N	\N
8970	13	7	42	\N	\N	\N	\N
8971	13	7	43	\N	\N	\N	\N
8972	13	7	44	\N	\N	\N	\N
8973	13	7	45	\N	\N	\N	\N
8974	13	7	46	\N	\N	\N	\N
8975	13	7	47	\N	\N	\N	\N
8976	13	7	48	\N	\N	\N	\N
8977	13	8	1	\N	\N	\N	\N
8978	13	8	2	\N	\N	\N	\N
8979	13	8	3	\N	\N	\N	\N
8980	13	8	4	\N	\N	\N	\N
8981	13	8	5	\N	\N	\N	\N
8982	13	8	6	\N	\N	\N	\N
8983	13	8	7	\N	\N	\N	\N
8984	13	8	8	\N	\N	\N	\N
8985	13	8	9	\N	\N	\N	\N
8986	13	8	10	\N	\N	\N	\N
8987	13	8	11	\N	\N	\N	\N
8988	13	8	12	\N	\N	\N	\N
8989	13	8	13	\N	\N	\N	\N
8990	13	8	14	\N	\N	\N	\N
8991	13	8	15	\N	\N	\N	\N
8992	13	8	16	\N	\N	\N	\N
8993	13	8	17	\N	\N	\N	\N
8994	13	8	18	\N	\N	\N	\N
8995	13	8	19	\N	\N	\N	\N
8996	13	8	20	\N	\N	\N	\N
8997	13	8	21	\N	\N	\N	\N
8998	13	8	22	\N	\N	\N	\N
8999	13	8	23	\N	\N	\N	\N
9000	13	8	24	\N	\N	\N	\N
9001	13	8	25	\N	\N	\N	\N
9002	13	8	26	\N	\N	\N	\N
9003	13	8	27	\N	\N	\N	\N
9004	13	8	28	\N	\N	\N	\N
9005	13	8	29	\N	\N	\N	\N
9006	13	8	30	\N	\N	\N	\N
9007	13	8	31	\N	\N	\N	\N
9008	13	8	32	\N	\N	\N	\N
9009	13	8	33	\N	\N	\N	\N
9010	13	8	34	\N	\N	\N	\N
9011	13	8	35	\N	\N	\N	\N
9012	13	8	36	\N	\N	\N	\N
9013	13	8	37	\N	\N	\N	\N
9014	13	8	38	\N	\N	\N	\N
9015	13	8	39	\N	\N	\N	\N
9016	13	8	40	\N	\N	\N	\N
9017	13	8	41	\N	\N	\N	\N
9018	13	8	42	\N	\N	\N	\N
9019	13	8	43	\N	\N	\N	\N
9020	13	8	44	\N	\N	\N	\N
9021	13	8	45	\N	\N	\N	\N
9022	13	8	46	\N	\N	\N	\N
9023	13	8	47	\N	\N	\N	\N
9024	13	8	48	\N	\N	\N	\N
9025	13	9	1	\N	\N	\N	\N
9026	13	9	2	\N	\N	\N	\N
9027	13	9	3	\N	\N	\N	\N
9028	13	9	4	\N	\N	\N	\N
9029	13	9	5	\N	\N	\N	\N
9030	13	9	6	\N	\N	\N	\N
9031	13	9	7	\N	\N	\N	\N
9032	13	9	8	\N	\N	\N	\N
9033	13	9	9	\N	\N	\N	\N
9034	13	9	10	\N	\N	\N	\N
9035	13	9	11	\N	\N	\N	\N
9036	13	9	12	\N	\N	\N	\N
9037	13	9	13	\N	\N	\N	\N
9038	13	9	14	\N	\N	\N	\N
9039	13	9	15	\N	\N	\N	\N
9040	13	9	16	\N	\N	\N	\N
9041	13	9	17	\N	\N	\N	\N
9042	13	9	18	\N	\N	\N	\N
9043	13	9	19	\N	\N	\N	\N
9044	13	9	20	\N	\N	\N	\N
9045	13	9	21	\N	\N	\N	\N
9046	13	9	22	\N	\N	\N	\N
9047	13	9	23	\N	\N	\N	\N
9048	13	9	24	\N	\N	\N	\N
9049	13	9	25	\N	\N	\N	\N
9050	13	9	26	\N	\N	\N	\N
9051	13	9	27	\N	\N	\N	\N
9052	13	9	28	\N	\N	\N	\N
9053	13	9	29	\N	\N	\N	\N
9054	13	9	30	\N	\N	\N	\N
9055	13	9	31	\N	\N	\N	\N
9056	13	9	32	\N	\N	\N	\N
9057	13	9	33	\N	\N	\N	\N
9058	13	9	34	\N	\N	\N	\N
9059	13	9	35	\N	\N	\N	\N
9060	13	9	36	\N	\N	\N	\N
9061	13	9	37	\N	\N	\N	\N
9062	13	9	38	\N	\N	\N	\N
9063	13	9	39	\N	\N	\N	\N
9064	13	9	40	\N	\N	\N	\N
9065	13	9	41	\N	\N	\N	\N
9066	13	9	42	\N	\N	\N	\N
9067	13	9	43	\N	\N	\N	\N
9068	13	9	44	\N	\N	\N	\N
9069	13	9	45	\N	\N	\N	\N
9070	13	9	46	\N	\N	\N	\N
9071	13	9	47	\N	\N	\N	\N
9072	13	9	48	\N	\N	\N	\N
9073	13	10	1	\N	\N	\N	\N
9074	13	10	2	\N	\N	\N	\N
9075	13	10	3	\N	\N	\N	\N
9076	13	10	4	\N	\N	\N	\N
9077	13	10	5	\N	\N	\N	\N
9078	13	10	6	\N	\N	\N	\N
9079	13	10	7	\N	\N	\N	\N
9080	13	10	8	\N	\N	\N	\N
9081	13	10	9	\N	\N	\N	\N
9082	13	10	10	\N	\N	\N	\N
9083	13	10	11	\N	\N	\N	\N
9084	13	10	12	\N	\N	\N	\N
9085	13	10	13	\N	\N	\N	\N
9086	13	10	14	\N	\N	\N	\N
9087	13	10	15	\N	\N	\N	\N
9088	13	10	16	\N	\N	\N	\N
9089	13	10	17	\N	\N	\N	\N
9090	13	10	18	\N	\N	\N	\N
9091	13	10	19	\N	\N	\N	\N
9092	13	10	20	\N	\N	\N	\N
9093	13	10	21	\N	\N	\N	\N
9094	13	10	22	\N	\N	\N	\N
9095	13	10	23	\N	\N	\N	\N
9096	13	10	24	\N	\N	\N	\N
9097	13	10	25	\N	\N	\N	\N
9098	13	10	26	\N	\N	\N	\N
9099	13	10	27	\N	\N	\N	\N
9100	13	10	28	\N	\N	\N	\N
9101	13	10	29	\N	\N	\N	\N
9102	13	10	30	\N	\N	\N	\N
9103	13	10	31	\N	\N	\N	\N
9104	13	10	32	\N	\N	\N	\N
9105	13	10	33	\N	\N	\N	\N
9106	13	10	34	\N	\N	\N	\N
9107	13	10	35	\N	\N	\N	\N
9108	13	10	36	\N	\N	\N	\N
9109	13	10	37	\N	\N	\N	\N
9110	13	10	38	\N	\N	\N	\N
9111	13	10	39	\N	\N	\N	\N
9112	13	10	40	\N	\N	\N	\N
9113	13	10	41	\N	\N	\N	\N
9114	13	10	42	\N	\N	\N	\N
9115	13	10	43	\N	\N	\N	\N
9116	13	10	44	\N	\N	\N	\N
9117	13	10	45	\N	\N	\N	\N
9118	13	10	46	\N	\N	\N	\N
9119	13	10	47	\N	\N	\N	\N
9120	13	10	48	\N	\N	\N	\N
9121	13	11	1	\N	\N	\N	\N
9122	13	11	2	\N	\N	\N	\N
9123	13	11	3	\N	\N	\N	\N
9124	13	11	4	\N	\N	\N	\N
9125	13	11	5	\N	\N	\N	\N
9126	13	11	6	\N	\N	\N	\N
9127	13	11	7	\N	\N	\N	\N
9128	13	11	8	\N	\N	\N	\N
9129	13	11	9	\N	\N	\N	\N
9130	13	11	10	\N	\N	\N	\N
9131	13	11	11	\N	\N	\N	\N
9132	13	11	12	\N	\N	\N	\N
9133	13	11	13	\N	\N	\N	\N
9134	13	11	14	\N	\N	\N	\N
9135	13	11	15	\N	\N	\N	\N
9136	13	11	16	\N	\N	\N	\N
9137	13	11	17	\N	\N	\N	\N
9138	13	11	18	\N	\N	\N	\N
9139	13	11	19	\N	\N	\N	\N
9140	13	11	20	\N	\N	\N	\N
9141	13	11	21	\N	\N	\N	\N
9142	13	11	22	\N	\N	\N	\N
9143	13	11	23	\N	\N	\N	\N
9144	13	11	24	\N	\N	\N	\N
9145	13	11	25	\N	\N	\N	\N
9146	13	11	26	\N	\N	\N	\N
9147	13	11	27	\N	\N	\N	\N
9148	13	11	28	\N	\N	\N	\N
9149	13	11	29	\N	\N	\N	\N
9150	13	11	30	\N	\N	\N	\N
9151	13	11	31	\N	\N	\N	\N
9152	13	11	32	\N	\N	\N	\N
9153	13	11	33	\N	\N	\N	\N
9154	13	11	34	\N	\N	\N	\N
9155	13	11	35	\N	\N	\N	\N
9156	13	11	36	\N	\N	\N	\N
9157	13	11	37	\N	\N	\N	\N
9158	13	11	38	\N	\N	\N	\N
9159	13	11	39	\N	\N	\N	\N
9160	13	11	40	\N	\N	\N	\N
9161	13	11	41	\N	\N	\N	\N
9162	13	11	42	\N	\N	\N	\N
9163	13	11	43	\N	\N	\N	\N
9164	13	11	44	\N	\N	\N	\N
9165	13	11	45	\N	\N	\N	\N
9166	13	11	46	\N	\N	\N	\N
9167	13	11	47	\N	\N	\N	\N
9168	13	11	48	\N	\N	\N	\N
9169	13	12	1	\N	\N	\N	\N
9170	13	12	2	\N	\N	\N	\N
9171	13	12	3	\N	\N	\N	\N
9172	13	12	4	\N	\N	\N	\N
9173	13	12	5	\N	\N	\N	\N
9174	13	12	6	\N	\N	\N	\N
9175	13	12	7	\N	\N	\N	\N
9176	13	12	8	\N	\N	\N	\N
9177	13	12	9	\N	\N	\N	\N
9178	13	12	10	\N	\N	\N	\N
9179	13	12	11	\N	\N	\N	\N
9180	13	12	12	\N	\N	\N	\N
9181	13	12	13	\N	\N	\N	\N
9182	13	12	14	\N	\N	\N	\N
9183	13	12	15	\N	\N	\N	\N
9184	13	12	16	\N	\N	\N	\N
9185	13	12	17	\N	\N	\N	\N
9186	13	12	18	\N	\N	\N	\N
9187	13	12	19	\N	\N	\N	\N
9188	13	12	20	\N	\N	\N	\N
9189	13	12	21	\N	\N	\N	\N
9190	13	12	22	\N	\N	\N	\N
9191	13	12	23	\N	\N	\N	\N
9192	13	12	24	\N	\N	\N	\N
9193	13	12	25	\N	\N	\N	\N
9194	13	12	26	\N	\N	\N	\N
9195	13	12	27	\N	\N	\N	\N
9196	13	12	28	\N	\N	\N	\N
9197	13	12	29	\N	\N	\N	\N
9198	13	12	30	\N	\N	\N	\N
9199	13	12	31	\N	\N	\N	\N
9200	13	12	32	\N	\N	\N	\N
9201	13	12	33	\N	\N	\N	\N
9202	13	12	34	\N	\N	\N	\N
9203	13	12	35	\N	\N	\N	\N
9204	13	12	36	\N	\N	\N	\N
9205	13	12	37	\N	\N	\N	\N
9206	13	12	38	\N	\N	\N	\N
9207	13	12	39	\N	\N	\N	\N
9208	13	12	40	\N	\N	\N	\N
9209	13	12	41	\N	\N	\N	\N
9210	13	12	42	\N	\N	\N	\N
9211	13	12	43	\N	\N	\N	\N
9212	13	12	44	\N	\N	\N	\N
9213	13	12	45	\N	\N	\N	\N
9214	13	12	46	\N	\N	\N	\N
9215	13	12	47	\N	\N	\N	\N
9216	13	12	48	\N	\N	\N	\N
9217	13	13	1	\N	\N	\N	\N
9218	13	13	2	\N	\N	\N	\N
9219	13	13	3	\N	\N	\N	\N
9220	13	13	4	\N	\N	\N	\N
9221	13	13	5	\N	\N	\N	\N
9222	13	13	6	\N	\N	\N	\N
9223	13	13	7	\N	\N	\N	\N
9224	13	13	8	\N	\N	\N	\N
9225	13	13	9	\N	\N	\N	\N
9226	13	13	10	\N	\N	\N	\N
9227	13	13	11	\N	\N	\N	\N
9228	13	13	12	\N	\N	\N	\N
9229	13	13	13	\N	\N	\N	\N
9230	13	13	14	\N	\N	\N	\N
9231	13	13	15	\N	\N	\N	\N
9232	13	13	16	\N	\N	\N	\N
9233	13	13	17	\N	\N	\N	\N
9234	13	13	18	\N	\N	\N	\N
9235	13	13	19	\N	\N	\N	\N
9236	13	13	20	\N	\N	\N	\N
9237	13	13	21	\N	\N	\N	\N
9238	13	13	22	\N	\N	\N	\N
9239	13	13	23	\N	\N	\N	\N
9240	13	13	24	\N	\N	\N	\N
9241	13	13	25	\N	\N	\N	\N
9242	13	13	26	\N	\N	\N	\N
9243	13	13	27	\N	\N	\N	\N
9244	13	13	28	\N	\N	\N	\N
9245	13	13	29	\N	\N	\N	\N
9246	13	13	30	\N	\N	\N	\N
9247	13	13	31	\N	\N	\N	\N
9248	13	13	32	\N	\N	\N	\N
9249	13	13	33	\N	\N	\N	\N
9250	13	13	34	\N	\N	\N	\N
9251	13	13	35	\N	\N	\N	\N
9252	13	13	36	\N	\N	\N	\N
9253	13	13	37	\N	\N	\N	\N
9254	13	13	38	\N	\N	\N	\N
9255	13	13	39	\N	\N	\N	\N
9256	13	13	40	\N	\N	\N	\N
9257	13	13	41	\N	\N	\N	\N
9258	13	13	42	\N	\N	\N	\N
9259	13	13	43	\N	\N	\N	\N
9260	13	13	44	\N	\N	\N	\N
9261	13	13	45	\N	\N	\N	\N
9262	13	13	46	\N	\N	\N	\N
9263	13	13	47	\N	\N	\N	\N
9264	13	13	48	\N	\N	\N	\N
9265	13	14	1	\N	\N	\N	\N
9266	13	14	2	\N	\N	\N	\N
9267	13	14	3	\N	\N	\N	\N
9268	13	14	4	\N	\N	\N	\N
9269	13	14	5	\N	\N	\N	\N
9270	13	14	6	\N	\N	\N	\N
9271	13	14	7	\N	\N	\N	\N
9272	13	14	8	\N	\N	\N	\N
9273	13	14	9	\N	\N	\N	\N
9274	13	14	10	\N	\N	\N	\N
9275	13	14	11	\N	\N	\N	\N
9276	13	14	12	\N	\N	\N	\N
9277	13	14	13	\N	\N	\N	\N
9278	13	14	14	\N	\N	\N	\N
9279	13	14	15	\N	\N	\N	\N
9280	13	14	16	\N	\N	\N	\N
9281	13	14	17	\N	\N	\N	\N
9282	13	14	18	\N	\N	\N	\N
9283	13	14	19	\N	\N	\N	\N
9284	13	14	20	\N	\N	\N	\N
9285	13	14	21	\N	\N	\N	\N
9286	13	14	22	\N	\N	\N	\N
9287	13	14	23	\N	\N	\N	\N
9288	13	14	24	\N	\N	\N	\N
9289	13	14	25	\N	\N	\N	\N
9290	13	14	26	\N	\N	\N	\N
9291	13	14	27	\N	\N	\N	\N
9292	13	14	28	\N	\N	\N	\N
9293	13	14	29	\N	\N	\N	\N
9294	13	14	30	\N	\N	\N	\N
9295	13	14	31	\N	\N	\N	\N
9296	13	14	32	\N	\N	\N	\N
9297	13	14	33	\N	\N	\N	\N
9298	13	14	34	\N	\N	\N	\N
9299	13	14	35	\N	\N	\N	\N
9300	13	14	36	\N	\N	\N	\N
9301	13	14	37	\N	\N	\N	\N
9302	13	14	38	\N	\N	\N	\N
9303	13	14	39	\N	\N	\N	\N
9304	13	14	40	\N	\N	\N	\N
9305	13	14	41	\N	\N	\N	\N
9306	13	14	42	\N	\N	\N	\N
9307	13	14	43	\N	\N	\N	\N
9308	13	14	44	\N	\N	\N	\N
9309	13	14	45	\N	\N	\N	\N
9310	13	14	46	\N	\N	\N	\N
9311	13	14	47	\N	\N	\N	\N
9312	13	14	48	\N	\N	\N	\N
9313	13	15	1	\N	\N	\N	\N
9314	13	15	2	\N	\N	\N	\N
9315	13	15	3	\N	\N	\N	\N
9316	13	15	4	\N	\N	\N	\N
9317	13	15	5	\N	\N	\N	\N
9318	13	15	6	\N	\N	\N	\N
9319	13	15	7	\N	\N	\N	\N
9320	13	15	8	\N	\N	\N	\N
9321	13	15	9	\N	\N	\N	\N
9322	13	15	10	\N	\N	\N	\N
9323	13	15	11	\N	\N	\N	\N
9324	13	15	12	\N	\N	\N	\N
9325	13	15	13	\N	\N	\N	\N
9326	13	15	14	\N	\N	\N	\N
9327	13	15	15	\N	\N	\N	\N
9328	13	15	16	\N	\N	\N	\N
9329	13	15	17	\N	\N	\N	\N
9330	13	15	18	\N	\N	\N	\N
9331	13	15	19	\N	\N	\N	\N
9332	13	15	20	\N	\N	\N	\N
9333	13	15	21	\N	\N	\N	\N
9334	13	15	22	\N	\N	\N	\N
9335	13	15	23	\N	\N	\N	\N
9336	13	15	24	\N	\N	\N	\N
9337	13	15	25	\N	\N	\N	\N
9338	13	15	26	\N	\N	\N	\N
9339	13	15	27	\N	\N	\N	\N
9340	13	15	28	\N	\N	\N	\N
9341	13	15	29	\N	\N	\N	\N
9342	13	15	30	\N	\N	\N	\N
9343	13	15	31	\N	\N	\N	\N
9344	13	15	32	\N	\N	\N	\N
9345	13	15	33	\N	\N	\N	\N
9346	13	15	34	\N	\N	\N	\N
9347	13	15	35	\N	\N	\N	\N
9348	13	15	36	\N	\N	\N	\N
9349	13	15	37	\N	\N	\N	\N
9350	13	15	38	\N	\N	\N	\N
9351	13	15	39	\N	\N	\N	\N
9352	13	15	40	\N	\N	\N	\N
9353	13	15	41	\N	\N	\N	\N
9354	13	15	42	\N	\N	\N	\N
9355	13	15	43	\N	\N	\N	\N
9356	13	15	44	\N	\N	\N	\N
9357	13	15	45	\N	\N	\N	\N
9358	13	15	46	\N	\N	\N	\N
9359	13	15	47	\N	\N	\N	\N
9360	13	15	48	\N	\N	\N	\N
9361	14	1	1	\N	\N	\N	\N
9362	14	1	2	\N	\N	\N	\N
9363	14	1	3	\N	\N	\N	\N
9364	14	1	4	\N	\N	\N	\N
9365	14	1	5	\N	\N	\N	\N
9366	14	1	6	\N	\N	\N	\N
9367	14	1	7	\N	\N	\N	\N
9368	14	1	8	\N	\N	\N	\N
9369	14	1	9	\N	\N	\N	\N
9370	14	1	10	\N	\N	\N	\N
9371	14	1	11	\N	\N	\N	\N
9372	14	1	12	\N	\N	\N	\N
9373	14	1	13	\N	\N	\N	\N
9374	14	1	14	\N	\N	\N	\N
9375	14	1	15	\N	\N	\N	\N
9376	14	1	16	\N	\N	\N	\N
9377	14	1	17	\N	\N	\N	\N
9378	14	1	18	\N	\N	\N	\N
9379	14	1	19	\N	\N	\N	\N
9380	14	1	20	\N	\N	\N	\N
9381	14	1	21	\N	\N	\N	\N
9382	14	1	22	\N	\N	\N	\N
9383	14	1	23	\N	\N	\N	\N
9384	14	1	24	\N	\N	\N	\N
9385	14	1	25	\N	\N	\N	\N
9386	14	1	26	\N	\N	\N	\N
9387	14	1	27	\N	\N	\N	\N
9388	14	1	28	\N	\N	\N	\N
9389	14	1	29	\N	\N	\N	\N
9390	14	1	30	\N	\N	\N	\N
9391	14	1	31	\N	\N	\N	\N
9392	14	1	32	\N	\N	\N	\N
9393	14	1	33	\N	\N	\N	\N
9394	14	1	34	\N	\N	\N	\N
9395	14	1	35	\N	\N	\N	\N
9396	14	1	36	\N	\N	\N	\N
9397	14	1	37	\N	\N	\N	\N
9398	14	1	38	\N	\N	\N	\N
9399	14	1	39	\N	\N	\N	\N
9400	14	1	40	\N	\N	\N	\N
9401	14	1	41	\N	\N	\N	\N
9402	14	1	42	\N	\N	\N	\N
9403	14	1	43	\N	\N	\N	\N
9404	14	1	44	\N	\N	\N	\N
9405	14	1	45	\N	\N	\N	\N
9406	14	1	46	\N	\N	\N	\N
9407	14	1	47	\N	\N	\N	\N
9408	14	1	48	\N	\N	\N	\N
9409	14	2	1	\N	\N	\N	\N
9410	14	2	2	\N	\N	\N	\N
9411	14	2	3	\N	\N	\N	\N
9412	14	2	4	\N	\N	\N	\N
9413	14	2	5	\N	\N	\N	\N
9414	14	2	6	\N	\N	\N	\N
9415	14	2	7	\N	\N	\N	\N
9416	14	2	8	\N	\N	\N	\N
9417	14	2	9	\N	\N	\N	\N
9418	14	2	10	\N	\N	\N	\N
9419	14	2	11	\N	\N	\N	\N
9420	14	2	12	\N	\N	\N	\N
9421	14	2	13	\N	\N	\N	\N
9422	14	2	14	\N	\N	\N	\N
9423	14	2	15	\N	\N	\N	\N
9424	14	2	16	\N	\N	\N	\N
9425	14	2	17	\N	\N	\N	\N
9426	14	2	18	\N	\N	\N	\N
9427	14	2	19	\N	\N	\N	\N
9428	14	2	20	\N	\N	\N	\N
9429	14	2	21	\N	\N	\N	\N
9430	14	2	22	\N	\N	\N	\N
9431	14	2	23	\N	\N	\N	\N
9432	14	2	24	\N	\N	\N	\N
9433	14	2	25	\N	\N	\N	\N
9434	14	2	26	\N	\N	\N	\N
9435	14	2	27	\N	\N	\N	\N
9436	14	2	28	\N	\N	\N	\N
9437	14	2	29	\N	\N	\N	\N
9438	14	2	30	\N	\N	\N	\N
9439	14	2	31	\N	\N	\N	\N
9440	14	2	32	\N	\N	\N	\N
9441	14	2	33	\N	\N	\N	\N
9442	14	2	34	\N	\N	\N	\N
9443	14	2	35	\N	\N	\N	\N
9444	14	2	36	\N	\N	\N	\N
9445	14	2	37	\N	\N	\N	\N
9446	14	2	38	\N	\N	\N	\N
9447	14	2	39	\N	\N	\N	\N
9448	14	2	40	\N	\N	\N	\N
9449	14	2	41	\N	\N	\N	\N
9450	14	2	42	\N	\N	\N	\N
9451	14	2	43	\N	\N	\N	\N
9452	14	2	44	\N	\N	\N	\N
9453	14	2	45	\N	\N	\N	\N
9454	14	2	46	\N	\N	\N	\N
9455	14	2	47	\N	\N	\N	\N
9456	14	2	48	\N	\N	\N	\N
9457	14	3	1	\N	\N	\N	\N
9458	14	3	2	\N	\N	\N	\N
9459	14	3	3	\N	\N	\N	\N
9460	14	3	4	\N	\N	\N	\N
9461	14	3	5	\N	\N	\N	\N
9462	14	3	6	\N	\N	\N	\N
9463	14	3	7	\N	\N	\N	\N
9464	14	3	8	\N	\N	\N	\N
9465	14	3	9	\N	\N	\N	\N
9466	14	3	10	\N	\N	\N	\N
9467	14	3	11	\N	\N	\N	\N
9468	14	3	12	\N	\N	\N	\N
9469	14	3	13	\N	\N	\N	\N
9470	14	3	14	\N	\N	\N	\N
9471	14	3	15	\N	\N	\N	\N
9472	14	3	16	\N	\N	\N	\N
9473	14	3	17	\N	\N	\N	\N
9474	14	3	18	\N	\N	\N	\N
9475	14	3	19	\N	\N	\N	\N
9476	14	3	20	\N	\N	\N	\N
9477	14	3	21	\N	\N	\N	\N
9478	14	3	22	\N	\N	\N	\N
9479	14	3	23	\N	\N	\N	\N
9480	14	3	24	\N	\N	\N	\N
9481	14	3	25	\N	\N	\N	\N
9482	14	3	26	\N	\N	\N	\N
9483	14	3	27	\N	\N	\N	\N
9484	14	3	28	\N	\N	\N	\N
9485	14	3	29	\N	\N	\N	\N
9486	14	3	30	\N	\N	\N	\N
9487	14	3	31	\N	\N	\N	\N
9488	14	3	32	\N	\N	\N	\N
9489	14	3	33	\N	\N	\N	\N
9490	14	3	34	\N	\N	\N	\N
9491	14	3	35	\N	\N	\N	\N
9492	14	3	36	\N	\N	\N	\N
9493	14	3	37	\N	\N	\N	\N
9494	14	3	38	\N	\N	\N	\N
9495	14	3	39	\N	\N	\N	\N
9496	14	3	40	\N	\N	\N	\N
9497	14	3	41	\N	\N	\N	\N
9498	14	3	42	\N	\N	\N	\N
9499	14	3	43	\N	\N	\N	\N
9500	14	3	44	\N	\N	\N	\N
9501	14	3	45	\N	\N	\N	\N
9502	14	3	46	\N	\N	\N	\N
9503	14	3	47	\N	\N	\N	\N
9504	14	3	48	\N	\N	\N	\N
9505	14	4	1	\N	\N	\N	\N
9506	14	4	2	\N	\N	\N	\N
9507	14	4	3	\N	\N	\N	\N
9508	14	4	4	\N	\N	\N	\N
9509	14	4	5	\N	\N	\N	\N
9510	14	4	6	\N	\N	\N	\N
9511	14	4	7	\N	\N	\N	\N
9512	14	4	8	\N	\N	\N	\N
9513	14	4	9	\N	\N	\N	\N
9514	14	4	10	\N	\N	\N	\N
9515	14	4	11	\N	\N	\N	\N
9516	14	4	12	\N	\N	\N	\N
9517	14	4	13	\N	\N	\N	\N
9518	14	4	14	\N	\N	\N	\N
9519	14	4	15	\N	\N	\N	\N
9520	14	4	16	\N	\N	\N	\N
9521	14	4	17	\N	\N	\N	\N
9522	14	4	18	\N	\N	\N	\N
9523	14	4	19	\N	\N	\N	\N
9524	14	4	20	\N	\N	\N	\N
9525	14	4	21	\N	\N	\N	\N
9526	14	4	22	\N	\N	\N	\N
9527	14	4	23	\N	\N	\N	\N
9528	14	4	24	\N	\N	\N	\N
9529	14	4	25	\N	\N	\N	\N
9530	14	4	26	\N	\N	\N	\N
9531	14	4	27	\N	\N	\N	\N
9532	14	4	28	\N	\N	\N	\N
9533	14	4	29	\N	\N	\N	\N
9534	14	4	30	\N	\N	\N	\N
9535	14	4	31	\N	\N	\N	\N
9536	14	4	32	\N	\N	\N	\N
9537	14	4	33	\N	\N	\N	\N
9538	14	4	34	\N	\N	\N	\N
9539	14	4	35	\N	\N	\N	\N
9540	14	4	36	\N	\N	\N	\N
9541	14	4	37	\N	\N	\N	\N
9542	14	4	38	\N	\N	\N	\N
9543	14	4	39	\N	\N	\N	\N
9544	14	4	40	\N	\N	\N	\N
9545	14	4	41	\N	\N	\N	\N
9546	14	4	42	\N	\N	\N	\N
9547	14	4	43	\N	\N	\N	\N
9548	14	4	44	\N	\N	\N	\N
9549	14	4	45	\N	\N	\N	\N
9550	14	4	46	\N	\N	\N	\N
9551	14	4	47	\N	\N	\N	\N
9552	14	4	48	\N	\N	\N	\N
9553	14	5	1	\N	\N	\N	\N
9554	14	5	2	\N	\N	\N	\N
9555	14	5	3	\N	\N	\N	\N
9556	14	5	4	\N	\N	\N	\N
9557	14	5	5	\N	\N	\N	\N
9558	14	5	6	\N	\N	\N	\N
9559	14	5	7	\N	\N	\N	\N
9560	14	5	8	\N	\N	\N	\N
9561	14	5	9	\N	\N	\N	\N
9562	14	5	10	\N	\N	\N	\N
9563	14	5	11	\N	\N	\N	\N
9564	14	5	12	\N	\N	\N	\N
9565	14	5	13	\N	\N	\N	\N
9566	14	5	14	\N	\N	\N	\N
9567	14	5	15	\N	\N	\N	\N
9568	14	5	16	\N	\N	\N	\N
9569	14	5	17	\N	\N	\N	\N
9570	14	5	18	\N	\N	\N	\N
9571	14	5	19	\N	\N	\N	\N
9572	14	5	20	\N	\N	\N	\N
9573	14	5	21	\N	\N	\N	\N
9574	14	5	22	\N	\N	\N	\N
9575	14	5	23	\N	\N	\N	\N
9576	14	5	24	\N	\N	\N	\N
9577	14	5	25	\N	\N	\N	\N
9578	14	5	26	\N	\N	\N	\N
9579	14	5	27	\N	\N	\N	\N
9580	14	5	28	\N	\N	\N	\N
9581	14	5	29	\N	\N	\N	\N
9582	14	5	30	\N	\N	\N	\N
9583	14	5	31	\N	\N	\N	\N
9584	14	5	32	\N	\N	\N	\N
9585	14	5	33	\N	\N	\N	\N
9586	14	5	34	\N	\N	\N	\N
9587	14	5	35	\N	\N	\N	\N
9588	14	5	36	\N	\N	\N	\N
9589	14	5	37	\N	\N	\N	\N
9590	14	5	38	\N	\N	\N	\N
9591	14	5	39	\N	\N	\N	\N
9592	14	5	40	\N	\N	\N	\N
9593	14	5	41	\N	\N	\N	\N
9594	14	5	42	\N	\N	\N	\N
9595	14	5	43	\N	\N	\N	\N
9596	14	5	44	\N	\N	\N	\N
9597	14	5	45	\N	\N	\N	\N
9598	14	5	46	\N	\N	\N	\N
9599	14	5	47	\N	\N	\N	\N
9600	14	5	48	\N	\N	\N	\N
9601	14	6	1	\N	\N	\N	\N
9602	14	6	2	\N	\N	\N	\N
9603	14	6	3	\N	\N	\N	\N
9604	14	6	4	\N	\N	\N	\N
9605	14	6	5	\N	\N	\N	\N
9606	14	6	6	\N	\N	\N	\N
9607	14	6	7	\N	\N	\N	\N
9608	14	6	8	\N	\N	\N	\N
9609	14	6	9	\N	\N	\N	\N
9610	14	6	10	\N	\N	\N	\N
9611	14	6	11	\N	\N	\N	\N
9612	14	6	12	\N	\N	\N	\N
9613	14	6	13	\N	\N	\N	\N
9614	14	6	14	\N	\N	\N	\N
9615	14	6	15	\N	\N	\N	\N
9616	14	6	16	\N	\N	\N	\N
9617	14	6	17	\N	\N	\N	\N
9618	14	6	18	\N	\N	\N	\N
9619	14	6	19	\N	\N	\N	\N
9620	14	6	20	\N	\N	\N	\N
9621	14	6	21	\N	\N	\N	\N
9622	14	6	22	\N	\N	\N	\N
9623	14	6	23	\N	\N	\N	\N
9624	14	6	24	\N	\N	\N	\N
9625	14	6	25	\N	\N	\N	\N
9626	14	6	26	\N	\N	\N	\N
9627	14	6	27	\N	\N	\N	\N
9628	14	6	28	\N	\N	\N	\N
9629	14	6	29	\N	\N	\N	\N
9630	14	6	30	\N	\N	\N	\N
9631	14	6	31	\N	\N	\N	\N
9632	14	6	32	\N	\N	\N	\N
9633	14	6	33	\N	\N	\N	\N
9634	14	6	34	\N	\N	\N	\N
9635	14	6	35	\N	\N	\N	\N
9636	14	6	36	\N	\N	\N	\N
9637	14	6	37	\N	\N	\N	\N
9638	14	6	38	\N	\N	\N	\N
9639	14	6	39	\N	\N	\N	\N
9640	14	6	40	\N	\N	\N	\N
9641	14	6	41	\N	\N	\N	\N
9642	14	6	42	\N	\N	\N	\N
9643	14	6	43	\N	\N	\N	\N
9644	14	6	44	\N	\N	\N	\N
9645	14	6	45	\N	\N	\N	\N
9646	14	6	46	\N	\N	\N	\N
9647	14	6	47	\N	\N	\N	\N
9648	14	6	48	\N	\N	\N	\N
9649	14	7	1	\N	\N	\N	\N
9650	14	7	2	\N	\N	\N	\N
9651	14	7	3	\N	\N	\N	\N
9652	14	7	4	\N	\N	\N	\N
9653	14	7	5	\N	\N	\N	\N
9654	14	7	6	\N	\N	\N	\N
9655	14	7	7	\N	\N	\N	\N
9656	14	7	8	\N	\N	\N	\N
9657	14	7	9	\N	\N	\N	\N
9658	14	7	10	\N	\N	\N	\N
9659	14	7	11	\N	\N	\N	\N
9660	14	7	12	\N	\N	\N	\N
9661	14	7	13	\N	\N	\N	\N
9662	14	7	14	\N	\N	\N	\N
9663	14	7	15	\N	\N	\N	\N
9664	14	7	16	\N	\N	\N	\N
9665	14	7	17	\N	\N	\N	\N
9666	14	7	18	\N	\N	\N	\N
9667	14	7	19	\N	\N	\N	\N
9668	14	7	20	\N	\N	\N	\N
9669	14	7	21	\N	\N	\N	\N
9670	14	7	22	\N	\N	\N	\N
9671	14	7	23	\N	\N	\N	\N
9672	14	7	24	\N	\N	\N	\N
9673	14	7	25	\N	\N	\N	\N
9674	14	7	26	\N	\N	\N	\N
9675	14	7	27	\N	\N	\N	\N
9676	14	7	28	\N	\N	\N	\N
9677	14	7	29	\N	\N	\N	\N
9678	14	7	30	\N	\N	\N	\N
9679	14	7	31	\N	\N	\N	\N
9680	14	7	32	\N	\N	\N	\N
9681	14	7	33	\N	\N	\N	\N
9682	14	7	34	\N	\N	\N	\N
9683	14	7	35	\N	\N	\N	\N
9684	14	7	36	\N	\N	\N	\N
9685	14	7	37	\N	\N	\N	\N
9686	14	7	38	\N	\N	\N	\N
9687	14	7	39	\N	\N	\N	\N
9688	14	7	40	\N	\N	\N	\N
9689	14	7	41	\N	\N	\N	\N
9690	14	7	42	\N	\N	\N	\N
9691	14	7	43	\N	\N	\N	\N
9692	14	7	44	\N	\N	\N	\N
9693	14	7	45	\N	\N	\N	\N
9694	14	7	46	\N	\N	\N	\N
9695	14	7	47	\N	\N	\N	\N
9696	14	7	48	\N	\N	\N	\N
9697	14	8	1	\N	\N	\N	\N
9698	14	8	2	\N	\N	\N	\N
9699	14	8	3	\N	\N	\N	\N
9700	14	8	4	\N	\N	\N	\N
9701	14	8	5	\N	\N	\N	\N
9702	14	8	6	\N	\N	\N	\N
9703	14	8	7	\N	\N	\N	\N
9704	14	8	8	\N	\N	\N	\N
9705	14	8	9	\N	\N	\N	\N
9706	14	8	10	\N	\N	\N	\N
9707	14	8	11	\N	\N	\N	\N
9708	14	8	12	\N	\N	\N	\N
9709	14	8	13	\N	\N	\N	\N
9710	14	8	14	\N	\N	\N	\N
9711	14	8	15	\N	\N	\N	\N
9712	14	8	16	\N	\N	\N	\N
9713	14	8	17	\N	\N	\N	\N
9714	14	8	18	\N	\N	\N	\N
9715	14	8	19	\N	\N	\N	\N
9716	14	8	20	\N	\N	\N	\N
9717	14	8	21	\N	\N	\N	\N
9718	14	8	22	\N	\N	\N	\N
9719	14	8	23	\N	\N	\N	\N
9720	14	8	24	\N	\N	\N	\N
9721	14	8	25	\N	\N	\N	\N
9722	14	8	26	\N	\N	\N	\N
9723	14	8	27	\N	\N	\N	\N
9724	14	8	28	\N	\N	\N	\N
9725	14	8	29	\N	\N	\N	\N
9726	14	8	30	\N	\N	\N	\N
9727	14	8	31	\N	\N	\N	\N
9728	14	8	32	\N	\N	\N	\N
9729	14	8	33	\N	\N	\N	\N
9730	14	8	34	\N	\N	\N	\N
9731	14	8	35	\N	\N	\N	\N
9732	14	8	36	\N	\N	\N	\N
9733	14	8	37	\N	\N	\N	\N
9734	14	8	38	\N	\N	\N	\N
9735	14	8	39	\N	\N	\N	\N
9736	14	8	40	\N	\N	\N	\N
9737	14	8	41	\N	\N	\N	\N
9738	14	8	42	\N	\N	\N	\N
9739	14	8	43	\N	\N	\N	\N
9740	14	8	44	\N	\N	\N	\N
9741	14	8	45	\N	\N	\N	\N
9742	14	8	46	\N	\N	\N	\N
9743	14	8	47	\N	\N	\N	\N
9744	14	8	48	\N	\N	\N	\N
9745	14	9	1	\N	\N	\N	\N
9746	14	9	2	\N	\N	\N	\N
9747	14	9	3	\N	\N	\N	\N
9748	14	9	4	\N	\N	\N	\N
9749	14	9	5	\N	\N	\N	\N
9750	14	9	6	\N	\N	\N	\N
9751	14	9	7	\N	\N	\N	\N
9752	14	9	8	\N	\N	\N	\N
9753	14	9	9	\N	\N	\N	\N
9754	14	9	10	\N	\N	\N	\N
9755	14	9	11	\N	\N	\N	\N
9756	14	9	12	\N	\N	\N	\N
9757	14	9	13	\N	\N	\N	\N
9758	14	9	14	\N	\N	\N	\N
9759	14	9	15	\N	\N	\N	\N
9760	14	9	16	\N	\N	\N	\N
9761	14	9	17	\N	\N	\N	\N
9762	14	9	18	\N	\N	\N	\N
9763	14	9	19	\N	\N	\N	\N
9764	14	9	20	\N	\N	\N	\N
9765	14	9	21	\N	\N	\N	\N
9766	14	9	22	\N	\N	\N	\N
9767	14	9	23	\N	\N	\N	\N
9768	14	9	24	\N	\N	\N	\N
9769	14	9	25	\N	\N	\N	\N
9770	14	9	26	\N	\N	\N	\N
9771	14	9	27	\N	\N	\N	\N
9772	14	9	28	\N	\N	\N	\N
9773	14	9	29	\N	\N	\N	\N
9774	14	9	30	\N	\N	\N	\N
9775	14	9	31	\N	\N	\N	\N
9776	14	9	32	\N	\N	\N	\N
9777	14	9	33	\N	\N	\N	\N
9778	14	9	34	\N	\N	\N	\N
9779	14	9	35	\N	\N	\N	\N
9780	14	9	36	\N	\N	\N	\N
9781	14	9	37	\N	\N	\N	\N
9782	14	9	38	\N	\N	\N	\N
9783	14	9	39	\N	\N	\N	\N
9784	14	9	40	\N	\N	\N	\N
9785	14	9	41	\N	\N	\N	\N
9786	14	9	42	\N	\N	\N	\N
9787	14	9	43	\N	\N	\N	\N
9788	14	9	44	\N	\N	\N	\N
9789	14	9	45	\N	\N	\N	\N
9790	14	9	46	\N	\N	\N	\N
9791	14	9	47	\N	\N	\N	\N
9792	14	9	48	\N	\N	\N	\N
9793	14	10	1	\N	\N	\N	\N
9794	14	10	2	\N	\N	\N	\N
9795	14	10	3	\N	\N	\N	\N
9796	14	10	4	\N	\N	\N	\N
9797	14	10	5	\N	\N	\N	\N
9798	14	10	6	\N	\N	\N	\N
9799	14	10	7	\N	\N	\N	\N
9800	14	10	8	\N	\N	\N	\N
9801	14	10	9	\N	\N	\N	\N
9802	14	10	10	\N	\N	\N	\N
9803	14	10	11	\N	\N	\N	\N
9804	14	10	12	\N	\N	\N	\N
9805	14	10	13	\N	\N	\N	\N
9806	14	10	14	\N	\N	\N	\N
9807	14	10	15	\N	\N	\N	\N
9808	14	10	16	\N	\N	\N	\N
9809	14	10	17	\N	\N	\N	\N
9810	14	10	18	\N	\N	\N	\N
9811	14	10	19	\N	\N	\N	\N
9812	14	10	20	\N	\N	\N	\N
9813	14	10	21	\N	\N	\N	\N
9814	14	10	22	\N	\N	\N	\N
9815	14	10	23	\N	\N	\N	\N
9816	14	10	24	\N	\N	\N	\N
9817	14	10	25	\N	\N	\N	\N
9818	14	10	26	\N	\N	\N	\N
9819	14	10	27	\N	\N	\N	\N
9820	14	10	28	\N	\N	\N	\N
9821	14	10	29	\N	\N	\N	\N
9822	14	10	30	\N	\N	\N	\N
9823	14	10	31	\N	\N	\N	\N
9824	14	10	32	\N	\N	\N	\N
9825	14	10	33	\N	\N	\N	\N
9826	14	10	34	\N	\N	\N	\N
9827	14	10	35	\N	\N	\N	\N
9828	14	10	36	\N	\N	\N	\N
9829	14	10	37	\N	\N	\N	\N
9830	14	10	38	\N	\N	\N	\N
9831	14	10	39	\N	\N	\N	\N
9832	14	10	40	\N	\N	\N	\N
9833	14	10	41	\N	\N	\N	\N
9834	14	10	42	\N	\N	\N	\N
9835	14	10	43	\N	\N	\N	\N
9836	14	10	44	\N	\N	\N	\N
9837	14	10	45	\N	\N	\N	\N
9838	14	10	46	\N	\N	\N	\N
9839	14	10	47	\N	\N	\N	\N
9840	14	10	48	\N	\N	\N	\N
9841	14	11	1	\N	\N	\N	\N
9842	14	11	2	\N	\N	\N	\N
9843	14	11	3	\N	\N	\N	\N
9844	14	11	4	\N	\N	\N	\N
9845	14	11	5	\N	\N	\N	\N
9846	14	11	6	\N	\N	\N	\N
9847	14	11	7	\N	\N	\N	\N
9848	14	11	8	\N	\N	\N	\N
9849	14	11	9	\N	\N	\N	\N
9850	14	11	10	\N	\N	\N	\N
9851	14	11	11	\N	\N	\N	\N
9852	14	11	12	\N	\N	\N	\N
9853	14	11	13	\N	\N	\N	\N
9854	14	11	14	\N	\N	\N	\N
9855	14	11	15	\N	\N	\N	\N
9856	14	11	16	\N	\N	\N	\N
9857	14	11	17	\N	\N	\N	\N
9858	14	11	18	\N	\N	\N	\N
9859	14	11	19	\N	\N	\N	\N
9860	14	11	20	\N	\N	\N	\N
9861	14	11	21	\N	\N	\N	\N
9862	14	11	22	\N	\N	\N	\N
9863	14	11	23	\N	\N	\N	\N
9864	14	11	24	\N	\N	\N	\N
9865	14	11	25	\N	\N	\N	\N
9866	14	11	26	\N	\N	\N	\N
9867	14	11	27	\N	\N	\N	\N
9868	14	11	28	\N	\N	\N	\N
9869	14	11	29	\N	\N	\N	\N
9870	14	11	30	\N	\N	\N	\N
9871	14	11	31	\N	\N	\N	\N
9872	14	11	32	\N	\N	\N	\N
9873	14	11	33	\N	\N	\N	\N
9874	14	11	34	\N	\N	\N	\N
9875	14	11	35	\N	\N	\N	\N
9876	14	11	36	\N	\N	\N	\N
9877	14	11	37	\N	\N	\N	\N
9878	14	11	38	\N	\N	\N	\N
9879	14	11	39	\N	\N	\N	\N
9880	14	11	40	\N	\N	\N	\N
9881	14	11	41	\N	\N	\N	\N
9882	14	11	42	\N	\N	\N	\N
9883	14	11	43	\N	\N	\N	\N
9884	14	11	44	\N	\N	\N	\N
9885	14	11	45	\N	\N	\N	\N
9886	14	11	46	\N	\N	\N	\N
9887	14	11	47	\N	\N	\N	\N
9888	14	11	48	\N	\N	\N	\N
9889	14	12	1	\N	\N	\N	\N
9890	14	12	2	\N	\N	\N	\N
9891	14	12	3	\N	\N	\N	\N
9892	14	12	4	\N	\N	\N	\N
9893	14	12	5	\N	\N	\N	\N
9894	14	12	6	\N	\N	\N	\N
9895	14	12	7	\N	\N	\N	\N
9896	14	12	8	\N	\N	\N	\N
9897	14	12	9	\N	\N	\N	\N
9898	14	12	10	\N	\N	\N	\N
9899	14	12	11	\N	\N	\N	\N
9900	14	12	12	\N	\N	\N	\N
9901	14	12	13	\N	\N	\N	\N
9902	14	12	14	\N	\N	\N	\N
9903	14	12	15	\N	\N	\N	\N
9904	14	12	16	\N	\N	\N	\N
9905	14	12	17	\N	\N	\N	\N
9906	14	12	18	\N	\N	\N	\N
9907	14	12	19	\N	\N	\N	\N
9908	14	12	20	\N	\N	\N	\N
9909	14	12	21	\N	\N	\N	\N
9910	14	12	22	\N	\N	\N	\N
9911	14	12	23	\N	\N	\N	\N
9912	14	12	24	\N	\N	\N	\N
9913	14	12	25	\N	\N	\N	\N
9914	14	12	26	\N	\N	\N	\N
9915	14	12	27	\N	\N	\N	\N
9916	14	12	28	\N	\N	\N	\N
9917	14	12	29	\N	\N	\N	\N
9918	14	12	30	\N	\N	\N	\N
9919	14	12	31	\N	\N	\N	\N
9920	14	12	32	\N	\N	\N	\N
9921	14	12	33	\N	\N	\N	\N
9922	14	12	34	\N	\N	\N	\N
9923	14	12	35	\N	\N	\N	\N
9924	14	12	36	\N	\N	\N	\N
9925	14	12	37	\N	\N	\N	\N
9926	14	12	38	\N	\N	\N	\N
9927	14	12	39	\N	\N	\N	\N
9928	14	12	40	\N	\N	\N	\N
9929	14	12	41	\N	\N	\N	\N
9930	14	12	42	\N	\N	\N	\N
9931	14	12	43	\N	\N	\N	\N
9932	14	12	44	\N	\N	\N	\N
9933	14	12	45	\N	\N	\N	\N
9934	14	12	46	\N	\N	\N	\N
9935	14	12	47	\N	\N	\N	\N
9936	14	12	48	\N	\N	\N	\N
9937	14	13	1	\N	\N	\N	\N
9938	14	13	2	\N	\N	\N	\N
9939	14	13	3	\N	\N	\N	\N
9940	14	13	4	\N	\N	\N	\N
9941	14	13	5	\N	\N	\N	\N
9942	14	13	6	\N	\N	\N	\N
9943	14	13	7	\N	\N	\N	\N
9944	14	13	8	\N	\N	\N	\N
9945	14	13	9	\N	\N	\N	\N
9946	14	13	10	\N	\N	\N	\N
9947	14	13	11	\N	\N	\N	\N
9948	14	13	12	\N	\N	\N	\N
9949	14	13	13	\N	\N	\N	\N
9950	14	13	14	\N	\N	\N	\N
9951	14	13	15	\N	\N	\N	\N
9952	14	13	16	\N	\N	\N	\N
9953	14	13	17	\N	\N	\N	\N
9954	14	13	18	\N	\N	\N	\N
9955	14	13	19	\N	\N	\N	\N
9956	14	13	20	\N	\N	\N	\N
9957	14	13	21	\N	\N	\N	\N
9958	14	13	22	\N	\N	\N	\N
9959	14	13	23	\N	\N	\N	\N
9960	14	13	24	\N	\N	\N	\N
9961	14	13	25	\N	\N	\N	\N
9962	14	13	26	\N	\N	\N	\N
9963	14	13	27	\N	\N	\N	\N
9964	14	13	28	\N	\N	\N	\N
9965	14	13	29	\N	\N	\N	\N
9966	14	13	30	\N	\N	\N	\N
9967	14	13	31	\N	\N	\N	\N
9968	14	13	32	\N	\N	\N	\N
9969	14	13	33	\N	\N	\N	\N
9970	14	13	34	\N	\N	\N	\N
9971	14	13	35	\N	\N	\N	\N
9972	14	13	36	\N	\N	\N	\N
9973	14	13	37	\N	\N	\N	\N
9974	14	13	38	\N	\N	\N	\N
9975	14	13	39	\N	\N	\N	\N
9976	14	13	40	\N	\N	\N	\N
9977	14	13	41	\N	\N	\N	\N
9978	14	13	42	\N	\N	\N	\N
9979	14	13	43	\N	\N	\N	\N
9980	14	13	44	\N	\N	\N	\N
9981	14	13	45	\N	\N	\N	\N
9982	14	13	46	\N	\N	\N	\N
9983	14	13	47	\N	\N	\N	\N
9984	14	13	48	\N	\N	\N	\N
9985	14	14	1	\N	\N	\N	\N
9986	14	14	2	\N	\N	\N	\N
9987	14	14	3	\N	\N	\N	\N
9988	14	14	4	\N	\N	\N	\N
9989	14	14	5	\N	\N	\N	\N
9990	14	14	6	\N	\N	\N	\N
9991	14	14	7	\N	\N	\N	\N
9992	14	14	8	\N	\N	\N	\N
9993	14	14	9	\N	\N	\N	\N
9994	14	14	10	\N	\N	\N	\N
9995	14	14	11	\N	\N	\N	\N
9996	14	14	12	\N	\N	\N	\N
9997	14	14	13	\N	\N	\N	\N
9998	14	14	14	\N	\N	\N	\N
9999	14	14	15	\N	\N	\N	\N
10000	14	14	16	\N	\N	\N	\N
10001	14	14	17	\N	\N	\N	\N
10002	14	14	18	\N	\N	\N	\N
10003	14	14	19	\N	\N	\N	\N
10004	14	14	20	\N	\N	\N	\N
10005	14	14	21	\N	\N	\N	\N
10006	14	14	22	\N	\N	\N	\N
10007	14	14	23	\N	\N	\N	\N
10008	14	14	24	\N	\N	\N	\N
10009	14	14	25	\N	\N	\N	\N
10010	14	14	26	\N	\N	\N	\N
10011	14	14	27	\N	\N	\N	\N
10012	14	14	28	\N	\N	\N	\N
10013	14	14	29	\N	\N	\N	\N
10014	14	14	30	\N	\N	\N	\N
10015	14	14	31	\N	\N	\N	\N
10016	14	14	32	\N	\N	\N	\N
10017	14	14	33	\N	\N	\N	\N
10018	14	14	34	\N	\N	\N	\N
10019	14	14	35	\N	\N	\N	\N
10020	14	14	36	\N	\N	\N	\N
10021	14	14	37	\N	\N	\N	\N
10022	14	14	38	\N	\N	\N	\N
10023	14	14	39	\N	\N	\N	\N
10024	14	14	40	\N	\N	\N	\N
10025	14	14	41	\N	\N	\N	\N
10026	14	14	42	\N	\N	\N	\N
10027	14	14	43	\N	\N	\N	\N
10028	14	14	44	\N	\N	\N	\N
10029	14	14	45	\N	\N	\N	\N
10030	14	14	46	\N	\N	\N	\N
10031	14	14	47	\N	\N	\N	\N
10032	14	14	48	\N	\N	\N	\N
10033	14	15	1	\N	\N	\N	\N
10034	14	15	2	\N	\N	\N	\N
10035	14	15	3	\N	\N	\N	\N
10036	14	15	4	\N	\N	\N	\N
10037	14	15	5	\N	\N	\N	\N
10038	14	15	6	\N	\N	\N	\N
10039	14	15	7	\N	\N	\N	\N
10040	14	15	8	\N	\N	\N	\N
10041	14	15	9	\N	\N	\N	\N
10042	14	15	10	\N	\N	\N	\N
10043	14	15	11	\N	\N	\N	\N
10044	14	15	12	\N	\N	\N	\N
10045	14	15	13	\N	\N	\N	\N
10046	14	15	14	\N	\N	\N	\N
10047	14	15	15	\N	\N	\N	\N
10048	14	15	16	\N	\N	\N	\N
10049	14	15	17	\N	\N	\N	\N
10050	14	15	18	\N	\N	\N	\N
10051	14	15	19	\N	\N	\N	\N
10052	14	15	20	\N	\N	\N	\N
10053	14	15	21	\N	\N	\N	\N
10054	14	15	22	\N	\N	\N	\N
10055	14	15	23	\N	\N	\N	\N
10056	14	15	24	\N	\N	\N	\N
10057	14	15	25	\N	\N	\N	\N
10058	14	15	26	\N	\N	\N	\N
10059	14	15	27	\N	\N	\N	\N
10060	14	15	28	\N	\N	\N	\N
10061	14	15	29	\N	\N	\N	\N
10062	14	15	30	\N	\N	\N	\N
10063	14	15	31	\N	\N	\N	\N
10064	14	15	32	\N	\N	\N	\N
10065	14	15	33	\N	\N	\N	\N
10066	14	15	34	\N	\N	\N	\N
10067	14	15	35	\N	\N	\N	\N
10068	14	15	36	\N	\N	\N	\N
10069	14	15	37	\N	\N	\N	\N
10070	14	15	38	\N	\N	\N	\N
10071	14	15	39	\N	\N	\N	\N
10072	14	15	40	\N	\N	\N	\N
10073	14	15	41	\N	\N	\N	\N
10074	14	15	42	\N	\N	\N	\N
10075	14	15	43	\N	\N	\N	\N
10076	14	15	44	\N	\N	\N	\N
10077	14	15	45	\N	\N	\N	\N
10078	14	15	46	\N	\N	\N	\N
10079	14	15	47	\N	\N	\N	\N
10080	14	15	48	\N	\N	\N	\N
10081	15	1	1	\N	\N	\N	\N
10082	15	1	2	\N	\N	\N	\N
10083	15	1	3	\N	\N	\N	\N
10084	15	1	4	\N	\N	\N	\N
10085	15	1	5	\N	\N	\N	\N
10086	15	1	6	\N	\N	\N	\N
10087	15	1	7	\N	\N	\N	\N
10088	15	1	8	\N	\N	\N	\N
10089	15	1	9	\N	\N	\N	\N
10090	15	1	10	\N	\N	\N	\N
10091	15	1	11	\N	\N	\N	\N
10092	15	1	12	\N	\N	\N	\N
10093	15	1	13	\N	\N	\N	\N
10094	15	1	14	\N	\N	\N	\N
10095	15	1	15	\N	\N	\N	\N
10096	15	1	16	\N	\N	\N	\N
10097	15	1	17	\N	\N	\N	\N
10098	15	1	18	\N	\N	\N	\N
10099	15	1	19	\N	\N	\N	\N
10100	15	1	20	\N	\N	\N	\N
10101	15	1	21	\N	\N	\N	\N
10102	15	1	22	\N	\N	\N	\N
10103	15	1	23	\N	\N	\N	\N
10104	15	1	24	\N	\N	\N	\N
10105	15	1	25	\N	\N	\N	\N
10106	15	1	26	\N	\N	\N	\N
10107	15	1	27	\N	\N	\N	\N
10108	15	1	28	\N	\N	\N	\N
10109	15	1	29	\N	\N	\N	\N
10110	15	1	30	\N	\N	\N	\N
10111	15	1	31	\N	\N	\N	\N
10112	15	1	32	\N	\N	\N	\N
10113	15	1	33	\N	\N	\N	\N
10114	15	1	34	\N	\N	\N	\N
10115	15	1	35	\N	\N	\N	\N
10116	15	1	36	\N	\N	\N	\N
10117	15	1	37	\N	\N	\N	\N
10118	15	1	38	\N	\N	\N	\N
10119	15	1	39	\N	\N	\N	\N
10120	15	1	40	\N	\N	\N	\N
10121	15	1	41	\N	\N	\N	\N
10122	15	1	42	\N	\N	\N	\N
10123	15	1	43	\N	\N	\N	\N
10124	15	1	44	\N	\N	\N	\N
10125	15	1	45	\N	\N	\N	\N
10126	15	1	46	\N	\N	\N	\N
10127	15	1	47	\N	\N	\N	\N
10128	15	1	48	\N	\N	\N	\N
10129	15	2	1	\N	\N	\N	\N
10130	15	2	2	\N	\N	\N	\N
10131	15	2	3	\N	\N	\N	\N
10132	15	2	4	\N	\N	\N	\N
10133	15	2	5	\N	\N	\N	\N
10134	15	2	6	\N	\N	\N	\N
10135	15	2	7	\N	\N	\N	\N
10136	15	2	8	\N	\N	\N	\N
10137	15	2	9	\N	\N	\N	\N
10138	15	2	10	\N	\N	\N	\N
10139	15	2	11	\N	\N	\N	\N
10140	15	2	12	\N	\N	\N	\N
10141	15	2	13	\N	\N	\N	\N
10142	15	2	14	\N	\N	\N	\N
10143	15	2	15	\N	\N	\N	\N
10144	15	2	16	\N	\N	\N	\N
10145	15	2	17	\N	\N	\N	\N
10146	15	2	18	\N	\N	\N	\N
10147	15	2	19	\N	\N	\N	\N
10148	15	2	20	\N	\N	\N	\N
10149	15	2	21	\N	\N	\N	\N
10150	15	2	22	\N	\N	\N	\N
10151	15	2	23	\N	\N	\N	\N
10152	15	2	24	\N	\N	\N	\N
10153	15	2	25	\N	\N	\N	\N
10154	15	2	26	\N	\N	\N	\N
10155	15	2	27	\N	\N	\N	\N
10156	15	2	28	\N	\N	\N	\N
10157	15	2	29	\N	\N	\N	\N
10158	15	2	30	\N	\N	\N	\N
10159	15	2	31	\N	\N	\N	\N
10160	15	2	32	\N	\N	\N	\N
10161	15	2	33	\N	\N	\N	\N
10162	15	2	34	\N	\N	\N	\N
10163	15	2	35	\N	\N	\N	\N
10164	15	2	36	\N	\N	\N	\N
10165	15	2	37	\N	\N	\N	\N
10166	15	2	38	\N	\N	\N	\N
10167	15	2	39	\N	\N	\N	\N
10168	15	2	40	\N	\N	\N	\N
10169	15	2	41	\N	\N	\N	\N
10170	15	2	42	\N	\N	\N	\N
10171	15	2	43	\N	\N	\N	\N
10172	15	2	44	\N	\N	\N	\N
10173	15	2	45	\N	\N	\N	\N
10174	15	2	46	\N	\N	\N	\N
10175	15	2	47	\N	\N	\N	\N
10176	15	2	48	\N	\N	\N	\N
10177	15	3	1	\N	\N	\N	\N
10178	15	3	2	\N	\N	\N	\N
10179	15	3	3	\N	\N	\N	\N
10180	15	3	4	\N	\N	\N	\N
10181	15	3	5	\N	\N	\N	\N
10182	15	3	6	\N	\N	\N	\N
10183	15	3	7	\N	\N	\N	\N
10184	15	3	8	\N	\N	\N	\N
10185	15	3	9	\N	\N	\N	\N
10186	15	3	10	\N	\N	\N	\N
10187	15	3	11	\N	\N	\N	\N
10188	15	3	12	\N	\N	\N	\N
10189	15	3	13	\N	\N	\N	\N
10190	15	3	14	\N	\N	\N	\N
10191	15	3	15	\N	\N	\N	\N
10192	15	3	16	\N	\N	\N	\N
10193	15	3	17	\N	\N	\N	\N
10194	15	3	18	\N	\N	\N	\N
10195	15	3	19	\N	\N	\N	\N
10196	15	3	20	\N	\N	\N	\N
10197	15	3	21	\N	\N	\N	\N
10198	15	3	22	\N	\N	\N	\N
10199	15	3	23	\N	\N	\N	\N
10200	15	3	24	\N	\N	\N	\N
10201	15	3	25	\N	\N	\N	\N
10202	15	3	26	\N	\N	\N	\N
10203	15	3	27	\N	\N	\N	\N
10204	15	3	28	\N	\N	\N	\N
10205	15	3	29	\N	\N	\N	\N
10206	15	3	30	\N	\N	\N	\N
10207	15	3	31	\N	\N	\N	\N
10208	15	3	32	\N	\N	\N	\N
10209	15	3	33	\N	\N	\N	\N
10210	15	3	34	\N	\N	\N	\N
10211	15	3	35	\N	\N	\N	\N
10212	15	3	36	\N	\N	\N	\N
10213	15	3	37	\N	\N	\N	\N
10214	15	3	38	\N	\N	\N	\N
10215	15	3	39	\N	\N	\N	\N
10216	15	3	40	\N	\N	\N	\N
10217	15	3	41	\N	\N	\N	\N
10218	15	3	42	\N	\N	\N	\N
10219	15	3	43	\N	\N	\N	\N
10220	15	3	44	\N	\N	\N	\N
10221	15	3	45	\N	\N	\N	\N
10222	15	3	46	\N	\N	\N	\N
10223	15	3	47	\N	\N	\N	\N
10224	15	3	48	\N	\N	\N	\N
10225	15	4	1	\N	\N	\N	\N
10226	15	4	2	\N	\N	\N	\N
10227	15	4	3	\N	\N	\N	\N
10228	15	4	4	\N	\N	\N	\N
10229	15	4	5	\N	\N	\N	\N
10230	15	4	6	\N	\N	\N	\N
10231	15	4	7	\N	\N	\N	\N
10232	15	4	8	\N	\N	\N	\N
10233	15	4	9	\N	\N	\N	\N
10234	15	4	10	\N	\N	\N	\N
10235	15	4	11	\N	\N	\N	\N
10236	15	4	12	\N	\N	\N	\N
10237	15	4	13	\N	\N	\N	\N
10238	15	4	14	\N	\N	\N	\N
10239	15	4	15	\N	\N	\N	\N
10240	15	4	16	\N	\N	\N	\N
10241	15	4	17	\N	\N	\N	\N
10242	15	4	18	\N	\N	\N	\N
10243	15	4	19	\N	\N	\N	\N
10244	15	4	20	\N	\N	\N	\N
10245	15	4	21	\N	\N	\N	\N
10246	15	4	22	\N	\N	\N	\N
10247	15	4	23	\N	\N	\N	\N
10248	15	4	24	\N	\N	\N	\N
10249	15	4	25	\N	\N	\N	\N
10250	15	4	26	\N	\N	\N	\N
10251	15	4	27	\N	\N	\N	\N
10252	15	4	28	\N	\N	\N	\N
10253	15	4	29	\N	\N	\N	\N
10254	15	4	30	\N	\N	\N	\N
10255	15	4	31	\N	\N	\N	\N
10256	15	4	32	\N	\N	\N	\N
10257	15	4	33	\N	\N	\N	\N
10258	15	4	34	\N	\N	\N	\N
10259	15	4	35	\N	\N	\N	\N
10260	15	4	36	\N	\N	\N	\N
10261	15	4	37	\N	\N	\N	\N
10262	15	4	38	\N	\N	\N	\N
10263	15	4	39	\N	\N	\N	\N
10264	15	4	40	\N	\N	\N	\N
10265	15	4	41	\N	\N	\N	\N
10266	15	4	42	\N	\N	\N	\N
10267	15	4	43	\N	\N	\N	\N
10268	15	4	44	\N	\N	\N	\N
10269	15	4	45	\N	\N	\N	\N
10270	15	4	46	\N	\N	\N	\N
10271	15	4	47	\N	\N	\N	\N
10272	15	4	48	\N	\N	\N	\N
10273	15	5	1	\N	\N	\N	\N
10274	15	5	2	\N	\N	\N	\N
10275	15	5	3	\N	\N	\N	\N
10276	15	5	4	\N	\N	\N	\N
10277	15	5	5	\N	\N	\N	\N
10278	15	5	6	\N	\N	\N	\N
10279	15	5	7	\N	\N	\N	\N
10280	15	5	8	\N	\N	\N	\N
10281	15	5	9	\N	\N	\N	\N
10282	15	5	10	\N	\N	\N	\N
10283	15	5	11	\N	\N	\N	\N
10284	15	5	12	\N	\N	\N	\N
10285	15	5	13	\N	\N	\N	\N
10286	15	5	14	\N	\N	\N	\N
10287	15	5	15	\N	\N	\N	\N
10288	15	5	16	\N	\N	\N	\N
10289	15	5	17	\N	\N	\N	\N
10290	15	5	18	\N	\N	\N	\N
10291	15	5	19	\N	\N	\N	\N
10292	15	5	20	\N	\N	\N	\N
10293	15	5	21	\N	\N	\N	\N
10294	15	5	22	\N	\N	\N	\N
10295	15	5	23	\N	\N	\N	\N
10296	15	5	24	\N	\N	\N	\N
10297	15	5	25	\N	\N	\N	\N
10298	15	5	26	\N	\N	\N	\N
10299	15	5	27	\N	\N	\N	\N
10300	15	5	28	\N	\N	\N	\N
10301	15	5	29	\N	\N	\N	\N
10302	15	5	30	\N	\N	\N	\N
10303	15	5	31	\N	\N	\N	\N
10304	15	5	32	\N	\N	\N	\N
10305	15	5	33	\N	\N	\N	\N
10306	15	5	34	\N	\N	\N	\N
10307	15	5	35	\N	\N	\N	\N
10308	15	5	36	\N	\N	\N	\N
10309	15	5	37	\N	\N	\N	\N
10310	15	5	38	\N	\N	\N	\N
10311	15	5	39	\N	\N	\N	\N
10312	15	5	40	\N	\N	\N	\N
10313	15	5	41	\N	\N	\N	\N
10314	15	5	42	\N	\N	\N	\N
10315	15	5	43	\N	\N	\N	\N
10316	15	5	44	\N	\N	\N	\N
10317	15	5	45	\N	\N	\N	\N
10318	15	5	46	\N	\N	\N	\N
10319	15	5	47	\N	\N	\N	\N
10320	15	5	48	\N	\N	\N	\N
10321	15	6	1	\N	\N	\N	\N
10322	15	6	2	\N	\N	\N	\N
10323	15	6	3	\N	\N	\N	\N
10324	15	6	4	\N	\N	\N	\N
10325	15	6	5	\N	\N	\N	\N
10326	15	6	6	\N	\N	\N	\N
10327	15	6	7	\N	\N	\N	\N
10328	15	6	8	\N	\N	\N	\N
10329	15	6	9	\N	\N	\N	\N
10330	15	6	10	\N	\N	\N	\N
10331	15	6	11	\N	\N	\N	\N
10332	15	6	12	\N	\N	\N	\N
10333	15	6	13	\N	\N	\N	\N
10334	15	6	14	\N	\N	\N	\N
10335	15	6	15	\N	\N	\N	\N
10336	15	6	16	\N	\N	\N	\N
10337	15	6	17	\N	\N	\N	\N
10338	15	6	18	\N	\N	\N	\N
10339	15	6	19	\N	\N	\N	\N
10340	15	6	20	\N	\N	\N	\N
10341	15	6	21	\N	\N	\N	\N
10342	15	6	22	\N	\N	\N	\N
10343	15	6	23	\N	\N	\N	\N
10344	15	6	24	\N	\N	\N	\N
10345	15	6	25	\N	\N	\N	\N
10346	15	6	26	\N	\N	\N	\N
10347	15	6	27	\N	\N	\N	\N
10348	15	6	28	\N	\N	\N	\N
10349	15	6	29	\N	\N	\N	\N
10350	15	6	30	\N	\N	\N	\N
10351	15	6	31	\N	\N	\N	\N
10352	15	6	32	\N	\N	\N	\N
10353	15	6	33	\N	\N	\N	\N
10354	15	6	34	\N	\N	\N	\N
10355	15	6	35	\N	\N	\N	\N
10356	15	6	36	\N	\N	\N	\N
10357	15	6	37	\N	\N	\N	\N
10358	15	6	38	\N	\N	\N	\N
10359	15	6	39	\N	\N	\N	\N
10360	15	6	40	\N	\N	\N	\N
10361	15	6	41	\N	\N	\N	\N
10362	15	6	42	\N	\N	\N	\N
10363	15	6	43	\N	\N	\N	\N
10364	15	6	44	\N	\N	\N	\N
10365	15	6	45	\N	\N	\N	\N
10366	15	6	46	\N	\N	\N	\N
10367	15	6	47	\N	\N	\N	\N
10368	15	6	48	\N	\N	\N	\N
10369	15	7	1	\N	\N	\N	\N
10370	15	7	2	\N	\N	\N	\N
10371	15	7	3	\N	\N	\N	\N
10372	15	7	4	\N	\N	\N	\N
10373	15	7	5	\N	\N	\N	\N
10374	15	7	6	\N	\N	\N	\N
10375	15	7	7	\N	\N	\N	\N
10376	15	7	8	\N	\N	\N	\N
10377	15	7	9	\N	\N	\N	\N
10378	15	7	10	\N	\N	\N	\N
10379	15	7	11	\N	\N	\N	\N
10380	15	7	12	\N	\N	\N	\N
10381	15	7	13	\N	\N	\N	\N
10382	15	7	14	\N	\N	\N	\N
10383	15	7	15	\N	\N	\N	\N
10384	15	7	16	\N	\N	\N	\N
10385	15	7	17	\N	\N	\N	\N
10386	15	7	18	\N	\N	\N	\N
10387	15	7	19	\N	\N	\N	\N
10388	15	7	20	\N	\N	\N	\N
10389	15	7	21	\N	\N	\N	\N
10390	15	7	22	\N	\N	\N	\N
10391	15	7	23	\N	\N	\N	\N
10392	15	7	24	\N	\N	\N	\N
10393	15	7	25	\N	\N	\N	\N
10394	15	7	26	\N	\N	\N	\N
10395	15	7	27	\N	\N	\N	\N
10396	15	7	28	\N	\N	\N	\N
10397	15	7	29	\N	\N	\N	\N
10398	15	7	30	\N	\N	\N	\N
10399	15	7	31	\N	\N	\N	\N
10400	15	7	32	\N	\N	\N	\N
10401	15	7	33	\N	\N	\N	\N
10402	15	7	34	\N	\N	\N	\N
10403	15	7	35	\N	\N	\N	\N
10404	15	7	36	\N	\N	\N	\N
10405	15	7	37	\N	\N	\N	\N
10406	15	7	38	\N	\N	\N	\N
10407	15	7	39	\N	\N	\N	\N
10408	15	7	40	\N	\N	\N	\N
10409	15	7	41	\N	\N	\N	\N
10410	15	7	42	\N	\N	\N	\N
10411	15	7	43	\N	\N	\N	\N
10412	15	7	44	\N	\N	\N	\N
10413	15	7	45	\N	\N	\N	\N
10414	15	7	46	\N	\N	\N	\N
10415	15	7	47	\N	\N	\N	\N
10416	15	7	48	\N	\N	\N	\N
10417	15	8	1	\N	\N	\N	\N
10418	15	8	2	\N	\N	\N	\N
10419	15	8	3	\N	\N	\N	\N
10420	15	8	4	\N	\N	\N	\N
10421	15	8	5	\N	\N	\N	\N
10422	15	8	6	\N	\N	\N	\N
10423	15	8	7	\N	\N	\N	\N
10424	15	8	8	\N	\N	\N	\N
10425	15	8	9	\N	\N	\N	\N
10426	15	8	10	\N	\N	\N	\N
10427	15	8	11	\N	\N	\N	\N
10428	15	8	12	\N	\N	\N	\N
10429	15	8	13	\N	\N	\N	\N
10430	15	8	14	\N	\N	\N	\N
10431	15	8	15	\N	\N	\N	\N
10432	15	8	16	\N	\N	\N	\N
10433	15	8	17	\N	\N	\N	\N
10434	15	8	18	\N	\N	\N	\N
10435	15	8	19	\N	\N	\N	\N
10436	15	8	20	\N	\N	\N	\N
10437	15	8	21	\N	\N	\N	\N
10438	15	8	22	\N	\N	\N	\N
10439	15	8	23	\N	\N	\N	\N
10440	15	8	24	\N	\N	\N	\N
10441	15	8	25	\N	\N	\N	\N
10442	15	8	26	\N	\N	\N	\N
10443	15	8	27	\N	\N	\N	\N
10444	15	8	28	\N	\N	\N	\N
10445	15	8	29	\N	\N	\N	\N
10446	15	8	30	\N	\N	\N	\N
10447	15	8	31	\N	\N	\N	\N
10448	15	8	32	\N	\N	\N	\N
10449	15	8	33	\N	\N	\N	\N
10450	15	8	34	\N	\N	\N	\N
10451	15	8	35	\N	\N	\N	\N
10452	15	8	36	\N	\N	\N	\N
10453	15	8	37	\N	\N	\N	\N
10454	15	8	38	\N	\N	\N	\N
10455	15	8	39	\N	\N	\N	\N
10456	15	8	40	\N	\N	\N	\N
10457	15	8	41	\N	\N	\N	\N
10458	15	8	42	\N	\N	\N	\N
10459	15	8	43	\N	\N	\N	\N
10460	15	8	44	\N	\N	\N	\N
10461	15	8	45	\N	\N	\N	\N
10462	15	8	46	\N	\N	\N	\N
10463	15	8	47	\N	\N	\N	\N
10464	15	8	48	\N	\N	\N	\N
10465	15	9	1	\N	\N	\N	\N
10466	15	9	2	\N	\N	\N	\N
10467	15	9	3	\N	\N	\N	\N
10468	15	9	4	\N	\N	\N	\N
10469	15	9	5	\N	\N	\N	\N
10470	15	9	6	\N	\N	\N	\N
10471	15	9	7	\N	\N	\N	\N
10472	15	9	8	\N	\N	\N	\N
10473	15	9	9	\N	\N	\N	\N
10474	15	9	10	\N	\N	\N	\N
10475	15	9	11	\N	\N	\N	\N
10476	15	9	12	\N	\N	\N	\N
10477	15	9	13	\N	\N	\N	\N
10478	15	9	14	\N	\N	\N	\N
10479	15	9	15	\N	\N	\N	\N
10480	15	9	16	\N	\N	\N	\N
10481	15	9	17	\N	\N	\N	\N
10482	15	9	18	\N	\N	\N	\N
10483	15	9	19	\N	\N	\N	\N
10484	15	9	20	\N	\N	\N	\N
10485	15	9	21	\N	\N	\N	\N
10486	15	9	22	\N	\N	\N	\N
10487	15	9	23	\N	\N	\N	\N
10488	15	9	24	\N	\N	\N	\N
10489	15	9	25	\N	\N	\N	\N
10490	15	9	26	\N	\N	\N	\N
10491	15	9	27	\N	\N	\N	\N
10492	15	9	28	\N	\N	\N	\N
10493	15	9	29	\N	\N	\N	\N
10494	15	9	30	\N	\N	\N	\N
10495	15	9	31	\N	\N	\N	\N
10496	15	9	32	\N	\N	\N	\N
10497	15	9	33	\N	\N	\N	\N
10498	15	9	34	\N	\N	\N	\N
10499	15	9	35	\N	\N	\N	\N
10500	15	9	36	\N	\N	\N	\N
10501	15	9	37	\N	\N	\N	\N
10502	15	9	38	\N	\N	\N	\N
10503	15	9	39	\N	\N	\N	\N
10504	15	9	40	\N	\N	\N	\N
10505	15	9	41	\N	\N	\N	\N
10506	15	9	42	\N	\N	\N	\N
10507	15	9	43	\N	\N	\N	\N
10508	15	9	44	\N	\N	\N	\N
10509	15	9	45	\N	\N	\N	\N
10510	15	9	46	\N	\N	\N	\N
10511	15	9	47	\N	\N	\N	\N
10512	15	9	48	\N	\N	\N	\N
10513	15	10	1	\N	\N	\N	\N
10514	15	10	2	\N	\N	\N	\N
10515	15	10	3	\N	\N	\N	\N
10516	15	10	4	\N	\N	\N	\N
10517	15	10	5	\N	\N	\N	\N
10518	15	10	6	\N	\N	\N	\N
10519	15	10	7	\N	\N	\N	\N
10520	15	10	8	\N	\N	\N	\N
10521	15	10	9	\N	\N	\N	\N
10522	15	10	10	\N	\N	\N	\N
10523	15	10	11	\N	\N	\N	\N
10524	15	10	12	\N	\N	\N	\N
10525	15	10	13	\N	\N	\N	\N
10526	15	10	14	\N	\N	\N	\N
10527	15	10	15	\N	\N	\N	\N
10528	15	10	16	\N	\N	\N	\N
10529	15	10	17	\N	\N	\N	\N
10530	15	10	18	\N	\N	\N	\N
10531	15	10	19	\N	\N	\N	\N
10532	15	10	20	\N	\N	\N	\N
10533	15	10	21	\N	\N	\N	\N
10534	15	10	22	\N	\N	\N	\N
10535	15	10	23	\N	\N	\N	\N
10536	15	10	24	\N	\N	\N	\N
10537	15	10	25	\N	\N	\N	\N
10538	15	10	26	\N	\N	\N	\N
10539	15	10	27	\N	\N	\N	\N
10540	15	10	28	\N	\N	\N	\N
10541	15	10	29	\N	\N	\N	\N
10542	15	10	30	\N	\N	\N	\N
10543	15	10	31	\N	\N	\N	\N
10544	15	10	32	\N	\N	\N	\N
10545	15	10	33	\N	\N	\N	\N
10546	15	10	34	\N	\N	\N	\N
10547	15	10	35	\N	\N	\N	\N
10548	15	10	36	\N	\N	\N	\N
10549	15	10	37	\N	\N	\N	\N
10550	15	10	38	\N	\N	\N	\N
10551	15	10	39	\N	\N	\N	\N
10552	15	10	40	\N	\N	\N	\N
10553	15	10	41	\N	\N	\N	\N
10554	15	10	42	\N	\N	\N	\N
10555	15	10	43	\N	\N	\N	\N
10556	15	10	44	\N	\N	\N	\N
10557	15	10	45	\N	\N	\N	\N
10558	15	10	46	\N	\N	\N	\N
10559	15	10	47	\N	\N	\N	\N
10560	15	10	48	\N	\N	\N	\N
10561	15	11	1	\N	\N	\N	\N
10562	15	11	2	\N	\N	\N	\N
10563	15	11	3	\N	\N	\N	\N
10564	15	11	4	\N	\N	\N	\N
10565	15	11	5	\N	\N	\N	\N
10566	15	11	6	\N	\N	\N	\N
10567	15	11	7	\N	\N	\N	\N
10568	15	11	8	\N	\N	\N	\N
10569	15	11	9	\N	\N	\N	\N
10570	15	11	10	\N	\N	\N	\N
10571	15	11	11	\N	\N	\N	\N
10572	15	11	12	\N	\N	\N	\N
10573	15	11	13	\N	\N	\N	\N
10574	15	11	14	\N	\N	\N	\N
10575	15	11	15	\N	\N	\N	\N
10576	15	11	16	\N	\N	\N	\N
10577	15	11	17	\N	\N	\N	\N
10578	15	11	18	\N	\N	\N	\N
10579	15	11	19	\N	\N	\N	\N
10580	15	11	20	\N	\N	\N	\N
10581	15	11	21	\N	\N	\N	\N
10582	15	11	22	\N	\N	\N	\N
10583	15	11	23	\N	\N	\N	\N
10584	15	11	24	\N	\N	\N	\N
10585	15	11	25	\N	\N	\N	\N
10586	15	11	26	\N	\N	\N	\N
10587	15	11	27	\N	\N	\N	\N
10588	15	11	28	\N	\N	\N	\N
10589	15	11	29	\N	\N	\N	\N
10590	15	11	30	\N	\N	\N	\N
10591	15	11	31	\N	\N	\N	\N
10592	15	11	32	\N	\N	\N	\N
10593	15	11	33	\N	\N	\N	\N
10594	15	11	34	\N	\N	\N	\N
10595	15	11	35	\N	\N	\N	\N
10596	15	11	36	\N	\N	\N	\N
10597	15	11	37	\N	\N	\N	\N
10598	15	11	38	\N	\N	\N	\N
10599	15	11	39	\N	\N	\N	\N
10600	15	11	40	\N	\N	\N	\N
10601	15	11	41	\N	\N	\N	\N
10602	15	11	42	\N	\N	\N	\N
10603	15	11	43	\N	\N	\N	\N
10604	15	11	44	\N	\N	\N	\N
10605	15	11	45	\N	\N	\N	\N
10606	15	11	46	\N	\N	\N	\N
10607	15	11	47	\N	\N	\N	\N
10608	15	11	48	\N	\N	\N	\N
10609	15	12	1	\N	\N	\N	\N
10610	15	12	2	\N	\N	\N	\N
10611	15	12	3	\N	\N	\N	\N
10612	15	12	4	\N	\N	\N	\N
10613	15	12	5	\N	\N	\N	\N
10614	15	12	6	\N	\N	\N	\N
10615	15	12	7	\N	\N	\N	\N
10616	15	12	8	\N	\N	\N	\N
10617	15	12	9	\N	\N	\N	\N
10618	15	12	10	\N	\N	\N	\N
10619	15	12	11	\N	\N	\N	\N
10620	15	12	12	\N	\N	\N	\N
10621	15	12	13	\N	\N	\N	\N
10622	15	12	14	\N	\N	\N	\N
10623	15	12	15	\N	\N	\N	\N
10624	15	12	16	\N	\N	\N	\N
10625	15	12	17	\N	\N	\N	\N
10626	15	12	18	\N	\N	\N	\N
10627	15	12	19	\N	\N	\N	\N
10628	15	12	20	\N	\N	\N	\N
10629	15	12	21	\N	\N	\N	\N
10630	15	12	22	\N	\N	\N	\N
10631	15	12	23	\N	\N	\N	\N
10632	15	12	24	\N	\N	\N	\N
10633	15	12	25	\N	\N	\N	\N
10634	15	12	26	\N	\N	\N	\N
10635	15	12	27	\N	\N	\N	\N
10636	15	12	28	\N	\N	\N	\N
10637	15	12	29	\N	\N	\N	\N
10638	15	12	30	\N	\N	\N	\N
10639	15	12	31	\N	\N	\N	\N
10640	15	12	32	\N	\N	\N	\N
10641	15	12	33	\N	\N	\N	\N
10642	15	12	34	\N	\N	\N	\N
10643	15	12	35	\N	\N	\N	\N
10644	15	12	36	\N	\N	\N	\N
10645	15	12	37	\N	\N	\N	\N
10646	15	12	38	\N	\N	\N	\N
10647	15	12	39	\N	\N	\N	\N
10648	15	12	40	\N	\N	\N	\N
10649	15	12	41	\N	\N	\N	\N
10650	15	12	42	\N	\N	\N	\N
10651	15	12	43	\N	\N	\N	\N
10652	15	12	44	\N	\N	\N	\N
10653	15	12	45	\N	\N	\N	\N
10654	15	12	46	\N	\N	\N	\N
10655	15	12	47	\N	\N	\N	\N
10656	15	12	48	\N	\N	\N	\N
10657	15	13	1	\N	\N	\N	\N
10658	15	13	2	\N	\N	\N	\N
10659	15	13	3	\N	\N	\N	\N
10660	15	13	4	\N	\N	\N	\N
10661	15	13	5	\N	\N	\N	\N
10662	15	13	6	\N	\N	\N	\N
10663	15	13	7	\N	\N	\N	\N
10664	15	13	8	\N	\N	\N	\N
10665	15	13	9	\N	\N	\N	\N
10666	15	13	10	\N	\N	\N	\N
10667	15	13	11	\N	\N	\N	\N
10668	15	13	12	\N	\N	\N	\N
10669	15	13	13	\N	\N	\N	\N
10670	15	13	14	\N	\N	\N	\N
10671	15	13	15	\N	\N	\N	\N
10672	15	13	16	\N	\N	\N	\N
10673	15	13	17	\N	\N	\N	\N
10674	15	13	18	\N	\N	\N	\N
10675	15	13	19	\N	\N	\N	\N
10676	15	13	20	\N	\N	\N	\N
10677	15	13	21	\N	\N	\N	\N
10678	15	13	22	\N	\N	\N	\N
10679	15	13	23	\N	\N	\N	\N
10680	15	13	24	\N	\N	\N	\N
10681	15	13	25	\N	\N	\N	\N
10682	15	13	26	\N	\N	\N	\N
10683	15	13	27	\N	\N	\N	\N
10684	15	13	28	\N	\N	\N	\N
10685	15	13	29	\N	\N	\N	\N
10686	15	13	30	\N	\N	\N	\N
10687	15	13	31	\N	\N	\N	\N
10688	15	13	32	\N	\N	\N	\N
10689	15	13	33	\N	\N	\N	\N
10690	15	13	34	\N	\N	\N	\N
10691	15	13	35	\N	\N	\N	\N
10692	15	13	36	\N	\N	\N	\N
10693	15	13	37	\N	\N	\N	\N
10694	15	13	38	\N	\N	\N	\N
10695	15	13	39	\N	\N	\N	\N
10696	15	13	40	\N	\N	\N	\N
10697	15	13	41	\N	\N	\N	\N
10698	15	13	42	\N	\N	\N	\N
10699	15	13	43	\N	\N	\N	\N
10700	15	13	44	\N	\N	\N	\N
10701	15	13	45	\N	\N	\N	\N
10702	15	13	46	\N	\N	\N	\N
10703	15	13	47	\N	\N	\N	\N
10704	15	13	48	\N	\N	\N	\N
10705	15	14	1	\N	\N	\N	\N
10706	15	14	2	\N	\N	\N	\N
10707	15	14	3	\N	\N	\N	\N
10708	15	14	4	\N	\N	\N	\N
10709	15	14	5	\N	\N	\N	\N
10710	15	14	6	\N	\N	\N	\N
10711	15	14	7	\N	\N	\N	\N
10712	15	14	8	\N	\N	\N	\N
10713	15	14	9	\N	\N	\N	\N
10714	15	14	10	\N	\N	\N	\N
10715	15	14	11	\N	\N	\N	\N
10716	15	14	12	\N	\N	\N	\N
10717	15	14	13	\N	\N	\N	\N
10718	15	14	14	\N	\N	\N	\N
10719	15	14	15	\N	\N	\N	\N
10720	15	14	16	\N	\N	\N	\N
10721	15	14	17	\N	\N	\N	\N
10722	15	14	18	\N	\N	\N	\N
10723	15	14	19	\N	\N	\N	\N
10724	15	14	20	\N	\N	\N	\N
10725	15	14	21	\N	\N	\N	\N
10726	15	14	22	\N	\N	\N	\N
10727	15	14	23	\N	\N	\N	\N
10728	15	14	24	\N	\N	\N	\N
10729	15	14	25	\N	\N	\N	\N
10730	15	14	26	\N	\N	\N	\N
10731	15	14	27	\N	\N	\N	\N
10732	15	14	28	\N	\N	\N	\N
10733	15	14	29	\N	\N	\N	\N
10734	15	14	30	\N	\N	\N	\N
10735	15	14	31	\N	\N	\N	\N
10736	15	14	32	\N	\N	\N	\N
10737	15	14	33	\N	\N	\N	\N
10738	15	14	34	\N	\N	\N	\N
10739	15	14	35	\N	\N	\N	\N
10740	15	14	36	\N	\N	\N	\N
10741	15	14	37	\N	\N	\N	\N
10742	15	14	38	\N	\N	\N	\N
10743	15	14	39	\N	\N	\N	\N
10744	15	14	40	\N	\N	\N	\N
10745	15	14	41	\N	\N	\N	\N
10746	15	14	42	\N	\N	\N	\N
10747	15	14	43	\N	\N	\N	\N
10748	15	14	44	\N	\N	\N	\N
10749	15	14	45	\N	\N	\N	\N
10750	15	14	46	\N	\N	\N	\N
10751	15	14	47	\N	\N	\N	\N
10752	15	14	48	\N	\N	\N	\N
10753	15	15	1	\N	\N	\N	\N
10754	15	15	2	\N	\N	\N	\N
10755	15	15	3	\N	\N	\N	\N
10756	15	15	4	\N	\N	\N	\N
10757	15	15	5	\N	\N	\N	\N
10758	15	15	6	\N	\N	\N	\N
10759	15	15	7	\N	\N	\N	\N
10760	15	15	8	\N	\N	\N	\N
10761	15	15	9	\N	\N	\N	\N
10762	15	15	10	\N	\N	\N	\N
10763	15	15	11	\N	\N	\N	\N
10764	15	15	12	\N	\N	\N	\N
10765	15	15	13	\N	\N	\N	\N
10766	15	15	14	\N	\N	\N	\N
10767	15	15	15	\N	\N	\N	\N
10768	15	15	16	\N	\N	\N	\N
10769	15	15	17	\N	\N	\N	\N
10770	15	15	18	\N	\N	\N	\N
10771	15	15	19	\N	\N	\N	\N
10772	15	15	20	\N	\N	\N	\N
10773	15	15	21	\N	\N	\N	\N
10774	15	15	22	\N	\N	\N	\N
10775	15	15	23	\N	\N	\N	\N
10776	15	15	24	\N	\N	\N	\N
10777	15	15	25	\N	\N	\N	\N
10778	15	15	26	\N	\N	\N	\N
10779	15	15	27	\N	\N	\N	\N
10780	15	15	28	\N	\N	\N	\N
10781	15	15	29	\N	\N	\N	\N
10782	15	15	30	\N	\N	\N	\N
10783	15	15	31	\N	\N	\N	\N
10784	15	15	32	\N	\N	\N	\N
10785	15	15	33	\N	\N	\N	\N
10786	15	15	34	\N	\N	\N	\N
10787	15	15	35	\N	\N	\N	\N
10788	15	15	36	\N	\N	\N	\N
10789	15	15	37	\N	\N	\N	\N
10790	15	15	38	\N	\N	\N	\N
10791	15	15	39	\N	\N	\N	\N
10792	15	15	40	\N	\N	\N	\N
10793	15	15	41	\N	\N	\N	\N
10794	15	15	42	\N	\N	\N	\N
10795	15	15	43	\N	\N	\N	\N
10796	15	15	44	\N	\N	\N	\N
10797	15	15	45	\N	\N	\N	\N
10798	15	15	46	\N	\N	\N	\N
10799	15	15	47	\N	\N	\N	\N
10800	15	15	48	\N	\N	\N	\N
10801	16	1	1	\N	\N	\N	\N
10802	16	1	2	\N	\N	\N	\N
10803	16	1	3	\N	\N	\N	\N
10804	16	1	4	\N	\N	\N	\N
10805	16	1	5	\N	\N	\N	\N
10806	16	1	6	\N	\N	\N	\N
10807	16	1	7	\N	\N	\N	\N
10808	16	1	8	\N	\N	\N	\N
10809	16	1	9	\N	\N	\N	\N
10810	16	1	10	\N	\N	\N	\N
10811	16	1	11	\N	\N	\N	\N
10812	16	1	12	\N	\N	\N	\N
10813	16	1	13	\N	\N	\N	\N
10814	16	1	14	\N	\N	\N	\N
10815	16	1	15	\N	\N	\N	\N
10816	16	1	16	\N	\N	\N	\N
10817	16	1	17	\N	\N	\N	\N
10818	16	1	18	\N	\N	\N	\N
10819	16	1	19	\N	\N	\N	\N
10820	16	1	20	\N	\N	\N	\N
10821	16	1	21	\N	\N	\N	\N
10822	16	1	22	\N	\N	\N	\N
10823	16	1	23	\N	\N	\N	\N
10824	16	1	24	\N	\N	\N	\N
10825	16	1	25	\N	\N	\N	\N
10826	16	1	26	\N	\N	\N	\N
10827	16	1	27	\N	\N	\N	\N
10828	16	1	28	\N	\N	\N	\N
10829	16	1	29	\N	\N	\N	\N
10830	16	1	30	\N	\N	\N	\N
10831	16	1	31	\N	\N	\N	\N
10832	16	1	32	\N	\N	\N	\N
10833	16	1	33	\N	\N	\N	\N
10834	16	1	34	\N	\N	\N	\N
10835	16	1	35	\N	\N	\N	\N
10836	16	1	36	\N	\N	\N	\N
10837	16	1	37	\N	\N	\N	\N
10838	16	1	38	\N	\N	\N	\N
10839	16	1	39	\N	\N	\N	\N
10840	16	1	40	\N	\N	\N	\N
10841	16	1	41	\N	\N	\N	\N
10842	16	1	42	\N	\N	\N	\N
10843	16	1	43	\N	\N	\N	\N
10844	16	1	44	\N	\N	\N	\N
10845	16	1	45	\N	\N	\N	\N
10846	16	1	46	\N	\N	\N	\N
10847	16	1	47	\N	\N	\N	\N
10848	16	1	48	\N	\N	\N	\N
10849	16	2	1	\N	\N	\N	\N
10850	16	2	2	\N	\N	\N	\N
10851	16	2	3	\N	\N	\N	\N
10852	16	2	4	\N	\N	\N	\N
10853	16	2	5	\N	\N	\N	\N
10854	16	2	6	\N	\N	\N	\N
10855	16	2	7	\N	\N	\N	\N
10856	16	2	8	\N	\N	\N	\N
10857	16	2	9	\N	\N	\N	\N
10858	16	2	10	\N	\N	\N	\N
10859	16	2	11	\N	\N	\N	\N
10860	16	2	12	\N	\N	\N	\N
10861	16	2	13	\N	\N	\N	\N
10862	16	2	14	\N	\N	\N	\N
10863	16	2	15	\N	\N	\N	\N
10864	16	2	16	\N	\N	\N	\N
10865	16	2	17	\N	\N	\N	\N
10866	16	2	18	\N	\N	\N	\N
10867	16	2	19	\N	\N	\N	\N
10868	16	2	20	\N	\N	\N	\N
10869	16	2	21	\N	\N	\N	\N
10870	16	2	22	\N	\N	\N	\N
10871	16	2	23	\N	\N	\N	\N
10872	16	2	24	\N	\N	\N	\N
10873	16	2	25	\N	\N	\N	\N
10874	16	2	26	\N	\N	\N	\N
10875	16	2	27	\N	\N	\N	\N
10876	16	2	28	\N	\N	\N	\N
10877	16	2	29	\N	\N	\N	\N
10878	16	2	30	\N	\N	\N	\N
10879	16	2	31	\N	\N	\N	\N
10880	16	2	32	\N	\N	\N	\N
10881	16	2	33	\N	\N	\N	\N
10882	16	2	34	\N	\N	\N	\N
10883	16	2	35	\N	\N	\N	\N
10884	16	2	36	\N	\N	\N	\N
10885	16	2	37	\N	\N	\N	\N
10886	16	2	38	\N	\N	\N	\N
10887	16	2	39	\N	\N	\N	\N
10888	16	2	40	\N	\N	\N	\N
10889	16	2	41	\N	\N	\N	\N
10890	16	2	42	\N	\N	\N	\N
10891	16	2	43	\N	\N	\N	\N
10892	16	2	44	\N	\N	\N	\N
10893	16	2	45	\N	\N	\N	\N
10894	16	2	46	\N	\N	\N	\N
10895	16	2	47	\N	\N	\N	\N
10896	16	2	48	\N	\N	\N	\N
10897	16	3	1	\N	\N	\N	\N
10898	16	3	2	\N	\N	\N	\N
10899	16	3	3	\N	\N	\N	\N
10900	16	3	4	\N	\N	\N	\N
10901	16	3	5	\N	\N	\N	\N
10902	16	3	6	\N	\N	\N	\N
10903	16	3	7	\N	\N	\N	\N
10904	16	3	8	\N	\N	\N	\N
10905	16	3	9	\N	\N	\N	\N
10906	16	3	10	\N	\N	\N	\N
10907	16	3	11	\N	\N	\N	\N
10908	16	3	12	\N	\N	\N	\N
10909	16	3	13	\N	\N	\N	\N
10910	16	3	14	\N	\N	\N	\N
10911	16	3	15	\N	\N	\N	\N
10912	16	3	16	\N	\N	\N	\N
10913	16	3	17	\N	\N	\N	\N
10914	16	3	18	\N	\N	\N	\N
10915	16	3	19	\N	\N	\N	\N
10916	16	3	20	\N	\N	\N	\N
10917	16	3	21	\N	\N	\N	\N
10918	16	3	22	\N	\N	\N	\N
10919	16	3	23	\N	\N	\N	\N
10920	16	3	24	\N	\N	\N	\N
10921	16	3	25	\N	\N	\N	\N
10922	16	3	26	\N	\N	\N	\N
10923	16	3	27	\N	\N	\N	\N
10924	16	3	28	\N	\N	\N	\N
10925	16	3	29	\N	\N	\N	\N
10926	16	3	30	\N	\N	\N	\N
10927	16	3	31	\N	\N	\N	\N
10928	16	3	32	\N	\N	\N	\N
10929	16	3	33	\N	\N	\N	\N
10930	16	3	34	\N	\N	\N	\N
10931	16	3	35	\N	\N	\N	\N
10932	16	3	36	\N	\N	\N	\N
10933	16	3	37	\N	\N	\N	\N
10934	16	3	38	\N	\N	\N	\N
10935	16	3	39	\N	\N	\N	\N
10936	16	3	40	\N	\N	\N	\N
10937	16	3	41	\N	\N	\N	\N
10938	16	3	42	\N	\N	\N	\N
10939	16	3	43	\N	\N	\N	\N
10940	16	3	44	\N	\N	\N	\N
10941	16	3	45	\N	\N	\N	\N
10942	16	3	46	\N	\N	\N	\N
10943	16	3	47	\N	\N	\N	\N
10944	16	3	48	\N	\N	\N	\N
10945	16	4	1	\N	\N	\N	\N
10946	16	4	2	\N	\N	\N	\N
10947	16	4	3	\N	\N	\N	\N
10948	16	4	4	\N	\N	\N	\N
10949	16	4	5	\N	\N	\N	\N
10950	16	4	6	\N	\N	\N	\N
10951	16	4	7	\N	\N	\N	\N
10952	16	4	8	\N	\N	\N	\N
10953	16	4	9	\N	\N	\N	\N
10954	16	4	10	\N	\N	\N	\N
10955	16	4	11	\N	\N	\N	\N
10956	16	4	12	\N	\N	\N	\N
10957	16	4	13	\N	\N	\N	\N
10958	16	4	14	\N	\N	\N	\N
10959	16	4	15	\N	\N	\N	\N
10960	16	4	16	\N	\N	\N	\N
10961	16	4	17	\N	\N	\N	\N
10962	16	4	18	\N	\N	\N	\N
10963	16	4	19	\N	\N	\N	\N
10964	16	4	20	\N	\N	\N	\N
10965	16	4	21	\N	\N	\N	\N
10966	16	4	22	\N	\N	\N	\N
10967	16	4	23	\N	\N	\N	\N
10968	16	4	24	\N	\N	\N	\N
10969	16	4	25	\N	\N	\N	\N
10970	16	4	26	\N	\N	\N	\N
10971	16	4	27	\N	\N	\N	\N
10972	16	4	28	\N	\N	\N	\N
10973	16	4	29	\N	\N	\N	\N
10974	16	4	30	\N	\N	\N	\N
10975	16	4	31	\N	\N	\N	\N
10976	16	4	32	\N	\N	\N	\N
10977	16	4	33	\N	\N	\N	\N
10978	16	4	34	\N	\N	\N	\N
10979	16	4	35	\N	\N	\N	\N
10980	16	4	36	\N	\N	\N	\N
10981	16	4	37	\N	\N	\N	\N
10982	16	4	38	\N	\N	\N	\N
10983	16	4	39	\N	\N	\N	\N
10984	16	4	40	\N	\N	\N	\N
10985	16	4	41	\N	\N	\N	\N
10986	16	4	42	\N	\N	\N	\N
10987	16	4	43	\N	\N	\N	\N
10988	16	4	44	\N	\N	\N	\N
10989	16	4	45	\N	\N	\N	\N
10990	16	4	46	\N	\N	\N	\N
10991	16	4	47	\N	\N	\N	\N
10992	16	4	48	\N	\N	\N	\N
10993	16	5	1	\N	\N	\N	\N
10994	16	5	2	\N	\N	\N	\N
10995	16	5	3	\N	\N	\N	\N
10996	16	5	4	\N	\N	\N	\N
10997	16	5	5	\N	\N	\N	\N
10998	16	5	6	\N	\N	\N	\N
10999	16	5	7	\N	\N	\N	\N
11000	16	5	8	\N	\N	\N	\N
11001	16	5	9	\N	\N	\N	\N
11002	16	5	10	\N	\N	\N	\N
11003	16	5	11	\N	\N	\N	\N
11004	16	5	12	\N	\N	\N	\N
11005	16	5	13	\N	\N	\N	\N
11006	16	5	14	\N	\N	\N	\N
11007	16	5	15	\N	\N	\N	\N
11008	16	5	16	\N	\N	\N	\N
11009	16	5	17	\N	\N	\N	\N
11010	16	5	18	\N	\N	\N	\N
11011	16	5	19	\N	\N	\N	\N
11012	16	5	20	\N	\N	\N	\N
11013	16	5	21	\N	\N	\N	\N
11014	16	5	22	\N	\N	\N	\N
11015	16	5	23	\N	\N	\N	\N
11016	16	5	24	\N	\N	\N	\N
11017	16	5	25	\N	\N	\N	\N
11018	16	5	26	\N	\N	\N	\N
11019	16	5	27	\N	\N	\N	\N
11020	16	5	28	\N	\N	\N	\N
11021	16	5	29	\N	\N	\N	\N
11022	16	5	30	\N	\N	\N	\N
11023	16	5	31	\N	\N	\N	\N
11024	16	5	32	\N	\N	\N	\N
11025	16	5	33	\N	\N	\N	\N
11026	16	5	34	\N	\N	\N	\N
11027	16	5	35	\N	\N	\N	\N
11028	16	5	36	\N	\N	\N	\N
11029	16	5	37	\N	\N	\N	\N
11030	16	5	38	\N	\N	\N	\N
11031	16	5	39	\N	\N	\N	\N
11032	16	5	40	\N	\N	\N	\N
11033	16	5	41	\N	\N	\N	\N
11034	16	5	42	\N	\N	\N	\N
11035	16	5	43	\N	\N	\N	\N
11036	16	5	44	\N	\N	\N	\N
11037	16	5	45	\N	\N	\N	\N
11038	16	5	46	\N	\N	\N	\N
11039	16	5	47	\N	\N	\N	\N
11040	16	5	48	\N	\N	\N	\N
11041	16	6	1	\N	\N	\N	\N
11042	16	6	2	\N	\N	\N	\N
11043	16	6	3	\N	\N	\N	\N
11044	16	6	4	\N	\N	\N	\N
11045	16	6	5	\N	\N	\N	\N
11046	16	6	6	\N	\N	\N	\N
11047	16	6	7	\N	\N	\N	\N
11048	16	6	8	\N	\N	\N	\N
11049	16	6	9	\N	\N	\N	\N
11050	16	6	10	\N	\N	\N	\N
11051	16	6	11	\N	\N	\N	\N
11052	16	6	12	\N	\N	\N	\N
11053	16	6	13	\N	\N	\N	\N
11054	16	6	14	\N	\N	\N	\N
11055	16	6	15	\N	\N	\N	\N
11056	16	6	16	\N	\N	\N	\N
11057	16	6	17	\N	\N	\N	\N
11058	16	6	18	\N	\N	\N	\N
11059	16	6	19	\N	\N	\N	\N
11060	16	6	20	\N	\N	\N	\N
11061	16	6	21	\N	\N	\N	\N
11062	16	6	22	\N	\N	\N	\N
11063	16	6	23	\N	\N	\N	\N
11064	16	6	24	\N	\N	\N	\N
11065	16	6	25	\N	\N	\N	\N
11066	16	6	26	\N	\N	\N	\N
11067	16	6	27	\N	\N	\N	\N
11068	16	6	28	\N	\N	\N	\N
11069	16	6	29	\N	\N	\N	\N
11070	16	6	30	\N	\N	\N	\N
11071	16	6	31	\N	\N	\N	\N
11072	16	6	32	\N	\N	\N	\N
11073	16	6	33	\N	\N	\N	\N
11074	16	6	34	\N	\N	\N	\N
11075	16	6	35	\N	\N	\N	\N
11076	16	6	36	\N	\N	\N	\N
11077	16	6	37	\N	\N	\N	\N
11078	16	6	38	\N	\N	\N	\N
11079	16	6	39	\N	\N	\N	\N
11080	16	6	40	\N	\N	\N	\N
11081	16	6	41	\N	\N	\N	\N
11082	16	6	42	\N	\N	\N	\N
11083	16	6	43	\N	\N	\N	\N
11084	16	6	44	\N	\N	\N	\N
11085	16	6	45	\N	\N	\N	\N
11086	16	6	46	\N	\N	\N	\N
11087	16	6	47	\N	\N	\N	\N
11088	16	6	48	\N	\N	\N	\N
11089	16	7	1	\N	\N	\N	\N
11090	16	7	2	\N	\N	\N	\N
11091	16	7	3	\N	\N	\N	\N
11092	16	7	4	\N	\N	\N	\N
11093	16	7	5	\N	\N	\N	\N
11094	16	7	6	\N	\N	\N	\N
11095	16	7	7	\N	\N	\N	\N
11096	16	7	8	\N	\N	\N	\N
11097	16	7	9	\N	\N	\N	\N
11098	16	7	10	\N	\N	\N	\N
11099	16	7	11	\N	\N	\N	\N
11100	16	7	12	\N	\N	\N	\N
11101	16	7	13	\N	\N	\N	\N
11102	16	7	14	\N	\N	\N	\N
11103	16	7	15	\N	\N	\N	\N
11104	16	7	16	\N	\N	\N	\N
11105	16	7	17	\N	\N	\N	\N
11106	16	7	18	\N	\N	\N	\N
11107	16	7	19	\N	\N	\N	\N
11108	16	7	20	\N	\N	\N	\N
11109	16	7	21	\N	\N	\N	\N
11110	16	7	22	\N	\N	\N	\N
11111	16	7	23	\N	\N	\N	\N
11112	16	7	24	\N	\N	\N	\N
11113	16	7	25	\N	\N	\N	\N
11114	16	7	26	\N	\N	\N	\N
11115	16	7	27	\N	\N	\N	\N
11116	16	7	28	\N	\N	\N	\N
11117	16	7	29	\N	\N	\N	\N
11118	16	7	30	\N	\N	\N	\N
11119	16	7	31	\N	\N	\N	\N
11120	16	7	32	\N	\N	\N	\N
11121	16	7	33	\N	\N	\N	\N
11122	16	7	34	\N	\N	\N	\N
11123	16	7	35	\N	\N	\N	\N
11124	16	7	36	\N	\N	\N	\N
11125	16	7	37	\N	\N	\N	\N
11126	16	7	38	\N	\N	\N	\N
11127	16	7	39	\N	\N	\N	\N
11128	16	7	40	\N	\N	\N	\N
11129	16	7	41	\N	\N	\N	\N
11130	16	7	42	\N	\N	\N	\N
11131	16	7	43	\N	\N	\N	\N
11132	16	7	44	\N	\N	\N	\N
11133	16	7	45	\N	\N	\N	\N
11134	16	7	46	\N	\N	\N	\N
11135	16	7	47	\N	\N	\N	\N
11136	16	7	48	\N	\N	\N	\N
11137	16	8	1	\N	\N	\N	\N
11138	16	8	2	\N	\N	\N	\N
11139	16	8	3	\N	\N	\N	\N
11140	16	8	4	\N	\N	\N	\N
11141	16	8	5	\N	\N	\N	\N
11142	16	8	6	\N	\N	\N	\N
11143	16	8	7	\N	\N	\N	\N
11144	16	8	8	\N	\N	\N	\N
11145	16	8	9	\N	\N	\N	\N
11146	16	8	10	\N	\N	\N	\N
11147	16	8	11	\N	\N	\N	\N
11148	16	8	12	\N	\N	\N	\N
11149	16	8	13	\N	\N	\N	\N
11150	16	8	14	\N	\N	\N	\N
11151	16	8	15	\N	\N	\N	\N
11152	16	8	16	\N	\N	\N	\N
11153	16	8	17	\N	\N	\N	\N
11154	16	8	18	\N	\N	\N	\N
11155	16	8	19	\N	\N	\N	\N
11156	16	8	20	\N	\N	\N	\N
11157	16	8	21	\N	\N	\N	\N
11158	16	8	22	\N	\N	\N	\N
11159	16	8	23	\N	\N	\N	\N
11160	16	8	24	\N	\N	\N	\N
11161	16	8	25	\N	\N	\N	\N
11162	16	8	26	\N	\N	\N	\N
11163	16	8	27	\N	\N	\N	\N
11164	16	8	28	\N	\N	\N	\N
11165	16	8	29	\N	\N	\N	\N
11166	16	8	30	\N	\N	\N	\N
11167	16	8	31	\N	\N	\N	\N
11168	16	8	32	\N	\N	\N	\N
11169	16	8	33	\N	\N	\N	\N
11170	16	8	34	\N	\N	\N	\N
11171	16	8	35	\N	\N	\N	\N
11172	16	8	36	\N	\N	\N	\N
11173	16	8	37	\N	\N	\N	\N
11174	16	8	38	\N	\N	\N	\N
11175	16	8	39	\N	\N	\N	\N
11176	16	8	40	\N	\N	\N	\N
11177	16	8	41	\N	\N	\N	\N
11178	16	8	42	\N	\N	\N	\N
11179	16	8	43	\N	\N	\N	\N
11180	16	8	44	\N	\N	\N	\N
11181	16	8	45	\N	\N	\N	\N
11182	16	8	46	\N	\N	\N	\N
11183	16	8	47	\N	\N	\N	\N
11184	16	8	48	\N	\N	\N	\N
11185	16	9	1	\N	\N	\N	\N
11186	16	9	2	\N	\N	\N	\N
11187	16	9	3	\N	\N	\N	\N
11188	16	9	4	\N	\N	\N	\N
11189	16	9	5	\N	\N	\N	\N
11190	16	9	6	\N	\N	\N	\N
11191	16	9	7	\N	\N	\N	\N
11192	16	9	8	\N	\N	\N	\N
11193	16	9	9	\N	\N	\N	\N
11194	16	9	10	\N	\N	\N	\N
11195	16	9	11	\N	\N	\N	\N
11196	16	9	12	\N	\N	\N	\N
11197	16	9	13	\N	\N	\N	\N
11198	16	9	14	\N	\N	\N	\N
11199	16	9	15	\N	\N	\N	\N
11200	16	9	16	\N	\N	\N	\N
11201	16	9	17	\N	\N	\N	\N
11202	16	9	18	\N	\N	\N	\N
11203	16	9	19	\N	\N	\N	\N
11204	16	9	20	\N	\N	\N	\N
11205	16	9	21	\N	\N	\N	\N
11206	16	9	22	\N	\N	\N	\N
11207	16	9	23	\N	\N	\N	\N
11208	16	9	24	\N	\N	\N	\N
11209	16	9	25	\N	\N	\N	\N
11210	16	9	26	\N	\N	\N	\N
11211	16	9	27	\N	\N	\N	\N
11212	16	9	28	\N	\N	\N	\N
11213	16	9	29	\N	\N	\N	\N
11214	16	9	30	\N	\N	\N	\N
11215	16	9	31	\N	\N	\N	\N
11216	16	9	32	\N	\N	\N	\N
11217	16	9	33	\N	\N	\N	\N
11218	16	9	34	\N	\N	\N	\N
11219	16	9	35	\N	\N	\N	\N
11220	16	9	36	\N	\N	\N	\N
11221	16	9	37	\N	\N	\N	\N
11222	16	9	38	\N	\N	\N	\N
11223	16	9	39	\N	\N	\N	\N
11224	16	9	40	\N	\N	\N	\N
11225	16	9	41	\N	\N	\N	\N
11226	16	9	42	\N	\N	\N	\N
11227	16	9	43	\N	\N	\N	\N
11228	16	9	44	\N	\N	\N	\N
11229	16	9	45	\N	\N	\N	\N
11230	16	9	46	\N	\N	\N	\N
11231	16	9	47	\N	\N	\N	\N
11232	16	9	48	\N	\N	\N	\N
11233	16	10	1	\N	\N	\N	\N
11234	16	10	2	\N	\N	\N	\N
11235	16	10	3	\N	\N	\N	\N
11236	16	10	4	\N	\N	\N	\N
11237	16	10	5	\N	\N	\N	\N
11238	16	10	6	\N	\N	\N	\N
11239	16	10	7	\N	\N	\N	\N
11240	16	10	8	\N	\N	\N	\N
11241	16	10	9	\N	\N	\N	\N
11242	16	10	10	\N	\N	\N	\N
11243	16	10	11	\N	\N	\N	\N
11244	16	10	12	\N	\N	\N	\N
11245	16	10	13	\N	\N	\N	\N
11246	16	10	14	\N	\N	\N	\N
11247	16	10	15	\N	\N	\N	\N
11248	16	10	16	\N	\N	\N	\N
11249	16	10	17	\N	\N	\N	\N
11250	16	10	18	\N	\N	\N	\N
11251	16	10	19	\N	\N	\N	\N
11252	16	10	20	\N	\N	\N	\N
11253	16	10	21	\N	\N	\N	\N
11254	16	10	22	\N	\N	\N	\N
11255	16	10	23	\N	\N	\N	\N
11256	16	10	24	\N	\N	\N	\N
11257	16	10	25	\N	\N	\N	\N
11258	16	10	26	\N	\N	\N	\N
11259	16	10	27	\N	\N	\N	\N
11260	16	10	28	\N	\N	\N	\N
11261	16	10	29	\N	\N	\N	\N
11262	16	10	30	\N	\N	\N	\N
11263	16	10	31	\N	\N	\N	\N
11264	16	10	32	\N	\N	\N	\N
11265	16	10	33	\N	\N	\N	\N
11266	16	10	34	\N	\N	\N	\N
11267	16	10	35	\N	\N	\N	\N
11268	16	10	36	\N	\N	\N	\N
11269	16	10	37	\N	\N	\N	\N
11270	16	10	38	\N	\N	\N	\N
11271	16	10	39	\N	\N	\N	\N
11272	16	10	40	\N	\N	\N	\N
11273	16	10	41	\N	\N	\N	\N
11274	16	10	42	\N	\N	\N	\N
11275	16	10	43	\N	\N	\N	\N
11276	16	10	44	\N	\N	\N	\N
11277	16	10	45	\N	\N	\N	\N
11278	16	10	46	\N	\N	\N	\N
11279	16	10	47	\N	\N	\N	\N
11280	16	10	48	\N	\N	\N	\N
11281	16	11	1	\N	\N	\N	\N
11282	16	11	2	\N	\N	\N	\N
11283	16	11	3	\N	\N	\N	\N
11284	16	11	4	\N	\N	\N	\N
11285	16	11	5	\N	\N	\N	\N
11286	16	11	6	\N	\N	\N	\N
11287	16	11	7	\N	\N	\N	\N
11288	16	11	8	\N	\N	\N	\N
11289	16	11	9	\N	\N	\N	\N
11290	16	11	10	\N	\N	\N	\N
11291	16	11	11	\N	\N	\N	\N
11292	16	11	12	\N	\N	\N	\N
11293	16	11	13	\N	\N	\N	\N
11294	16	11	14	\N	\N	\N	\N
11295	16	11	15	\N	\N	\N	\N
11296	16	11	16	\N	\N	\N	\N
11297	16	11	17	\N	\N	\N	\N
11298	16	11	18	\N	\N	\N	\N
11299	16	11	19	\N	\N	\N	\N
11300	16	11	20	\N	\N	\N	\N
11301	16	11	21	\N	\N	\N	\N
11302	16	11	22	\N	\N	\N	\N
11303	16	11	23	\N	\N	\N	\N
11304	16	11	24	\N	\N	\N	\N
11305	16	11	25	\N	\N	\N	\N
11306	16	11	26	\N	\N	\N	\N
11307	16	11	27	\N	\N	\N	\N
11308	16	11	28	\N	\N	\N	\N
11309	16	11	29	\N	\N	\N	\N
11310	16	11	30	\N	\N	\N	\N
11311	16	11	31	\N	\N	\N	\N
11312	16	11	32	\N	\N	\N	\N
11313	16	11	33	\N	\N	\N	\N
11314	16	11	34	\N	\N	\N	\N
11315	16	11	35	\N	\N	\N	\N
11316	16	11	36	\N	\N	\N	\N
11317	16	11	37	\N	\N	\N	\N
11318	16	11	38	\N	\N	\N	\N
11319	16	11	39	\N	\N	\N	\N
11320	16	11	40	\N	\N	\N	\N
11321	16	11	41	\N	\N	\N	\N
11322	16	11	42	\N	\N	\N	\N
11323	16	11	43	\N	\N	\N	\N
11324	16	11	44	\N	\N	\N	\N
11325	16	11	45	\N	\N	\N	\N
11326	16	11	46	\N	\N	\N	\N
11327	16	11	47	\N	\N	\N	\N
11328	16	11	48	\N	\N	\N	\N
11329	16	12	1	\N	\N	\N	\N
11330	16	12	2	\N	\N	\N	\N
11331	16	12	3	\N	\N	\N	\N
11332	16	12	4	\N	\N	\N	\N
11333	16	12	5	\N	\N	\N	\N
11334	16	12	6	\N	\N	\N	\N
11335	16	12	7	\N	\N	\N	\N
11336	16	12	8	\N	\N	\N	\N
11337	16	12	9	\N	\N	\N	\N
11338	16	12	10	\N	\N	\N	\N
11339	16	12	11	\N	\N	\N	\N
11340	16	12	12	\N	\N	\N	\N
11341	16	12	13	\N	\N	\N	\N
11342	16	12	14	\N	\N	\N	\N
11343	16	12	15	\N	\N	\N	\N
11344	16	12	16	\N	\N	\N	\N
11345	16	12	17	\N	\N	\N	\N
11346	16	12	18	\N	\N	\N	\N
11347	16	12	19	\N	\N	\N	\N
11348	16	12	20	\N	\N	\N	\N
11349	16	12	21	\N	\N	\N	\N
11350	16	12	22	\N	\N	\N	\N
11351	16	12	23	\N	\N	\N	\N
11352	16	12	24	\N	\N	\N	\N
11353	16	12	25	\N	\N	\N	\N
11354	16	12	26	\N	\N	\N	\N
11355	16	12	27	\N	\N	\N	\N
11356	16	12	28	\N	\N	\N	\N
11357	16	12	29	\N	\N	\N	\N
11358	16	12	30	\N	\N	\N	\N
11359	16	12	31	\N	\N	\N	\N
11360	16	12	32	\N	\N	\N	\N
11361	16	12	33	\N	\N	\N	\N
11362	16	12	34	\N	\N	\N	\N
11363	16	12	35	\N	\N	\N	\N
11364	16	12	36	\N	\N	\N	\N
11365	16	12	37	\N	\N	\N	\N
11366	16	12	38	\N	\N	\N	\N
11367	16	12	39	\N	\N	\N	\N
11368	16	12	40	\N	\N	\N	\N
11369	16	12	41	\N	\N	\N	\N
11370	16	12	42	\N	\N	\N	\N
11371	16	12	43	\N	\N	\N	\N
11372	16	12	44	\N	\N	\N	\N
11373	16	12	45	\N	\N	\N	\N
11374	16	12	46	\N	\N	\N	\N
11375	16	12	47	\N	\N	\N	\N
11376	16	12	48	\N	\N	\N	\N
11377	16	13	1	\N	\N	\N	\N
11378	16	13	2	\N	\N	\N	\N
11379	16	13	3	\N	\N	\N	\N
11380	16	13	4	\N	\N	\N	\N
11381	16	13	5	\N	\N	\N	\N
11382	16	13	6	\N	\N	\N	\N
11383	16	13	7	\N	\N	\N	\N
11384	16	13	8	\N	\N	\N	\N
11385	16	13	9	\N	\N	\N	\N
11386	16	13	10	\N	\N	\N	\N
11387	16	13	11	\N	\N	\N	\N
11388	16	13	12	\N	\N	\N	\N
11389	16	13	13	\N	\N	\N	\N
11390	16	13	14	\N	\N	\N	\N
11391	16	13	15	\N	\N	\N	\N
11392	16	13	16	\N	\N	\N	\N
11393	16	13	17	\N	\N	\N	\N
11394	16	13	18	\N	\N	\N	\N
11395	16	13	19	\N	\N	\N	\N
11396	16	13	20	\N	\N	\N	\N
11397	16	13	21	\N	\N	\N	\N
11398	16	13	22	\N	\N	\N	\N
11399	16	13	23	\N	\N	\N	\N
11400	16	13	24	\N	\N	\N	\N
11401	16	13	25	\N	\N	\N	\N
11402	16	13	26	\N	\N	\N	\N
11403	16	13	27	\N	\N	\N	\N
11404	16	13	28	\N	\N	\N	\N
11405	16	13	29	\N	\N	\N	\N
11406	16	13	30	\N	\N	\N	\N
11407	16	13	31	\N	\N	\N	\N
11408	16	13	32	\N	\N	\N	\N
11409	16	13	33	\N	\N	\N	\N
11410	16	13	34	\N	\N	\N	\N
11411	16	13	35	\N	\N	\N	\N
11412	16	13	36	\N	\N	\N	\N
11413	16	13	37	\N	\N	\N	\N
11414	16	13	38	\N	\N	\N	\N
11415	16	13	39	\N	\N	\N	\N
11416	16	13	40	\N	\N	\N	\N
11417	16	13	41	\N	\N	\N	\N
11418	16	13	42	\N	\N	\N	\N
11419	16	13	43	\N	\N	\N	\N
11420	16	13	44	\N	\N	\N	\N
11421	16	13	45	\N	\N	\N	\N
11422	16	13	46	\N	\N	\N	\N
11423	16	13	47	\N	\N	\N	\N
11424	16	13	48	\N	\N	\N	\N
11425	16	14	1	\N	\N	\N	\N
11426	16	14	2	\N	\N	\N	\N
11427	16	14	3	\N	\N	\N	\N
11428	16	14	4	\N	\N	\N	\N
11429	16	14	5	\N	\N	\N	\N
11430	16	14	6	\N	\N	\N	\N
11431	16	14	7	\N	\N	\N	\N
11432	16	14	8	\N	\N	\N	\N
11433	16	14	9	\N	\N	\N	\N
11434	16	14	10	\N	\N	\N	\N
11435	16	14	11	\N	\N	\N	\N
11436	16	14	12	\N	\N	\N	\N
11437	16	14	13	\N	\N	\N	\N
11438	16	14	14	\N	\N	\N	\N
11439	16	14	15	\N	\N	\N	\N
11440	16	14	16	\N	\N	\N	\N
11441	16	14	17	\N	\N	\N	\N
11442	16	14	18	\N	\N	\N	\N
11443	16	14	19	\N	\N	\N	\N
11444	16	14	20	\N	\N	\N	\N
11445	16	14	21	\N	\N	\N	\N
11446	16	14	22	\N	\N	\N	\N
11447	16	14	23	\N	\N	\N	\N
11448	16	14	24	\N	\N	\N	\N
11449	16	14	25	\N	\N	\N	\N
11450	16	14	26	\N	\N	\N	\N
11451	16	14	27	\N	\N	\N	\N
11452	16	14	28	\N	\N	\N	\N
11453	16	14	29	\N	\N	\N	\N
11454	16	14	30	\N	\N	\N	\N
11455	16	14	31	\N	\N	\N	\N
11456	16	14	32	\N	\N	\N	\N
11457	16	14	33	\N	\N	\N	\N
11458	16	14	34	\N	\N	\N	\N
11459	16	14	35	\N	\N	\N	\N
11460	16	14	36	\N	\N	\N	\N
11461	16	14	37	\N	\N	\N	\N
11462	16	14	38	\N	\N	\N	\N
11463	16	14	39	\N	\N	\N	\N
11464	16	14	40	\N	\N	\N	\N
11465	16	14	41	\N	\N	\N	\N
11466	16	14	42	\N	\N	\N	\N
11467	16	14	43	\N	\N	\N	\N
11468	16	14	44	\N	\N	\N	\N
11469	16	14	45	\N	\N	\N	\N
11470	16	14	46	\N	\N	\N	\N
11471	16	14	47	\N	\N	\N	\N
11472	16	14	48	\N	\N	\N	\N
11473	16	15	1	\N	\N	\N	\N
11474	16	15	2	\N	\N	\N	\N
11475	16	15	3	\N	\N	\N	\N
11476	16	15	4	\N	\N	\N	\N
11477	16	15	5	\N	\N	\N	\N
11478	16	15	6	\N	\N	\N	\N
11479	16	15	7	\N	\N	\N	\N
11480	16	15	8	\N	\N	\N	\N
11481	16	15	9	\N	\N	\N	\N
11482	16	15	10	\N	\N	\N	\N
11483	16	15	11	\N	\N	\N	\N
11484	16	15	12	\N	\N	\N	\N
11485	16	15	13	\N	\N	\N	\N
11486	16	15	14	\N	\N	\N	\N
11487	16	15	15	\N	\N	\N	\N
11488	16	15	16	\N	\N	\N	\N
11489	16	15	17	\N	\N	\N	\N
11490	16	15	18	\N	\N	\N	\N
11491	16	15	19	\N	\N	\N	\N
11492	16	15	20	\N	\N	\N	\N
11493	16	15	21	\N	\N	\N	\N
11494	16	15	22	\N	\N	\N	\N
11495	16	15	23	\N	\N	\N	\N
11496	16	15	24	\N	\N	\N	\N
11497	16	15	25	\N	\N	\N	\N
11498	16	15	26	\N	\N	\N	\N
11499	16	15	27	\N	\N	\N	\N
11500	16	15	28	\N	\N	\N	\N
11501	16	15	29	\N	\N	\N	\N
11502	16	15	30	\N	\N	\N	\N
11503	16	15	31	\N	\N	\N	\N
11504	16	15	32	\N	\N	\N	\N
11505	16	15	33	\N	\N	\N	\N
11506	16	15	34	\N	\N	\N	\N
11507	16	15	35	\N	\N	\N	\N
11508	16	15	36	\N	\N	\N	\N
11509	16	15	37	\N	\N	\N	\N
11510	16	15	38	\N	\N	\N	\N
11511	16	15	39	\N	\N	\N	\N
11512	16	15	40	\N	\N	\N	\N
11513	16	15	41	\N	\N	\N	\N
11514	16	15	42	\N	\N	\N	\N
11515	16	15	43	\N	\N	\N	\N
11516	16	15	44	\N	\N	\N	\N
11517	16	15	45	\N	\N	\N	\N
11518	16	15	46	\N	\N	\N	\N
11519	16	15	47	\N	\N	\N	\N
11520	16	15	48	\N	\N	\N	\N
11521	17	1	1	\N	\N	\N	\N
11522	17	1	2	\N	\N	\N	\N
11523	17	1	3	\N	\N	\N	\N
11524	17	1	4	\N	\N	\N	\N
11525	17	1	5	\N	\N	\N	\N
11526	17	1	6	\N	\N	\N	\N
11527	17	1	7	\N	\N	\N	\N
11528	17	1	8	\N	\N	\N	\N
11529	17	1	9	\N	\N	\N	\N
11530	17	1	10	\N	\N	\N	\N
11531	17	1	11	\N	\N	\N	\N
11532	17	1	12	\N	\N	\N	\N
11533	17	1	13	\N	\N	\N	\N
11534	17	1	14	\N	\N	\N	\N
11535	17	1	15	\N	\N	\N	\N
11536	17	1	16	\N	\N	\N	\N
11537	17	1	17	\N	\N	\N	\N
11538	17	1	18	\N	\N	\N	\N
11539	17	1	19	\N	\N	\N	\N
11540	17	1	20	\N	\N	\N	\N
11541	17	1	21	\N	\N	\N	\N
11542	17	1	22	\N	\N	\N	\N
11543	17	1	23	\N	\N	\N	\N
11544	17	1	24	\N	\N	\N	\N
11545	17	1	25	\N	\N	\N	\N
11546	17	1	26	\N	\N	\N	\N
11547	17	1	27	\N	\N	\N	\N
11548	17	1	28	\N	\N	\N	\N
11549	17	1	29	\N	\N	\N	\N
11550	17	1	30	\N	\N	\N	\N
11551	17	1	31	\N	\N	\N	\N
11552	17	1	32	\N	\N	\N	\N
11553	17	1	33	\N	\N	\N	\N
11554	17	1	34	\N	\N	\N	\N
11555	17	1	35	\N	\N	\N	\N
11556	17	1	36	\N	\N	\N	\N
11557	17	1	37	\N	\N	\N	\N
11558	17	1	38	\N	\N	\N	\N
11559	17	1	39	\N	\N	\N	\N
11560	17	1	40	\N	\N	\N	\N
11561	17	1	41	\N	\N	\N	\N
11562	17	1	42	\N	\N	\N	\N
11563	17	1	43	\N	\N	\N	\N
11564	17	1	44	\N	\N	\N	\N
11565	17	1	45	\N	\N	\N	\N
11566	17	1	46	\N	\N	\N	\N
11567	17	1	47	\N	\N	\N	\N
11568	17	1	48	\N	\N	\N	\N
11569	17	2	1	\N	\N	\N	\N
11570	17	2	2	\N	\N	\N	\N
11571	17	2	3	\N	\N	\N	\N
11572	17	2	4	\N	\N	\N	\N
11573	17	2	5	\N	\N	\N	\N
11574	17	2	6	\N	\N	\N	\N
11575	17	2	7	\N	\N	\N	\N
11576	17	2	8	\N	\N	\N	\N
11577	17	2	9	\N	\N	\N	\N
11578	17	2	10	\N	\N	\N	\N
11579	17	2	11	\N	\N	\N	\N
11580	17	2	12	\N	\N	\N	\N
11581	17	2	13	\N	\N	\N	\N
11582	17	2	14	\N	\N	\N	\N
11583	17	2	15	\N	\N	\N	\N
11584	17	2	16	\N	\N	\N	\N
11585	17	2	17	\N	\N	\N	\N
11586	17	2	18	\N	\N	\N	\N
11587	17	2	19	\N	\N	\N	\N
11588	17	2	20	\N	\N	\N	\N
11589	17	2	21	\N	\N	\N	\N
11590	17	2	22	\N	\N	\N	\N
11591	17	2	23	\N	\N	\N	\N
11592	17	2	24	\N	\N	\N	\N
11593	17	2	25	\N	\N	\N	\N
11594	17	2	26	\N	\N	\N	\N
11595	17	2	27	\N	\N	\N	\N
11596	17	2	28	\N	\N	\N	\N
11597	17	2	29	\N	\N	\N	\N
11598	17	2	30	\N	\N	\N	\N
11599	17	2	31	\N	\N	\N	\N
11600	17	2	32	\N	\N	\N	\N
11601	17	2	33	\N	\N	\N	\N
11602	17	2	34	\N	\N	\N	\N
11603	17	2	35	\N	\N	\N	\N
11604	17	2	36	\N	\N	\N	\N
11605	17	2	37	\N	\N	\N	\N
11606	17	2	38	\N	\N	\N	\N
11607	17	2	39	\N	\N	\N	\N
11608	17	2	40	\N	\N	\N	\N
11609	17	2	41	\N	\N	\N	\N
11610	17	2	42	\N	\N	\N	\N
11611	17	2	43	\N	\N	\N	\N
11612	17	2	44	\N	\N	\N	\N
11613	17	2	45	\N	\N	\N	\N
11614	17	2	46	\N	\N	\N	\N
11615	17	2	47	\N	\N	\N	\N
11616	17	2	48	\N	\N	\N	\N
11617	17	3	1	\N	\N	\N	\N
11618	17	3	2	\N	\N	\N	\N
11619	17	3	3	\N	\N	\N	\N
11620	17	3	4	\N	\N	\N	\N
11621	17	3	5	\N	\N	\N	\N
11622	17	3	6	\N	\N	\N	\N
11623	17	3	7	\N	\N	\N	\N
11624	17	3	8	\N	\N	\N	\N
11625	17	3	9	\N	\N	\N	\N
11626	17	3	10	\N	\N	\N	\N
11627	17	3	11	\N	\N	\N	\N
11628	17	3	12	\N	\N	\N	\N
11629	17	3	13	\N	\N	\N	\N
11630	17	3	14	\N	\N	\N	\N
11631	17	3	15	\N	\N	\N	\N
11632	17	3	16	\N	\N	\N	\N
11633	17	3	17	\N	\N	\N	\N
11634	17	3	18	\N	\N	\N	\N
11635	17	3	19	\N	\N	\N	\N
11636	17	3	20	\N	\N	\N	\N
11637	17	3	21	\N	\N	\N	\N
11638	17	3	22	\N	\N	\N	\N
11639	17	3	23	\N	\N	\N	\N
11640	17	3	24	\N	\N	\N	\N
11641	17	3	25	\N	\N	\N	\N
11642	17	3	26	\N	\N	\N	\N
11643	17	3	27	\N	\N	\N	\N
11644	17	3	28	\N	\N	\N	\N
11645	17	3	29	\N	\N	\N	\N
11646	17	3	30	\N	\N	\N	\N
11647	17	3	31	\N	\N	\N	\N
11648	17	3	32	\N	\N	\N	\N
11649	17	3	33	\N	\N	\N	\N
11650	17	3	34	\N	\N	\N	\N
11651	17	3	35	\N	\N	\N	\N
11652	17	3	36	\N	\N	\N	\N
11653	17	3	37	\N	\N	\N	\N
11654	17	3	38	\N	\N	\N	\N
11655	17	3	39	\N	\N	\N	\N
11656	17	3	40	\N	\N	\N	\N
11657	17	3	41	\N	\N	\N	\N
11658	17	3	42	\N	\N	\N	\N
11659	17	3	43	\N	\N	\N	\N
11660	17	3	44	\N	\N	\N	\N
11661	17	3	45	\N	\N	\N	\N
11662	17	3	46	\N	\N	\N	\N
11663	17	3	47	\N	\N	\N	\N
11664	17	3	48	\N	\N	\N	\N
11665	17	4	1	\N	\N	\N	\N
11666	17	4	2	\N	\N	\N	\N
11667	17	4	3	\N	\N	\N	\N
11668	17	4	4	\N	\N	\N	\N
11669	17	4	5	\N	\N	\N	\N
11670	17	4	6	\N	\N	\N	\N
11671	17	4	7	\N	\N	\N	\N
11672	17	4	8	\N	\N	\N	\N
11673	17	4	9	\N	\N	\N	\N
11674	17	4	10	\N	\N	\N	\N
11675	17	4	11	\N	\N	\N	\N
11676	17	4	12	\N	\N	\N	\N
11677	17	4	13	\N	\N	\N	\N
11678	17	4	14	\N	\N	\N	\N
11679	17	4	15	\N	\N	\N	\N
11680	17	4	16	\N	\N	\N	\N
11681	17	4	17	\N	\N	\N	\N
11682	17	4	18	\N	\N	\N	\N
11683	17	4	19	\N	\N	\N	\N
11684	17	4	20	\N	\N	\N	\N
11685	17	4	21	\N	\N	\N	\N
11686	17	4	22	\N	\N	\N	\N
11687	17	4	23	\N	\N	\N	\N
11688	17	4	24	\N	\N	\N	\N
11689	17	4	25	\N	\N	\N	\N
11690	17	4	26	\N	\N	\N	\N
11691	17	4	27	\N	\N	\N	\N
11692	17	4	28	\N	\N	\N	\N
11693	17	4	29	\N	\N	\N	\N
11694	17	4	30	\N	\N	\N	\N
11695	17	4	31	\N	\N	\N	\N
11696	17	4	32	\N	\N	\N	\N
11697	17	4	33	\N	\N	\N	\N
11698	17	4	34	\N	\N	\N	\N
11699	17	4	35	\N	\N	\N	\N
11700	17	4	36	\N	\N	\N	\N
11701	17	4	37	\N	\N	\N	\N
11702	17	4	38	\N	\N	\N	\N
11703	17	4	39	\N	\N	\N	\N
11704	17	4	40	\N	\N	\N	\N
11705	17	4	41	\N	\N	\N	\N
11706	17	4	42	\N	\N	\N	\N
11707	17	4	43	\N	\N	\N	\N
11708	17	4	44	\N	\N	\N	\N
11709	17	4	45	\N	\N	\N	\N
11710	17	4	46	\N	\N	\N	\N
11711	17	4	47	\N	\N	\N	\N
11712	17	4	48	\N	\N	\N	\N
11713	17	5	1	\N	\N	\N	\N
11714	17	5	2	\N	\N	\N	\N
11715	17	5	3	\N	\N	\N	\N
11716	17	5	4	\N	\N	\N	\N
11717	17	5	5	\N	\N	\N	\N
11718	17	5	6	\N	\N	\N	\N
11719	17	5	7	\N	\N	\N	\N
11720	17	5	8	\N	\N	\N	\N
11721	17	5	9	\N	\N	\N	\N
11722	17	5	10	\N	\N	\N	\N
11723	17	5	11	\N	\N	\N	\N
11724	17	5	12	\N	\N	\N	\N
11725	17	5	13	\N	\N	\N	\N
11726	17	5	14	\N	\N	\N	\N
11727	17	5	15	\N	\N	\N	\N
11728	17	5	16	\N	\N	\N	\N
11729	17	5	17	\N	\N	\N	\N
11730	17	5	18	\N	\N	\N	\N
11731	17	5	19	\N	\N	\N	\N
11732	17	5	20	\N	\N	\N	\N
11733	17	5	21	\N	\N	\N	\N
11734	17	5	22	\N	\N	\N	\N
11735	17	5	23	\N	\N	\N	\N
11736	17	5	24	\N	\N	\N	\N
11737	17	5	25	\N	\N	\N	\N
11738	17	5	26	\N	\N	\N	\N
11739	17	5	27	\N	\N	\N	\N
11740	17	5	28	\N	\N	\N	\N
11741	17	5	29	\N	\N	\N	\N
11742	17	5	30	\N	\N	\N	\N
11743	17	5	31	\N	\N	\N	\N
11744	17	5	32	\N	\N	\N	\N
11745	17	5	33	\N	\N	\N	\N
11746	17	5	34	\N	\N	\N	\N
11747	17	5	35	\N	\N	\N	\N
11748	17	5	36	\N	\N	\N	\N
11749	17	5	37	\N	\N	\N	\N
11750	17	5	38	\N	\N	\N	\N
11751	17	5	39	\N	\N	\N	\N
11752	17	5	40	\N	\N	\N	\N
11753	17	5	41	\N	\N	\N	\N
11754	17	5	42	\N	\N	\N	\N
11755	17	5	43	\N	\N	\N	\N
11756	17	5	44	\N	\N	\N	\N
11757	17	5	45	\N	\N	\N	\N
11758	17	5	46	\N	\N	\N	\N
11759	17	5	47	\N	\N	\N	\N
11760	17	5	48	\N	\N	\N	\N
11761	17	6	1	\N	\N	\N	\N
11762	17	6	2	\N	\N	\N	\N
11763	17	6	3	\N	\N	\N	\N
11764	17	6	4	\N	\N	\N	\N
11765	17	6	5	\N	\N	\N	\N
11766	17	6	6	\N	\N	\N	\N
11767	17	6	7	\N	\N	\N	\N
11768	17	6	8	\N	\N	\N	\N
11769	17	6	9	\N	\N	\N	\N
11770	17	6	10	\N	\N	\N	\N
11771	17	6	11	\N	\N	\N	\N
11772	17	6	12	\N	\N	\N	\N
11773	17	6	13	\N	\N	\N	\N
11774	17	6	14	\N	\N	\N	\N
11775	17	6	15	\N	\N	\N	\N
11776	17	6	16	\N	\N	\N	\N
11777	17	6	17	\N	\N	\N	\N
11778	17	6	18	\N	\N	\N	\N
11779	17	6	19	\N	\N	\N	\N
11780	17	6	20	\N	\N	\N	\N
11781	17	6	21	\N	\N	\N	\N
11782	17	6	22	\N	\N	\N	\N
11783	17	6	23	\N	\N	\N	\N
11784	17	6	24	\N	\N	\N	\N
11785	17	6	25	\N	\N	\N	\N
11786	17	6	26	\N	\N	\N	\N
11787	17	6	27	\N	\N	\N	\N
11788	17	6	28	\N	\N	\N	\N
11789	17	6	29	\N	\N	\N	\N
11790	17	6	30	\N	\N	\N	\N
11791	17	6	31	\N	\N	\N	\N
11792	17	6	32	\N	\N	\N	\N
11793	17	6	33	\N	\N	\N	\N
11794	17	6	34	\N	\N	\N	\N
11795	17	6	35	\N	\N	\N	\N
11796	17	6	36	\N	\N	\N	\N
11797	17	6	37	\N	\N	\N	\N
11798	17	6	38	\N	\N	\N	\N
11799	17	6	39	\N	\N	\N	\N
11800	17	6	40	\N	\N	\N	\N
11801	17	6	41	\N	\N	\N	\N
11802	17	6	42	\N	\N	\N	\N
11803	17	6	43	\N	\N	\N	\N
11804	17	6	44	\N	\N	\N	\N
11805	17	6	45	\N	\N	\N	\N
11806	17	6	46	\N	\N	\N	\N
11807	17	6	47	\N	\N	\N	\N
11808	17	6	48	\N	\N	\N	\N
11809	17	7	1	\N	\N	\N	\N
11810	17	7	2	\N	\N	\N	\N
11811	17	7	3	\N	\N	\N	\N
11812	17	7	4	\N	\N	\N	\N
11813	17	7	5	\N	\N	\N	\N
11814	17	7	6	\N	\N	\N	\N
11815	17	7	7	\N	\N	\N	\N
11816	17	7	8	\N	\N	\N	\N
11817	17	7	9	\N	\N	\N	\N
11818	17	7	10	\N	\N	\N	\N
11819	17	7	11	\N	\N	\N	\N
11820	17	7	12	\N	\N	\N	\N
11821	17	7	13	\N	\N	\N	\N
11822	17	7	14	\N	\N	\N	\N
11823	17	7	15	\N	\N	\N	\N
11824	17	7	16	\N	\N	\N	\N
11825	17	7	17	\N	\N	\N	\N
11826	17	7	18	\N	\N	\N	\N
11827	17	7	19	\N	\N	\N	\N
11828	17	7	20	\N	\N	\N	\N
11829	17	7	21	\N	\N	\N	\N
11830	17	7	22	\N	\N	\N	\N
11831	17	7	23	\N	\N	\N	\N
11832	17	7	24	\N	\N	\N	\N
11833	17	7	25	\N	\N	\N	\N
11834	17	7	26	\N	\N	\N	\N
11835	17	7	27	\N	\N	\N	\N
11836	17	7	28	\N	\N	\N	\N
11837	17	7	29	\N	\N	\N	\N
11838	17	7	30	\N	\N	\N	\N
11839	17	7	31	\N	\N	\N	\N
11840	17	7	32	\N	\N	\N	\N
11841	17	7	33	\N	\N	\N	\N
11842	17	7	34	\N	\N	\N	\N
11843	17	7	35	\N	\N	\N	\N
11844	17	7	36	\N	\N	\N	\N
11845	17	7	37	\N	\N	\N	\N
11846	17	7	38	\N	\N	\N	\N
11847	17	7	39	\N	\N	\N	\N
11848	17	7	40	\N	\N	\N	\N
11849	17	7	41	\N	\N	\N	\N
11850	17	7	42	\N	\N	\N	\N
11851	17	7	43	\N	\N	\N	\N
11852	17	7	44	\N	\N	\N	\N
11853	17	7	45	\N	\N	\N	\N
11854	17	7	46	\N	\N	\N	\N
11855	17	7	47	\N	\N	\N	\N
11856	17	7	48	\N	\N	\N	\N
11857	17	8	1	\N	\N	\N	\N
11858	17	8	2	\N	\N	\N	\N
11859	17	8	3	\N	\N	\N	\N
11860	17	8	4	\N	\N	\N	\N
11861	17	8	5	\N	\N	\N	\N
11862	17	8	6	\N	\N	\N	\N
11863	17	8	7	\N	\N	\N	\N
11864	17	8	8	\N	\N	\N	\N
11865	17	8	9	\N	\N	\N	\N
11866	17	8	10	\N	\N	\N	\N
11867	17	8	11	\N	\N	\N	\N
11868	17	8	12	\N	\N	\N	\N
11869	17	8	13	\N	\N	\N	\N
11870	17	8	14	\N	\N	\N	\N
11871	17	8	15	\N	\N	\N	\N
11872	17	8	16	\N	\N	\N	\N
11873	17	8	17	\N	\N	\N	\N
11874	17	8	18	\N	\N	\N	\N
11875	17	8	19	\N	\N	\N	\N
11876	17	8	20	\N	\N	\N	\N
11877	17	8	21	\N	\N	\N	\N
11878	17	8	22	\N	\N	\N	\N
11879	17	8	23	\N	\N	\N	\N
11880	17	8	24	\N	\N	\N	\N
11881	17	8	25	\N	\N	\N	\N
11882	17	8	26	\N	\N	\N	\N
11883	17	8	27	\N	\N	\N	\N
11884	17	8	28	\N	\N	\N	\N
11885	17	8	29	\N	\N	\N	\N
11886	17	8	30	\N	\N	\N	\N
11887	17	8	31	\N	\N	\N	\N
11888	17	8	32	\N	\N	\N	\N
11889	17	8	33	\N	\N	\N	\N
11890	17	8	34	\N	\N	\N	\N
11891	17	8	35	\N	\N	\N	\N
11892	17	8	36	\N	\N	\N	\N
11893	17	8	37	\N	\N	\N	\N
11894	17	8	38	\N	\N	\N	\N
11895	17	8	39	\N	\N	\N	\N
11896	17	8	40	\N	\N	\N	\N
11897	17	8	41	\N	\N	\N	\N
11898	17	8	42	\N	\N	\N	\N
11899	17	8	43	\N	\N	\N	\N
11900	17	8	44	\N	\N	\N	\N
11901	17	8	45	\N	\N	\N	\N
11902	17	8	46	\N	\N	\N	\N
11903	17	8	47	\N	\N	\N	\N
11904	17	8	48	\N	\N	\N	\N
11905	17	9	1	\N	\N	\N	\N
11906	17	9	2	\N	\N	\N	\N
11907	17	9	3	\N	\N	\N	\N
11908	17	9	4	\N	\N	\N	\N
11909	17	9	5	\N	\N	\N	\N
11910	17	9	6	\N	\N	\N	\N
11911	17	9	7	\N	\N	\N	\N
11912	17	9	8	\N	\N	\N	\N
11913	17	9	9	\N	\N	\N	\N
11914	17	9	10	\N	\N	\N	\N
11915	17	9	11	\N	\N	\N	\N
11916	17	9	12	\N	\N	\N	\N
11917	17	9	13	\N	\N	\N	\N
11918	17	9	14	\N	\N	\N	\N
11919	17	9	15	\N	\N	\N	\N
11920	17	9	16	\N	\N	\N	\N
11921	17	9	17	\N	\N	\N	\N
11922	17	9	18	\N	\N	\N	\N
11923	17	9	19	\N	\N	\N	\N
11924	17	9	20	\N	\N	\N	\N
11925	17	9	21	\N	\N	\N	\N
11926	17	9	22	\N	\N	\N	\N
11927	17	9	23	\N	\N	\N	\N
11928	17	9	24	\N	\N	\N	\N
11929	17	9	25	\N	\N	\N	\N
11930	17	9	26	\N	\N	\N	\N
11931	17	9	27	\N	\N	\N	\N
11932	17	9	28	\N	\N	\N	\N
11933	17	9	29	\N	\N	\N	\N
11934	17	9	30	\N	\N	\N	\N
11935	17	9	31	\N	\N	\N	\N
11936	17	9	32	\N	\N	\N	\N
11937	17	9	33	\N	\N	\N	\N
11938	17	9	34	\N	\N	\N	\N
11939	17	9	35	\N	\N	\N	\N
11940	17	9	36	\N	\N	\N	\N
11941	17	9	37	\N	\N	\N	\N
11942	17	9	38	\N	\N	\N	\N
11943	17	9	39	\N	\N	\N	\N
11944	17	9	40	\N	\N	\N	\N
11945	17	9	41	\N	\N	\N	\N
11946	17	9	42	\N	\N	\N	\N
11947	17	9	43	\N	\N	\N	\N
11948	17	9	44	\N	\N	\N	\N
11949	17	9	45	\N	\N	\N	\N
11950	17	9	46	\N	\N	\N	\N
11951	17	9	47	\N	\N	\N	\N
11952	17	9	48	\N	\N	\N	\N
11953	17	10	1	\N	\N	\N	\N
11954	17	10	2	\N	\N	\N	\N
11955	17	10	3	\N	\N	\N	\N
11956	17	10	4	\N	\N	\N	\N
11957	17	10	5	\N	\N	\N	\N
11958	17	10	6	\N	\N	\N	\N
11959	17	10	7	\N	\N	\N	\N
11960	17	10	8	\N	\N	\N	\N
11961	17	10	9	\N	\N	\N	\N
11962	17	10	10	\N	\N	\N	\N
11963	17	10	11	\N	\N	\N	\N
11964	17	10	12	\N	\N	\N	\N
11965	17	10	13	\N	\N	\N	\N
11966	17	10	14	\N	\N	\N	\N
11967	17	10	15	\N	\N	\N	\N
11968	17	10	16	\N	\N	\N	\N
11969	17	10	17	\N	\N	\N	\N
11970	17	10	18	\N	\N	\N	\N
11971	17	10	19	\N	\N	\N	\N
11972	17	10	20	\N	\N	\N	\N
11973	17	10	21	\N	\N	\N	\N
11974	17	10	22	\N	\N	\N	\N
11975	17	10	23	\N	\N	\N	\N
11976	17	10	24	\N	\N	\N	\N
11977	17	10	25	\N	\N	\N	\N
11978	17	10	26	\N	\N	\N	\N
11979	17	10	27	\N	\N	\N	\N
11980	17	10	28	\N	\N	\N	\N
11981	17	10	29	\N	\N	\N	\N
11982	17	10	30	\N	\N	\N	\N
11983	17	10	31	\N	\N	\N	\N
11984	17	10	32	\N	\N	\N	\N
11985	17	10	33	\N	\N	\N	\N
11986	17	10	34	\N	\N	\N	\N
11987	17	10	35	\N	\N	\N	\N
11988	17	10	36	\N	\N	\N	\N
11989	17	10	37	\N	\N	\N	\N
11990	17	10	38	\N	\N	\N	\N
11991	17	10	39	\N	\N	\N	\N
11992	17	10	40	\N	\N	\N	\N
11993	17	10	41	\N	\N	\N	\N
11994	17	10	42	\N	\N	\N	\N
11995	17	10	43	\N	\N	\N	\N
11996	17	10	44	\N	\N	\N	\N
11997	17	10	45	\N	\N	\N	\N
11998	17	10	46	\N	\N	\N	\N
11999	17	10	47	\N	\N	\N	\N
12000	17	10	48	\N	\N	\N	\N
12001	17	11	1	\N	\N	\N	\N
12002	17	11	2	\N	\N	\N	\N
12003	17	11	3	\N	\N	\N	\N
12004	17	11	4	\N	\N	\N	\N
12005	17	11	5	\N	\N	\N	\N
12006	17	11	6	\N	\N	\N	\N
12007	17	11	7	\N	\N	\N	\N
12008	17	11	8	\N	\N	\N	\N
12009	17	11	9	\N	\N	\N	\N
12010	17	11	10	\N	\N	\N	\N
12011	17	11	11	\N	\N	\N	\N
12012	17	11	12	\N	\N	\N	\N
12013	17	11	13	\N	\N	\N	\N
12014	17	11	14	\N	\N	\N	\N
12015	17	11	15	\N	\N	\N	\N
12016	17	11	16	\N	\N	\N	\N
12017	17	11	17	\N	\N	\N	\N
12018	17	11	18	\N	\N	\N	\N
12019	17	11	19	\N	\N	\N	\N
12020	17	11	20	\N	\N	\N	\N
12021	17	11	21	\N	\N	\N	\N
12022	17	11	22	\N	\N	\N	\N
12023	17	11	23	\N	\N	\N	\N
12024	17	11	24	\N	\N	\N	\N
12025	17	11	25	\N	\N	\N	\N
12026	17	11	26	\N	\N	\N	\N
12027	17	11	27	\N	\N	\N	\N
12028	17	11	28	\N	\N	\N	\N
12029	17	11	29	\N	\N	\N	\N
12030	17	11	30	\N	\N	\N	\N
12031	17	11	31	\N	\N	\N	\N
12032	17	11	32	\N	\N	\N	\N
12033	17	11	33	\N	\N	\N	\N
12034	17	11	34	\N	\N	\N	\N
12035	17	11	35	\N	\N	\N	\N
12036	17	11	36	\N	\N	\N	\N
12037	17	11	37	\N	\N	\N	\N
12038	17	11	38	\N	\N	\N	\N
12039	17	11	39	\N	\N	\N	\N
12040	17	11	40	\N	\N	\N	\N
12041	17	11	41	\N	\N	\N	\N
12042	17	11	42	\N	\N	\N	\N
12043	17	11	43	\N	\N	\N	\N
12044	17	11	44	\N	\N	\N	\N
12045	17	11	45	\N	\N	\N	\N
12046	17	11	46	\N	\N	\N	\N
12047	17	11	47	\N	\N	\N	\N
12048	17	11	48	\N	\N	\N	\N
12049	17	12	1	\N	\N	\N	\N
12050	17	12	2	\N	\N	\N	\N
12051	17	12	3	\N	\N	\N	\N
12052	17	12	4	\N	\N	\N	\N
12053	17	12	5	\N	\N	\N	\N
12054	17	12	6	\N	\N	\N	\N
12055	17	12	7	\N	\N	\N	\N
12056	17	12	8	\N	\N	\N	\N
12057	17	12	9	\N	\N	\N	\N
12058	17	12	10	\N	\N	\N	\N
12059	17	12	11	\N	\N	\N	\N
12060	17	12	12	\N	\N	\N	\N
12061	17	12	13	\N	\N	\N	\N
12062	17	12	14	\N	\N	\N	\N
12063	17	12	15	\N	\N	\N	\N
12064	17	12	16	\N	\N	\N	\N
12065	17	12	17	\N	\N	\N	\N
12066	17	12	18	\N	\N	\N	\N
12067	17	12	19	\N	\N	\N	\N
12068	17	12	20	\N	\N	\N	\N
12069	17	12	21	\N	\N	\N	\N
12070	17	12	22	\N	\N	\N	\N
12071	17	12	23	\N	\N	\N	\N
12072	17	12	24	\N	\N	\N	\N
12073	17	12	25	\N	\N	\N	\N
12074	17	12	26	\N	\N	\N	\N
12075	17	12	27	\N	\N	\N	\N
12076	17	12	28	\N	\N	\N	\N
12077	17	12	29	\N	\N	\N	\N
12078	17	12	30	\N	\N	\N	\N
12079	17	12	31	\N	\N	\N	\N
12080	17	12	32	\N	\N	\N	\N
12081	17	12	33	\N	\N	\N	\N
12082	17	12	34	\N	\N	\N	\N
12083	17	12	35	\N	\N	\N	\N
12084	17	12	36	\N	\N	\N	\N
12085	17	12	37	\N	\N	\N	\N
12086	17	12	38	\N	\N	\N	\N
12087	17	12	39	\N	\N	\N	\N
12088	17	12	40	\N	\N	\N	\N
12089	17	12	41	\N	\N	\N	\N
12090	17	12	42	\N	\N	\N	\N
12091	17	12	43	\N	\N	\N	\N
12092	17	12	44	\N	\N	\N	\N
12093	17	12	45	\N	\N	\N	\N
12094	17	12	46	\N	\N	\N	\N
12095	17	12	47	\N	\N	\N	\N
12096	17	12	48	\N	\N	\N	\N
12097	17	13	1	\N	\N	\N	\N
12098	17	13	2	\N	\N	\N	\N
12099	17	13	3	\N	\N	\N	\N
12100	17	13	4	\N	\N	\N	\N
12101	17	13	5	\N	\N	\N	\N
12102	17	13	6	\N	\N	\N	\N
12103	17	13	7	\N	\N	\N	\N
12104	17	13	8	\N	\N	\N	\N
12105	17	13	9	\N	\N	\N	\N
12106	17	13	10	\N	\N	\N	\N
12107	17	13	11	\N	\N	\N	\N
12108	17	13	12	\N	\N	\N	\N
12109	17	13	13	\N	\N	\N	\N
12110	17	13	14	\N	\N	\N	\N
12111	17	13	15	\N	\N	\N	\N
12112	17	13	16	\N	\N	\N	\N
12113	17	13	17	\N	\N	\N	\N
12114	17	13	18	\N	\N	\N	\N
12115	17	13	19	\N	\N	\N	\N
12116	17	13	20	\N	\N	\N	\N
12117	17	13	21	\N	\N	\N	\N
12118	17	13	22	\N	\N	\N	\N
12119	17	13	23	\N	\N	\N	\N
12120	17	13	24	\N	\N	\N	\N
12121	17	13	25	\N	\N	\N	\N
12122	17	13	26	\N	\N	\N	\N
12123	17	13	27	\N	\N	\N	\N
12124	17	13	28	\N	\N	\N	\N
12125	17	13	29	\N	\N	\N	\N
12126	17	13	30	\N	\N	\N	\N
12127	17	13	31	\N	\N	\N	\N
12128	17	13	32	\N	\N	\N	\N
12129	17	13	33	\N	\N	\N	\N
12130	17	13	34	\N	\N	\N	\N
12131	17	13	35	\N	\N	\N	\N
12132	17	13	36	\N	\N	\N	\N
12133	17	13	37	\N	\N	\N	\N
12134	17	13	38	\N	\N	\N	\N
12135	17	13	39	\N	\N	\N	\N
12136	17	13	40	\N	\N	\N	\N
12137	17	13	41	\N	\N	\N	\N
12138	17	13	42	\N	\N	\N	\N
12139	17	13	43	\N	\N	\N	\N
12140	17	13	44	\N	\N	\N	\N
12141	17	13	45	\N	\N	\N	\N
12142	17	13	46	\N	\N	\N	\N
12143	17	13	47	\N	\N	\N	\N
12144	17	13	48	\N	\N	\N	\N
12145	17	14	1	\N	\N	\N	\N
12146	17	14	2	\N	\N	\N	\N
12147	17	14	3	\N	\N	\N	\N
12148	17	14	4	\N	\N	\N	\N
12149	17	14	5	\N	\N	\N	\N
12150	17	14	6	\N	\N	\N	\N
12151	17	14	7	\N	\N	\N	\N
12152	17	14	8	\N	\N	\N	\N
12153	17	14	9	\N	\N	\N	\N
12154	17	14	10	\N	\N	\N	\N
12155	17	14	11	\N	\N	\N	\N
12156	17	14	12	\N	\N	\N	\N
12157	17	14	13	\N	\N	\N	\N
12158	17	14	14	\N	\N	\N	\N
12159	17	14	15	\N	\N	\N	\N
12160	17	14	16	\N	\N	\N	\N
12161	17	14	17	\N	\N	\N	\N
12162	17	14	18	\N	\N	\N	\N
12163	17	14	19	\N	\N	\N	\N
12164	17	14	20	\N	\N	\N	\N
12165	17	14	21	\N	\N	\N	\N
12166	17	14	22	\N	\N	\N	\N
12167	17	14	23	\N	\N	\N	\N
12168	17	14	24	\N	\N	\N	\N
12169	17	14	25	\N	\N	\N	\N
12170	17	14	26	\N	\N	\N	\N
12171	17	14	27	\N	\N	\N	\N
12172	17	14	28	\N	\N	\N	\N
12173	17	14	29	\N	\N	\N	\N
12174	17	14	30	\N	\N	\N	\N
12175	17	14	31	\N	\N	\N	\N
12176	17	14	32	\N	\N	\N	\N
12177	17	14	33	\N	\N	\N	\N
12178	17	14	34	\N	\N	\N	\N
12179	17	14	35	\N	\N	\N	\N
12180	17	14	36	\N	\N	\N	\N
12181	17	14	37	\N	\N	\N	\N
12182	17	14	38	\N	\N	\N	\N
12183	17	14	39	\N	\N	\N	\N
12184	17	14	40	\N	\N	\N	\N
12185	17	14	41	\N	\N	\N	\N
12186	17	14	42	\N	\N	\N	\N
12187	17	14	43	\N	\N	\N	\N
12188	17	14	44	\N	\N	\N	\N
12189	17	14	45	\N	\N	\N	\N
12190	17	14	46	\N	\N	\N	\N
12191	17	14	47	\N	\N	\N	\N
12192	17	14	48	\N	\N	\N	\N
12193	17	15	1	\N	\N	\N	\N
12194	17	15	2	\N	\N	\N	\N
12195	17	15	3	\N	\N	\N	\N
12196	17	15	4	\N	\N	\N	\N
12197	17	15	5	\N	\N	\N	\N
12198	17	15	6	\N	\N	\N	\N
12199	17	15	7	\N	\N	\N	\N
12200	17	15	8	\N	\N	\N	\N
12201	17	15	9	\N	\N	\N	\N
12202	17	15	10	\N	\N	\N	\N
12203	17	15	11	\N	\N	\N	\N
12204	17	15	12	\N	\N	\N	\N
12205	17	15	13	\N	\N	\N	\N
12206	17	15	14	\N	\N	\N	\N
12207	17	15	15	\N	\N	\N	\N
12208	17	15	16	\N	\N	\N	\N
12209	17	15	17	\N	\N	\N	\N
12210	17	15	18	\N	\N	\N	\N
12211	17	15	19	\N	\N	\N	\N
12212	17	15	20	\N	\N	\N	\N
12213	17	15	21	\N	\N	\N	\N
12214	17	15	22	\N	\N	\N	\N
12215	17	15	23	\N	\N	\N	\N
12216	17	15	24	\N	\N	\N	\N
12217	17	15	25	\N	\N	\N	\N
12218	17	15	26	\N	\N	\N	\N
12219	17	15	27	\N	\N	\N	\N
12220	17	15	28	\N	\N	\N	\N
12221	17	15	29	\N	\N	\N	\N
12222	17	15	30	\N	\N	\N	\N
12223	17	15	31	\N	\N	\N	\N
12224	17	15	32	\N	\N	\N	\N
12225	17	15	33	\N	\N	\N	\N
12226	17	15	34	\N	\N	\N	\N
12227	17	15	35	\N	\N	\N	\N
12228	17	15	36	\N	\N	\N	\N
12229	17	15	37	\N	\N	\N	\N
12230	17	15	38	\N	\N	\N	\N
12231	17	15	39	\N	\N	\N	\N
12232	17	15	40	\N	\N	\N	\N
12233	17	15	41	\N	\N	\N	\N
12234	17	15	42	\N	\N	\N	\N
12235	17	15	43	\N	\N	\N	\N
12236	17	15	44	\N	\N	\N	\N
12237	17	15	45	\N	\N	\N	\N
12238	17	15	46	\N	\N	\N	\N
12239	17	15	47	\N	\N	\N	\N
12240	17	15	48	\N	\N	\N	\N
\.


--
-- TOC entry 2259 (class 0 OID 17380)
-- Dependencies: 1682
-- Data for Name: container_widths; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_widths (id, min_millimeter, max_millimeter, min_feet, max_feet, min_inch, max_inch, created, created_by, modified, modified_by) FROM stdin;
1	2348	2348	8	8	0	0	\N	\N	\N	\N
2	2349	2500	8	8	1	2	\N	\N	\N	\N
3	2501	\N	8	\N	3	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2296 (class 0 OID 17768)
-- Dependencies: 1756
-- Data for Name: container_yard_coordinates; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_yard_coordinates (id, container_yard_id, coordinate_id) FROM stdin;
\.


--
-- TOC entry 2293 (class 0 OID 17737)
-- Dependencies: 1750
-- Data for Name: container_yards; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY container_yards (id, name, branch_id) FROM stdin;
\.


--
-- TOC entry 2295 (class 0 OID 17755)
-- Dependencies: 1754
-- Data for Name: coordinates; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY coordinates (id, block_id, column_id, row_id, tier_id, container_id) FROM stdin;
\.


--
-- TOC entry 2260 (class 0 OID 17385)
-- Dependencies: 1684
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY countries (id, iso2, iso3, name) FROM stdin;
4	AF	AFG	Afghanistan
8	AL	ALB	Albania
10	AQ	ATA	Antarctica
12	DZ	DZA	Algeria
16	AS	ASM	American Samoa
20	AD	AND	Andorra
24	AO	AGO	Angola
28	AG	ATG	Antigua and Barbuda
31	AZ	AZE	Azerbaijan
32	AR	ARG	Argentina
36	AU	AUS	Australia
40	AT	AUT	Austria
44	BS	BHS	Bahamas
48	BH	BHR	Bahrain
50	BD	BGD	Bangladesh
51	AM	ARM	Armenia
52	BB	BRB	Barbados
56	BE	BEL	Belgium
60	BM	BMU	Bermuda
64	BT	BTN	Bhutan
68	BO	BOL	Bolivia
70	BA	BIH	Bosnia and Herzegovina
72	BW	BWA	Botswana
74	BV	BVT	Bouvet Island
76	BR	BRA	Brazil
84	BZ	BLZ	Belize
86	IO	IOT	British Indian Ocean Territory
90	SB	SLB	Solomon Islands
92	VG	VGB	Virgin Islands, British
96	BN	BRN	Brunei Darussalam
100	BG	BGR	Bulgaria
104	MM	MMR	Myanmar
108	BI	BDI	Burundi
112	BY	BLR	Belarus
116	KH	KHM	Cambodia
120	CM	CMR	Cameroon
124	CA	CAN	Canada
132	CV	CPV	Cape Verde
136	KY	CYM	Cayman Islands
140	CF	CAF	Central African Republic
144	LK	LKA	Sri Lanka
148	TD	TCD	Chad
152	CL	CHL	Chile
156	CN	CHN	China
158	TW	TWN	Taiwan, Province of China
162	CX	CXR	Christmas Island
166	CC	CCK	Cocos (Keeling); Islands
170	CO	COL	Colombia
174	KM	COM	Comoros
175	YT	MYT	Mayotte
178	CG	COG	Congo
180	CD	COD	Congo, Democratic Republic of the
184	CK	COK	Cook Islands
188	CR	CRI	Costa Rica
191	HR	HRV	Croatia
192	CU	CUB	Cuba
196	CY	CYP	Cyprus
203	CZ	CZE	Czech Republic
204	BJ	BEN	Benin
208	DK	DNK	Denmark
212	DM	DMA	Dominica
214	DO	DOM	Dominican Republic
218	EC	ECU	Ecuador
222	SV	SLV	El Salvador
226	GQ	GNQ	Equatorial Guinea
231	ET	ETH	Ethiopia
232	ER	ERI	Eritrea
233	EE	EST	Estonia
234	FO	FRO	Faroe Islands
238	FK	FLK	Falkland Islands (Malvinas);
239	GS	SGS	South Georgia and the South Sandwich Islands
242	FJ	FJI	Fiji
246	FI	FIN	Finland
248	AX	ALA	Aland Islands
250	FR	FRA	France
254	GF	GUF	French Guiana
258	PF	PYF	French Polynesia
260	TF	ATF	French Southern Territories
262	DJ	DJI	Djibouti
266	GA	GAB	Gabon
268	GE	GEO	Georgia
270	GM	GMB	Gambia
275	PS	PSE	Palestinian Territory, Occupied
276	DE	DEU	Germany
288	GH	GHA	Ghana
292	GI	GIB	Gibraltar
296	KI	KIR	Kiribati
300	GR	GRC	Greece
304	GL	GRL	Greenland
308	GD	GRD	Grenada
312	GP	GLP	Guadeloupe
316	GU	GUM	Guam
320	GT	GTM	Guatemala
324	GN	GIN	Guinea
328	GY	GUY	Guyana
332	HT	HTI	Haiti
334	HM	HMD	Heard Island and McDonald Islands
336	VA	VAT	Holy See (Vatican City State);
340	HN	HND	Honduras
344	HK	HKG	Hong Kong
348	HU	HUN	Hungary
352	IS	ISL	Iceland
356	IN	IND	India
360	ID	IDN	Indonesia
364	IR	IRN	Iran, Islamic Republic of
368	IQ	IRQ	Iraq
372	IE	IRL	Ireland
376	IL	ISR	Israel
380	IT	ITA	Italy
384	CI	CIV	Côte d'Ivoire
388	JM	JAM	Jamaica
392	JP	JPN	Japan
398	KZ	KAZ	Kazakhstan
400	JO	JOR	Jordan
404	KE	KEN	Kenya
408	KP	PRK	Korea, Democratic People's Republic of
410	KR	KOR	Korea, Republic of
414	KW	KWT	Kuwait
417	KG	KGZ	Kyrgyzstan
418	LA	LAO	Lao People's Democratic Republic
422	LB	LBN	Lebanon
426	LS	LSO	Lesotho
428	LV	LVA	Latvia
430	LR	LBR	Liberia
434	LY	LBY	Libyan Arab Jamahiriya
438	LI	LIE	Liechtenstein
440	LT	LTU	Lithuania
442	LU	LUX	Luxembourg
446	MO	MAC	Macao
450	MG	MDG	Madagascar
454	MW	MWI	Malawi
458	MY	MYS	Malaysia
462	MV	MDV	Maldives
466	ML	MLI	Mali
470	MT	MLT	Malta
474	MQ	MTQ	Martinique
478	MR	MRT	Mauritania
480	MU	MUS	Mauritius
484	MX	MEX	Mexico
492	MC	MCO	Monaco
496	MN	MNG	Mongolia
498	MD	MDA	Moldova
499	ME	MNE	Montenegro
500	MS	MSR	Montserrat
504	MA	MAR	Morocco
508	MZ	MOZ	Mozambique
512	OM	OMN	Oman
516	NA	NAM	Namibia
520	NR	NRU	Nauru
524	NP	NPL	Nepal
528	NL	NLD	Netherlands
530	AN	ANT	Netherlands Antilles
533	AW	ABW	Aruba
540	NC	NCL	New Caledonia
548	VU	VUT	Vanuatu
554	NZ	NZL	New Zealand
558	NI	NIC	Nicaragua
562	NE	NER	Niger
566	NG	NGA	Nigeria
570	NU	NIU	Niue
574	NF	NFK	Norfolk Island
578	NO	NOR	Norway
580	MP	MNP	Northern Mariana Islands
581	UM	UMI	United States Minor Outlying Islands
583	FM	FSM	Micronesia, Federated States of
584	MH	MHL	Marshall Islands
585	PW	PLW	Palau
586	PK	PAK	Pakistan
591	PA	PAN	Panama
598	PG	PNG	Papua New Guinea
600	PY	PRY	Paraguay
604	PE	PER	Peru
608	PH	PHL	Philippines
612	PN	PCN	Pitcairn
616	PL	POL	Poland
620	PT	PRT	Portugal
624	GW	GNB	Guinea-Bissau
626	TL	TLS	Timor-Leste
630	PR	PRI	Puerto Rico
634	QA	QAT	Qatar
638	RE	REU	Réunion
642	RO	ROU	Romania
643	RU	RUS	Russian Federation
646	RW	RWA	Rwanda
652	BL	BLM	Saint Barthélemy
654	SH	SHN	Saint Helena
659	KN	KNA	Saint Kitts and Nevis
660	AI	AIA	Anguilla
662	LC	LCA	Saint Lucia
663	MF	MAF	Saint Martin (French part);
666	PM	SPM	Saint Pierre and Miquelon
670	VC	VCT	Saint Vincent and the Grenadines
674	SM	SMR	San Marino
678	ST	STP	Sao Tome and Principe
682	SA	SAU	Saudi Arabia
686	SN	SEN	Senegal
688	RS	SRB	Serbia[5]
690	SC	SYC	Seychelles
694	SL	SLE	Sierra Leone
702	SG	SGP	Singapore
703	SK	SVK	Slovakia
704	VN	VNM	Viet Nam
705	SI	SVN	Slovenia
706	SO	SOM	Somalia
710	ZA	ZAF	South Africa
716	ZW	ZWE	Zimbabwe
724	ES	ESP	Spain
732	EH	ESH	Western Sahara
736	SD	SDN	Sudan
740	SR	SUR	Suriname
744	SJ	SJM	Svalbard and Jan Mayen
748	SZ	SWZ	Swaziland
752	SE	SWE	Sweden
756	CH	CHE	Switzerland
760	SY	SYR	Syrian Arab Republic
762	TJ	TJK	Tajikistan
764	TH	THA	Thailand
768	TG	TGO	Togo
772	TK	TKL	Tokelau
776	TO	TON	Tonga
780	TT	TTO	Trinidad and Tobago
784	AE	ARE	United Arab Emirates
788	TN	TUN	Tunisia
792	TR	TUR	Turkey
795	TM	TKM	Turkmenistan
796	TC	TCA	Turks and Caicos Islands
798	TV	TUV	Tuvalu
800	UG	UGA	Uganda
804	UA	UKR	Ukraine
807	MK	MKD	Macedonia, the former Yugoslav Republic of
818	EG	EGY	Egypt
826	GB	GBR	United Kingdom
831	GG	GGY	Guernsey
832	JE	JEY	Jersey
833	IM	IMN	Isle of Man
834	TZ	TZA	Tanzania, United Republic of
840	US	USA	United States
850	VI	VIR	Virgin Islands, U.S.
854	BF	BFA	Burkina Faso
858	UY	URY	Uruguay
860	UZ	UZB	Uzbekistan
862	VE	VEN	Venezuela
876	WF	WLF	Wallis and Futuna
882	WS	WSM	Samoa
887	YE	YEM	Yemen
894	ZM	ZMB	Zambia
\.


--
-- TOC entry 2261 (class 0 OID 17390)
-- Dependencies: 1686
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY customers (id, name, contact_person_id) FROM stdin;
\.


--
-- TOC entry 2262 (class 0 OID 17395)
-- Dependencies: 1688
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY drivers (id, first_name, middle_name, last_name, license_id) FROM stdin;
2	Desanto		Wuryantono	2
3	JAMES	\N	SMITH	3
4	JOHN	\N	JOHNSON	4
5	ROBERT	\N	WILLIAMS	5
6	MICHAEL	\N	JONES	6
7	WILLIAM	\N	BROWN	7
8	DAVID	\N	DAVIS	8
9	RICHARD	\N	MILLER	9
10	CHARLES	\N	WILSON	10
11	JOSEPH	\N	MOORE	11
12	THOMAS	\N	TAYLOR	12
13	CHRISTOPHER	\N	ANDERSON	13
15	PAUL	\N	JACKSON	15
16	MARK	\N	WHITE	16
17	DONALD	\N	HARRIS	17
18	GEORGE	\N	MARTIN	18
19	KENNETH	\N	THOMPSON	19
20	STEVEN	\N	GARCIA	20
21	EDWARD	\N	MARTINEZ	21
22	BRIAN	\N	ROBINSON	22
23	RONALD	\N	CLARK	23
24	ANTHONY	\N	RODRIGUEZ	24
25	KEVIN	\N	LEWIS	25
26	JASON	\N	LEE	26
27	MATTHEW	\N	WALKER	27
28	GARY	\N	HALL	28
29	TIMOTHY	\N	ALLEN	29
30	JOSE	\N	YOUNG	30
31	LARRY	\N	HERNANDEZ	31
32	JEFFREY	\N	KING	32
33	FRANK	\N	WRIGHT	33
34	SCOTT	\N	LOPEZ	34
35	ERIC	\N	HILL	35
36	STEPHEN	\N	SCOTT	36
37	ANDREW	\N	GREEN	37
38	RAYMOND	\N	ADAMS	38
39	GREGORY	\N	BAKER	39
40	JOSHUA	\N	GONZALEZ	40
41	JERRY	\N	NELSON	41
42	DENNIS	\N	CARTER	42
43	WALTER	\N	MITCHELL	43
44	PATRICK	\N	PEREZ	44
45	PETER	\N	ROBERTS	45
46	HAROLD	\N	TURNER	46
47	DOUGLAS	\N	PHILLIPS	47
48	HENRY	\N	CAMPBELL	48
49	CARL	\N	PARKER	49
50	ARTHUR	\N	EVANS	50
51	RYAN	\N	EDWARDS	51
52	ROGER	\N	COLLINS	52
1	Fandi		Fardian	1
14	DANIEL	\N	THOMAS	14
\.


--
-- TOC entry 2288 (class 0 OID 17683)
-- Dependencies: 1740
-- Data for Name: freights; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY freights (id, schedule_id, locomotive_id, date) FROM stdin;
\.


--
-- TOC entry 2263 (class 0 OID 17402)
-- Dependencies: 1691
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY groups (id, name) FROM stdin;
2	user
1	admin
\.


--
-- TOC entry 2264 (class 0 OID 17407)
-- Dependencies: 1693
-- Data for Name: groups_menus; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY groups_menus (group_id, menu_id) FROM stdin;
2	32
1	14
1	15
1	26
1	27
1	5
1	6
1	7
1	9
1	12
1	24
1	31
\.


--
-- TOC entry 2265 (class 0 OID 17410)
-- Dependencies: 1694
-- Data for Name: groups_module_actions; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY groups_module_actions (module_action_id, group_id) FROM stdin;
208	2
202	2
203	2
204	2
205	2
206	2
152	2
153	2
154	2
155	2
156	2
157	2
158	2
159	2
160	2
161	2
172	2
173	2
174	2
175	2
176	2
168	2
169	2
170	2
171	2
167	2
22	1
23	1
24	1
25	1
152	1
153	1
154	1
155	1
156	1
157	1
158	1
159	1
160	1
161	1
54	1
55	1
56	1
57	1
172	1
173	1
174	1
175	1
176	1
168	1
169	1
170	1
171	1
167	1
126	1
139	1
140	1
141	1
142	1
99	1
100	1
101	1
102	1
42	1
43	1
44	1
45	1
50	1
51	1
52	1
53	1
73	1
26	1
27	1
28	1
29	1
113	1
114	1
115	1
116	1
199	1
200	1
201	1
195	1
196	1
197	1
198	1
208	1
202	1
203	1
204	1
205	1
206	1
207	1
34	1
35	1
36	1
37	1
95	1
96	1
97	1
98	1
\.


--
-- TOC entry 2266 (class 0 OID 17413)
-- Dependencies: 1695
-- Data for Name: letter_numbers; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY letter_numbers (id, no_start, no_end, valid_start, valid_end, active, created, created_by) FROM stdin;
\.


--
-- TOC entry 2267 (class 0 OID 17419)
-- Dependencies: 1697
-- Data for Name: license_types; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY license_types (id, name) FROM stdin;
\.


--
-- TOC entry 2268 (class 0 OID 17424)
-- Dependencies: 1699
-- Data for Name: licenses; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY licenses (id, license_type_id, code, authorized_by, issued_date, expired_date) FROM stdin;
\.


--
-- TOC entry 2291 (class 0 OID 17717)
-- Dependencies: 1746
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY locations (id, name) FROM stdin;
\.


--
-- TOC entry 2289 (class 0 OID 17693)
-- Dependencies: 1742
-- Data for Name: locomotives; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY locomotives (id, code) FROM stdin;
\.


--
-- TOC entry 2269 (class 0 OID 17432)
-- Dependencies: 1701
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY members (id, code, name, vehicle_category_id, stnk_no, created, created_by, modified, modified_by) FROM stdin;
\.


--
-- TOC entry 2270 (class 0 OID 17437)
-- Dependencies: 1703
-- Data for Name: menu_types; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY menu_types (id, name, call_name, created, created_by, modified, modified_by) FROM stdin;
1	Top Menu	top	2009-11-17 14:13:29	0	2009-12-12 23:45:36	1
2	Left Menu	left	2009-11-17 14:32:48	0	2009-12-12 23:45:45	1
3	Setup	setup	2009-12-12 23:53:31	1	2009-12-12 23:53:31	0
4	Letters	letters	2009-12-12 23:53:43	1	2009-12-12 23:53:43	0
5	Report	report	2009-12-12 23:53:54	1	2009-12-12 23:53:54	0
6	Admin	admin	2009-12-16 13:47:50	1	2009-12-16 13:48:59	1
\.


--
-- TOC entry 2271 (class 0 OID 17442)
-- Dependencies: 1705
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY menus (id, parent_id, name, url, element_id, enable, lft, rght, menu_type_id, created, created_by, modified, modified_by) FROM stdin;
5	0	Provinces	/provinces	provinces	1	1	2	3	2009-12-13 02:03:29	1	2009-12-13 02:37:10	1
6	0	Cities	/cities	cities	0	13	14	3	2009-12-13 02:34:56	1	2009-12-13 05:03:34	1
7	0	Letter Numbers	/letter_numbers	letter_numbers	1	3	4	3	2009-12-13 02:51:31	1	2009-12-13 02:53:02	1
9	0	Unit Codes	/unit_codes	unit_codes	1	7	8	3	2009-12-13 02:53:40	1	2009-12-13 02:53:40	0
11	0	Menu	/menus	menus	1	34	37	1	2009-12-13 05:03:18	1	2011-01-28 03:55:57	1
12	0	Menu Type	/menu_types	menu_types	1	15	16	3	2009-12-13 05:12:51	1	2010-06-10 08:49:56	1
14	0	User Management	/users	users	1	19	20	6	2009-12-16 13:49:35	1	2009-12-16 13:49:35	0
15	0	Settings	/site_settings	site_settings	1	21	22	6	2009-12-16 13:50:55	1	2009-12-16 13:50:55	0
24	0	Menu	/menus	menus	1	5	6	3	2009-12-13 05:03:18	1	2009-12-21 16:36:09	1
26	0	Module Management	/modules	modules	1	36	37	6	2009-12-17 10:21:02	3	2009-12-17 10:21:02	0
27	0	Group - Permission	/groups	groups	1	13	14	6	2009-12-17 12:07:33	1	2009-12-17 12:07:33	0
31	0	Member 	/members	members	1	44	45	3	2011-02-07 21:09:27	1	2011-02-07 21:10:07	1
32	\N	License	/licenses	licenses	1	46	47	1	2011-06-12 21:46:53	1	2011-08-10 11:13:44	1
\.


--
-- TOC entry 2272 (class 0 OID 17448)
-- Dependencies: 1707
-- Data for Name: module_actions; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY module_actions (id, module_id, name, created, created_by, modified, modified_by) FROM stdin;
22	5	index	2009-12-17 12:00:01	1	2009-12-17 12:00:01	0
23	5	add	2009-12-17 12:00:01	1	2009-12-17 12:00:01	0
24	5	edit	2009-12-17 12:00:01	1	2009-12-17 12:00:01	0
25	5	delete	2009-12-17 12:00:01	1	2009-12-17 12:00:01	0
26	6	index	2009-12-17 12:00:17	1	2009-12-17 12:00:17	0
27	6	add	2009-12-17 12:00:17	1	2009-12-17 12:00:17	0
28	6	edit	2009-12-17 12:00:17	1	2009-12-17 12:00:17	0
29	6	delete	2009-12-17 12:00:17	1	2009-12-17 17:14:56	0
34	8	index	2009-12-17 12:00:54	1	2009-12-17 12:00:54	0
35	8	add	2009-12-17 12:00:54	1	2009-12-17 12:00:54	0
36	8	edit	2009-12-17 12:00:54	1	2009-12-17 12:00:54	0
37	8	delete	2009-12-17 12:00:54	1	2009-12-17 12:00:54	0
42	10	index	2009-12-17 12:01:51	1	2009-12-17 12:01:51	0
43	10	add	2009-12-17 12:01:51	1	2009-12-17 12:01:51	0
44	10	edit	2009-12-17 12:01:51	1	2009-12-17 12:01:51	0
45	10	delete	2009-12-17 12:01:51	1	2009-12-17 12:01:51	0
50	12	index	2009-12-17 12:05:49	1	2009-12-17 12:05:49	0
51	12	add	2009-12-17 12:05:49	1	2009-12-17 12:05:49	0
52	12	edit	2009-12-17 12:05:49	1	2009-12-17 12:05:49	0
53	12	delete	2009-12-17 12:05:49	1	2009-12-17 12:05:49	0
54	13	index	2009-12-17 12:47:42	1	2009-12-17 12:47:42	0
55	13	add	2009-12-17 12:47:42	1	2009-12-17 12:47:42	0
56	13	edit	2009-12-17 12:47:42	1	2009-12-17 12:47:42	0
57	13	delete	2009-12-17 12:47:42	1	2009-12-17 12:47:42	0
73	14	display	2009-12-20 21:32:51	0	2009-12-20 21:32:51	1
95	11	edit	2009-12-20 23:23:42	0	2009-12-20 23:23:42	1
96	11	add	2009-12-20 23:23:42	0	2009-12-20 23:23:42	1
97	11	index	2009-12-20 23:23:42	0	2009-12-20 23:23:42	1
98	11	delete	2009-12-20 23:23:42	0	2009-12-20 23:23:42	1
99	9	edit	2009-12-20 23:24:05	0	2009-12-20 23:24:05	1
100	9	add	2009-12-20 23:24:05	0	2009-12-20 23:24:05	1
101	9	index	2009-12-20 23:24:05	0	2009-12-20 23:24:05	1
102	9	delete	2009-12-20 23:24:05	0	2009-12-20 23:24:05	1
113	15	index	2009-12-21 11:39:21	1	2009-12-21 11:39:21	0
114	15	add	2009-12-21 11:39:21	1	2009-12-21 11:39:21	0
115	15	edit	2009-12-21 11:39:21	1	2009-12-21 11:39:21	0
116	15	delete	2009-12-21 11:39:21	1	2009-12-21 11:39:21	0
126	17	index	2010-01-13 21:16:44	1	2010-01-13 21:16:44	0
139	21	index	2011-02-07 21:16:25	1	2011-02-07 21:16:25	0
140	21	add	2011-02-07 21:16:25	1	2011-02-07 21:16:25	0
141	21	edit	2011-02-07 21:16:25	1	2011-02-07 21:16:25	0
142	21	delete	2011-02-07 21:16:25	1	2011-02-07 21:16:25	0
168	25	add	2011-08-09 21:16:00	1	2011-08-09 21:16:00	\N
169	25	edit	2011-08-09 21:16:00	1	2011-08-09 21:16:00	\N
170	25	delete	2011-08-09 21:16:00	1	2011-08-09 21:16:00	\N
171	25	view	2011-08-09 21:16:00	1	2011-08-09 21:16:00	\N
152	22	index	2011-06-12 18:40:21	1	2011-06-12 18:40:21	1
153	22	add	2011-06-12 18:40:21	1	2011-06-12 18:40:21	1
154	22	edit	2011-06-12 18:40:21	1	2011-06-12 18:40:21	1
155	22	delete	2011-06-12 18:40:21	1	2011-06-12 18:40:21	1
156	22	view	2011-06-12 18:40:21	1	2011-06-12 18:40:21	1
157	23	index	2011-08-08 21:34:41	1	2011-08-08 21:34:41	\N
158	23	add	2011-08-08 21:34:41	1	2011-08-08 21:34:41	\N
159	23	edit	2011-08-08 21:34:41	1	2011-08-08 21:34:41	\N
160	23	delete	2011-08-08 21:34:41	1	2011-08-08 21:34:41	\N
161	23	view	2011-08-08 21:34:41	1	2011-08-08 21:34:41	\N
208	26	jqgrid_edit	2011-08-27 21:08:16	1	2011-08-27 21:08:16	1
167	25	index	2011-08-09 21:16:00	1	2011-08-09 21:16:00	\N
172	24	index	2011-08-09 21:16:09	1	2011-08-09 21:16:09	1
173	24	add	2011-08-09 21:16:09	1	2011-08-09 21:16:09	1
174	24	edit	2011-08-09 21:16:09	1	2011-08-09 21:16:09	1
175	24	delete	2011-08-09 21:16:09	1	2011-08-09 21:16:09	1
176	24	view	2011-08-09 21:16:09	1	2011-08-09 21:16:09	1
199	27	view	2011-08-27 21:07:47	1	2011-08-27 21:07:47	\N
200	27	jqgrid_list	2011-08-27 21:07:47	1	2011-08-27 21:07:47	\N
201	27	jqgrid_edit	2011-08-27 21:07:47	1	2011-08-27 21:07:47	\N
195	27	index	2011-08-27 21:07:47	1	2011-08-27 21:07:47	\N
196	27	add	2011-08-27 21:07:47	1	2011-08-27 21:07:47	\N
197	27	edit	2011-08-27 21:07:47	1	2011-08-27 21:07:47	\N
198	27	delete	2011-08-27 21:07:47	1	2011-08-27 21:07:47	\N
202	26	index	2011-08-27 21:08:16	1	2011-08-27 21:08:16	1
203	26	add	2011-08-27 21:08:16	1	2011-08-27 21:08:16	1
204	26	edit	2011-08-27 21:08:16	1	2011-08-27 21:08:16	1
205	26	delete	2011-08-27 21:08:16	1	2011-08-27 21:08:16	1
206	26	view	2011-08-27 21:08:16	1	2011-08-27 21:08:16	1
207	26	jqgrid_list	2011-08-27 21:08:16	1	2011-08-27 21:08:16	1
209	28	index	2011-09-07 23:15:19	1	2011-09-07 23:15:19	\N
210	28	add	2011-09-07 23:15:19	1	2011-09-07 23:15:19	\N
211	28	edit	2011-09-07 23:15:19	1	2011-09-07 23:15:19	\N
212	28	delete	2011-09-07 23:15:19	1	2011-09-07 23:15:19	\N
213	29	index	2011-09-07 23:18:16	1	2011-09-07 23:18:16	\N
214	29	add	2011-09-07 23:18:16	1	2011-09-07 23:18:16	\N
215	29	edit	2011-09-07 23:18:16	1	2011-09-07 23:18:16	\N
216	29	delete	2011-09-07 23:18:16	1	2011-09-07 23:18:16	\N
217	30	index	2011-09-07 23:18:57	1	2011-09-07 23:18:57	\N
218	30	add	2011-09-07 23:18:57	1	2011-09-07 23:18:57	\N
219	30	edit	2011-09-07 23:18:57	1	2011-09-07 23:18:57	\N
220	30	delete	2011-09-07 23:18:57	1	2011-09-07 23:18:57	\N
221	31	index	2011-09-07 23:19:22	1	2011-09-07 23:19:22	\N
222	31	add	2011-09-07 23:19:22	1	2011-09-07 23:19:22	\N
223	31	edit	2011-09-07 23:19:22	1	2011-09-07 23:19:22	\N
224	31	delete	2011-09-07 23:19:22	1	2011-09-07 23:19:22	\N
225	32	index	2011-09-07 23:19:45	1	2011-09-07 23:19:45	\N
226	32	add	2011-09-07 23:19:45	1	2011-09-07 23:19:45	\N
227	32	edit	2011-09-07 23:19:45	1	2011-09-07 23:19:45	\N
228	32	delete	2011-09-07 23:19:45	1	2011-09-07 23:19:45	\N
\.


--
-- TOC entry 2273 (class 0 OID 17453)
-- Dependencies: 1709
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY modules (id, name, controller, show_all, created, created_by, modified, modified_by) FROM stdin;
5	Cities	cities	1	2009-12-17 12:00:01	1	2009-12-17 12:00:01	0
6	Provinces	provinces	1	2009-12-17 12:00:17	1	2009-12-17 12:00:17	0
8	Unit Codes	unit_codes	1	2009-12-17 12:00:54	1	2009-12-17 12:00:54	0
9	Menu	menus	1	2009-12-17 12:01:06	1	2009-12-20 23:24:05	1
10	Menu Type	menu_types	1	2009-12-17 12:01:51	1	2009-12-17 12:01:51	0
11	User Management	users	1	2009-12-17 12:02:55	1	2009-12-20 23:23:42	1
12	Module Management	modules	1	2009-12-17 12:05:49	1	2009-12-17 12:05:49	0
13	Group Management	groups	1	2009-12-17 12:47:42	1	2009-12-17 12:47:42	0
14	Pages	pages	1	2009-12-20 21:29:56	1	2009-12-20 21:32:51	1
15	Settings	site_settings	1	2009-12-21 11:39:21	1	2009-12-21 11:39:21	0
17	Log Pengguna	user_logs	1	2010-01-13 21:16:44	1	2010-01-13 21:16:44	0
21	Member	members	1	2011-02-07 21:16:25	1	2011-02-07 21:16:25	0
22	Container Groups	container_groups	1	2011-06-12 17:03:32	1	2011-06-12 18:40:21	1
23	Container Types	container_types	1	2011-08-08 21:34:41	1	2011-08-08 21:34:41	\N
25	License Types	license_types	1	2011-08-09 21:16:00	1	2011-08-09 21:16:00	\N
24	Licenses	licenses	1	2011-08-09 21:15:24	1	2011-08-09 21:16:09	1
27	Trucking Company	trucking_companies	1	2011-08-27 21:07:47	1	2011-08-27 21:07:47	\N
26	Trucks	trucks	1	2011-08-10 13:44:53	1	2011-08-27 21:08:16	1
28	Carriage Freight	carriage_freights	1	2011-09-07 23:15:19	1	2011-09-07 23:15:19	\N
29	Carriage	carriages	1	2011-09-07 23:18:16	1	2011-09-07 23:18:16	\N
30	Freight	freights	1	2011-09-07 23:18:57	1	2011-09-07 23:18:57	\N
31	Locomotive	locomotives	1	2011-09-07 23:19:22	1	2011-09-07 23:19:22	\N
32	Schedule	schedules	1	2011-09-07 23:19:45	1	2011-09-07 23:19:45	\N
\.


--
-- TOC entry 2274 (class 0 OID 17459)
-- Dependencies: 1711
-- Data for Name: packets; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY packets (id, name) FROM stdin;
\.


--
-- TOC entry 2275 (class 0 OID 17467)
-- Dependencies: 1713
-- Data for Name: packets_services; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY packets_services (id, packet_id, service_id) FROM stdin;
\.


--
-- TOC entry 2276 (class 0 OID 17472)
-- Dependencies: 1715
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY provinces (id, code, name, created_by, created, modified_by, modified) FROM stdin;
1	BB	KEPULAUAN BANGKA BELITUNG	\N	\N	\N	\N
2	BK	BENGKULU	\N	\N	\N	\N
3	BL	BALI	\N	\N	\N	\N
4	BT	BANTEN	\N	\N	\N	\N
7	CR	SULAWESI TENGGARA	\N	\N	\N	\N
11	JB	JAWA BARAT	\N	\N	\N	\N
18	KH	KALIMANTAN TENGAH	\N	\N	\N	\N
19	KR	KEPULAUAN RIAU	\N	\N	\N	\N
20	KS	KALIMANTAN SELATAN	\N	\N	\N	\N
22	LP	LAMPUNG	\N	\N	\N	\N
23	ML	MALUKU	\N	\N	\N	\N
24	CB	SULAWESI BARAT	\N	\N	\N	\N
25	CH	SULAWESI TENGAH	\N	\N	\N	\N
26	CS	SULAWESI SELATAN	\N	\N	\N	\N
27	CU	SULAWESI UTARA	\N	\N	\N	\N
28	GT	GORONTALO	\N	\N	\N	\N
29	JH	JAWA TENGAH	\N	\N	\N	\N
30	JK	JAKARTA	\N	\N	\N	\N
31	JM	JAMBI	\N	\N	\N	\N
32	JO	DAERAH ISTIMEWA YOGYAKARTA	\N	\N	\N	\N
33	JT	JAWA TIMUR	\N	\N	\N	\N
34	KB	KALIMANTAN BARAT	\N	\N	\N	\N
35	KT	KALIMANTAN TIMUR	\N	\N	\N	\N
36	MU	MALUKU UTARA	\N	\N	\N	\N
37	NA	NANGROE ACEH DARUSSALAM	\N	\N	\N	\N
38	NB	NUSA TENGGARA BARAT	\N	\N	\N	\N
39	NT	NUSA TENGGARA TIMUR	\N	\N	\N	\N
40	PB	PAPUA BARAT	\N	\N	\N	\N
41	PP	PAPUA	\N	\N	\N	\N
42	RI	RIAU	\N	\N	\N	\N
43	SB	SUMATERA BARAT	\N	\N	\N	\N
44	SS	SUMATERA SELATAN	\N	\N	\N	\N
45	SU	SUMATERA UTARA	\N	\N	\N	\N
46	NY	NEW YORK	\N	\N	\N	\N
47	WS	WASHINGTON DC.	\N	\N	\N	\N
48	BM	BOMBAY	\N	\N	\N	\N
\.


--
-- TOC entry 2300 (class 0 OID 17822)
-- Dependencies: 1764
-- Data for Name: rows; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY rows (id, code) FROM stdin;
\.


--
-- TOC entry 2290 (class 0 OID 17703)
-- Dependencies: 1744
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY schedules (id, arrival_time, departure_time, closing_time) FROM stdin;
\.


--
-- TOC entry 2277 (class 0 OID 17481)
-- Dependencies: 1717
-- Data for Name: service_charges; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY service_charges (id, service_id, date_applied, basic_charge) FROM stdin;
\.


--
-- TOC entry 2278 (class 0 OID 17486)
-- Dependencies: 1719
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY services (id, name, default_debitur, default_creditur) FROM stdin;
\.


--
-- TOC entry 2279 (class 0 OID 17494)
-- Dependencies: 1721
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY site_settings (id, param, value) FROM stdin;
1	default_lang	ind
3	site_address1	Jl. Ir Haji Djuanda, Jagakarsa, Jakarta Selatan.
4	site_address2	(depan Stasiun Djuanda)
5	site_email	hari.esa@gmail
6	site_web	
8	site_phone	
2	site_name	KALOG OPERATIONAL MANAGEMENT SYSTEM
\.


--
-- TOC entry 2301 (class 0 OID 17830)
-- Dependencies: 1766
-- Data for Name: tiers; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY tiers (id, code) FROM stdin;
\.


--
-- TOC entry 2280 (class 0 OID 17499)
-- Dependencies: 1723
-- Data for Name: trucking_companies; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY trucking_companies (id, name) FROM stdin;
2	Truck B
3	Truck C
4	Truck D
5	Truck E
1	Truck A
\.


--
-- TOC entry 2281 (class 0 OID 17504)
-- Dependencies: 1725
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY trucks (id, plate_number, driver_id, trucking_company_id) FROM stdin;
2	B7334CG   	2	1
3	B5509PB   	3	1
4	B8541ZX   	4	1
5	B2572SY   	5	1
6	B7924OC   	6	1
7	B7294XF   	7	1
8	B4927RX   	8	1
9	B7071IO   	9	1
10	B6717KN   	10	1
11	B5748CT   	11	1
12	B3774TF   	12	1
13	B1019VG   	13	1
15	B2424GP   	15	2
16	B5388TP   	16	2
17	B3624EJ   	17	2
18	B2846FM   	18	2
19	B8831XO   	19	2
20	B5456FD   	20	2
21	B8816AJ   	21	2
22	B4861OI   	22	2
23	B8002SC   	23	2
24	B5015NT   	24	2
25	B5184OR   	25	2
26	B1169OQ   	26	2
27	B2143DA   	27	2
28	B6446UF   	28	2
29	B1454TK   	29	2
30	B2922AY   	30	2
31	B7810FM   	31	3
32	B1692MX   	32	3
33	B9590DE   	33	3
34	B3320UO   	34	3
35	B9567MU   	35	3
36	B2163WC   	36	3
37	B1244JQ   	37	4
38	B6861KA   	38	4
39	B6424NA   	39	4
40	B7650SF   	40	4
41	B3579UN   	41	4
42	B2172PT   	42	4
43	B1424LK   	43	5
44	B3932QT   	44	5
45	B4938AS   	45	5
46	B3182SZ   	46	5
47	B8654JJ   	47	5
48	B7897FB   	48	5
49	B5363YM   	49	5
50	B7486HY   	50	5
1	B2030TM   	1	1
14	B3431KY   	14	2
\.


--
-- TOC entry 2282 (class 0 OID 17509)
-- Dependencies: 1727
-- Data for Name: unit_codes; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY unit_codes (id, name, code, created, created_by, modified, modified_by) FROM stdin;
1	Gaji	01	2009-12-12 22:19:32	1	2010-01-14 22:07:24	1
\.


--
-- TOC entry 2283 (class 0 OID 17514)
-- Dependencies: 1729
-- Data for Name: user_logs; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY user_logs (id, user_id, ip_address, controller, action, request_method, referer, url, user_agent, created) FROM stdin;
1002	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/edit/5	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 15:55:57
1003	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/modules	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 15:56:38
1004	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/modules	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 16:40:33
1005	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/modules	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 16:42:47
1006	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/groups	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 16:42:52
1007	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/groups	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 16:45:47
1008	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/groups	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 17:56:53
1009	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/modules	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 18:36:19
1010	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/customers	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 18:36:55
1011	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/customers	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 19:59:55
929	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:01:14
930	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315069277122&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:01:18
931	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315069277291&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:01:18
932	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?Truck.id=5&_search=false&nd=1315069281183&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:01:21
933	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?Truck.id=4&_search=false&nd=1315069284803&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:01:25
934	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?Truck.id=1&_search=false&nd=1315069291468&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:01:31
935	1	127.0.0.1      	trucks	jqgrid_list	GET		/kalog/trucks/jqgrid_list.json?Truck.id=1&_search=false&nd=1315069291468&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:26:31
936	1	127.0.0.1      	trucks	index	GET		/kalog/trucks	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:27:46
937	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucks	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315070868752&rows=5&page=1&sidx=&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:27:49
938	1	127.0.0.1      	trucks	jqgrid_list	GET		/kalog/trucks/jqgrid_list.json?_search=false&nd=1315070868752&rows=5&page=1&sidx=&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:27:59
939	1	127.0.0.1      	trucks	jqgrid_list	GET		/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315069291468&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:29:15
940	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:29:36
941	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315070979707&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:29:40
942	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315070979884&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:29:40
943	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315070986780&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:29:47
944	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315070991825&rows=10&page=2&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:29:52
945	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315070994894&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 00:29:55
946	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:35:04
947	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315078508081&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:35:09
948	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:36:43
949	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315078606688&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:36:47
950	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315078606908&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:36:47
951	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:38:39
952	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315078721203&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:38:41
953	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315078721059&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:38:41
954	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:39:54
955	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315078796817&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:39:57
956	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315078796664&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:39:57
957	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=5&_search=false&nd=1315078800205&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:40:00
958	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:40:43
959	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:40:50
960	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:41:50
961	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315078913103&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:41:53
962	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315078913253&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:41:54
963	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315078918308&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:41:58
964	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:43:36
965	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315079017666&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:43:38
966	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315079017789&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:43:38
967	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=2&_search=false&nd=1315079034491&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:43:55
968	1	127.0.0.1      	trucks	jqgrid_edit	POST	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_edit.json	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:44:08
969	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=2&_search=false&nd=1315079048446&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:44:08
970	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:56:47
971	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315079808836&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:56:49
972	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315079808735&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:56:49
973	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:57:06
974	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315079829950&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:57:10
975	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315079829749&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 02:57:10
976	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:01:55
977	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315080118196&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:01:59
978	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315080118355&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:01:59
979	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315080124081&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:02:04
1024	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/menu_types	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:43:19
980	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=2&_search=false&nd=1315080134433&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:02:15
981	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:03:19
982	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315080202490&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:03:23
983	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315080202335&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:03:23
984	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315080205393&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:03:25
985	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:52:51
986	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:53:40
987	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315083223781&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:53:44
988	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315083223622&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 03:53:44
989	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 14:57:28
990	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 14:57:49
991	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315123070477&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 14:57:50
992	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315123070534&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 14:57:51
993	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315123072616&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 14:57:52
994	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=2&_search=false&nd=1315123081307&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 14:58:02
995	1	127.0.0.1      	trucking_companies	index	GET		/kalog/trucking_companies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 15:54:57
996	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315126497813&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 15:54:58
997	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/trucking_companies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315126497760&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 15:54:58
998	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/trucks	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 15:55:03
999	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/modules	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 15:55:06
1000	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/groups	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 15:55:10
1001	1	127.0.0.1      	modules	edit	GET	http://localhost/kalog/modules	/kalog/modules/edit/5	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-04 15:55:19
1012	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:35:18
1013	1	127.0.0.1      	provinces	index	GET	http://localhost/kalog/	/kalog/provinces	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:35:22
1014	1	127.0.0.1      	users	index	GET	http://localhost/kalog/letter_numbers	/kalog/users	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:35:29
1015	1	127.0.0.1      	site_settings	index	GET	http://localhost/kalog/users	/kalog/site_settings	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:35:31
1016	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/users	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:35:40
1017	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/groups	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:35:43
1018	1	127.0.0.1      	modules	edit	GET	http://localhost/kalog/modules	/kalog/modules/edit/10	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:35:52
1019	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/edit/10	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:36:02
1020	1	127.0.0.1      	site_settings	index	GET	http://localhost/kalog/modules	/kalog/site_settings	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:36:07
1021	1	127.0.0.1      	site_settings	add	GET	http://localhost/kalog/site_settings	/kalog/site_settings/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:36:31
1022	1	127.0.0.1      	unit_codes	index	GET	http://localhost/kalog/site_settings/add	/kalog/unit_codes	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:36:44
1023	1	127.0.0.1      	menu_types	index	GET	http://localhost/kalog/Carriages/Schedules/Locomotives/index	/kalog/menu_types	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:37:56
1025	1	127.0.0.1      	users	preferences	GET	http://localhost/kalog/	/kalog/users/preferences	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 14:43:22
1026	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 21:53:39
1027	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 21:54:13
1028	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315407253687&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 21:54:13
1029	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315407253724&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 21:54:14
1030	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315407257956&rows=10&page=1&sidx=TruckingCompany.id&sord=desc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 21:54:18
1031	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=5&_search=false&nd=1315407262006&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 21:54:22
1032	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:10:00
1033	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:10:17
1034	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315408217611&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:10:17
1035	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315408217568&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:10:17
1036	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:10:35
1037	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:11:58
1038	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315408318849&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:11:59
1039	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315408318885&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:11:59
1040	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315408325306&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:12:05
1041	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:15:42
1042	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315408543331&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:15:43
1043	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315408543357&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:15:43
1044	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=2&_search=false&nd=1315408548334&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:15:48
1045	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:21:16
1046	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315408877542&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:21:17
1047	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315408877574&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:21:17
1048	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/TruckingCompanies	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:21:32
1049	1	127.0.0.1      	groups	edit	GET	http://localhost/kalog/groups	/kalog/groups/edit/1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:21:36
1050	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/groups/edit/1	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:31:28
1051	1	127.0.0.1      	pages	display	GET		/kalog/	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.220 Safari/535.1	2011-09-07 22:56:53
1052	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:57:22
1053	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:57:31
1054	1	127.0.0.1      	Carriages	index	GET	http://localhost/kalog/groups	/kalog/Carriages/index	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:57:49
1055	1	127.0.0.1      	Carriages	permission_denied	GET	http://localhost/kalog/groups	/kalog/Carriages/permission_denied	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:57:49
1056	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/Carriages/permission_denied	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:58:49
1057	1	127.0.0.1      	users	edit	GET	http://localhost/kalog/groups	/kalog/users/edit/1	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:59:02
1058	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/users/edit/1	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:59:06
1059	1	127.0.0.1      	groups	edit	GET	http://localhost/kalog/groups	/kalog/groups/edit/1	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:59:09
1060	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/groups/edit/1	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:59:51
1061	1	127.0.0.1      	modules	add	GET	http://localhost/kalog/modules	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 22:59:57
1062	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/modules/add	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:00:33
1063	1	127.0.0.1      	groups	edit	GET	http://localhost/kalog/groups	/kalog/groups/edit/1	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:00:36
1064	1	127.0.0.1      	groups	edit	GET	http://localhost/kalog/groups/edit/1	/kalog/groups/edit/Schedules/index	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:12:51
1065	1	127.0.0.1      	groups	edit	GET	http://localhost/kalog/groups/edit/1	/kalog/groups/edit/Locomotives/index	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:13:00
1066	1	127.0.0.1      	groups	edit	GET	http://localhost/kalog/groups/edit/1	/kalog/groups/edit/Carriages/index	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:13:04
1067	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/groups/edit/1	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:13:39
1068	1	127.0.0.1      	modules	edit	GET	http://localhost/kalog/modules	/kalog/modules/edit/5	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:13:58
1069	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/edit/5	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:14:16
1070	1	127.0.0.1      	modules	add	GET	http://localhost/kalog/modules	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:14:19
1071	1	127.0.0.1      	modules	add	POST	http://localhost/kalog/modules/add	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:15:19
1072	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/add	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:15:19
1073	1	127.0.0.1      	modules	edit	GET	http://localhost/kalog/modules	/kalog/modules/edit/10	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:15:24
1074	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/edit/10	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:15:29
1075	1	127.0.0.1      	modules	add	GET	http://localhost/kalog/modules	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:17:53
1076	1	127.0.0.1      	modules	add	POST	http://localhost/kalog/modules/add	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:18:16
1077	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/add	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:18:16
1078	1	127.0.0.1      	modules	edit	GET	http://localhost/kalog/modules	/kalog/modules/edit/28	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:18:20
1079	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/edit/28	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:18:23
1080	1	127.0.0.1      	modules	add	GET	http://localhost/kalog/modules	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:18:29
1081	1	127.0.0.1      	modules	add	POST	http://localhost/kalog/modules/add	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:18:57
1082	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/add	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:18:57
1083	1	127.0.0.1      	modules	add	GET	http://localhost/kalog/modules	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:19:08
1084	1	127.0.0.1      	modules	add	POST	http://localhost/kalog/modules/add	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:19:22
1085	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/add	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:19:22
1086	1	127.0.0.1      	modules	add	GET	http://localhost/kalog/modules	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:19:33
1087	1	127.0.0.1      	modules	add	POST	http://localhost/kalog/modules/add	/kalog/modules/add	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:19:45
1088	1	127.0.0.1      	modules	index	GET	http://localhost/kalog/modules/add	/kalog/modules	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-07 23:19:45
1089	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:09:50
1090	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:10:05
1091	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1315419006357&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:10:06
1092	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1315419006291&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:10:06
1093	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=2&_search=false&nd=1315419009878&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:10:10
1094	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?TruckingCompany.id=1&_search=false&nd=1315419030570&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:10:31
1095	1	127.0.0.1      	Schedules	index	GET	http://localhost/kalog/TruckingCompanies	/kalog/Schedules/index	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:16:39
1096	1	127.0.0.1      	Schedules	permission_denied	GET	http://localhost/kalog/TruckingCompanies	/kalog/Schedules/permission_denied	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:16:39
1097	1	127.0.0.1      	Schedules	Carriages	GET	http://localhost/kalog/Schedules/permission_denied	/kalog/Schedules/Carriages/index	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:16:47
1098	1	127.0.0.1      	provinces	index	GET	http://localhost/kalog/Schedules/Carriages/index	/kalog/provinces	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:17:15
1099	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/provinces	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:17:18
1100	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/provinces	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:19:37
1101	1	127.0.0.1      	users	logout	GET	http://localhost/kalog/	/kalog/users/logout	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:19:44
1102	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:19:53
1103	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:23:22
1104	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:24:36
1105	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:27:33
1106	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:27:52
1107	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:28:12
1108	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:28:27
1109	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:29:37
1110	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-08 01:30:07
1111	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-09 15:43:20
1112	1	127.0.0.1      	users	preferences	GET	http://localhost/kalog/	/kalog/users/preferences	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.1) Gecko/20100101 Firefox/6.0.1	2011-09-09 15:43:27
1113	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-10 09:08:10
1114	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-12 11:26:03
1115	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-12 11:26:23
1116	1	127.0.0.1      	groups	edit	GET	http://localhost/kalog/groups	/kalog/groups/edit/1	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-12 11:26:26
1117	1	127.0.0.1      	groups	index	GET	http://localhost/kalog/groups/edit/1	/kalog/groups	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-12 11:26:41
1118	1	127.0.0.1      	groups	edit	GET	http://localhost/kalog/groups	/kalog/groups/edit/2	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-12 11:26:44
1119	1	127.0.0.1      	users	index	GET	http://localhost/kalog/groups/edit/2	/kalog/users	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-12 11:26:57
1120	1	127.0.0.1      	users	edit	GET	http://localhost/kalog/users	/kalog/users/edit/2	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-12 11:27:01
1121	1	127.0.0.1      	users	preferences	GET	http://localhost/kalog/users/edit/2	/kalog/users/preferences	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-12 11:27:06
1122	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:55:27
1123	1	127.0.0.1      	Trucks	index	GET		/kalog/Trucks	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:55:36
1124	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/Trucks	/kalog/trucks/jqgrid_list.json?_search=false&nd=1316138136689&rows=5&page=1&sidx=&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:55:36
1125	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:56:00
1126	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1316138160716&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:56:00
1127	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1316138160768&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:56:01
1128	1	127.0.0.1      	TruckingCompanies	index	GET		/kalog/TruckingCompanies	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:56:18
1129	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1316138179100&rows=10&page=1&sidx=id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:56:19
1130	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucks/jqgrid_list.json?_search=false&nd=1316138179169&rows=10&page=1&sidx=Truck.id&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:56:19
1131	1	127.0.0.1      	Trucks	index	GET		/kalog/Trucks	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:56:20
1132	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/Trucks	/kalog/trucks/jqgrid_list.json?_search=false&nd=1316138181857&rows=5&page=1&sidx=&sord=asc	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 08:56:22
1133	1	127.0.0.1      	trucks	jqgrid_list	GET	http://localhost/kalog/Trucks	/kalog/trucks/jqgrid_list.json?_search=false&nd=1316138418203&rows=5&page=1&sidx=&sord=asc&filters=	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 09:00:18
1134	1	127.0.0.1      	trucking_companies	jqgrid_list	GET	http://localhost/kalog/TruckingCompanies	/kalog/trucking_companies/jqgrid_list.json?_search=false&nd=1316139587226&rows=10&page=1&sidx=id&sord=asc&filters=	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-16 09:19:47
1135	1	127.0.0.1      	pages	display	GET	http://localhost/kalog/users/login	/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-19 11:04:11
1136	1	127.0.0.1      	pages	display	GET		/kalog/	Mozilla/5.0 (X11; Linux x86_64; rv:6.0.2) Gecko/20100101 Firefox/6.0.2	2011-09-19 11:33:42
\.


--
-- TOC entry 2284 (class 0 OID 17522)
-- Dependencies: 1731
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY user_preferences (id, user_id, param, value) FROM stdin;
\.


--
-- TOC entry 2285 (class 0 OID 17527)
-- Dependencies: 1733
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cms_kalog
--

COPY users (id, group_id, unit_code_id, username, name, password_real, password, sex, pob, dob, address1, address2, address3, zipcode, city_id, province_id, handphone, homephone, email, active, created, created_by, modified, modified_by) FROM stdin;
2	0	0	kumis	Kumis	123456	7c4a8d09ca3762af61e59520943dc26494f8941b	L		1999-12-16					\N	\N			shifty.power@gmail.com	0	2009-12-16 17:18:09	1	2009-12-16 17:18:09	0
3	2	1	erwin	Erwin Komaruloh	erwingila	3ef701949435109065cb1ebba18740cf8dc23599	L	Jakarta	1980-11-28	Jalan Pepaya VII no 6			17133	163	11	62812345678		erwin@komaruloh.com	1	2011-06-12 21:54:01	1	2011-08-27 20:37:45	\N
1	1	1	admin	Fandy Fardian	123456	7c4a8d09ca3762af61e59520943dc26494f8941b	L	Bekasi	1984-07-13	rahasia			17146	163	11	081807743559	021-8857380	panjul@freebsd.or.id	1	2009-12-12 14:05:18	0	2011-09-19 11:04:10	0
\.


--
-- TOC entry 2139 (class 2606 OID 17584)
-- Dependencies: 1662 1662
-- Name: agreements_packets_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY agreements_packets
    ADD CONSTRAINT agreements_packets_pkey PRIMARY KEY (id);


--
-- TOC entry 2137 (class 2606 OID 17586)
-- Dependencies: 1659 1659
-- Name: agreements_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY agreements
    ADD CONSTRAINT agreements_pkey PRIMARY KEY (id);


--
-- TOC entry 2241 (class 2606 OID 17811)
-- Dependencies: 1760 1760
-- Name: block_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY blocks
    ADD CONSTRAINT block_primary PRIMARY KEY (id);


--
-- TOC entry 2229 (class 2606 OID 17734)
-- Dependencies: 1748 1748
-- Name: branch_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branch_primary PRIMARY KEY (id);


--
-- TOC entry 2217 (class 2606 OID 17680)
-- Dependencies: 1738 1738
-- Name: carriages_freight_id; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY carriages_freights
    ADD CONSTRAINT carriages_freight_id PRIMARY KEY (id);


--
-- TOC entry 2141 (class 2606 OID 17588)
-- Dependencies: 1664 1664
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 17819)
-- Dependencies: 1762 1762
-- Name: column_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY columns
    ADD CONSTRAINT column_primary PRIMARY KEY (id);


--
-- TOC entry 2143 (class 2606 OID 17590)
-- Dependencies: 1666 1666
-- Name: contact_person_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY contact_person
    ADD CONSTRAINT contact_person_pkey PRIMARY KEY (id);


--
-- TOC entry 2239 (class 2606 OID 17785)
-- Dependencies: 1758 1758
-- Name: container_depo_coordinate_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_depo_coordinates
    ADD CONSTRAINT container_depo_coordinate_primary PRIMARY KEY (id);


--
-- TOC entry 2233 (class 2606 OID 17752)
-- Dependencies: 1752 1752
-- Name: container_depo_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_depos
    ADD CONSTRAINT container_depo_primary PRIMARY KEY (id);


--
-- TOC entry 2145 (class 2606 OID 17592)
-- Dependencies: 1668 1668
-- Name: container_group_designations_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_group_designations
    ADD CONSTRAINT container_group_designations_pkey PRIMARY KEY (id);


--
-- TOC entry 2147 (class 2606 OID 17594)
-- Dependencies: 1670 1670
-- Name: container_group_types_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_group_types
    ADD CONSTRAINT container_group_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2149 (class 2606 OID 17596)
-- Dependencies: 1672 1672
-- Name: container_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_groups
    ADD CONSTRAINT container_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2153 (class 2606 OID 17598)
-- Dependencies: 1675 1675
-- Name: container_heights_container_widths_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_heights_container_widths
    ADD CONSTRAINT container_heights_container_widths_pkey PRIMARY KEY (id);


--
-- TOC entry 2151 (class 2606 OID 17600)
-- Dependencies: 1674 1674
-- Name: container_heights_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_heights
    ADD CONSTRAINT container_heights_pkey PRIMARY KEY (id);


--
-- TOC entry 2155 (class 2606 OID 17602)
-- Dependencies: 1678 1678
-- Name: container_lengths_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_lengths
    ADD CONSTRAINT container_lengths_pkey PRIMARY KEY (id);


--
-- TOC entry 2157 (class 2606 OID 17604)
-- Dependencies: 1680 1680
-- Name: container_types_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_types
    ADD CONSTRAINT container_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2159 (class 2606 OID 17606)
-- Dependencies: 1682 1682
-- Name: container_widths_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_widths
    ADD CONSTRAINT container_widths_pkey PRIMARY KEY (id);


--
-- TOC entry 2237 (class 2606 OID 17775)
-- Dependencies: 1756 1756
-- Name: container_yard_coordinate_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_yard_coordinates
    ADD CONSTRAINT container_yard_coordinate_primary PRIMARY KEY (id);


--
-- TOC entry 2231 (class 2606 OID 17743)
-- Dependencies: 1750 1750
-- Name: container_yard_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY container_yards
    ADD CONSTRAINT container_yard_primary PRIMARY KEY (id);


--
-- TOC entry 2235 (class 2606 OID 17765)
-- Dependencies: 1754 1754
-- Name: coordinate_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY coordinates
    ADD CONSTRAINT coordinate_primary PRIMARY KEY (id);


--
-- TOC entry 2161 (class 2606 OID 17608)
-- Dependencies: 1684 1684
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 2163 (class 2606 OID 17610)
-- Dependencies: 1686 1686
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 2165 (class 2606 OID 17612)
-- Dependencies: 1688 1688
-- Name: drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- TOC entry 2219 (class 2606 OID 17690)
-- Dependencies: 1740 1740
-- Name: freight_id; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY freights
    ADD CONSTRAINT freight_id PRIMARY KEY (id);


--
-- TOC entry 2167 (class 2606 OID 17614)
-- Dependencies: 1691 1691
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2169 (class 2606 OID 17616)
-- Dependencies: 1695 1695
-- Name: letter_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY letter_numbers
    ADD CONSTRAINT letter_numbers_pkey PRIMARY KEY (id);


--
-- TOC entry 2171 (class 2606 OID 17618)
-- Dependencies: 1697 1697
-- Name: license_types_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY license_types
    ADD CONSTRAINT license_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2173 (class 2606 OID 17620)
-- Dependencies: 1699 1699
-- Name: licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY licenses
    ADD CONSTRAINT licenses_pkey PRIMARY KEY (id);


--
-- TOC entry 2227 (class 2606 OID 17725)
-- Dependencies: 1746 1746
-- Name: location_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT location_primary PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 17622)
-- Dependencies: 1701 1701
-- Name: members_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 2177 (class 2606 OID 17624)
-- Dependencies: 1703 1703
-- Name: menu_types_call_name_key; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY menu_types
    ADD CONSTRAINT menu_types_call_name_key UNIQUE (call_name);


--
-- TOC entry 2179 (class 2606 OID 17626)
-- Dependencies: 1703 1703
-- Name: menu_types_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY menu_types
    ADD CONSTRAINT menu_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2181 (class 2606 OID 17628)
-- Dependencies: 1705 1705
-- Name: menus_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- TOC entry 2183 (class 2606 OID 17630)
-- Dependencies: 1707 1707
-- Name: module_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY module_actions
    ADD CONSTRAINT module_actions_pkey PRIMARY KEY (id);


--
-- TOC entry 2185 (class 2606 OID 17632)
-- Dependencies: 1709 1709
-- Name: modules_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);


--
-- TOC entry 2187 (class 2606 OID 17634)
-- Dependencies: 1711 1711
-- Name: packets_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY packets
    ADD CONSTRAINT packets_pkey PRIMARY KEY (id);


--
-- TOC entry 2189 (class 2606 OID 17636)
-- Dependencies: 1713 1713
-- Name: packets_services_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY packets_services
    ADD CONSTRAINT packets_services_pkey PRIMARY KEY (id);


--
-- TOC entry 2213 (class 2606 OID 17667)
-- Dependencies: 1736 1736
-- Name: primary_carriages; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY carriages
    ADD CONSTRAINT primary_carriages PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 17698)
-- Dependencies: 1742 1742
-- Name: primary_locomotive; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY locomotives
    ADD CONSTRAINT primary_locomotive PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 17708)
-- Dependencies: 1744 1744
-- Name: primary_schedule; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT primary_schedule PRIMARY KEY (id);


--
-- TOC entry 2191 (class 2606 OID 17638)
-- Dependencies: 1715 1715
-- Name: provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 17827)
-- Dependencies: 1764 1764
-- Name: row_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY rows
    ADD CONSTRAINT row_primary PRIMARY KEY (id);


--
-- TOC entry 2193 (class 2606 OID 17640)
-- Dependencies: 1717 1717
-- Name: service_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY service_charges
    ADD CONSTRAINT service_charges_pkey PRIMARY KEY (id);


--
-- TOC entry 2195 (class 2606 OID 17642)
-- Dependencies: 1719 1719
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 2197 (class 2606 OID 17644)
-- Dependencies: 1721 1721
-- Name: site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 2247 (class 2606 OID 17835)
-- Dependencies: 1766 1766
-- Name: tier_primary; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY tiers
    ADD CONSTRAINT tier_primary PRIMARY KEY (id);


--
-- TOC entry 2199 (class 2606 OID 17646)
-- Dependencies: 1723 1723
-- Name: trucking_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY trucking_companies
    ADD CONSTRAINT trucking_companies_pkey PRIMARY KEY (id);


--
-- TOC entry 2201 (class 2606 OID 17648)
-- Dependencies: 1725 1725
-- Name: trucks_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY trucks
    ADD CONSTRAINT trucks_pkey PRIMARY KEY (id);


--
-- TOC entry 2215 (class 2606 OID 17669)
-- Dependencies: 1736 1736
-- Name: unique_carriage_code; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY carriages
    ADD CONSTRAINT unique_carriage_code UNIQUE (code);


--
-- TOC entry 2223 (class 2606 OID 17700)
-- Dependencies: 1742 1742
-- Name: unique_locomotive_code; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY locomotives
    ADD CONSTRAINT unique_locomotive_code UNIQUE (code);


--
-- TOC entry 2203 (class 2606 OID 17650)
-- Dependencies: 1727 1727
-- Name: unit_codes_code_key; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY unit_codes
    ADD CONSTRAINT unit_codes_code_key UNIQUE (code);


--
-- TOC entry 2205 (class 2606 OID 17652)
-- Dependencies: 1727 1727
-- Name: unit_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY unit_codes
    ADD CONSTRAINT unit_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 2207 (class 2606 OID 17654)
-- Dependencies: 1731 1731
-- Name: user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2209 (class 2606 OID 17656)
-- Dependencies: 1733 1733
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2211 (class 2606 OID 17658)
-- Dependencies: 1733 1733
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: cms_kalog; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2011-09-27 21:31:42 WIT

--
-- PostgreSQL database dump complete
--

