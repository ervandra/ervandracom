--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: celery_taskmeta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.celery_taskmeta (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.celery_taskmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.celery_taskmeta_id_seq OWNED BY public.celery_taskmeta.id;


--
-- Name: celery_tasksetmeta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.celery_tasksetmeta (
    id integer NOT NULL,
    taskset_id character varying(255) NOT NULL,
    result text NOT NULL,
    date_done timestamp with time zone NOT NULL,
    hidden boolean NOT NULL
);


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.celery_tasksetmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.celery_tasksetmeta_id_seq OWNED BY public.celery_tasksetmeta.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: djcelery_crontabschedule; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.djcelery_crontabschedule (
    id integer NOT NULL,
    minute character varying(64) NOT NULL,
    hour character varying(64) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(64) NOT NULL,
    month_of_year character varying(64) NOT NULL
);


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.djcelery_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.djcelery_crontabschedule_id_seq OWNED BY public.djcelery_crontabschedule.id;


--
-- Name: djcelery_intervalschedule; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.djcelery_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.djcelery_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.djcelery_intervalschedule_id_seq OWNED BY public.djcelery_intervalschedule.id;


--
-- Name: djcelery_periodictask; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.djcelery_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    CONSTRAINT djcelery_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.djcelery_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.djcelery_periodictask_id_seq OWNED BY public.djcelery_periodictask.id;


--
-- Name: djcelery_periodictasks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.djcelery_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


--
-- Name: djcelery_taskstate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.djcelery_taskstate (
    id integer NOT NULL,
    state character varying(64) NOT NULL,
    task_id character varying(36) NOT NULL,
    name character varying(200),
    tstamp timestamp with time zone NOT NULL,
    args text,
    kwargs text,
    eta timestamp with time zone,
    expires timestamp with time zone,
    result text,
    traceback text,
    runtime double precision,
    retries integer NOT NULL,
    hidden boolean NOT NULL,
    worker_id integer
);


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.djcelery_taskstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.djcelery_taskstate_id_seq OWNED BY public.djcelery_taskstate.id;


--
-- Name: djcelery_workerstate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.djcelery_workerstate (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    last_heartbeat timestamp with time zone
);


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.djcelery_workerstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.djcelery_workerstate_id_seq OWNED BY public.djcelery_workerstate.id;


--
-- Name: dreamcards_card; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_card (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    title character varying(4096) NOT NULL,
    url character varying(2048),
    thumbnail character varying(2048),
    active boolean NOT NULL,
    card_type character varying(128),
    language character varying(5),
    default_for_new_users boolean NOT NULL,
    category_id integer,
    owner_id integer,
    permission_id integer
);


--
-- Name: dreamcards_card_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_card_groups (
    id integer NOT NULL,
    card_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: dreamcards_card_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_card_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_card_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_card_groups_id_seq OWNED BY public.dreamcards_card_groups.id;


--
-- Name: dreamcards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_card_id_seq OWNED BY public.dreamcards_card.id;


--
-- Name: dreamcards_card_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_card_users (
    id integer NOT NULL,
    card_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamcards_card_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_card_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_card_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_card_users_id_seq OWNED BY public.dreamcards_card_users.id;


--
-- Name: dreamcards_cardpageassociation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_cardpageassociation (
    id integer NOT NULL,
    size_x integer NOT NULL,
    size_y integer NOT NULL,
    "order" integer NOT NULL,
    card_id integer NOT NULL,
    page_id integer NOT NULL,
    CONSTRAINT dreamcards_cardpageassociation_order_check CHECK (("order" >= 0)),
    CONSTRAINT dreamcards_cardpageassociation_size_x_check CHECK ((size_x >= 0)),
    CONSTRAINT dreamcards_cardpageassociation_size_y_check CHECK ((size_y >= 0))
);


--
-- Name: dreamcards_cardpageassociation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_cardpageassociation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_cardpageassociation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_cardpageassociation_id_seq OWNED BY public.dreamcards_cardpageassociation.id;


--
-- Name: dreamcards_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_category (
    id integer NOT NULL,
    title character varying(4096) NOT NULL,
    active boolean NOT NULL,
    language character varying(5),
    color character varying(255) NOT NULL,
    owner_id integer
);


--
-- Name: dreamcards_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_category_id_seq OWNED BY public.dreamcards_category.id;


--
-- Name: dreamcards_desktopuserprofile; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_desktopuserprofile (
    id integer NOT NULL,
    preferred_background character varying(1024),
    preferred_language character varying(2) NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamcards_desktopuserprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_desktopuserprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_desktopuserprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_desktopuserprofile_id_seq OWNED BY public.dreamcards_desktopuserprofile.id;


--
-- Name: dreamcards_dreamcards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_dreamcards (
    id integer NOT NULL
);


--
-- Name: dreamcards_dreamcards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_dreamcards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_dreamcards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_dreamcards_id_seq OWNED BY public.dreamcards_dreamcards.id;


--
-- Name: dreamcards_page; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_page (
    id integer NOT NULL,
    title character varying(4096) NOT NULL,
    active boolean NOT NULL,
    owner_id integer
);


--
-- Name: dreamcards_page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_page_id_seq OWNED BY public.dreamcards_page.id;


--
-- Name: dreamcards_usergroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_usergroup (
    id integer NOT NULL,
    name character varying(2048) NOT NULL
);


--
-- Name: dreamcards_usergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_usergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_usergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_usergroup_id_seq OWNED BY public.dreamcards_usergroup.id;


--
-- Name: dreamcards_usergroup_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcards_usergroup_users (
    id integer NOT NULL,
    usergroup_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamcards_usergroup_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcards_usergroup_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcards_usergroup_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcards_usergroup_users_id_seq OWNED BY public.dreamcards_usergroup_users.id;


--
-- Name: dreamcommunication_message; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamcommunication_message (
    id integer NOT NULL,
    body text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    context_type character varying(2048) NOT NULL,
    context_id character varying(2048) NOT NULL,
    uuid character varying(36) NOT NULL,
    sender_id integer NOT NULL,
    extra_data text
);


--
-- Name: dreamcommunication_message_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamcommunication_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamcommunication_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamcommunication_message_id_seq OWNED BY public.dreamcommunication_message.id;


--
-- Name: dreamdevices_apisession; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdevices_apisession (
    id integer NOT NULL,
    token character varying(2048) NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamdevices_apisession_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdevices_apisession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdevices_apisession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdevices_apisession_id_seq OWNED BY public.dreamdevices_apisession.id;


--
-- Name: dreamdevices_device; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdevices_device (
    id integer NOT NULL,
    iid character varying(2048),
    owner_id integer
);


--
-- Name: dreamdevices_device_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdevices_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdevices_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdevices_device_id_seq OWNED BY public.dreamdevices_device.id;


--
-- Name: dreamdevices_device_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdevices_device_users (
    id integer NOT NULL,
    device_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamdevices_device_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdevices_device_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdevices_device_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdevices_device_users_id_seq OWNED BY public.dreamdevices_device_users.id;


--
-- Name: dreamdiary_color; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_color (
    id integer NOT NULL,
    color character varying(7) NOT NULL,
    title character varying(200) NOT NULL,
    owner_id integer NOT NULL
);


--
-- Name: dreamdiary_color_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_color_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_color_id_seq OWNED BY public.dreamdiary_color.id;


--
-- Name: dreamdiary_content; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_content (
    id integer NOT NULL,
    is_archived boolean NOT NULL,
    uuid character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    created timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    "order" integer,
    public boolean NOT NULL,
    answer_timestamp timestamp with time zone,
    is_ready boolean NOT NULL,
    answer_to_id integer,
    color_id integer,
    network_id integer,
    owner_id integer NOT NULL
);


--
-- Name: dreamdiary_content_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_content_id_seq OWNED BY public.dreamdiary_content.id;


--
-- Name: dreamdiary_content_participants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_content_participants (
    id integer NOT NULL,
    content_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamdiary_content_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_content_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_content_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_content_participants_id_seq OWNED BY public.dreamdiary_content_participants.id;


--
-- Name: dreamdiary_contentaccess; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_contentaccess (
    id integer NOT NULL,
    read boolean NOT NULL,
    edit boolean NOT NULL,
    content_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamdiary_contentaccess_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_contentaccess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_contentaccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_contentaccess_id_seq OWNED BY public.dreamdiary_contentaccess.id;


--
-- Name: dreamdiary_contentattachment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_contentattachment (
    id integer NOT NULL,
    url character varying(2048) NOT NULL,
    type character varying(512),
    title character varying(2048),
    description text,
    thumbnail character varying(100),
    image character varying(100),
    embed_html text,
    document_id character varying(512),
    content_id integer NOT NULL,
    owner_id integer
);


--
-- Name: dreamdiary_contentattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_contentattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_contentattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_contentattachment_id_seq OWNED BY public.dreamdiary_contentattachment.id;


--
-- Name: dreamdiary_contentnote; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_contentnote (
    id integer NOT NULL,
    html text,
    created timestamp with time zone,
    last_modified timestamp with time zone,
    content_id integer NOT NULL,
    owner_id integer NOT NULL
);


--
-- Name: dreamdiary_contentnote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_contentnote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_contentnote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_contentnote_id_seq OWNED BY public.dreamdiary_contentnote.id;


--
-- Name: dreamdiary_contenttool; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_contenttool (
    id integer NOT NULL,
    url character varying(2048),
    tool_type character varying(512) NOT NULL,
    content_id integer NOT NULL
);


--
-- Name: dreamdiary_contenttool_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_contenttool_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_contenttool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_contenttool_id_seq OWNED BY public.dreamdiary_contenttool.id;


--
-- Name: dreamdiary_course; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_course (
    id integer NOT NULL,
    is_archived boolean NOT NULL,
    uuid character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    last_modified timestamp with time zone,
    main_image character varying(100),
    main_image_crop_scale integer,
    main_image_focal_point_x integer,
    main_image_focal_point_y integer,
    "order" integer,
    organisation_id integer,
    owner_id integer NOT NULL
);


--
-- Name: dreamdiary_course_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_course_id_seq OWNED BY public.dreamdiary_course.id;


--
-- Name: dreamdiary_course_participants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_course_participants (
    id integer NOT NULL,
    course_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamdiary_course_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_course_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_course_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_course_participants_id_seq OWNED BY public.dreamdiary_course_participants.id;


--
-- Name: dreamdiary_course_usergroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_course_usergroups (
    id integer NOT NULL,
    course_id integer NOT NULL,
    usergroup_id integer NOT NULL
);


--
-- Name: dreamdiary_course_usergroups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_course_usergroups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_course_usergroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_course_usergroups_id_seq OWNED BY public.dreamdiary_course_usergroups.id;


--
-- Name: dreamdiary_diary; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_diary (
    id integer NOT NULL
);


--
-- Name: dreamdiary_diary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_diary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_diary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_diary_id_seq OWNED BY public.dreamdiary_diary.id;


--
-- Name: dreamdiary_network; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_network (
    id integer NOT NULL,
    is_archived boolean NOT NULL,
    uuid character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    created timestamp with time zone NOT NULL,
    last_modified timestamp with time zone,
    deadline timestamp with time zone,
    main_image character varying(100),
    main_image_crop_scale integer,
    main_image_focal_point_x integer,
    main_image_focal_point_y integer,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    "order" integer,
    course_order integer,
    hierarchy text,
    color_id integer,
    course_id integer,
    organisation_id integer,
    owner_id integer NOT NULL,
    autoaccess boolean NOT NULL
);


--
-- Name: dreamdiary_network_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_network_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_network_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_network_id_seq OWNED BY public.dreamdiary_network.id;


--
-- Name: dreamdiary_network_participants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_network_participants (
    id integer NOT NULL,
    network_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamdiary_network_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_network_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_network_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_network_participants_id_seq OWNED BY public.dreamdiary_network_participants.id;


--
-- Name: dreamdiary_network_tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_network_tags (
    id integer NOT NULL,
    network_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: dreamdiary_network_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_network_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_network_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_network_tags_id_seq OWNED BY public.dreamdiary_network_tags.id;


--
-- Name: dreamdiary_network_usergroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_network_usergroups (
    id integer NOT NULL,
    network_id integer NOT NULL,
    usergroup_id integer NOT NULL
);


--
-- Name: dreamdiary_network_usergroups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_network_usergroups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_network_usergroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_network_usergroups_id_seq OWNED BY public.dreamdiary_network_usergroups.id;


--
-- Name: dreamdiary_networkaccess; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_networkaccess (
    id integer NOT NULL,
    read boolean NOT NULL,
    add_content boolean NOT NULL,
    share_content boolean NOT NULL,
    edit boolean NOT NULL,
    moderate boolean NOT NULL,
    network_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamdiary_networkaccess_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_networkaccess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_networkaccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_networkaccess_id_seq OWNED BY public.dreamdiary_networkaccess.id;


--
-- Name: dreamdiary_referencecontent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_referencecontent (
    content_ptr_id integer NOT NULL,
    reference_to_id integer NOT NULL
);


--
-- Name: dreamdiary_tag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_tag (
    id integer NOT NULL,
    name character varying(2048) NOT NULL
);


--
-- Name: dreamdiary_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_tag_id_seq OWNED BY public.dreamdiary_tag.id;


--
-- Name: dreamdiary_task; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_task (
    content_ptr_id integer NOT NULL
);


--
-- Name: dreamdiary_usercourse; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_usercourse (
    id integer NOT NULL,
    "order" integer,
    course_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamdiary_usercourse_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_usercourse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_usercourse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_usercourse_id_seq OWNED BY public.dreamdiary_usercourse.id;


--
-- Name: dreamdiary_usergroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_usergroup (
    id integer NOT NULL,
    title character varying(255) NOT NULL
);


--
-- Name: dreamdiary_usergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_usergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_usergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_usergroup_id_seq OWNED BY public.dreamdiary_usergroup.id;


--
-- Name: dreamdiary_usernetwork; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_usernetwork (
    id integer NOT NULL,
    "order" integer,
    network_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamdiary_usernetwork_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamdiary_usernetwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamdiary_usernetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamdiary_usernetwork_id_seq OWNED BY public.dreamdiary_usernetwork.id;


--
-- Name: dreamdiary_work; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamdiary_work (
    content_ptr_id integer NOT NULL
);


--
-- Name: dreamevents_event; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamevents_event (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    sender_type character varying(1024) NOT NULL,
    sender_id character varying(128) NOT NULL,
    name character varying(1024) NOT NULL,
    context_type character varying(1024) NOT NULL,
    context_id character varying(128) NOT NULL,
    target_type character varying(1024) NOT NULL,
    target_id character varying(128) NOT NULL
);


--
-- Name: dreamevents_event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamevents_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamevents_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamevents_event_id_seq OWNED BY public.dreamevents_event.id;


--
-- Name: dreameventstimeline_timelineevent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreameventstimeline_timelineevent (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    sender_type character varying(1024) NOT NULL,
    sender_id character varying(128) NOT NULL,
    name character varying(1024) NOT NULL,
    context_type character varying(1024) NOT NULL,
    context_id character varying(128) NOT NULL,
    target_type character varying(1024) NOT NULL,
    target_id character varying(128) NOT NULL,
    timeline_type character varying(1024) NOT NULL,
    timeline_id character varying(128) NOT NULL,
    origin_event_id integer NOT NULL,
    extra_data text
);


--
-- Name: dreameventstimeline_timelineevent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreameventstimeline_timelineevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreameventstimeline_timelineevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreameventstimeline_timelineevent_id_seq OWNED BY public.dreameventstimeline_timelineevent.id;


--
-- Name: dreaminvites_invitetoken; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreaminvites_invitetoken (
    id integer NOT NULL,
    token character varying(2048) NOT NULL,
    should_create_user boolean NOT NULL,
    active_network_id integer,
    organisation_id integer,
    owner_id integer
);


--
-- Name: dreaminvites_invitetoken_courses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreaminvites_invitetoken_courses (
    id integer NOT NULL,
    invitetoken_id integer NOT NULL,
    course_id integer NOT NULL
);


--
-- Name: dreaminvites_invitetoken_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreaminvites_invitetoken_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreaminvites_invitetoken_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreaminvites_invitetoken_courses_id_seq OWNED BY public.dreaminvites_invitetoken_courses.id;


--
-- Name: dreaminvites_invitetoken_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreaminvites_invitetoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreaminvites_invitetoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreaminvites_invitetoken_id_seq OWNED BY public.dreaminvites_invitetoken.id;


--
-- Name: dreaminvites_organisationsettings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreaminvites_organisationsettings (
    id integer NOT NULL,
    app_store_url_ios character varying(4096),
    app_store_url_android character varying(4096),
    share_template_name character varying(4096),
    protocol_name character varying(2048),
    organisation_id integer NOT NULL
);


--
-- Name: dreaminvites_organisationsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreaminvites_organisationsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreaminvites_organisationsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreaminvites_organisationsettings_id_seq OWNED BY public.dreaminvites_organisationsettings.id;


--
-- Name: dreammarket_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammarket_category (
    id integer NOT NULL,
    title character varying(2048) NOT NULL,
    color character varying(2048) NOT NULL
);


--
-- Name: dreammarket_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammarket_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammarket_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammarket_category_id_seq OWNED BY public.dreammarket_category.id;


--
-- Name: dreammarket_domain; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammarket_domain (
    id integer NOT NULL,
    title character varying(2048) NOT NULL,
    color character varying(2048) NOT NULL
);


--
-- Name: dreammarket_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammarket_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammarket_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammarket_domain_id_seq OWNED BY public.dreammarket_domain.id;


--
-- Name: dreammarket_domain_organisations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammarket_domain_organisations (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    organisation_id integer NOT NULL
);


--
-- Name: dreammarket_domain_organisations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammarket_domain_organisations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammarket_domain_organisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammarket_domain_organisations_id_seq OWNED BY public.dreammarket_domain_organisations.id;


--
-- Name: dreammarket_sellable; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammarket_sellable (
    id integer NOT NULL,
    title character varying(2048),
    description text,
    sellable_type character varying(128) NOT NULL,
    price integer NOT NULL,
    currency character varying(64) NOT NULL,
    sku character varying(1024),
    is_published boolean NOT NULL,
    is_shareable boolean NOT NULL,
    learner_amount integer NOT NULL,
    dark_color character varying(2048) NOT NULL,
    light_color character varying(2048) NOT NULL,
    min_color character varying(2048) NOT NULL,
    low_color character varying(2048) NOT NULL,
    high_color character varying(2048) NOT NULL,
    max_color character varying(2048) NOT NULL,
    bg_image_url character varying(2048) NOT NULL,
    market_image_url character varying(2048) NOT NULL,
    market_image character varying(2048),
    market_thumbnail_url character varying(2048) NOT NULL,
    market_thumbnail character varying(2048),
    subtitle character varying(4096) NOT NULL,
    rating1_title character varying(2048) NOT NULL,
    rating2_title character varying(2048) NOT NULL,
    rating3_title character varying(2048) NOT NULL,
    rating1_value integer NOT NULL,
    rating2_value integer NOT NULL,
    rating3_value integer NOT NULL,
    course_id integer,
    payment_type character varying(255) NOT NULL,
    decorative_image_url character varying(2048),
    lifecoin_amount integer NOT NULL
);


--
-- Name: dreammarket_sellable_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammarket_sellable_categories (
    id integer NOT NULL,
    sellable_id integer NOT NULL,
    category_id integer NOT NULL
);


--
-- Name: dreammarket_sellable_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammarket_sellable_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammarket_sellable_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammarket_sellable_categories_id_seq OWNED BY public.dreammarket_sellable_categories.id;


--
-- Name: dreammarket_sellable_domains; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammarket_sellable_domains (
    id integer NOT NULL,
    sellable_id integer NOT NULL,
    domain_id integer NOT NULL
);


--
-- Name: dreammarket_sellable_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammarket_sellable_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammarket_sellable_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammarket_sellable_domains_id_seq OWNED BY public.dreammarket_sellable_domains.id;


--
-- Name: dreammarket_sellable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammarket_sellable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammarket_sellable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammarket_sellable_id_seq OWNED BY public.dreammarket_sellable.id;


--
-- Name: dreammarket_sellable_starred_by; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammarket_sellable_starred_by (
    id integer NOT NULL,
    sellable_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreammarket_sellable_starred_by_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammarket_sellable_starred_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammarket_sellable_starred_by_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammarket_sellable_starred_by_id_seq OWNED BY public.dreammarket_sellable_starred_by.id;


--
-- Name: dreammarket_sellablecontent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammarket_sellablecontent (
    id integer NOT NULL,
    content_id integer NOT NULL,
    sellable_id integer NOT NULL
);


--
-- Name: dreammarket_sellablecontent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammarket_sellablecontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammarket_sellablecontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammarket_sellablecontent_id_seq OWNED BY public.dreammarket_sellablecontent.id;


--
-- Name: dreammessaging_message; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammessaging_message (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    msg_id character varying(50) NOT NULL,
    msg_uuid character varying(50),
    metadata text,
    body text NOT NULL,
    html text,
    thread_last_updated_timestamp timestamp with time zone,
    from_user_id integer,
    parent_id integer,
    room_id integer
);


--
-- Name: dreammessaging_message_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammessaging_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammessaging_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammessaging_message_id_seq OWNED BY public.dreammessaging_message.id;


--
-- Name: dreammessaging_message_to_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammessaging_message_to_user (
    id integer NOT NULL,
    message_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreammessaging_message_to_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammessaging_message_to_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammessaging_message_to_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammessaging_message_to_user_id_seq OWNED BY public.dreammessaging_message_to_user.id;


--
-- Name: dreammessaging_room; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammessaging_room (
    id integer NOT NULL,
    name character varying(400) NOT NULL,
    jid character varying(50) NOT NULL,
    active boolean NOT NULL,
    public boolean NOT NULL,
    roster_managed boolean NOT NULL,
    roster_managed_by_system boolean NOT NULL,
    group_id integer,
    organisation_id integer,
    role_id integer
);


--
-- Name: dreammessaging_room_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammessaging_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammessaging_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammessaging_room_id_seq OWNED BY public.dreammessaging_room.id;


--
-- Name: dreammessaging_room_roster; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammessaging_room_roster (
    id integer NOT NULL,
    room_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreammessaging_room_roster_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammessaging_room_roster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammessaging_room_roster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammessaging_room_roster_id_seq OWNED BY public.dreammessaging_room_roster.id;


--
-- Name: dreammessaging_room_topics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammessaging_room_topics (
    id integer NOT NULL,
    room_id integer NOT NULL,
    topic_id integer NOT NULL
);


--
-- Name: dreammessaging_room_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammessaging_room_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammessaging_room_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammessaging_room_topics_id_seq OWNED BY public.dreammessaging_room_topics.id;


--
-- Name: dreammessaging_topic; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammessaging_topic (
    id integer NOT NULL,
    name character varying(300) NOT NULL,
    public boolean NOT NULL,
    active boolean NOT NULL,
    organisation_id integer NOT NULL
);


--
-- Name: dreammessaging_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammessaging_topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammessaging_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammessaging_topic_id_seq OWNED BY public.dreammessaging_topic.id;


--
-- Name: dreammindmup_mindmupcontent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreammindmup_mindmupcontent (
    id integer NOT NULL,
    data text NOT NULL,
    content_id integer NOT NULL
);


--
-- Name: dreammindmup_mindmupcontent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreammindmup_mindmupcontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreammindmup_mindmupcontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreammindmup_mindmupcontent_id_seq OWNED BY public.dreammindmup_mindmupcontent.id;


--
-- Name: dreampayments_order; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreampayments_order (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    payment_backend character varying(1024),
    uuid character varying(255) NOT NULL,
    amount_due integer NOT NULL,
    amount_paid integer NOT NULL,
    status character varying(2048),
    status_code integer NOT NULL,
    message text,
    external_id character varying(2048),
    external_type character varying(2048),
    sellable_id integer NOT NULL,
    user_id integer NOT NULL,
    currency character varying(64) NOT NULL
);


--
-- Name: dreampayments_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreampayments_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreampayments_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreampayments_order_id_seq OWNED BY public.dreampayments_order.id;


--
-- Name: dreamsms_onetimetoken; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamsms_onetimetoken (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    code character varying(32) NOT NULL,
    used boolean NOT NULL,
    user_id integer,
    phone_number character varying(64),
    active boolean NOT NULL
);


--
-- Name: dreamsms_onetimetoken_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamsms_onetimetoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamsms_onetimetoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamsms_onetimetoken_id_seq OWNED BY public.dreamsms_onetimetoken.id;


--
-- Name: dreamsms_smsmessage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamsms_smsmessage (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    to_number character varying(64) NOT NULL,
    from_number character varying(64),
    external_id character varying(1024) NOT NULL,
    body character varying(1600) NOT NULL,
    status character varying(1024) NOT NULL,
    error_code character varying(1024),
    error_message character varying(1024),
    token_id integer
);


--
-- Name: dreamsms_smsmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamsms_smsmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamsms_smsmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamsms_smsmessage_id_seq OWNED BY public.dreamsms_smsmessage.id;


--
-- Name: dreamsocialqa_answer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamsocialqa_answer (
    id integer NOT NULL,
    "order" integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    text text NOT NULL,
    question_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT dreamsocialqa_answer_order_check CHECK (("order" >= 0))
);


--
-- Name: dreamsocialqa_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamsocialqa_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamsocialqa_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamsocialqa_answer_id_seq OWNED BY public.dreamsocialqa_answer.id;


--
-- Name: dreamsocialqa_answerrating; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamsocialqa_answerrating (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    answer_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamsocialqa_answerrating_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamsocialqa_answerrating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamsocialqa_answerrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamsocialqa_answerrating_id_seq OWNED BY public.dreamsocialqa_answerrating.id;


--
-- Name: dreamsocialqa_contentconsumption; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamsocialqa_contentconsumption (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_consumed boolean NOT NULL,
    content_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamsocialqa_contentconsumption_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamsocialqa_contentconsumption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamsocialqa_contentconsumption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamsocialqa_contentconsumption_id_seq OWNED BY public.dreamsocialqa_contentconsumption.id;


--
-- Name: dreamsocialqa_networkconsumption; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamsocialqa_networkconsumption (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_consumed boolean NOT NULL,
    network_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamsocialqa_networkconsumption_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamsocialqa_networkconsumption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamsocialqa_networkconsumption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamsocialqa_networkconsumption_id_seq OWNED BY public.dreamsocialqa_networkconsumption.id;


--
-- Name: dreamsocialqa_networkfeedback; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamsocialqa_networkfeedback (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    key character varying(2048) NOT NULL,
    value integer NOT NULL,
    network_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamsocialqa_networkfeedback_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamsocialqa_networkfeedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamsocialqa_networkfeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamsocialqa_networkfeedback_id_seq OWNED BY public.dreamsocialqa_networkfeedback.id;


--
-- Name: dreamsocialqa_question; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamsocialqa_question (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    text text NOT NULL,
    urgency integer NOT NULL,
    network_id integer NOT NULL,
    user_id integer NOT NULL,
    image character varying(2048)
);


--
-- Name: dreamsocialqa_question_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamsocialqa_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamsocialqa_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamsocialqa_question_id_seq OWNED BY public.dreamsocialqa_question.id;


--
-- Name: dreamuserdb_authprovider; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_authprovider (
    id integer NOT NULL,
    organisation_id integer NOT NULL
);


--
-- Name: dreamuserdb_authprovider_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_authprovider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_authprovider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_authprovider_id_seq OWNED BY public.dreamuserdb_authprovider.id;


--
-- Name: dreamuserdb_googleuser; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_googleuser (
    id integer NOT NULL,
    username character varying(200) NOT NULL,
    organisation_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamuserdb_googleuser_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_googleuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_googleuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_googleuser_id_seq OWNED BY public.dreamuserdb_googleuser.id;


--
-- Name: dreamuserdb_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_group (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    title character varying(200) NOT NULL,
    source character varying(2048) NOT NULL,
    official boolean NOT NULL,
    filter_type character varying(200),
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    organisation_id integer NOT NULL,
    parent_id integer,
    CONSTRAINT dreamuserdb_group_level_check CHECK ((level >= 0)),
    CONSTRAINT dreamuserdb_group_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dreamuserdb_group_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dreamuserdb_group_tree_id_check CHECK ((tree_id >= 0))
);


--
-- Name: dreamuserdb_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_group_id_seq OWNED BY public.dreamuserdb_group.id;


--
-- Name: dreamuserdb_organisation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_organisation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    title character varying(200) NOT NULL,
    registration_allowed boolean NOT NULL,
    source character varying(2048) NOT NULL,
    override_username_cleanup boolean NOT NULL,
    default_service_id integer
);


--
-- Name: dreamuserdb_organisation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_organisation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_organisation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_organisation_id_seq OWNED BY public.dreamuserdb_organisation.id;


--
-- Name: dreamuserdb_organisation_owners; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_organisation_owners (
    id integer NOT NULL,
    organisation_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamuserdb_organisation_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_organisation_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_organisation_owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_organisation_owners_id_seq OWNED BY public.dreamuserdb_organisation_owners.id;


--
-- Name: dreamuserdb_role; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_role (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    title character varying(200) NOT NULL,
    source character varying(2048) NOT NULL,
    official boolean NOT NULL,
    organisation_id integer NOT NULL
);


--
-- Name: dreamuserdb_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_role_id_seq OWNED BY public.dreamuserdb_role.id;


--
-- Name: dreamuserdb_role_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_role_permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    servicepermission_id integer NOT NULL
);


--
-- Name: dreamuserdb_role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_role_permissions_id_seq OWNED BY public.dreamuserdb_role_permissions.id;


--
-- Name: dreamuserdb_service; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_service (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    title character varying(200) NOT NULL,
    public boolean NOT NULL,
    entity_id character varying(200) NOT NULL,
    url character varying(2048) NOT NULL,
    user_id integer
);


--
-- Name: dreamuserdb_service_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_service_id_seq OWNED BY public.dreamuserdb_service.id;


--
-- Name: dreamuserdb_service_organisations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_service_organisations (
    id integer NOT NULL,
    service_id integer NOT NULL,
    organisation_id integer NOT NULL
);


--
-- Name: dreamuserdb_service_organisations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_service_organisations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_service_organisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_service_organisations_id_seq OWNED BY public.dreamuserdb_service_organisations.id;


--
-- Name: dreamuserdb_servicepermission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_servicepermission (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    entity character varying(200) NOT NULL,
    action character varying(200) NOT NULL,
    service_id integer NOT NULL
);


--
-- Name: dreamuserdb_servicepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_servicepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_servicepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_servicepermission_id_seq OWNED BY public.dreamuserdb_servicepermission.id;


--
-- Name: dreamuserdb_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_user (
    user_ptr_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    phone_number character varying(200) NOT NULL,
    personal_identity_code_hash character varying(2048),
    theme_color character varying(8),
    picture_url text,
    profile_picture character varying(100),
    password_md5 character varying(50),
    locale character varying(50),
    override_username_cleanup boolean NOT NULL,
    source character varying(2048) NOT NULL,
    official boolean NOT NULL,
    password_reset_email character varying(2048),
    external_id character varying(2048),
    active_organisation_id integer,
    default_service_id integer
);


--
-- Name: dreamuserdb_user_organisations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_user_organisations (
    id integer NOT NULL,
    user_id integer NOT NULL,
    organisation_id integer NOT NULL
);


--
-- Name: dreamuserdb_user_organisations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_user_organisations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_user_organisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_user_organisations_id_seq OWNED BY public.dreamuserdb_user_organisations.id;


--
-- Name: dreamuserdb_user_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_user_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- Name: dreamuserdb_user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_user_roles_id_seq OWNED BY public.dreamuserdb_user_roles.id;


--
-- Name: dreamuserdb_user_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamuserdb_user_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: dreamuserdb_user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamuserdb_user_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamuserdb_user_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamuserdb_user_user_groups_id_seq OWNED BY public.dreamuserdb_user_user_groups.id;


--
-- Name: dreamvuolearning_vuoauthtoken; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamvuolearning_vuoauthtoken (
    id integer NOT NULL,
    token character varying(2048) NOT NULL,
    refreshed_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dreamvuolearning_vuoauthtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamvuolearning_vuoauthtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamvuolearning_vuoauthtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamvuolearning_vuoauthtoken_id_seq OWNED BY public.dreamvuolearning_vuoauthtoken.id;


--
-- Name: dreamvuolearning_vuodocumentcontent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamvuolearning_vuodocumentcontent (
    id integer NOT NULL,
    document_id character varying(2048) NOT NULL,
    revision_id character varying(2048) NOT NULL,
    content_id integer NOT NULL
);


--
-- Name: dreamvuolearning_vuodocumentcontent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamvuolearning_vuodocumentcontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamvuolearning_vuodocumentcontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamvuolearning_vuodocumentcontent_id_seq OWNED BY public.dreamvuolearning_vuodocumentcontent.id;


--
-- Name: dreamyle_ylecontent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.dreamyle_ylecontent (
    id integer NOT NULL,
    data text NOT NULL,
    data_type character varying(255) NOT NULL,
    data_id character varying(255) NOT NULL,
    url character varying(4096),
    image_url character varying(4096),
    expiration_date timestamp with time zone,
    content_id integer NOT NULL
);


--
-- Name: dreamyle_ylecontent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dreamyle_ylecontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dreamyle_ylecontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dreamyle_ylecontent_id_seq OWNED BY public.dreamyle_ylecontent.id;


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.easy_thumbnails_source_id_seq OWNED BY public.easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.easy_thumbnails_thumbnail_id_seq OWNED BY public.easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.easy_thumbnails_thumbnaildimensions_id_seq OWNED BY public.easy_thumbnails_thumbnaildimensions.id;


--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.guardian_groupobjectpermission_id_seq OWNED BY public.guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.guardian_userobjectpermission_id_seq OWNED BY public.guardian_userobjectpermission.id;


--
-- Name: health_check_db_testmodel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.health_check_db_testmodel (
    id integer NOT NULL,
    title character varying(128) NOT NULL
);


--
-- Name: health_check_db_testmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.health_check_db_testmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: health_check_db_testmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.health_check_db_testmodel_id_seq OWNED BY public.health_check_db_testmodel.id;


--
-- Name: lifelearn_agpaiiregistrationform; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearn_agpaiiregistrationform (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(2048) NOT NULL,
    province character varying(200) NOT NULL,
    district character varying(200) NOT NULL,
    sub_district character varying(200) NOT NULL,
    education_kindergarten boolean NOT NULL,
    education_primary_school boolean NOT NULL,
    education_secondary_school boolean NOT NULL,
    education_high_school boolean NOT NULL,
    created_timestamp timestamp with time zone NOT NULL,
    email_verified boolean NOT NULL,
    email_verified_timestamp timestamp with time zone,
    email_verification_sent boolean NOT NULL,
    user_id integer NOT NULL,
    category character varying(200) NOT NULL,
    education_supervisor boolean NOT NULL
);


--
-- Name: lifelearn_agpaiiregistrationform_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearn_agpaiiregistrationform_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearn_agpaiiregistrationform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearn_agpaiiregistrationform_id_seq OWNED BY public.lifelearn_agpaiiregistrationform.id;


--
-- Name: lifelearn_filecontent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearn_filecontent (
    id integer NOT NULL,
    uploaded_file character varying(2048) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    content_id integer NOT NULL,
    owner_id integer NOT NULL
);


--
-- Name: lifelearn_filecontent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearn_filecontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearn_filecontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearn_filecontent_id_seq OWNED BY public.lifelearn_filecontent.id;


--
-- Name: lifelearn_usercoursebadge; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearn_usercoursebadge (
    id integer NOT NULL,
    url character varying(2048) NOT NULL,
    course_id integer
);


--
-- Name: lifelearn_usercoursebadge_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearn_usercoursebadge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearn_usercoursebadge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearn_usercoursebadge_id_seq OWNED BY public.lifelearn_usercoursebadge.id;


--
-- Name: lifelearn_usercoursebadge_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearn_usercoursebadge_users (
    id integer NOT NULL,
    usercoursebadge_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: lifelearn_usercoursebadge_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearn_usercoursebadge_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearn_usercoursebadge_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearn_usercoursebadge_users_id_seq OWNED BY public.lifelearn_usercoursebadge_users.id;


--
-- Name: lifelearn_userprofile; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearn_userprofile (
    id integer NOT NULL,
    bio text,
    user_id integer NOT NULL
);


--
-- Name: lifelearn_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearn_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearn_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearn_userprofile_id_seq OWNED BY public.lifelearn_userprofile.id;


--
-- Name: lifelearncoins_lifecointransaction; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearncoins_lifecointransaction (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    difference integer NOT NULL,
    is_applied boolean NOT NULL,
    applied_at timestamp with time zone,
    reference_type character varying(2048) NOT NULL,
    reference_id character varying(2048),
    wallet_id integer NOT NULL
);


--
-- Name: lifelearncoins_lifecointransaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearncoins_lifecointransaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearncoins_lifecointransaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearncoins_lifecointransaction_id_seq OWNED BY public.lifelearncoins_lifecointransaction.id;


--
-- Name: lifelearncoins_lifecoinwallet; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearncoins_lifecoinwallet (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    value integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: lifelearncoins_lifecoinwallet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearncoins_lifecoinwallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearncoins_lifecoinwallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearncoins_lifecoinwallet_id_seq OWNED BY public.lifelearncoins_lifecoinwallet.id;


--
-- Name: lifelearnpushnotifications_eventcreatednotification; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearnpushnotifications_eventcreatednotification (
    id integer NOT NULL,
    is_sent boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    attempts integer NOT NULL,
    event_id integer NOT NULL
);


--
-- Name: lifelearnpushnotifications_eventcreatednotification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearnpushnotifications_eventcreatednotification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearnpushnotifications_eventcreatednotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearnpushnotifications_eventcreatednotification_id_seq OWNED BY public.lifelearnpushnotifications_eventcreatednotification.id;


--
-- Name: lifelearnpushnotifications_timelineeventcreatednotification; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearnpushnotifications_timelineeventcreatednotification (
    id integer NOT NULL,
    is_sent boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    attempts integer NOT NULL,
    event_id integer NOT NULL
);


--
-- Name: lifelearnpushnotifications_timelineeventcreatednotificat_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearnpushnotifications_timelineeventcreatednotificat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearnpushnotifications_timelineeventcreatednotificat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearnpushnotifications_timelineeventcreatednotificat_id_seq OWNED BY public.lifelearnpushnotifications_timelineeventcreatednotification.id;


--
-- Name: lifelearnskills_point; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearnskills_point (
    id integer NOT NULL,
    value integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    course_id integer NOT NULL,
    event_id integer NOT NULL,
    skill_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: lifelearnskills_point_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearnskills_point_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearnskills_point_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearnskills_point_id_seq OWNED BY public.lifelearnskills_point.id;


--
-- Name: lifelearnskills_skill; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearnskills_skill (
    id integer NOT NULL,
    title character varying(2048) NOT NULL,
    organisation_id integer NOT NULL
);


--
-- Name: lifelearnskills_skill_courses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.lifelearnskills_skill_courses (
    id integer NOT NULL,
    skill_id integer NOT NULL,
    course_id integer NOT NULL
);


--
-- Name: lifelearnskills_skill_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearnskills_skill_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearnskills_skill_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearnskills_skill_courses_id_seq OWNED BY public.lifelearnskills_skill_courses.id;


--
-- Name: lifelearnskills_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifelearnskills_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lifelearnskills_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifelearnskills_skill_id_seq OWNED BY public.lifelearnskills_skill.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL
);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.celery_taskmeta ALTER COLUMN id SET DEFAULT nextval('public.celery_taskmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.celery_tasksetmeta ALTER COLUMN id SET DEFAULT nextval('public.celery_tasksetmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.djcelery_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.djcelery_crontabschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.djcelery_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.djcelery_intervalschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.djcelery_periodictask ALTER COLUMN id SET DEFAULT nextval('public.djcelery_periodictask_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.djcelery_taskstate ALTER COLUMN id SET DEFAULT nextval('public.djcelery_taskstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.djcelery_workerstate ALTER COLUMN id SET DEFAULT nextval('public.djcelery_workerstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_card_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card_groups ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_card_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card_users ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_card_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_cardpageassociation ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_cardpageassociation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_category ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_desktopuserprofile ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_desktopuserprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_dreamcards ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_dreamcards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_page ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_usergroup ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_usergroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_usergroup_users ALTER COLUMN id SET DEFAULT nextval('public.dreamcards_usergroup_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcommunication_message ALTER COLUMN id SET DEFAULT nextval('public.dreamcommunication_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdevices_apisession ALTER COLUMN id SET DEFAULT nextval('public.dreamdevices_apisession_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdevices_device ALTER COLUMN id SET DEFAULT nextval('public.dreamdevices_device_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdevices_device_users ALTER COLUMN id SET DEFAULT nextval('public.dreamdevices_device_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_color ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_color_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_content ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_content_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_content_participants ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_content_participants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contentaccess ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_contentaccess_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contentattachment ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_contentattachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contentnote ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_contentnote_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contenttool ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_contenttool_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_course ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_course_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_course_participants ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_course_participants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_course_usergroups ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_course_usergroups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_diary ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_diary_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_network_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network_participants ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_network_participants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network_tags ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_network_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network_usergroups ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_network_usergroups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_networkaccess ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_networkaccess_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_tag ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_usercourse ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_usercourse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_usergroup ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_usergroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_usernetwork ALTER COLUMN id SET DEFAULT nextval('public.dreamdiary_usernetwork_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamevents_event ALTER COLUMN id SET DEFAULT nextval('public.dreamevents_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreameventstimeline_timelineevent ALTER COLUMN id SET DEFAULT nextval('public.dreameventstimeline_timelineevent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreaminvites_invitetoken ALTER COLUMN id SET DEFAULT nextval('public.dreaminvites_invitetoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreaminvites_invitetoken_courses ALTER COLUMN id SET DEFAULT nextval('public.dreaminvites_invitetoken_courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreaminvites_organisationsettings ALTER COLUMN id SET DEFAULT nextval('public.dreaminvites_organisationsettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_category ALTER COLUMN id SET DEFAULT nextval('public.dreammarket_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_domain ALTER COLUMN id SET DEFAULT nextval('public.dreammarket_domain_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_domain_organisations ALTER COLUMN id SET DEFAULT nextval('public.dreammarket_domain_organisations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable ALTER COLUMN id SET DEFAULT nextval('public.dreammarket_sellable_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable_categories ALTER COLUMN id SET DEFAULT nextval('public.dreammarket_sellable_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable_domains ALTER COLUMN id SET DEFAULT nextval('public.dreammarket_sellable_domains_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable_starred_by ALTER COLUMN id SET DEFAULT nextval('public.dreammarket_sellable_starred_by_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellablecontent ALTER COLUMN id SET DEFAULT nextval('public.dreammarket_sellablecontent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_message ALTER COLUMN id SET DEFAULT nextval('public.dreammessaging_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_message_to_user ALTER COLUMN id SET DEFAULT nextval('public.dreammessaging_message_to_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room ALTER COLUMN id SET DEFAULT nextval('public.dreammessaging_room_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room_roster ALTER COLUMN id SET DEFAULT nextval('public.dreammessaging_room_roster_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room_topics ALTER COLUMN id SET DEFAULT nextval('public.dreammessaging_room_topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_topic ALTER COLUMN id SET DEFAULT nextval('public.dreammessaging_topic_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammindmup_mindmupcontent ALTER COLUMN id SET DEFAULT nextval('public.dreammindmup_mindmupcontent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreampayments_order ALTER COLUMN id SET DEFAULT nextval('public.dreampayments_order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsms_onetimetoken ALTER COLUMN id SET DEFAULT nextval('public.dreamsms_onetimetoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsms_smsmessage ALTER COLUMN id SET DEFAULT nextval('public.dreamsms_smsmessage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_answer ALTER COLUMN id SET DEFAULT nextval('public.dreamsocialqa_answer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_answerrating ALTER COLUMN id SET DEFAULT nextval('public.dreamsocialqa_answerrating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_contentconsumption ALTER COLUMN id SET DEFAULT nextval('public.dreamsocialqa_contentconsumption_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_networkconsumption ALTER COLUMN id SET DEFAULT nextval('public.dreamsocialqa_networkconsumption_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_networkfeedback ALTER COLUMN id SET DEFAULT nextval('public.dreamsocialqa_networkfeedback_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_question ALTER COLUMN id SET DEFAULT nextval('public.dreamsocialqa_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_authprovider ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_authprovider_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_googleuser ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_googleuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_group ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_organisation ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_organisation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_organisation_owners ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_organisation_owners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_role ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_role_permissions ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_role_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_service ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_service_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_service_organisations ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_service_organisations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_servicepermission ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_servicepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user_organisations ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_user_organisations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user_roles ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_user_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.dreamuserdb_user_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamvuolearning_vuoauthtoken ALTER COLUMN id SET DEFAULT nextval('public.dreamvuolearning_vuoauthtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamvuolearning_vuodocumentcontent ALTER COLUMN id SET DEFAULT nextval('public.dreamvuolearning_vuodocumentcontent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamyle_ylecontent ALTER COLUMN id SET DEFAULT nextval('public.dreamyle_ylecontent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('public.guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('public.guardian_userobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_check_db_testmodel ALTER COLUMN id SET DEFAULT nextval('public.health_check_db_testmodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_agpaiiregistrationform ALTER COLUMN id SET DEFAULT nextval('public.lifelearn_agpaiiregistrationform_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_filecontent ALTER COLUMN id SET DEFAULT nextval('public.lifelearn_filecontent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_usercoursebadge ALTER COLUMN id SET DEFAULT nextval('public.lifelearn_usercoursebadge_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_usercoursebadge_users ALTER COLUMN id SET DEFAULT nextval('public.lifelearn_usercoursebadge_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_userprofile ALTER COLUMN id SET DEFAULT nextval('public.lifelearn_userprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearncoins_lifecointransaction ALTER COLUMN id SET DEFAULT nextval('public.lifelearncoins_lifecointransaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearncoins_lifecoinwallet ALTER COLUMN id SET DEFAULT nextval('public.lifelearncoins_lifecoinwallet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnpushnotifications_eventcreatednotification ALTER COLUMN id SET DEFAULT nextval('public.lifelearnpushnotifications_eventcreatednotification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnpushnotifications_timelineeventcreatednotification ALTER COLUMN id SET DEFAULT nextval('public.lifelearnpushnotifications_timelineeventcreatednotificat_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_point ALTER COLUMN id SET DEFAULT nextval('public.lifelearnskills_point_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_skill ALTER COLUMN id SET DEFAULT nextval('public.lifelearnskills_skill_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_skill_courses ALTER COLUMN id SET DEFAULT nextval('public.lifelearnskills_skill_courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add achsoreply	1	add_achsoreply
2	Can change achsoreply	1	change_achsoreply
3	Can delete achsoreply	1	delete_achsoreply
4	Can add analysationentries	2	add_analysationentries
5	Can change analysationentries	2	change_analysationentries
6	Can delete analysationentries	2	delete_analysationentries
7	Can add analysationentry block	3	add_analysationentryblock
8	Can change analysationentry block	3	change_analysationentryblock
9	Can delete analysationentry block	3	delete_analysationentryblock
10	Can add analyticsblockentries	4	add_analyticsblockentries
11	Can change analyticsblockentries	4	change_analyticsblockentries
12	Can delete analyticsblockentries	4	delete_analyticsblockentries
13	Can add analyticsblocksummaries	5	add_analyticsblocksummaries
14	Can change analyticsblocksummaries	5	change_analyticsblocksummaries
15	Can delete analyticsblocksummaries	5	delete_analyticsblocksummaries
16	Can add analyticschaptertimes	6	add_analyticschaptertimes
17	Can change analyticschaptertimes	6	change_analyticschaptertimes
18	Can delete analyticschaptertimes	6	delete_analyticschaptertimes
19	Can add analyticssearchentries	7	add_analyticssearchentries
20	Can change analyticssearchentries	7	change_analyticssearchentries
21	Can delete analyticssearchentries	7	delete_analyticssearchentries
22	Can add analyticssearchsummaries	8	add_analyticssearchsummaries
23	Can change analyticssearchsummaries	8	change_analyticssearchsummaries
24	Can delete analyticssearchsummaries	8	delete_analyticssearchsummaries
25	Can add analyticsusercountentries	9	add_analyticsusercountentries
26	Can change analyticsusercountentries	9	change_analyticsusercountentries
27	Can delete analyticsusercountentries	9	delete_analyticsusercountentries
28	Can add analyticsusercountsummaries	10	add_analyticsusercountsummaries
29	Can change analyticsusercountsummaries	10	change_analyticsusercountsummaries
30	Can delete analyticsusercountsummaries	10	delete_analyticsusercountsummaries
31	Can add answerreviews	11	add_answerreviews
32	Can change answerreviews	11	change_answerreviews
33	Can delete answerreviews	11	delete_answerreviews
34	Can add answers	12	add_answers
35	Can change answers	12	change_answers
36	Can delete answers	12	delete_answers
37	Can add blocks	13	add_blocks
38	Can change blocks	13	change_blocks
39	Can delete blocks	13	delete_blocks
40	Can add chapter blocks	14	add_chapterblocks
41	Can change chapter blocks	14	change_chapterblocks
42	Can delete chapter blocks	14	delete_chapterblocks
43	Can add chapters	15	add_chapters
44	Can change chapters	15	change_chapters
45	Can delete chapters	15	delete_chapters
46	Can add chattexts	16	add_chattexts
47	Can change chattexts	16	change_chattexts
48	Can delete chattexts	16	delete_chattexts
49	Can add chatusers	17	add_chatusers
50	Can change chatusers	17	change_chatusers
51	Can delete chatusers	17	delete_chatusers
52	Can add comments	18	add_comments
53	Can change comments	18	change_comments
54	Can delete comments	18	delete_comments
55	Can add courses	19	add_courses
56	Can change courses	19	change_courses
57	Can delete courses	19	delete_courses
58	Can add definitioncategories	20	add_definitioncategories
59	Can change definitioncategories	20	change_definitioncategories
60	Can delete definitioncategories	20	delete_definitioncategories
61	Can add definition category	21	add_definitioncategory
62	Can change definition category	21	change_definitioncategory
63	Can delete definition category	21	delete_definitioncategory
64	Can add definitions	22	add_definitions
65	Can change definitions	22	change_definitions
66	Can delete definitions	22	delete_definitions
67	Can add editor course	23	add_editorcourse
68	Can change editor course	23	change_editorcourse
69	Can delete editor course	23	delete_editorcourse
70	Can add logentries	24	add_logentries
71	Can change logentries	24	change_logentries
72	Can delete logentries	24	delete_logentries
73	Can add parts	25	add_parts
74	Can change parts	25	change_parts
75	Can delete parts	25	delete_parts
76	Can add readerlinks	26	add_readerlinks
77	Can change readerlinks	26	change_readerlinks
78	Can delete readerlinks	26	delete_readerlinks
79	Can add savedpasscodes	27	add_savedpasscodes
80	Can change savedpasscodes	27	change_savedpasscodes
81	Can delete savedpasscodes	27	delete_savedpasscodes
82	Can add sequelizemeta	28	add_sequelizemeta
83	Can change sequelizemeta	28	change_sequelizemeta
84	Can delete sequelizemeta	28	delete_sequelizemeta
85	Can add sites	29	add_sites
86	Can change sites	29	change_sites
87	Can delete sites	29	delete_sites
88	Can add synonyms	30	add_synonyms
89	Can change synonyms	30	change_synonyms
90	Can delete synonyms	30	delete_synonyms
91	Can add user course	31	add_usercourse
92	Can change user course	31	change_usercourse
93	Can delete user course	31	delete_usercourse
94	Can add users	32	add_users
95	Can change users	32	change_users
96	Can delete users	32	delete_users
97	Can add vocabularies	33	add_vocabularies
98	Can change vocabularies	33	change_vocabularies
99	Can delete vocabularies	33	delete_vocabularies
100	Can add votes	34	add_votes
101	Can change votes	34	change_votes
102	Can delete votes	34	delete_votes
103	Can add votings	35	add_votings
104	Can change votings	35	change_votings
105	Can delete votings	35	delete_votings
106	Can add file content	36	add_filecontent
107	Can change file content	36	change_filecontent
108	Can delete file content	36	delete_filecontent
109	Can add dream cards	37	add_dreamcards
110	Can change dream cards	37	change_dreamcards
111	Can delete dream cards	37	delete_dreamcards
112	Can access useradmin	37	can_use_useradmin
113	Can share cards	37	can_share_cards
114	Can add Page	38	add_page
115	Can change Page	38	change_page
116	Can delete Page	38	delete_page
117	Can add card page association	39	add_cardpageassociation
118	Can change card page association	39	change_cardpageassociation
119	Can delete card page association	39	delete_cardpageassociation
120	Can add Category	40	add_category
121	Can change Category	40	change_category
122	Can delete Category	40	delete_category
123	Can add desktop user profile	41	add_desktopuserprofile
124	Can change desktop user profile	41	change_desktopuserprofile
125	Can delete desktop user profile	41	delete_desktopuserprofile
126	Can add Card	42	add_card
127	Can change Card	42	change_card
128	Can delete Card	42	delete_card
129	Can add UserGroup	43	add_usergroup
130	Can change UserGroup	43	change_usergroup
131	Can delete UserGroup	43	delete_usergroup
132	Can add diary	44	add_diary
133	Can change diary	44	change_diary
134	Can delete diary	44	delete_diary
135	supervisor	44	supervisor
136	user	44	user
137	Can add tag	45	add_tag
138	Can change tag	45	change_tag
139	Can delete tag	45	delete_tag
140	Can add network access	46	add_networkaccess
141	Can change network access	46	change_networkaccess
142	Can delete network access	46	delete_networkaccess
143	Can add user group	47	add_usergroup
144	Can change user group	47	change_usergroup
145	Can delete user group	47	delete_usergroup
146	Can add user network	48	add_usernetwork
147	Can change user network	48	change_usernetwork
148	Can delete user network	48	delete_usernetwork
149	Can add course	49	add_course
150	Can change course	49	change_course
151	Can delete course	49	delete_course
152	Can add content attachment	50	add_contentattachment
153	Can change content attachment	50	change_contentattachment
154	Can delete content attachment	50	delete_contentattachment
155	Can add content note	51	add_contentnote
156	Can change content note	51	change_contentnote
157	Can delete content note	51	delete_contentnote
158	Can add user course	52	add_usercourse
159	Can change user course	52	change_usercourse
160	Can delete user course	52	delete_usercourse
161	Can add network	53	add_network
162	Can change network	53	change_network
163	Can delete network	53	delete_network
164	Can add content	54	add_content
165	Can change content	54	change_content
166	Can delete content	54	delete_content
167	Can add color	55	add_color
168	Can change color	55	change_color
169	Can delete color	55	delete_color
170	Can add reference content	56	add_referencecontent
171	Can change reference content	56	change_referencecontent
172	Can delete reference content	56	delete_referencecontent
173	Can add content access	57	add_contentaccess
174	Can change content access	57	change_contentaccess
175	Can delete content access	57	delete_contentaccess
176	Can add content tool	58	add_contenttool
177	Can change content tool	58	change_contenttool
178	Can delete content tool	58	delete_contenttool
179	Can add task	59	add_task
180	Can change task	59	change_task
181	Can delete task	59	delete_task
182	Can add work	60	add_work
183	Can change work	60	change_work
184	Can delete work	60	delete_work
185	Can add event	61	add_event
186	Can change event	61	change_event
187	Can delete event	61	delete_event
188	Can add timeline event	62	add_timelineevent
189	Can change timeline event	62	change_timelineevent
190	Can delete timeline event	62	delete_timelineevent
191	Can add sellable content	63	add_sellablecontent
192	Can change sellable content	63	change_sellablecontent
193	Can delete sellable content	63	delete_sellablecontent
194	Can add sellable	64	add_sellable
195	Can change sellable	64	change_sellable
196	Can delete sellable	64	delete_sellable
197	Can add category	65	add_category
198	Can change category	65	change_category
199	Can delete category	65	delete_category
200	Can add domain	66	add_domain
201	Can change domain	66	change_domain
202	Can delete domain	66	delete_domain
203	Can add answer rating	67	add_answerrating
204	Can change answer rating	67	change_answerrating
205	Can delete answer rating	67	delete_answerrating
206	Can add content consumption	68	add_contentconsumption
207	Can change content consumption	68	change_contentconsumption
208	Can delete content consumption	68	delete_contentconsumption
209	Can add network feedback	69	add_networkfeedback
210	Can change network feedback	69	change_networkfeedback
211	Can delete network feedback	69	delete_networkfeedback
212	Can add answer	70	add_answer
213	Can change answer	70	change_answer
214	Can delete answer	70	delete_answer
215	Can add network consumption	71	add_networkconsumption
216	Can change network consumption	71	change_networkconsumption
217	Can delete network consumption	71	delete_networkconsumption
218	Can add question	72	add_question
219	Can change question	72	change_question
220	Can delete question	72	delete_question
221	Can add organisation settings	73	add_organisationsettings
222	Can change organisation settings	73	change_organisationsettings
223	Can delete organisation settings	73	delete_organisationsettings
224	Can add invite token	74	add_invitetoken
225	Can change invite token	74	change_invitetoken
226	Can delete invite token	74	delete_invitetoken
227	Can add topic	75	add_topic
228	Can change topic	75	change_topic
229	Can delete topic	75	delete_topic
230	Can add message	76	add_message
231	Can change message	76	change_message
232	Can delete message	76	delete_message
233	Can add room	77	add_room
234	Can change room	77	change_room
235	Can delete room	77	delete_room
236	Can add group	78	add_group
237	Can change group	78	change_group
238	Can delete group	78	delete_group
239	Can add role	79	add_role
240	Can change role	79	change_role
241	Can delete role	79	delete_role
242	Can add organisation	80	add_organisation
243	Can change organisation	80	change_organisation
244	Can delete organisation	80	delete_organisation
245	Can add user	81	add_user
246	Can change user	81	change_user
247	Can delete user	81	delete_user
248	Can add vuo document content	82	add_vuodocumentcontent
249	Can change vuo document content	82	change_vuodocumentcontent
250	Can delete vuo document content	82	delete_vuodocumentcontent
251	Can add vuo auth token	83	add_vuoauthtoken
252	Can change vuo auth token	83	change_vuoauthtoken
253	Can delete vuo auth token	83	delete_vuoauthtoken
254	Can add mindmup content	84	add_mindmupcontent
255	Can change mindmup content	84	change_mindmupcontent
256	Can delete mindmup content	84	delete_mindmupcontent
257	Can add order	85	add_order
258	Can change order	85	change_order
259	Can delete order	85	delete_order
260	Can add yle content	86	add_ylecontent
261	Can change yle content	86	change_ylecontent
262	Can delete yle content	86	delete_ylecontent
263	Can add message	87	add_message
264	Can change message	87	change_message
265	Can delete message	87	delete_message
266	Can add timeline event created notification	88	add_timelineeventcreatednotification
267	Can change timeline event created notification	88	change_timelineeventcreatednotification
268	Can delete timeline event created notification	88	delete_timelineeventcreatednotification
269	Can add event created notification	89	add_eventcreatednotification
270	Can change event created notification	89	change_eventcreatednotification
271	Can delete event created notification	89	delete_eventcreatednotification
272	Can add point	90	add_point
273	Can change point	90	change_point
274	Can delete point	90	delete_point
275	Can add skill	91	add_skill
276	Can change skill	91	change_skill
277	Can delete skill	91	delete_skill
278	Can add lifecoin wallet	92	add_lifecoinwallet
279	Can change lifecoin wallet	92	change_lifecoinwallet
280	Can delete lifecoin wallet	92	delete_lifecoinwallet
281	Can add lifecoin transaction	93	add_lifecointransaction
282	Can change lifecoin transaction	93	change_lifecointransaction
283	Can delete lifecoin transaction	93	delete_lifecointransaction
284	Can add task	94	add_taskstate
285	Can change task	94	change_taskstate
286	Can delete task	94	delete_taskstate
287	Can add worker	95	add_workerstate
288	Can change worker	95	change_workerstate
289	Can delete worker	95	delete_workerstate
290	Can add periodic task	96	add_periodictask
291	Can change periodic task	96	change_periodictask
292	Can delete periodic task	96	delete_periodictask
293	Can add crontab	97	add_crontabschedule
294	Can change crontab	97	change_crontabschedule
295	Can delete crontab	97	delete_crontabschedule
296	Can add interval	98	add_intervalschedule
297	Can change interval	98	change_intervalschedule
298	Can delete interval	98	delete_intervalschedule
299	Can add saved group result	99	add_tasksetmeta
300	Can change saved group result	99	change_tasksetmeta
301	Can delete saved group result	99	delete_tasksetmeta
302	Can add task state	100	add_taskmeta
303	Can change task state	100	change_taskmeta
304	Can delete task state	100	delete_taskmeta
305	Can add periodic tasks	101	add_periodictasks
306	Can change periodic tasks	101	change_periodictasks
307	Can delete periodic tasks	101	delete_periodictasks
308	Can add source	102	add_source
309	Can change source	102	change_source
310	Can delete source	102	delete_source
311	Can add thumbnail	103	add_thumbnail
312	Can change thumbnail	103	change_thumbnail
313	Can delete thumbnail	103	delete_thumbnail
314	Can add thumbnail dimensions	104	add_thumbnaildimensions
315	Can change thumbnail dimensions	104	change_thumbnaildimensions
316	Can delete thumbnail dimensions	104	delete_thumbnaildimensions
317	Can add group object permission	105	add_groupobjectpermission
318	Can change group object permission	105	change_groupobjectpermission
319	Can delete group object permission	105	delete_groupobjectpermission
320	Can add user object permission	106	add_userobjectpermission
321	Can change user object permission	106	change_userobjectpermission
322	Can delete user object permission	106	delete_userobjectpermission
323	Can add test model	107	add_testmodel
324	Can change test model	107	change_testmodel
325	Can delete test model	107	delete_testmodel
326	Can add site	108	add_site
327	Can change site	108	change_site
328	Can delete site	108	delete_site
329	Can add user	109	add_user
330	Can change user	109	change_user
331	Can delete user	109	delete_user
332	Can add permission	110	add_permission
333	Can change permission	110	change_permission
334	Can delete permission	110	delete_permission
335	Can add group	111	add_group
336	Can change group	111	change_group
337	Can delete group	111	delete_group
338	Can add content type	112	add_contenttype
339	Can change content type	112	change_contenttype
340	Can delete content type	112	delete_contenttype
341	Can add session	113	add_session
342	Can change session	113	change_session
343	Can delete session	113	delete_session
344	Can add log entry	114	add_logentry
345	Can change log entry	114	change_logentry
346	Can delete log entry	114	delete_logentry
347	Can add invite token	115	add_invitetoken
348	Can change invite token	115	change_invitetoken
349	Can delete invite token	115	delete_invitetoken
350	Can add vuo auth token	116	add_vuoauthtoken
351	Can change vuo auth token	116	change_vuoauthtoken
352	Can delete vuo auth token	116	delete_vuoauthtoken
353	Can add user profile	117	add_userprofile
354	Can change user profile	117	change_userprofile
355	Can delete user profile	117	delete_userprofile
356	Can add course	118	add_course
357	Can change course	118	change_course
358	Can delete course	118	delete_course
359	Can add user course badge	119	add_usercoursebadge
360	Can change user course badge	119	change_usercoursebadge
361	Can delete user course badge	119	delete_usercoursebadge
362	Can add agpaii registration form	120	add_agpaiiregistrationform
363	Can change agpaii registration form	120	change_agpaiiregistrationform
364	Can delete agpaii registration form	120	delete_agpaiiregistrationform
365	Can add service	121	add_service
366	Can change service	121	change_service
367	Can delete service	121	delete_service
368	Can add service permission	122	add_servicepermission
369	Can change service permission	122	change_servicepermission
370	Can delete service permission	122	delete_servicepermission
371	Can add role	123	add_role
372	Can change role	123	change_role
373	Can delete role	123	delete_role
374	Can use UserDB API	123	api
375	Can query users from all organisations via API	123	sysapi
376	Can add organisation	124	add_organisation
377	Can change organisation	124	change_organisation
378	Can delete organisation	124	delete_organisation
379	Can manage organisation	124	can_manage
380	Can add auth provider	125	add_authprovider
381	Can change auth provider	125	change_authprovider
382	Can delete auth provider	125	delete_authprovider
383	Can add group	126	add_group
384	Can change group	126	change_group
385	Can delete group	126	delete_group
386	Can manage group participants	126	can_manage_group_participants
387	Can add google user	127	add_googleuser
388	Can change google user	127	change_googleuser
389	Can delete google user	127	delete_googleuser
390	Can add user	128	add_user
391	Can change user	128	change_user
392	Can delete user	128	delete_user
393	Can add api session	129	add_apisession
394	Can change api session	129	change_apisession
395	Can delete api session	129	delete_apisession
396	Can add device	130	add_device
397	Can change device	130	change_device
398	Can delete device	130	delete_device
399	Can add one time token	131	add_onetimetoken
400	Can change one time token	131	change_onetimetoken
401	Can delete one time token	131	delete_onetimetoken
402	Can add sms message	132	add_smsmessage
403	Can change sms message	132	change_smsmessage
404	Can delete sms message	132	delete_smsmessage
405	Can add nonce	133	add_nonce
406	Can change nonce	133	change_nonce
407	Can delete nonce	133	delete_nonce
408	Can add code	134	add_code
409	Can change code	134	change_code
410	Can delete code	134	delete_code
411	Can add user social auth	135	add_usersocialauth
412	Can change user social auth	135	change_usersocialauth
413	Can delete user social auth	135	delete_usersocialauth
414	Can add association	136	add_association
415	Can change association	136	change_association
416	Can delete association	136	delete_association
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 416, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$30000$NKYIjh7r5Woa$wadZU4L9De4rnlZGKiUkfjTIlxE7c75GogZQ36iDbl4=	2018-08-02 19:58:29.226649+00	t	admin			admin@haltu.fi	t	t	2018-08-02 17:11:04.001983+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: celery_taskmeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.celery_taskmeta (id, task_id, status, result, date_done, traceback, hidden, meta) FROM stdin;
\.


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.celery_taskmeta_id_seq', 1, false);


--
-- Data for Name: celery_tasksetmeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.celery_tasksetmeta (id, taskset_id, result, date_done, hidden) FROM stdin;
\.


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.celery_tasksetmeta_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-08-02 19:56:52.130566+00	1	app	1	[{"added": {}}]	121	1
2	2018-08-02 19:57:32.08741+00	2	gql	1	[{"added": {}}]	121	1
3	2018-08-02 19:58:06.468965+00	3	vuo1.lifelearningplatform.com	1	[{"added": {}}]	121	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	lifelearn	achsoreply
2	lifelearn	analysationentries
3	lifelearn	analysationentryblock
4	lifelearn	analyticsblockentries
5	lifelearn	analyticsblocksummaries
6	lifelearn	analyticschaptertimes
7	lifelearn	analyticssearchentries
8	lifelearn	analyticssearchsummaries
9	lifelearn	analyticsusercountentries
10	lifelearn	analyticsusercountsummaries
11	lifelearn	answerreviews
12	lifelearn	answers
13	lifelearn	blocks
14	lifelearn	chapterblocks
15	lifelearn	chapters
16	lifelearn	chattexts
17	lifelearn	chatusers
18	lifelearn	comments
19	lifelearn	courses
20	lifelearn	definitioncategories
21	lifelearn	definitioncategory
22	lifelearn	definitions
23	lifelearn	editorcourse
24	lifelearn	logentries
25	lifelearn	parts
26	lifelearn	readerlinks
27	lifelearn	savedpasscodes
28	lifelearn	sequelizemeta
29	lifelearn	sites
30	lifelearn	synonyms
31	lifelearn	usercourse
32	lifelearn	users
33	lifelearn	vocabularies
34	lifelearn	votes
35	lifelearn	votings
36	lifelearn	filecontent
37	dreamcards	dreamcards
38	dreamcards	page
39	dreamcards	cardpageassociation
40	dreamcards	category
41	dreamcards	desktopuserprofile
42	dreamcards	card
43	dreamcards	usergroup
44	dreamdiary	diary
45	dreamdiary	tag
46	dreamdiary	networkaccess
47	dreamdiary	usergroup
48	dreamdiary	usernetwork
49	dreamdiary	course
50	dreamdiary	contentattachment
51	dreamdiary	contentnote
52	dreamdiary	usercourse
53	dreamdiary	network
54	dreamdiary	content
55	dreamdiary	color
56	dreamdiary	referencecontent
57	dreamdiary	contentaccess
58	dreamdiary	contenttool
59	dreamdiary	task
60	dreamdiary	work
61	dreamevents	event
62	dreameventstimeline	timelineevent
63	dreammarket	sellablecontent
64	dreammarket	sellable
65	dreammarket	category
66	dreammarket	domain
67	dreamsocialqa	answerrating
68	dreamsocialqa	contentconsumption
69	dreamsocialqa	networkfeedback
70	dreamsocialqa	answer
71	dreamsocialqa	networkconsumption
72	dreamsocialqa	question
73	dreaminvites	organisationsettings
74	dreaminvites	invitetoken
75	dreammessaging	topic
76	dreammessaging	message
77	dreammessaging	room
78	dreamsso	group
79	dreamsso	role
80	dreamsso	organisation
81	dreamsso	user
82	dreamvuolearning	vuodocumentcontent
83	dreamvuolearning	vuoauthtoken
84	dreammindmup	mindmupcontent
85	dreampayments	order
86	dreamyle	ylecontent
87	dreamcommunication	message
88	lifelearnpushnotifications	timelineeventcreatednotification
89	lifelearnpushnotifications	eventcreatednotification
90	lifelearnskills	point
91	lifelearnskills	skill
92	lifelearncoins	lifecoinwallet
93	lifelearncoins	lifecointransaction
94	djcelery	taskstate
95	djcelery	workerstate
96	djcelery	periodictask
97	djcelery	crontabschedule
98	djcelery	intervalschedule
99	djcelery	tasksetmeta
100	djcelery	taskmeta
101	djcelery	periodictasks
102	easy_thumbnails	source
103	easy_thumbnails	thumbnail
104	easy_thumbnails	thumbnaildimensions
105	guardian	groupobjectpermission
106	guardian	userobjectpermission
107	health_check_db	testmodel
108	sites	site
109	auth	user
110	auth	permission
111	auth	group
112	contenttypes	contenttype
113	sessions	session
114	admin	logentry
115	lifelearn	invitetoken
116	lifelearn	vuoauthtoken
117	lifelearn	userprofile
118	lifelearn	course
119	lifelearn	usercoursebadge
120	lifelearn	agpaiiregistrationform
121	dreamuserdb	service
122	dreamuserdb	servicepermission
123	dreamuserdb	role
124	dreamuserdb	organisation
125	dreamuserdb	authprovider
126	dreamuserdb	group
127	dreamuserdb	googleuser
128	dreamuserdb	user
129	dreamdevices	apisession
130	dreamdevices	device
131	dreamsms	onetimetoken
132	dreamsms	smsmessage
133	social_auth	nonce
134	social_auth	code
135	social_auth	usersocialauth
136	social_auth	association
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 136, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-08-01 21:39:31.31032+00
2	auth	0001_initial	2018-08-01 21:39:31.372332+00
3	admin	0001_initial	2018-08-01 21:39:31.420068+00
4	admin	0002_logentry_remove_auto_add	2018-08-01 21:39:31.439554+00
5	contenttypes	0002_remove_content_type_name	2018-08-01 21:39:31.472012+00
6	auth	0002_alter_permission_name_max_length	2018-08-01 21:39:31.483958+00
7	auth	0003_alter_user_email_max_length	2018-08-01 21:39:31.497608+00
8	auth	0004_alter_user_username_opts	2018-08-01 21:39:31.508751+00
9	auth	0005_alter_user_last_login_null	2018-08-01 21:39:31.526488+00
10	auth	0006_require_contenttypes_0002	2018-08-01 21:39:31.529514+00
11	auth	0007_alter_validators_add_error_messages	2018-08-01 21:39:31.541399+00
12	auth	0008_alter_user_username_max_length	2018-08-01 21:39:31.556043+00
13	djcelery	0001_initial	2018-08-01 21:39:31.633427+00
14	dreamuserdb	0001_initial	2018-08-01 21:39:32.126307+00
15	dreamdevices	0001_initial	2018-08-01 21:39:32.227141+00
16	dreamsms	0001_initial	2018-08-01 21:39:32.349019+00
17	dreamsms	0002_onetimetoken_phone_number	2018-08-01 21:39:32.354306+00
18	dreamsms	0002_auto_20170711_0958	2018-08-01 21:39:32.421911+00
19	dreamsms	0003_onetimetoken_active	2018-08-01 21:39:32.475813+00
20	dreamsms	0004_partial_ott_code_unique_index	2018-08-01 21:39:32.483489+00
21	dreamsms	0005_auto_20170904_1316	2018-08-01 21:39:32.555807+00
22	guardian	0001_initial	2018-08-01 21:39:32.872201+00
23	health_check_db	0001_initial	2018-08-01 21:39:32.883332+00
24	dreamsso	0001_initial	2018-08-01 21:40:18.22141+00
25	dreamcards	0001_initial	2018-08-01 21:40:18.342979+00
26	dreamcards	0002_auto_20161101_1304	2018-08-01 21:40:19.073167+00
27	dreamcards	0003_auto_20180405_1532	2018-08-01 21:40:19.169604+00
28	dreamcommunication	0001_initial	2018-08-01 21:40:19.239052+00
29	dreamcommunication	0002_auto_20171115_0959	2018-08-01 21:40:19.328138+00
30	dreamdiary	0001_initial	2018-08-01 21:40:19.55032+00
31	dreamdiary	0002_auto_20161101_1304	2018-08-01 21:40:23.069624+00
32	dreamdiary	0003_network_autoaccess	2018-08-01 21:40:23.214242+00
33	dreamdiary	0004_auto_20170327_1003	2018-08-01 21:40:23.494663+00
34	dreamevents	0001_initial	2018-08-01 21:40:23.513702+00
35	dreameventstimeline	0001_initial	2018-08-01 21:40:23.541033+00
36	dreameventstimeline	0002_timelineevent_extra_data	2018-08-01 21:40:23.561055+00
37	dreaminvites	0001_initial	2018-08-01 21:40:23.782229+00
38	dreammarket	0001_initial	2018-08-01 21:40:24.121088+00
39	dreammarket	0002_sellable_starred_by	2018-08-01 21:40:24.239975+00
40	dreammarket	0003_add_sellable_payment_type	2018-08-01 21:40:25.509245+00
41	dreammarket	0004_sellable_decorative_image_url	2018-08-01 21:40:25.693798+00
42	dreammarket	0005_auto_20170719_1051	2018-08-01 21:40:26.029623+00
43	dreammarket	0006_sellablecontent	2018-08-01 21:40:26.157487+00
44	dreammarket	0007_sellable_lifecoin_amount	2018-08-01 21:40:26.295392+00
45	dreammessaging	0001_initial	2018-08-01 21:40:26.354593+00
46	dreammessaging	0002_auto_20161101_1304	2018-08-01 21:40:27.60526+00
47	dreammindmup	0001_initial	2018-08-01 21:40:27.804106+00
48	dreampayments	0001_initial	2018-08-01 21:40:27.928427+00
49	dreampayments	0002_auto_20180117_1015	2018-08-01 21:40:28.138587+00
50	dreamsocialqa	0001_initial	2018-08-01 21:40:28.324926+00
51	dreamsocialqa	0002_auto_20161101_1304	2018-08-01 21:40:29.751854+00
52	dreamsocialqa	0003_question_image	2018-08-01 21:40:30.044047+00
53	dreamvuolearning	0001_initial	2018-08-01 21:40:30.191645+00
54	dreamvuolearning	0002_vuodocumentcontent	2018-08-01 21:40:30.315968+00
55	dreamyle	0001_initial	2018-08-01 21:40:30.435356+00
56	easy_thumbnails	0001_initial	2018-08-01 21:40:30.475615+00
57	easy_thumbnails	0002_thumbnaildimensions	2018-08-01 21:40:30.497359+00
58	lifelearn	0001_app_initial	2018-08-01 21:40:31.060368+00
59	lifelearncoins	0001_initial	2018-08-01 21:40:31.410144+00
60	lifelearnpushnotifications	0001_initial	2018-08-01 21:40:31.592219+00
61	lifelearnpushnotifications	0002_timelineeventcreatednotification	2018-08-01 21:40:31.624829+00
62	lifelearnskills	0001_initial	2018-08-01 21:40:32.51049+00
63	sessions	0001_initial	2018-08-01 21:40:32.533366+00
64	sites	0001_initial	2018-08-01 21:40:32.55172+00
65	sites	0002_alter_domain_unique	2018-08-01 21:40:32.576126+00
66	lifelearn	0001_initial	2018-08-01 21:41:00.291658+00
67	lifelearn	0002_agpaiiregistrationform	2018-08-01 21:41:00.40198+00
68	lifelearn	0003_agpaiiregistrationform_category	2018-08-01 21:41:00.533762+00
69	lifelearn	0004_agpaiiregistrationform_education_supervisor	2018-08-01 21:41:00.676376+00
70	default	0001_initial	2018-08-01 21:41:00.841245+00
71	default	0002_add_related_name	2018-08-01 21:41:00.926609+00
72	default	0003_alter_email_max_length	2018-08-01 21:41:00.940833+00
73	default	0004_auto_20160423_0400	2018-08-01 21:41:00.999515+00
74	social_auth	0005_auto_20160727_2333	2018-08-01 21:41:01.012959+00
75	social_auth	0001_initial	2018-08-01 21:41:01.021727+00
76	social_auth	0003_alter_email_max_length	2018-08-01 21:41:01.02523+00
77	dreamsms	0001_squashed_0002_onetimetoken_phone_number	2018-08-01 21:41:01.02841+00
78	social_auth	0004_auto_20160423_0400	2018-08-01 21:41:01.031514+00
79	social_auth	0002_add_related_name	2018-08-01 21:41:01.034939+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 79, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
rgkbfmb3x79yypnu5p7xowdijyrhs4rr	YTk1ZjIwYTRmNjY2Y2Y1NTU1MzY5M2U0MmQ2ZDdkOGZhZGVjOTMyOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM5YWU0ZTZmNzc3M2Q2YjNmZjUzNThjNGZlMTVkZmJlZGE2N2ZhNTkiLCJfc2FtbDJfb3V0c3RhbmRpbmdfcXVlcmllcyI6eyJpZC03MWRlZTg0OWIyNmMzZWU3MmJkN2RkMDI2NjgwMDcwZCI6Ii8ifSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZHJlYW1zc28uYXV0aGJhY2tlbmQubG9jYWwuU2luZ2xlRGF0YWJhc2VCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-08-03 17:12:26.879426+00
w56og39s8h5snraqnkpg3nfpcngh6iv8	MjhhYTE5OGI5ZjU0ZWQwOTc1ODRlN2UxYzVlNjUzNzc1MDk3MmRiNzp7Il9zYW1sMl9vdXRzdGFuZGluZ19xdWVyaWVzIjp7ImlkLWUwMzU1NTA3OTRjMWQxZTM3ZjY3ZTgxMmY1ZjgyZWE0IjoiLyJ9fQ==	2018-08-03 17:13:29.510311+00
330s2uwaod53v1sf790p18w6qetzciy2	OGY5NGZhYTdmY2ZiMjllNGUwNjI1NTViMGY1MDdiMDMxNjVhNTM3OTp7ImRvbWFpbiI6IiIsIl9hdXRoX3VzZXJfaGFzaCI6IjM5YWU0ZTZmNzc3M2Q2YjNmZjUzNThjNGZlMTVkZmJlZGE2N2ZhNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-08-16 17:37:32.471843+00
mn1jh9n6rci6y2r4ntpqsn1ecvp181gz	OGY5NGZhYTdmY2ZiMjllNGUwNjI1NTViMGY1MDdiMDMxNjVhNTM3OTp7ImRvbWFpbiI6IiIsIl9hdXRoX3VzZXJfaGFzaCI6IjM5YWU0ZTZmNzc3M2Q2YjNmZjUzNThjNGZlMTVkZmJlZGE2N2ZhNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-08-16 19:53:10.360824+00
1s128c6b0315iwufeyayhgs5xxxnhl87	ZTA0ZmY1YzkxNTVhOTg0NmMwOTQyNjNhMTNlOWVjOTExMjI2ZmU2Mzp7IlNBTUxSZXF1ZXN0TWV0aG9kIjoiR0VUIiwiU0FNTFJlcXVlc3QiOiJuVkk3Yjlzd0VONzdLd2d1bm16WmhwSTRoS1hBalJIVWdOc0lrZEtoMjVrNk5RUW9VdVdkM09iZmwxSWNORjJNSUFBWGt0L3JIdXViUDYwVlJ3eGt2TXNtaTlsOEl0QnBYeHYzTTVzOFZuZlQxZVFtLzdRbWFHMm5OajAvdVFmODFTT3hpRVJIYXZqSVpCK2M4a0NHbElNV1NiRlc1ZWJyWGkxbmN3VkVHRGpLeXplVTdqeW5DNTY5OWxhS3pTdjcxanZxV3d3bGhxUFIrUGl3eitRVGMwY3FTYURyWnRZMGFCR0M2eXh3NDBNNzA3NU5CcThFTkNWU2JHTm80MkRRK3NjMDlUbGlXZDVING02YlNWTlA0ZUtxV2E2Z3hrTjZPT0FsUUpvMjE4M2xLdDYxVHErYUNDVHFjZWVJd1hFbWwvUEZhanFQWjFrdHJsV2Fxb3ZGRHltS1UyV2ZqUnQ3ZkxZTmh4Y1FxUzlWVlV5TCs3SWFCWTZteHZBdG9qTzVqK0hGZmtndmlsTjhLYjZmeGltamhzekgyYWt4V3hCM0VRQjgzblY0aWZVMkkxU2hZOFBQTW45bnIxdGtxSUVoV1NkdmZQUFRBZzJoZDl2Q1c2T2Z4Y1phLy9zMklIQXNoRU9QOGdQeE9JQWpFME5La2VRdm52L3ZhZjRYIiwiZG9tYWluIjoiIiwiUmVsYXlTdGF0ZSI6Ii8iLCJ0ZXN0Y29va2llIjoid29ya2VkIn0=	2018-08-16 19:53:59.364265+00
6in72cm89hvhvx6235yogd3y6kgbljxk	MGRjNzk2ODYwZjc1MzM1NWIzNmQ1M2RmMjliODRjYzc0MDE5MmNhYzp7ImRvbWFpbiI6IiIsIl9hdXRoX3VzZXJfaGFzaCI6IjM5YWU0ZTZmNzc3M2Q2YjNmZjUzNThjNGZlMTVkZmJlZGE2N2ZhNTkiLCJzZXJ2aWNlX3Byb3ZpZGVycyI6W3sic3AiOiJodHRwczovL2FwcC5saWZlbGVhcm5wbGF0Zm9ybS5jb20vc2FtbC9tZXRhZGF0YS8iLCJyZXF1ZXN0X2lkIjoiaWQtMzVkNmZlZWZiNjVlNWMwYWQ1ODhiZTIwMzVjYTFjZjMifV0sIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==	2018-08-16 19:58:28.44002+00
tn6gr2kjp2db1a55bom4c1nbxqknezi4	YTkzOGZhZTgyODc2YWEyNDMxYTQ1YTkxOTVkMWY3NTkxZTcwODgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX3NhbWwyX2lkZW50aXRpZXMiOnsiYWRtaW4iOnsiaHR0cHM6Ly9pZC5saWZlbGVhcm5wbGF0Zm9ybS5jb20vc2FtbC9tZXRhZGF0YS8iOlsxNTMzMjQwODA4LHsiYXV0aG5faW5mbyI6W1sidXJuOm9hc2lzOm5hbWVzOnRjOlNBTUw6Mi4wOmFjOmNsYXNzZXM6UGFzc3dvcmQiLFtdXV0sIm5hbWVfaWQiOiJhZG1pbiIsIm5vdF9vbl9vcl9hZnRlciI6MTUzMzI0MDgwOCwiY2FtZV9mcm9tIjoiLyIsImF2YSI6eyJuYW1lIjpbImFkbWluIl0sInJvbGVzIjpbXSwibG9jYWxlIjpbXSwiZmFtaWx5TmFtZSI6WyIiXSwib3JnYW5pc2F0aW9ucyI6W10sInNuIjpbIiJdLCJtYWlsIjpbImFkbWluQGhhbHR1LmZpIl0sImdpdmVuTmFtZSI6WyIiXSwiaWQiOlsiMSJdLCJwZXJtaXNzaW9ucyI6W119fV19fSwiX3NhbWwyX291dHN0YW5kaW5nX3F1ZXJpZXMiOnsiaWQtODMzZTAyMjYwNDdmNjU4NDQ2ZmZkMjdkMThkOTZiODMiOiIvIiwiaWQtZTQ1ZjYyZGU0ZjNlZGQ0MWFkODJjMWFmNWUxMTk5ZGYiOiIvIn0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRyZWFtc3NvLmF1dGhiYWNrZW5kLnNhbWwuU2luZ2xlRGF0YWJhc2VCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzlhZTRlNmY3NzczZDZiM2ZmNTM1OGM0ZmUxNWRmYmVkYTY3ZmE1OSIsIl9zYW1sMl9zdWJqZWN0X2lkIjoiYWRtaW4ifQ==	2018-08-03 19:58:29.394705+00
x3d97fwmz4q4rmkydk79yevodsw6mwpd	ODhkM2U3ZjQ0NWNmODQxODNkMTBkM2U0YzhlYzlkOTdkZGJmMDU1Zjp7ImRvbWFpbiI6IiIsInNvY2lhbGF1dGhfZm9yY2VfbG9naW4iOnRydWUsInNvY2lhbGF1dGhfY3JlYXRlX3VzZXIiOnRydWUsInRlc3Rjb29raWUiOiJ3b3JrZWQiLCJnb29nbGUtb2F1dGgyX3N0YXRlIjoiOU5vU3VlQzVrRWhvWnFGZ2E1Qzl2aEJxUHZFaE1LWWwiLCJuZXh0IjoiLyIsInlsZV9zdGF0ZSI6InM0ZmRRQ3VTQjdpdXZROTNqMWNPc2ZRREtldVhId2FDIn0=	2018-08-16 20:05:48.758459+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Data for Name: djcelery_crontabschedule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.djcelery_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year) FROM stdin;
\.


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.djcelery_crontabschedule_id_seq', 1, false);


--
-- Data for Name: djcelery_intervalschedule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.djcelery_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.djcelery_intervalschedule_id_seq', 1, false);


--
-- Data for Name: djcelery_periodictask; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.djcelery_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id) FROM stdin;
\.


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.djcelery_periodictask_id_seq', 1, false);


--
-- Data for Name: djcelery_periodictasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.djcelery_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: djcelery_taskstate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.djcelery_taskstate (id, state, task_id, name, tstamp, args, kwargs, eta, expires, result, traceback, runtime, retries, hidden, worker_id) FROM stdin;
\.


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.djcelery_taskstate_id_seq', 1, false);


--
-- Data for Name: djcelery_workerstate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.djcelery_workerstate (id, hostname, last_heartbeat) FROM stdin;
\.


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.djcelery_workerstate_id_seq', 1, false);


--
-- Data for Name: dreamcards_card; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_card (id, created, modified, title, url, thumbnail, active, card_type, language, default_for_new_users, category_id, owner_id, permission_id) FROM stdin;
\.


--
-- Data for Name: dreamcards_card_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_card_groups (id, card_id, group_id) FROM stdin;
\.


--
-- Name: dreamcards_card_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_card_groups_id_seq', 1, false);


--
-- Name: dreamcards_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_card_id_seq', 1, false);


--
-- Data for Name: dreamcards_card_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_card_users (id, card_id, user_id) FROM stdin;
\.


--
-- Name: dreamcards_card_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_card_users_id_seq', 1, false);


--
-- Data for Name: dreamcards_cardpageassociation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_cardpageassociation (id, size_x, size_y, "order", card_id, page_id) FROM stdin;
\.


--
-- Name: dreamcards_cardpageassociation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_cardpageassociation_id_seq', 1, false);


--
-- Data for Name: dreamcards_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_category (id, title, active, language, color, owner_id) FROM stdin;
\.


--
-- Name: dreamcards_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_category_id_seq', 1, false);


--
-- Data for Name: dreamcards_desktopuserprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_desktopuserprofile (id, preferred_background, preferred_language, user_id) FROM stdin;
\.


--
-- Name: dreamcards_desktopuserprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_desktopuserprofile_id_seq', 1, false);


--
-- Data for Name: dreamcards_dreamcards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_dreamcards (id) FROM stdin;
\.


--
-- Name: dreamcards_dreamcards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_dreamcards_id_seq', 1, false);


--
-- Data for Name: dreamcards_page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_page (id, title, active, owner_id) FROM stdin;
1	Aloitussivu	t	1
\.


--
-- Name: dreamcards_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_page_id_seq', 1, true);


--
-- Data for Name: dreamcards_usergroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_usergroup (id, name) FROM stdin;
\.


--
-- Name: dreamcards_usergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_usergroup_id_seq', 1, false);


--
-- Data for Name: dreamcards_usergroup_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcards_usergroup_users (id, usergroup_id, user_id) FROM stdin;
\.


--
-- Name: dreamcards_usergroup_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcards_usergroup_users_id_seq', 1, false);


--
-- Data for Name: dreamcommunication_message; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamcommunication_message (id, body, "timestamp", context_type, context_id, uuid, sender_id, extra_data) FROM stdin;
\.


--
-- Name: dreamcommunication_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamcommunication_message_id_seq', 1, false);


--
-- Data for Name: dreamdevices_apisession; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdevices_apisession (id, token, user_id) FROM stdin;
\.


--
-- Name: dreamdevices_apisession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdevices_apisession_id_seq', 1, false);


--
-- Data for Name: dreamdevices_device; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdevices_device (id, iid, owner_id) FROM stdin;
\.


--
-- Name: dreamdevices_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdevices_device_id_seq', 1, false);


--
-- Data for Name: dreamdevices_device_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdevices_device_users (id, device_id, user_id) FROM stdin;
\.


--
-- Name: dreamdevices_device_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdevices_device_users_id_seq', 1, false);


--
-- Data for Name: dreamdiary_color; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_color (id, color, title, owner_id) FROM stdin;
\.


--
-- Name: dreamdiary_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_color_id_seq', 1, false);


--
-- Data for Name: dreamdiary_content; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_content (id, is_archived, uuid, title, description, created, last_modified, "order", public, answer_timestamp, is_ready, answer_to_id, color_id, network_id, owner_id) FROM stdin;
\.


--
-- Name: dreamdiary_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_content_id_seq', 1, false);


--
-- Data for Name: dreamdiary_content_participants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_content_participants (id, content_id, user_id) FROM stdin;
\.


--
-- Name: dreamdiary_content_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_content_participants_id_seq', 1, false);


--
-- Data for Name: dreamdiary_contentaccess; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_contentaccess (id, read, edit, content_id, user_id) FROM stdin;
\.


--
-- Name: dreamdiary_contentaccess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_contentaccess_id_seq', 1, false);


--
-- Data for Name: dreamdiary_contentattachment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_contentattachment (id, url, type, title, description, thumbnail, image, embed_html, document_id, content_id, owner_id) FROM stdin;
\.


--
-- Name: dreamdiary_contentattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_contentattachment_id_seq', 1, false);


--
-- Data for Name: dreamdiary_contentnote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_contentnote (id, html, created, last_modified, content_id, owner_id) FROM stdin;
\.


--
-- Name: dreamdiary_contentnote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_contentnote_id_seq', 1, false);


--
-- Data for Name: dreamdiary_contenttool; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_contenttool (id, url, tool_type, content_id) FROM stdin;
\.


--
-- Name: dreamdiary_contenttool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_contenttool_id_seq', 1, false);


--
-- Data for Name: dreamdiary_course; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_course (id, is_archived, uuid, title, created, last_modified, main_image, main_image_crop_scale, main_image_focal_point_x, main_image_focal_point_y, "order", organisation_id, owner_id) FROM stdin;
\.


--
-- Name: dreamdiary_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_course_id_seq', 1, false);


--
-- Data for Name: dreamdiary_course_participants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_course_participants (id, course_id, user_id) FROM stdin;
\.


--
-- Name: dreamdiary_course_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_course_participants_id_seq', 1, false);


--
-- Data for Name: dreamdiary_course_usergroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_course_usergroups (id, course_id, usergroup_id) FROM stdin;
\.


--
-- Name: dreamdiary_course_usergroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_course_usergroups_id_seq', 1, false);


--
-- Data for Name: dreamdiary_diary; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_diary (id) FROM stdin;
\.


--
-- Name: dreamdiary_diary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_diary_id_seq', 1, false);


--
-- Data for Name: dreamdiary_network; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_network (id, is_archived, uuid, title, description, created, last_modified, deadline, main_image, main_image_crop_scale, main_image_focal_point_x, main_image_focal_point_y, start_date, end_date, "order", course_order, hierarchy, color_id, course_id, organisation_id, owner_id, autoaccess) FROM stdin;
\.


--
-- Name: dreamdiary_network_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_network_id_seq', 1, false);


--
-- Data for Name: dreamdiary_network_participants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_network_participants (id, network_id, user_id) FROM stdin;
\.


--
-- Name: dreamdiary_network_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_network_participants_id_seq', 1, false);


--
-- Data for Name: dreamdiary_network_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_network_tags (id, network_id, tag_id) FROM stdin;
\.


--
-- Name: dreamdiary_network_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_network_tags_id_seq', 1, false);


--
-- Data for Name: dreamdiary_network_usergroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_network_usergroups (id, network_id, usergroup_id) FROM stdin;
\.


--
-- Name: dreamdiary_network_usergroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_network_usergroups_id_seq', 1, false);


--
-- Data for Name: dreamdiary_networkaccess; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_networkaccess (id, read, add_content, share_content, edit, moderate, network_id, user_id) FROM stdin;
\.


--
-- Name: dreamdiary_networkaccess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_networkaccess_id_seq', 1, false);


--
-- Data for Name: dreamdiary_referencecontent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_referencecontent (content_ptr_id, reference_to_id) FROM stdin;
\.


--
-- Data for Name: dreamdiary_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_tag (id, name) FROM stdin;
\.


--
-- Name: dreamdiary_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_tag_id_seq', 1, false);


--
-- Data for Name: dreamdiary_task; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_task (content_ptr_id) FROM stdin;
\.


--
-- Data for Name: dreamdiary_usercourse; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_usercourse (id, "order", course_id, user_id) FROM stdin;
\.


--
-- Name: dreamdiary_usercourse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_usercourse_id_seq', 1, false);


--
-- Data for Name: dreamdiary_usergroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_usergroup (id, title) FROM stdin;
\.


--
-- Name: dreamdiary_usergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_usergroup_id_seq', 1, false);


--
-- Data for Name: dreamdiary_usernetwork; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_usernetwork (id, "order", network_id, user_id) FROM stdin;
\.


--
-- Name: dreamdiary_usernetwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamdiary_usernetwork_id_seq', 1, false);


--
-- Data for Name: dreamdiary_work; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamdiary_work (content_ptr_id) FROM stdin;
\.


--
-- Data for Name: dreamevents_event; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamevents_event (id, "timestamp", sender_type, sender_id, name, context_type, context_id, target_type, target_id) FROM stdin;
\.


--
-- Name: dreamevents_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamevents_event_id_seq', 1, false);


--
-- Data for Name: dreameventstimeline_timelineevent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreameventstimeline_timelineevent (id, "timestamp", sender_type, sender_id, name, context_type, context_id, target_type, target_id, timeline_type, timeline_id, origin_event_id, extra_data) FROM stdin;
\.


--
-- Name: dreameventstimeline_timelineevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreameventstimeline_timelineevent_id_seq', 1, false);


--
-- Data for Name: dreaminvites_invitetoken; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreaminvites_invitetoken (id, token, should_create_user, active_network_id, organisation_id, owner_id) FROM stdin;
\.


--
-- Data for Name: dreaminvites_invitetoken_courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreaminvites_invitetoken_courses (id, invitetoken_id, course_id) FROM stdin;
\.


--
-- Name: dreaminvites_invitetoken_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreaminvites_invitetoken_courses_id_seq', 1, false);


--
-- Name: dreaminvites_invitetoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreaminvites_invitetoken_id_seq', 1, false);


--
-- Data for Name: dreaminvites_organisationsettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreaminvites_organisationsettings (id, app_store_url_ios, app_store_url_android, share_template_name, protocol_name, organisation_id) FROM stdin;
\.


--
-- Name: dreaminvites_organisationsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreaminvites_organisationsettings_id_seq', 1, false);


--
-- Data for Name: dreammarket_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammarket_category (id, title, color) FROM stdin;
\.


--
-- Name: dreammarket_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammarket_category_id_seq', 1, false);


--
-- Data for Name: dreammarket_domain; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammarket_domain (id, title, color) FROM stdin;
\.


--
-- Name: dreammarket_domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammarket_domain_id_seq', 1, false);


--
-- Data for Name: dreammarket_domain_organisations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammarket_domain_organisations (id, domain_id, organisation_id) FROM stdin;
\.


--
-- Name: dreammarket_domain_organisations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammarket_domain_organisations_id_seq', 1, false);


--
-- Data for Name: dreammarket_sellable; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammarket_sellable (id, title, description, sellable_type, price, currency, sku, is_published, is_shareable, learner_amount, dark_color, light_color, min_color, low_color, high_color, max_color, bg_image_url, market_image_url, market_image, market_thumbnail_url, market_thumbnail, subtitle, rating1_title, rating2_title, rating3_title, rating1_value, rating2_value, rating3_value, course_id, payment_type, decorative_image_url, lifecoin_amount) FROM stdin;
\.


--
-- Data for Name: dreammarket_sellable_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammarket_sellable_categories (id, sellable_id, category_id) FROM stdin;
\.


--
-- Name: dreammarket_sellable_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammarket_sellable_categories_id_seq', 1, false);


--
-- Data for Name: dreammarket_sellable_domains; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammarket_sellable_domains (id, sellable_id, domain_id) FROM stdin;
\.


--
-- Name: dreammarket_sellable_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammarket_sellable_domains_id_seq', 1, false);


--
-- Name: dreammarket_sellable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammarket_sellable_id_seq', 1, false);


--
-- Data for Name: dreammarket_sellable_starred_by; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammarket_sellable_starred_by (id, sellable_id, user_id) FROM stdin;
\.


--
-- Name: dreammarket_sellable_starred_by_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammarket_sellable_starred_by_id_seq', 1, false);


--
-- Data for Name: dreammarket_sellablecontent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammarket_sellablecontent (id, content_id, sellable_id) FROM stdin;
\.


--
-- Name: dreammarket_sellablecontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammarket_sellablecontent_id_seq', 1, false);


--
-- Data for Name: dreammessaging_message; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammessaging_message (id, "timestamp", msg_id, msg_uuid, metadata, body, html, thread_last_updated_timestamp, from_user_id, parent_id, room_id) FROM stdin;
\.


--
-- Name: dreammessaging_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammessaging_message_id_seq', 1, false);


--
-- Data for Name: dreammessaging_message_to_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammessaging_message_to_user (id, message_id, user_id) FROM stdin;
\.


--
-- Name: dreammessaging_message_to_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammessaging_message_to_user_id_seq', 1, false);


--
-- Data for Name: dreammessaging_room; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammessaging_room (id, name, jid, active, public, roster_managed, roster_managed_by_system, group_id, organisation_id, role_id) FROM stdin;
\.


--
-- Name: dreammessaging_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammessaging_room_id_seq', 1, false);


--
-- Data for Name: dreammessaging_room_roster; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammessaging_room_roster (id, room_id, user_id) FROM stdin;
\.


--
-- Name: dreammessaging_room_roster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammessaging_room_roster_id_seq', 1, false);


--
-- Data for Name: dreammessaging_room_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammessaging_room_topics (id, room_id, topic_id) FROM stdin;
\.


--
-- Name: dreammessaging_room_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammessaging_room_topics_id_seq', 1, false);


--
-- Data for Name: dreammessaging_topic; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammessaging_topic (id, name, public, active, organisation_id) FROM stdin;
\.


--
-- Name: dreammessaging_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammessaging_topic_id_seq', 1, false);


--
-- Data for Name: dreammindmup_mindmupcontent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreammindmup_mindmupcontent (id, data, content_id) FROM stdin;
\.


--
-- Name: dreammindmup_mindmupcontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreammindmup_mindmupcontent_id_seq', 1, false);


--
-- Data for Name: dreampayments_order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreampayments_order (id, created, modified, payment_backend, uuid, amount_due, amount_paid, status, status_code, message, external_id, external_type, sellable_id, user_id, currency) FROM stdin;
\.


--
-- Name: dreampayments_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreampayments_order_id_seq', 1, false);


--
-- Data for Name: dreamsms_onetimetoken; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamsms_onetimetoken (id, "timestamp", code, used, user_id, phone_number, active) FROM stdin;
\.


--
-- Name: dreamsms_onetimetoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamsms_onetimetoken_id_seq', 1, false);


--
-- Data for Name: dreamsms_smsmessage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamsms_smsmessage (id, "timestamp", to_number, from_number, external_id, body, status, error_code, error_message, token_id) FROM stdin;
\.


--
-- Name: dreamsms_smsmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamsms_smsmessage_id_seq', 1, false);


--
-- Data for Name: dreamsocialqa_answer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamsocialqa_answer (id, "order", created, modified, text, question_id, user_id) FROM stdin;
\.


--
-- Name: dreamsocialqa_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamsocialqa_answer_id_seq', 1, false);


--
-- Data for Name: dreamsocialqa_answerrating; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamsocialqa_answerrating (id, created, modified, answer_id, user_id) FROM stdin;
\.


--
-- Name: dreamsocialqa_answerrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamsocialqa_answerrating_id_seq', 1, false);


--
-- Data for Name: dreamsocialqa_contentconsumption; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamsocialqa_contentconsumption (id, created, modified, is_consumed, content_id, user_id) FROM stdin;
\.


--
-- Name: dreamsocialqa_contentconsumption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamsocialqa_contentconsumption_id_seq', 1, false);


--
-- Data for Name: dreamsocialqa_networkconsumption; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamsocialqa_networkconsumption (id, created, modified, is_consumed, network_id, user_id) FROM stdin;
\.


--
-- Name: dreamsocialqa_networkconsumption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamsocialqa_networkconsumption_id_seq', 1, false);


--
-- Data for Name: dreamsocialqa_networkfeedback; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamsocialqa_networkfeedback (id, created, modified, key, value, network_id, user_id) FROM stdin;
\.


--
-- Name: dreamsocialqa_networkfeedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamsocialqa_networkfeedback_id_seq', 1, false);


--
-- Data for Name: dreamsocialqa_question; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamsocialqa_question (id, created, modified, text, urgency, network_id, user_id, image) FROM stdin;
\.


--
-- Name: dreamsocialqa_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamsocialqa_question_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_authprovider; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_authprovider (id, organisation_id) FROM stdin;
\.


--
-- Name: dreamuserdb_authprovider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_authprovider_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_googleuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_googleuser (id, username, organisation_id, user_id) FROM stdin;
\.


--
-- Name: dreamuserdb_googleuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_googleuser_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_group (id, created, modified, name, title, source, official, filter_type, lft, rght, tree_id, level, organisation_id, parent_id) FROM stdin;
\.


--
-- Name: dreamuserdb_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_group_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_organisation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_organisation (id, created, modified, name, title, registration_allowed, source, override_username_cleanup, default_service_id) FROM stdin;
\.


--
-- Name: dreamuserdb_organisation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_organisation_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_organisation_owners; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_organisation_owners (id, organisation_id, user_id) FROM stdin;
\.


--
-- Name: dreamuserdb_organisation_owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_organisation_owners_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_role (id, created, modified, name, title, source, official, organisation_id) FROM stdin;
\.


--
-- Name: dreamuserdb_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_role_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_role_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_role_permissions (id, role_id, servicepermission_id) FROM stdin;
\.


--
-- Name: dreamuserdb_role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_role_permissions_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_service; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_service (id, created, modified, name, title, public, entity_id, url, user_id) FROM stdin;
1	2018-08-02 19:56:52.124348+00	2018-08-02 19:56:52.124371+00	app	App	t	https://app.lifelearnplatform.com/saml/metadata/	https://app.lifelearnplatform.com/	\N
2	2018-08-02 19:57:32.08456+00	2018-08-02 19:57:32.084579+00	gql	Gql	t	https://gql.lifelearnplatform.com	https://gql.lifelearnplatform.com	\N
3	2018-08-02 19:58:06.466459+00	2018-08-02 19:58:06.466479+00	vuo1.lifelearningplatform.com	vuo1.lifelearningplatform.com	t	https://vuo1.lifelearnplatform.com/saml/metadata		\N
\.


--
-- Name: dreamuserdb_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_service_id_seq', 3, true);


--
-- Data for Name: dreamuserdb_service_organisations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_service_organisations (id, service_id, organisation_id) FROM stdin;
\.


--
-- Name: dreamuserdb_service_organisations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_service_organisations_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_servicepermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_servicepermission (id, created, modified, name, entity, action, service_id) FROM stdin;
\.


--
-- Name: dreamuserdb_servicepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_servicepermission_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_user (user_ptr_id, created, modified, phone_number, personal_identity_code_hash, theme_color, picture_url, profile_picture, password_md5, locale, override_username_cleanup, source, official, password_reset_email, external_id, active_organisation_id, default_service_id) FROM stdin;
1	2018-08-02 17:11:04.100297+00	2018-08-02 17:11:04.105572+00		\N	ffffff	\N		\N	\N	f		f	\N	\N	\N	\N
\.


--
-- Data for Name: dreamuserdb_user_organisations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_user_organisations (id, user_id, organisation_id) FROM stdin;
\.


--
-- Name: dreamuserdb_user_organisations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_user_organisations_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_user_roles (id, user_id, role_id) FROM stdin;
\.


--
-- Name: dreamuserdb_user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_user_roles_id_seq', 1, false);


--
-- Data for Name: dreamuserdb_user_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamuserdb_user_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: dreamuserdb_user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamuserdb_user_user_groups_id_seq', 1, false);


--
-- Data for Name: dreamvuolearning_vuoauthtoken; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamvuolearning_vuoauthtoken (id, token, refreshed_at, user_id) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiIxIiwiZW1haWwiOiIxQHZ1b2xlYXJuaW5nbGlmZWxlYXJudXNlci5maSIsImlzQWRtaW4iOmZhbHNlLCJpc1N1cGVyQWRtaW4iOmZhbHNlLCJpYXQiOjE1MzMyMzk5MTB9.scW0izI-e9hSv7DMWcAk2ZmIICtd2infKJPOn_7uRTg	2018-08-02 19:58:30.037738+00	1
\.


--
-- Name: dreamvuolearning_vuoauthtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamvuolearning_vuoauthtoken_id_seq', 1, true);


--
-- Data for Name: dreamvuolearning_vuodocumentcontent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamvuolearning_vuodocumentcontent (id, document_id, revision_id, content_id) FROM stdin;
\.


--
-- Name: dreamvuolearning_vuodocumentcontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamvuolearning_vuodocumentcontent_id_seq', 1, false);


--
-- Data for Name: dreamyle_ylecontent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dreamyle_ylecontent (id, data, data_type, data_id, url, image_url, expiration_date, content_id) FROM stdin;
\.


--
-- Name: dreamyle_ylecontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dreamyle_ylecontent_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.easy_thumbnails_source_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.easy_thumbnails_thumbnail_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.guardian_groupobjectpermission_id_seq', 1, false);


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
\.


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.guardian_userobjectpermission_id_seq', 1, false);


--
-- Data for Name: health_check_db_testmodel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.health_check_db_testmodel (id, title) FROM stdin;
\.


--
-- Name: health_check_db_testmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.health_check_db_testmodel_id_seq', 1, false);


--
-- Data for Name: lifelearn_agpaiiregistrationform; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearn_agpaiiregistrationform (id, name, email, province, district, sub_district, education_kindergarten, education_primary_school, education_secondary_school, education_high_school, created_timestamp, email_verified, email_verified_timestamp, email_verification_sent, user_id, category, education_supervisor) FROM stdin;
\.


--
-- Name: lifelearn_agpaiiregistrationform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearn_agpaiiregistrationform_id_seq', 1, false);


--
-- Data for Name: lifelearn_filecontent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearn_filecontent (id, uploaded_file, "timestamp", content_id, owner_id) FROM stdin;
\.


--
-- Name: lifelearn_filecontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearn_filecontent_id_seq', 1, false);


--
-- Data for Name: lifelearn_usercoursebadge; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearn_usercoursebadge (id, url, course_id) FROM stdin;
\.


--
-- Name: lifelearn_usercoursebadge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearn_usercoursebadge_id_seq', 1, false);


--
-- Data for Name: lifelearn_usercoursebadge_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearn_usercoursebadge_users (id, usercoursebadge_id, user_id) FROM stdin;
\.


--
-- Name: lifelearn_usercoursebadge_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearn_usercoursebadge_users_id_seq', 1, false);


--
-- Data for Name: lifelearn_userprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearn_userprofile (id, bio, user_id) FROM stdin;
\.


--
-- Name: lifelearn_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearn_userprofile_id_seq', 1, false);


--
-- Data for Name: lifelearncoins_lifecointransaction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearncoins_lifecointransaction (id, created_at, modified_at, difference, is_applied, applied_at, reference_type, reference_id, wallet_id) FROM stdin;
\.


--
-- Name: lifelearncoins_lifecointransaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearncoins_lifecointransaction_id_seq', 1, false);


--
-- Data for Name: lifelearncoins_lifecoinwallet; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearncoins_lifecoinwallet (id, created_at, modified_at, value, user_id) FROM stdin;
\.


--
-- Name: lifelearncoins_lifecoinwallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearncoins_lifecoinwallet_id_seq', 1, false);


--
-- Data for Name: lifelearnpushnotifications_eventcreatednotification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearnpushnotifications_eventcreatednotification (id, is_sent, created, sent, attempts, event_id) FROM stdin;
\.


--
-- Name: lifelearnpushnotifications_eventcreatednotification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearnpushnotifications_eventcreatednotification_id_seq', 1, false);


--
-- Name: lifelearnpushnotifications_timelineeventcreatednotificat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearnpushnotifications_timelineeventcreatednotificat_id_seq', 1, false);


--
-- Data for Name: lifelearnpushnotifications_timelineeventcreatednotification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearnpushnotifications_timelineeventcreatednotification (id, is_sent, created, sent, attempts, event_id) FROM stdin;
\.


--
-- Data for Name: lifelearnskills_point; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearnskills_point (id, value, "timestamp", course_id, event_id, skill_id, user_id) FROM stdin;
\.


--
-- Name: lifelearnskills_point_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearnskills_point_id_seq', 1, false);


--
-- Data for Name: lifelearnskills_skill; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearnskills_skill (id, title, organisation_id) FROM stdin;
\.


--
-- Data for Name: lifelearnskills_skill_courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lifelearnskills_skill_courses (id, skill_id, course_id) FROM stdin;
\.


--
-- Name: lifelearnskills_skill_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearnskills_skill_courses_id_seq', 1, false);


--
-- Name: lifelearnskills_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifelearnskills_skill_id_seq', 1, false);


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.social_auth_code (id, email, code, verified) FROM stdin;
\.


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: celery_taskmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta_task_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_task_id_key UNIQUE (task_id);


--
-- Name: celery_tasksetmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_tasksetmeta_taskset_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_taskset_id_key UNIQUE (taskset_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djcelery_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.djcelery_crontabschedule
    ADD CONSTRAINT djcelery_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.djcelery_intervalschedule
    ADD CONSTRAINT djcelery_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_name_key UNIQUE (name);


--
-- Name: djcelery_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.djcelery_periodictasks
    ADD CONSTRAINT djcelery_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: djcelery_taskstate_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_pkey PRIMARY KEY (id);


--
-- Name: djcelery_taskstate_task_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_task_id_key UNIQUE (task_id);


--
-- Name: djcelery_workerstate_hostname_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_hostname_key UNIQUE (hostname);


--
-- Name: djcelery_workerstate_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_card_groups_card_id_f7f3cacc_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_card_groups
    ADD CONSTRAINT dreamcards_card_groups_card_id_f7f3cacc_uniq UNIQUE (card_id, group_id);


--
-- Name: dreamcards_card_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_card_groups
    ADD CONSTRAINT dreamcards_card_groups_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_card_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_card
    ADD CONSTRAINT dreamcards_card_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_card_users_card_id_2df42067_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_card_users
    ADD CONSTRAINT dreamcards_card_users_card_id_2df42067_uniq UNIQUE (card_id, user_id);


--
-- Name: dreamcards_card_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_card_users
    ADD CONSTRAINT dreamcards_card_users_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_cardpageassociation_page_id_bc9d313a_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_cardpageassociation
    ADD CONSTRAINT dreamcards_cardpageassociation_page_id_bc9d313a_uniq UNIQUE (page_id, card_id);


--
-- Name: dreamcards_cardpageassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_cardpageassociation
    ADD CONSTRAINT dreamcards_cardpageassociation_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_category
    ADD CONSTRAINT dreamcards_category_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_desktopuserprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_desktopuserprofile
    ADD CONSTRAINT dreamcards_desktopuserprofile_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_desktopuserprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_desktopuserprofile
    ADD CONSTRAINT dreamcards_desktopuserprofile_user_id_key UNIQUE (user_id);


--
-- Name: dreamcards_dreamcards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_dreamcards
    ADD CONSTRAINT dreamcards_dreamcards_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_page_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_page
    ADD CONSTRAINT dreamcards_page_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_usergroup
    ADD CONSTRAINT dreamcards_usergroup_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_usergroup_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_usergroup_users
    ADD CONSTRAINT dreamcards_usergroup_users_pkey PRIMARY KEY (id);


--
-- Name: dreamcards_usergroup_users_usergroup_id_1d556f5c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcards_usergroup_users
    ADD CONSTRAINT dreamcards_usergroup_users_usergroup_id_1d556f5c_uniq UNIQUE (usergroup_id, user_id);


--
-- Name: dreamcommunication_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamcommunication_message
    ADD CONSTRAINT dreamcommunication_message_pkey PRIMARY KEY (id);


--
-- Name: dreamdevices_apisession_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdevices_apisession
    ADD CONSTRAINT dreamdevices_apisession_pkey PRIMARY KEY (id);


--
-- Name: dreamdevices_apisession_token_e9939f23_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdevices_apisession
    ADD CONSTRAINT dreamdevices_apisession_token_e9939f23_uniq UNIQUE (token, user_id);


--
-- Name: dreamdevices_device_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdevices_device
    ADD CONSTRAINT dreamdevices_device_pkey PRIMARY KEY (id);


--
-- Name: dreamdevices_device_users_device_id_fa869e81_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdevices_device_users
    ADD CONSTRAINT dreamdevices_device_users_device_id_fa869e81_uniq UNIQUE (device_id, user_id);


--
-- Name: dreamdevices_device_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdevices_device_users
    ADD CONSTRAINT dreamdevices_device_users_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_color_color_0bfa2a01_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_color
    ADD CONSTRAINT dreamdiary_color_color_0bfa2a01_uniq UNIQUE (color, owner_id);


--
-- Name: dreamdiary_color_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_color
    ADD CONSTRAINT dreamdiary_color_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_content_participants_content_id_5a2720db_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_content_participants
    ADD CONSTRAINT dreamdiary_content_participants_content_id_5a2720db_uniq UNIQUE (content_id, user_id);


--
-- Name: dreamdiary_content_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_content_participants
    ADD CONSTRAINT dreamdiary_content_participants_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_content_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_content
    ADD CONSTRAINT dreamdiary_content_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_contentaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_contentaccess
    ADD CONSTRAINT dreamdiary_contentaccess_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_contentaccess_user_id_2b3fa0a9_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_contentaccess
    ADD CONSTRAINT dreamdiary_contentaccess_user_id_2b3fa0a9_uniq UNIQUE (user_id, content_id);


--
-- Name: dreamdiary_contentattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_contentattachment
    ADD CONSTRAINT dreamdiary_contentattachment_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_contentnote_owner_id_ca4a0ec9_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_contentnote
    ADD CONSTRAINT dreamdiary_contentnote_owner_id_ca4a0ec9_uniq UNIQUE (owner_id, content_id);


--
-- Name: dreamdiary_contentnote_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_contentnote
    ADD CONSTRAINT dreamdiary_contentnote_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_contenttool_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_contenttool
    ADD CONSTRAINT dreamdiary_contenttool_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_course_participants_course_id_ecb0d1ca_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_course_participants
    ADD CONSTRAINT dreamdiary_course_participants_course_id_ecb0d1ca_uniq UNIQUE (course_id, user_id);


--
-- Name: dreamdiary_course_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_course_participants
    ADD CONSTRAINT dreamdiary_course_participants_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_course_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_course
    ADD CONSTRAINT dreamdiary_course_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_course_usergroups_course_id_52c68728_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_course_usergroups
    ADD CONSTRAINT dreamdiary_course_usergroups_course_id_52c68728_uniq UNIQUE (course_id, usergroup_id);


--
-- Name: dreamdiary_course_usergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_course_usergroups
    ADD CONSTRAINT dreamdiary_course_usergroups_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_diary_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_diary
    ADD CONSTRAINT dreamdiary_diary_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_network_order_47b2eea2_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_network
    ADD CONSTRAINT dreamdiary_network_order_47b2eea2_uniq UNIQUE ("order", owner_id);


--
-- Name: dreamdiary_network_participants_network_id_2e20355e_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_network_participants
    ADD CONSTRAINT dreamdiary_network_participants_network_id_2e20355e_uniq UNIQUE (network_id, user_id);


--
-- Name: dreamdiary_network_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_network_participants
    ADD CONSTRAINT dreamdiary_network_participants_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_network_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_network
    ADD CONSTRAINT dreamdiary_network_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_network_tags_network_id_836fe7ea_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_network_tags
    ADD CONSTRAINT dreamdiary_network_tags_network_id_836fe7ea_uniq UNIQUE (network_id, tag_id);


--
-- Name: dreamdiary_network_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_network_tags
    ADD CONSTRAINT dreamdiary_network_tags_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_network_usergroups_network_id_c36e02ea_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_network_usergroups
    ADD CONSTRAINT dreamdiary_network_usergroups_network_id_c36e02ea_uniq UNIQUE (network_id, usergroup_id);


--
-- Name: dreamdiary_network_usergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_network_usergroups
    ADD CONSTRAINT dreamdiary_network_usergroups_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_networkaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_networkaccess
    ADD CONSTRAINT dreamdiary_networkaccess_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_networkaccess_user_id_3876ad72_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_networkaccess
    ADD CONSTRAINT dreamdiary_networkaccess_user_id_3876ad72_uniq UNIQUE (user_id, network_id);


--
-- Name: dreamdiary_referencecontent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_referencecontent
    ADD CONSTRAINT dreamdiary_referencecontent_pkey PRIMARY KEY (content_ptr_id);


--
-- Name: dreamdiary_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_tag
    ADD CONSTRAINT dreamdiary_tag_name_key UNIQUE (name);


--
-- Name: dreamdiary_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_tag
    ADD CONSTRAINT dreamdiary_tag_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_task_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_task
    ADD CONSTRAINT dreamdiary_task_pkey PRIMARY KEY (content_ptr_id);


--
-- Name: dreamdiary_usercourse_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_usercourse
    ADD CONSTRAINT dreamdiary_usercourse_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_usercourse_user_id_a125874f_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_usercourse
    ADD CONSTRAINT dreamdiary_usercourse_user_id_a125874f_uniq UNIQUE (user_id, course_id);


--
-- Name: dreamdiary_usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_usergroup
    ADD CONSTRAINT dreamdiary_usergroup_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_usernetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_usernetwork
    ADD CONSTRAINT dreamdiary_usernetwork_pkey PRIMARY KEY (id);


--
-- Name: dreamdiary_usernetwork_user_id_83a93af4_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_usernetwork
    ADD CONSTRAINT dreamdiary_usernetwork_user_id_83a93af4_uniq UNIQUE (user_id, network_id);


--
-- Name: dreamdiary_work_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamdiary_work
    ADD CONSTRAINT dreamdiary_work_pkey PRIMARY KEY (content_ptr_id);


--
-- Name: dreamevents_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamevents_event
    ADD CONSTRAINT dreamevents_event_pkey PRIMARY KEY (id);


--
-- Name: dreameventstimeline_timelineevent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreameventstimeline_timelineevent
    ADD CONSTRAINT dreameventstimeline_timelineevent_pkey PRIMARY KEY (id);


--
-- Name: dreaminvites_invitetoken_courses_invitetoken_id_f1aa4123_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreaminvites_invitetoken_courses
    ADD CONSTRAINT dreaminvites_invitetoken_courses_invitetoken_id_f1aa4123_uniq UNIQUE (invitetoken_id, course_id);


--
-- Name: dreaminvites_invitetoken_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreaminvites_invitetoken_courses
    ADD CONSTRAINT dreaminvites_invitetoken_courses_pkey PRIMARY KEY (id);


--
-- Name: dreaminvites_invitetoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreaminvites_invitetoken
    ADD CONSTRAINT dreaminvites_invitetoken_pkey PRIMARY KEY (id);


--
-- Name: dreaminvites_organisationsettings_organisation_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreaminvites_organisationsettings
    ADD CONSTRAINT dreaminvites_organisationsettings_organisation_id_key UNIQUE (organisation_id);


--
-- Name: dreaminvites_organisationsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreaminvites_organisationsettings
    ADD CONSTRAINT dreaminvites_organisationsettings_pkey PRIMARY KEY (id);


--
-- Name: dreammarket_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_category
    ADD CONSTRAINT dreammarket_category_pkey PRIMARY KEY (id);


--
-- Name: dreammarket_domain_organisations_domain_id_2534c905_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_domain_organisations
    ADD CONSTRAINT dreammarket_domain_organisations_domain_id_2534c905_uniq UNIQUE (domain_id, organisation_id);


--
-- Name: dreammarket_domain_organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_domain_organisations
    ADD CONSTRAINT dreammarket_domain_organisations_pkey PRIMARY KEY (id);


--
-- Name: dreammarket_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_domain
    ADD CONSTRAINT dreammarket_domain_pkey PRIMARY KEY (id);


--
-- Name: dreammarket_sellable_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellable_categories
    ADD CONSTRAINT dreammarket_sellable_categories_pkey PRIMARY KEY (id);


--
-- Name: dreammarket_sellable_categories_sellable_id_750ab42f_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellable_categories
    ADD CONSTRAINT dreammarket_sellable_categories_sellable_id_750ab42f_uniq UNIQUE (sellable_id, category_id);


--
-- Name: dreammarket_sellable_course_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellable
    ADD CONSTRAINT dreammarket_sellable_course_id_key UNIQUE (course_id);


--
-- Name: dreammarket_sellable_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellable_domains
    ADD CONSTRAINT dreammarket_sellable_domains_pkey PRIMARY KEY (id);


--
-- Name: dreammarket_sellable_domains_sellable_id_0683a86c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellable_domains
    ADD CONSTRAINT dreammarket_sellable_domains_sellable_id_0683a86c_uniq UNIQUE (sellable_id, domain_id);


--
-- Name: dreammarket_sellable_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellable
    ADD CONSTRAINT dreammarket_sellable_pkey PRIMARY KEY (id);


--
-- Name: dreammarket_sellable_starred_by_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellable_starred_by
    ADD CONSTRAINT dreammarket_sellable_starred_by_pkey PRIMARY KEY (id);


--
-- Name: dreammarket_sellable_starred_by_sellable_id_55091318_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellable_starred_by
    ADD CONSTRAINT dreammarket_sellable_starred_by_sellable_id_55091318_uniq UNIQUE (sellable_id, user_id);


--
-- Name: dreammarket_sellablecontent_content_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellablecontent
    ADD CONSTRAINT dreammarket_sellablecontent_content_id_key UNIQUE (content_id);


--
-- Name: dreammarket_sellablecontent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammarket_sellablecontent
    ADD CONSTRAINT dreammarket_sellablecontent_pkey PRIMARY KEY (id);


--
-- Name: dreammessaging_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammessaging_message
    ADD CONSTRAINT dreammessaging_message_pkey PRIMARY KEY (id);


--
-- Name: dreammessaging_message_to_user_message_id_b12b191d_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammessaging_message_to_user
    ADD CONSTRAINT dreammessaging_message_to_user_message_id_b12b191d_uniq UNIQUE (message_id, user_id);


--
-- Name: dreammessaging_message_to_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammessaging_message_to_user
    ADD CONSTRAINT dreammessaging_message_to_user_pkey PRIMARY KEY (id);


--
-- Name: dreammessaging_room_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammessaging_room
    ADD CONSTRAINT dreammessaging_room_pkey PRIMARY KEY (id);


--
-- Name: dreammessaging_room_roster_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammessaging_room_roster
    ADD CONSTRAINT dreammessaging_room_roster_pkey PRIMARY KEY (id);


--
-- Name: dreammessaging_room_roster_room_id_804ec6f3_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammessaging_room_roster
    ADD CONSTRAINT dreammessaging_room_roster_room_id_804ec6f3_uniq UNIQUE (room_id, user_id);


--
-- Name: dreammessaging_room_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammessaging_room_topics
    ADD CONSTRAINT dreammessaging_room_topics_pkey PRIMARY KEY (id);


--
-- Name: dreammessaging_room_topics_room_id_19ec76c9_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammessaging_room_topics
    ADD CONSTRAINT dreammessaging_room_topics_room_id_19ec76c9_uniq UNIQUE (room_id, topic_id);


--
-- Name: dreammessaging_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammessaging_topic
    ADD CONSTRAINT dreammessaging_topic_pkey PRIMARY KEY (id);


--
-- Name: dreammindmup_mindmupcontent_content_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammindmup_mindmupcontent
    ADD CONSTRAINT dreammindmup_mindmupcontent_content_id_key UNIQUE (content_id);


--
-- Name: dreammindmup_mindmupcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreammindmup_mindmupcontent
    ADD CONSTRAINT dreammindmup_mindmupcontent_pkey PRIMARY KEY (id);


--
-- Name: dreampayments_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreampayments_order
    ADD CONSTRAINT dreampayments_order_pkey PRIMARY KEY (id);


--
-- Name: dreamsms_onetimetoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamsms_onetimetoken
    ADD CONSTRAINT dreamsms_onetimetoken_pkey PRIMARY KEY (id);


--
-- Name: dreamsms_smsmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamsms_smsmessage
    ADD CONSTRAINT dreamsms_smsmessage_pkey PRIMARY KEY (id);


--
-- Name: dreamsocialqa_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamsocialqa_answer
    ADD CONSTRAINT dreamsocialqa_answer_pkey PRIMARY KEY (id);


--
-- Name: dreamsocialqa_answerrating_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamsocialqa_answerrating
    ADD CONSTRAINT dreamsocialqa_answerrating_pkey PRIMARY KEY (id);


--
-- Name: dreamsocialqa_contentconsumption_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamsocialqa_contentconsumption
    ADD CONSTRAINT dreamsocialqa_contentconsumption_pkey PRIMARY KEY (id);


--
-- Name: dreamsocialqa_networkconsumption_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamsocialqa_networkconsumption
    ADD CONSTRAINT dreamsocialqa_networkconsumption_pkey PRIMARY KEY (id);


--
-- Name: dreamsocialqa_networkfeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamsocialqa_networkfeedback
    ADD CONSTRAINT dreamsocialqa_networkfeedback_pkey PRIMARY KEY (id);


--
-- Name: dreamsocialqa_question_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamsocialqa_question
    ADD CONSTRAINT dreamsocialqa_question_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_authprovider_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_authprovider
    ADD CONSTRAINT dreamuserdb_authprovider_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_googleuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_googleuser
    ADD CONSTRAINT dreamuserdb_googleuser_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_googleuser_username_cfb56f16_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_googleuser
    ADD CONSTRAINT dreamuserdb_googleuser_username_cfb56f16_uniq UNIQUE (username, organisation_id);


--
-- Name: dreamuserdb_group_name_bb3ca7f1_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_group
    ADD CONSTRAINT dreamuserdb_group_name_bb3ca7f1_uniq UNIQUE (name, organisation_id);


--
-- Name: dreamuserdb_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_group
    ADD CONSTRAINT dreamuserdb_group_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_organisation_owners_organisation_id_6f3ad98c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_organisation_owners
    ADD CONSTRAINT dreamuserdb_organisation_owners_organisation_id_6f3ad98c_uniq UNIQUE (organisation_id, user_id);


--
-- Name: dreamuserdb_organisation_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_organisation_owners
    ADD CONSTRAINT dreamuserdb_organisation_owners_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_organisation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_organisation
    ADD CONSTRAINT dreamuserdb_organisation_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_role_name_adedde6a_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_role
    ADD CONSTRAINT dreamuserdb_role_name_adedde6a_uniq UNIQUE (name, organisation_id);


--
-- Name: dreamuserdb_role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_role_permissions
    ADD CONSTRAINT dreamuserdb_role_permissions_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_role_permissions_role_id_46e0b29e_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_role_permissions
    ADD CONSTRAINT dreamuserdb_role_permissions_role_id_46e0b29e_uniq UNIQUE (role_id, servicepermission_id);


--
-- Name: dreamuserdb_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_role
    ADD CONSTRAINT dreamuserdb_role_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_service_entity_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_service
    ADD CONSTRAINT dreamuserdb_service_entity_id_key UNIQUE (entity_id);


--
-- Name: dreamuserdb_service_organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_service_organisations
    ADD CONSTRAINT dreamuserdb_service_organisations_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_service_organisations_service_id_d111fffb_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_service_organisations
    ADD CONSTRAINT dreamuserdb_service_organisations_service_id_d111fffb_uniq UNIQUE (service_id, organisation_id);


--
-- Name: dreamuserdb_service_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_service
    ADD CONSTRAINT dreamuserdb_service_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_servicepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_servicepermission
    ADD CONSTRAINT dreamuserdb_servicepermission_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_user_organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_user_organisations
    ADD CONSTRAINT dreamuserdb_user_organisations_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_user_organisations_user_id_ddf6f12d_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_user_organisations
    ADD CONSTRAINT dreamuserdb_user_organisations_user_id_ddf6f12d_uniq UNIQUE (user_id, organisation_id);


--
-- Name: dreamuserdb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_user
    ADD CONSTRAINT dreamuserdb_user_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: dreamuserdb_user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_user_roles
    ADD CONSTRAINT dreamuserdb_user_roles_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_user_roles_user_id_6e4c3003_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_user_roles
    ADD CONSTRAINT dreamuserdb_user_roles_user_id_6e4c3003_uniq UNIQUE (user_id, role_id);


--
-- Name: dreamuserdb_user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_user_user_groups
    ADD CONSTRAINT dreamuserdb_user_user_groups_pkey PRIMARY KEY (id);


--
-- Name: dreamuserdb_user_user_groups_user_id_952b85a4_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamuserdb_user_user_groups
    ADD CONSTRAINT dreamuserdb_user_user_groups_user_id_952b85a4_uniq UNIQUE (user_id, group_id);


--
-- Name: dreamvuolearning_vuoauthtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamvuolearning_vuoauthtoken
    ADD CONSTRAINT dreamvuolearning_vuoauthtoken_pkey PRIMARY KEY (id);


--
-- Name: dreamvuolearning_vuoauthtoken_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamvuolearning_vuoauthtoken
    ADD CONSTRAINT dreamvuolearning_vuoauthtoken_user_id_key UNIQUE (user_id);


--
-- Name: dreamvuolearning_vuodocumentcontent_content_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamvuolearning_vuodocumentcontent
    ADD CONSTRAINT dreamvuolearning_vuodocumentcontent_content_id_key UNIQUE (content_id);


--
-- Name: dreamvuolearning_vuodocumentcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamvuolearning_vuodocumentcontent
    ADD CONSTRAINT dreamvuolearning_vuodocumentcontent_pkey PRIMARY KEY (id);


--
-- Name: dreamyle_ylecontent_content_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamyle_ylecontent
    ADD CONSTRAINT dreamyle_ylecontent_content_id_key UNIQUE (content_id);


--
-- Name: dreamyle_ylecontent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.dreamyle_ylecontent
    ADD CONSTRAINT dreamyle_ylecontent_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: guardian_groupobjectpermission_group_id_3f189f7c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_group_id_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_user_id_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- Name: health_check_db_testmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.health_check_db_testmodel
    ADD CONSTRAINT health_check_db_testmodel_pkey PRIMARY KEY (id);


--
-- Name: lifelearn_agpaiiregistrationform_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearn_agpaiiregistrationform
    ADD CONSTRAINT lifelearn_agpaiiregistrationform_pkey PRIMARY KEY (id);


--
-- Name: lifelearn_filecontent_content_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearn_filecontent
    ADD CONSTRAINT lifelearn_filecontent_content_id_key UNIQUE (content_id);


--
-- Name: lifelearn_filecontent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearn_filecontent
    ADD CONSTRAINT lifelearn_filecontent_pkey PRIMARY KEY (id);


--
-- Name: lifelearn_usercoursebadge_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearn_usercoursebadge
    ADD CONSTRAINT lifelearn_usercoursebadge_pkey PRIMARY KEY (id);


--
-- Name: lifelearn_usercoursebadge_user_usercoursebadge_id_21ade1ed_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearn_usercoursebadge_users
    ADD CONSTRAINT lifelearn_usercoursebadge_user_usercoursebadge_id_21ade1ed_uniq UNIQUE (usercoursebadge_id, user_id);


--
-- Name: lifelearn_usercoursebadge_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearn_usercoursebadge_users
    ADD CONSTRAINT lifelearn_usercoursebadge_users_pkey PRIMARY KEY (id);


--
-- Name: lifelearn_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearn_userprofile
    ADD CONSTRAINT lifelearn_userprofile_pkey PRIMARY KEY (id);


--
-- Name: lifelearn_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearn_userprofile
    ADD CONSTRAINT lifelearn_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: lifelearncoins_lifecointransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearncoins_lifecointransaction
    ADD CONSTRAINT lifelearncoins_lifecointransaction_pkey PRIMARY KEY (id);


--
-- Name: lifelearncoins_lifecoinwallet_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearncoins_lifecoinwallet
    ADD CONSTRAINT lifelearncoins_lifecoinwallet_pkey PRIMARY KEY (id);


--
-- Name: lifelearnpushnotifications_eventcreatednotification_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearnpushnotifications_eventcreatednotification
    ADD CONSTRAINT lifelearnpushnotifications_eventcreatednotification_pkey PRIMARY KEY (id);


--
-- Name: lifelearnpushnotifications_timelineeventcreatednotificatio_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearnpushnotifications_timelineeventcreatednotification
    ADD CONSTRAINT lifelearnpushnotifications_timelineeventcreatednotificatio_pkey PRIMARY KEY (id);


--
-- Name: lifelearnskills_point_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearnskills_point
    ADD CONSTRAINT lifelearnskills_point_pkey PRIMARY KEY (id);


--
-- Name: lifelearnskills_skill_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearnskills_skill_courses
    ADD CONSTRAINT lifelearnskills_skill_courses_pkey PRIMARY KEY (id);


--
-- Name: lifelearnskills_skill_courses_skill_id_71cdcf0f_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearnskills_skill_courses
    ADD CONSTRAINT lifelearnskills_skill_courses_skill_id_71cdcf0f_uniq UNIQUE (skill_id, course_id);


--
-- Name: lifelearnskills_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.lifelearnskills_skill
    ADD CONSTRAINT lifelearnskills_skill_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_server_url_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code_email_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_server_url_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_provider_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: celery_taskmeta_662f707d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX celery_taskmeta_662f707d ON public.celery_taskmeta USING btree (hidden);


--
-- Name: celery_taskmeta_task_id_9558b198_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX celery_taskmeta_task_id_9558b198_like ON public.celery_taskmeta USING btree (task_id varchar_pattern_ops);


--
-- Name: celery_tasksetmeta_662f707d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX celery_tasksetmeta_662f707d ON public.celery_tasksetmeta USING btree (hidden);


--
-- Name: celery_tasksetmeta_taskset_id_a5a1d4ae_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX celery_tasksetmeta_taskset_id_a5a1d4ae_like ON public.celery_tasksetmeta USING btree (taskset_id varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: djcelery_periodictask_1dcd7040; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_periodictask_1dcd7040 ON public.djcelery_periodictask USING btree (interval_id);


--
-- Name: djcelery_periodictask_f3f0d72a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_periodictask_f3f0d72a ON public.djcelery_periodictask USING btree (crontab_id);


--
-- Name: djcelery_periodictask_name_cb62cda9_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_periodictask_name_cb62cda9_like ON public.djcelery_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_662f707d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_taskstate_662f707d ON public.djcelery_taskstate USING btree (hidden);


--
-- Name: djcelery_taskstate_863bb2ee; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_taskstate_863bb2ee ON public.djcelery_taskstate USING btree (tstamp);


--
-- Name: djcelery_taskstate_9ed39e2e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_taskstate_9ed39e2e ON public.djcelery_taskstate USING btree (state);


--
-- Name: djcelery_taskstate_b068931c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_taskstate_b068931c ON public.djcelery_taskstate USING btree (name);


--
-- Name: djcelery_taskstate_ce77e6ef; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_taskstate_ce77e6ef ON public.djcelery_taskstate USING btree (worker_id);


--
-- Name: djcelery_taskstate_name_8af9eded_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_taskstate_name_8af9eded_like ON public.djcelery_taskstate USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_state_53543be4_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_taskstate_state_53543be4_like ON public.djcelery_taskstate USING btree (state varchar_pattern_ops);


--
-- Name: djcelery_taskstate_task_id_9d2efdb5_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_taskstate_task_id_9d2efdb5_like ON public.djcelery_taskstate USING btree (task_id varchar_pattern_ops);


--
-- Name: djcelery_workerstate_f129901a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_workerstate_f129901a ON public.djcelery_workerstate USING btree (last_heartbeat);


--
-- Name: djcelery_workerstate_hostname_b31c7fab_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX djcelery_workerstate_hostname_b31c7fab_like ON public.djcelery_workerstate USING btree (hostname varchar_pattern_ops);


--
-- Name: dreamcards_card_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_card_5e7b1936 ON public.dreamcards_card USING btree (owner_id);


--
-- Name: dreamcards_card_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_card_8373b171 ON public.dreamcards_card USING btree (permission_id);


--
-- Name: dreamcards_card_b583a629; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_card_b583a629 ON public.dreamcards_card USING btree (category_id);


--
-- Name: dreamcards_card_groups_50ce08ac; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_card_groups_50ce08ac ON public.dreamcards_card_groups USING btree (group_id);


--
-- Name: dreamcards_card_groups_dcbdb4d6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_card_groups_dcbdb4d6 ON public.dreamcards_card_groups USING btree (card_id);


--
-- Name: dreamcards_card_users_dcbdb4d6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_card_users_dcbdb4d6 ON public.dreamcards_card_users USING btree (card_id);


--
-- Name: dreamcards_card_users_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_card_users_e8701ad4 ON public.dreamcards_card_users USING btree (user_id);


--
-- Name: dreamcards_cardpageassociation_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_cardpageassociation_1a63c800 ON public.dreamcards_cardpageassociation USING btree (page_id);


--
-- Name: dreamcards_cardpageassociation_dcbdb4d6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_cardpageassociation_dcbdb4d6 ON public.dreamcards_cardpageassociation USING btree (card_id);


--
-- Name: dreamcards_category_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_category_5e7b1936 ON public.dreamcards_category USING btree (owner_id);


--
-- Name: dreamcards_page_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_page_5e7b1936 ON public.dreamcards_page USING btree (owner_id);


--
-- Name: dreamcards_usergroup_users_50ce08ac; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_usergroup_users_50ce08ac ON public.dreamcards_usergroup_users USING btree (usergroup_id);


--
-- Name: dreamcards_usergroup_users_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcards_usergroup_users_e8701ad4 ON public.dreamcards_usergroup_users USING btree (user_id);


--
-- Name: dreamcommunication_message_924b1846; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamcommunication_message_924b1846 ON public.dreamcommunication_message USING btree (sender_id);


--
-- Name: dreamdevices_apisession_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdevices_apisession_e8701ad4 ON public.dreamdevices_apisession USING btree (user_id);


--
-- Name: dreamdevices_device_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdevices_device_5e7b1936 ON public.dreamdevices_device USING btree (owner_id);


--
-- Name: dreamdevices_device_users_9379346c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdevices_device_users_9379346c ON public.dreamdevices_device_users USING btree (device_id);


--
-- Name: dreamdevices_device_users_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdevices_device_users_e8701ad4 ON public.dreamdevices_device_users USING btree (user_id);


--
-- Name: dreamdiary_color_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_color_5e7b1936 ON public.dreamdiary_color USING btree (owner_id);


--
-- Name: dreamdiary_content_399a0583; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_content_399a0583 ON public.dreamdiary_content USING btree (color_id);


--
-- Name: dreamdiary_content_4e19114d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_content_4e19114d ON public.dreamdiary_content USING btree (network_id);


--
-- Name: dreamdiary_content_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_content_5e7b1936 ON public.dreamdiary_content USING btree (owner_id);


--
-- Name: dreamdiary_content_b7643b45; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_content_b7643b45 ON public.dreamdiary_content USING btree (answer_to_id);


--
-- Name: dreamdiary_content_participants_e14f02ad; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_content_participants_e14f02ad ON public.dreamdiary_content_participants USING btree (content_id);


--
-- Name: dreamdiary_content_participants_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_content_participants_e8701ad4 ON public.dreamdiary_content_participants USING btree (user_id);


--
-- Name: dreamdiary_contentaccess_e14f02ad; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_contentaccess_e14f02ad ON public.dreamdiary_contentaccess USING btree (content_id);


--
-- Name: dreamdiary_contentaccess_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_contentaccess_e8701ad4 ON public.dreamdiary_contentaccess USING btree (user_id);


--
-- Name: dreamdiary_contentattachment_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_contentattachment_5e7b1936 ON public.dreamdiary_contentattachment USING btree (owner_id);


--
-- Name: dreamdiary_contentattachment_e14f02ad; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_contentattachment_e14f02ad ON public.dreamdiary_contentattachment USING btree (content_id);


--
-- Name: dreamdiary_contentnote_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_contentnote_5e7b1936 ON public.dreamdiary_contentnote USING btree (owner_id);


--
-- Name: dreamdiary_contentnote_e14f02ad; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_contentnote_e14f02ad ON public.dreamdiary_contentnote USING btree (content_id);


--
-- Name: dreamdiary_contenttool_e14f02ad; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_contenttool_e14f02ad ON public.dreamdiary_contenttool USING btree (content_id);


--
-- Name: dreamdiary_course_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_course_5e7b1936 ON public.dreamdiary_course USING btree (owner_id);


--
-- Name: dreamdiary_course_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_course_dd64d6a4 ON public.dreamdiary_course USING btree (organisation_id);


--
-- Name: dreamdiary_course_participants_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_course_participants_e8701ad4 ON public.dreamdiary_course_participants USING btree (user_id);


--
-- Name: dreamdiary_course_participants_ea134da7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_course_participants_ea134da7 ON public.dreamdiary_course_participants USING btree (course_id);


--
-- Name: dreamdiary_course_usergroups_50ce08ac; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_course_usergroups_50ce08ac ON public.dreamdiary_course_usergroups USING btree (usergroup_id);


--
-- Name: dreamdiary_course_usergroups_ea134da7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_course_usergroups_ea134da7 ON public.dreamdiary_course_usergroups USING btree (course_id);


--
-- Name: dreamdiary_network_399a0583; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_399a0583 ON public.dreamdiary_network USING btree (color_id);


--
-- Name: dreamdiary_network_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_5e7b1936 ON public.dreamdiary_network USING btree (owner_id);


--
-- Name: dreamdiary_network_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_dd64d6a4 ON public.dreamdiary_network USING btree (organisation_id);


--
-- Name: dreamdiary_network_ea134da7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_ea134da7 ON public.dreamdiary_network USING btree (course_id);


--
-- Name: dreamdiary_network_participants_4e19114d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_participants_4e19114d ON public.dreamdiary_network_participants USING btree (network_id);


--
-- Name: dreamdiary_network_participants_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_participants_e8701ad4 ON public.dreamdiary_network_participants USING btree (user_id);


--
-- Name: dreamdiary_network_tags_4e19114d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_tags_4e19114d ON public.dreamdiary_network_tags USING btree (network_id);


--
-- Name: dreamdiary_network_tags_76f094bc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_tags_76f094bc ON public.dreamdiary_network_tags USING btree (tag_id);


--
-- Name: dreamdiary_network_usergroups_4e19114d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_usergroups_4e19114d ON public.dreamdiary_network_usergroups USING btree (network_id);


--
-- Name: dreamdiary_network_usergroups_50ce08ac; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_network_usergroups_50ce08ac ON public.dreamdiary_network_usergroups USING btree (usergroup_id);


--
-- Name: dreamdiary_networkaccess_4e19114d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_networkaccess_4e19114d ON public.dreamdiary_networkaccess USING btree (network_id);


--
-- Name: dreamdiary_networkaccess_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_networkaccess_e8701ad4 ON public.dreamdiary_networkaccess USING btree (user_id);


--
-- Name: dreamdiary_referencecontent_f0e6bc93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_referencecontent_f0e6bc93 ON public.dreamdiary_referencecontent USING btree (reference_to_id);


--
-- Name: dreamdiary_tag_name_201ac4b4_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_tag_name_201ac4b4_like ON public.dreamdiary_tag USING btree (name varchar_pattern_ops);


--
-- Name: dreamdiary_usercourse_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_usercourse_e8701ad4 ON public.dreamdiary_usercourse USING btree (user_id);


--
-- Name: dreamdiary_usercourse_ea134da7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_usercourse_ea134da7 ON public.dreamdiary_usercourse USING btree (course_id);


--
-- Name: dreamdiary_usernetwork_4e19114d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_usernetwork_4e19114d ON public.dreamdiary_usernetwork USING btree (network_id);


--
-- Name: dreamdiary_usernetwork_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamdiary_usernetwork_e8701ad4 ON public.dreamdiary_usernetwork USING btree (user_id);


--
-- Name: dreamevents_event_d7e6d55b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamevents_event_d7e6d55b ON public.dreamevents_event USING btree ("timestamp");


--
-- Name: dreameventstimeline_timelineevent_ca35c5a3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreameventstimeline_timelineevent_ca35c5a3 ON public.dreameventstimeline_timelineevent USING btree (origin_event_id);


--
-- Name: dreameventstimeline_timelineevent_d7e6d55b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreameventstimeline_timelineevent_d7e6d55b ON public.dreameventstimeline_timelineevent USING btree ("timestamp");


--
-- Name: dreaminvites_invitetoken_4c616f81; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreaminvites_invitetoken_4c616f81 ON public.dreaminvites_invitetoken USING btree (active_network_id);


--
-- Name: dreaminvites_invitetoken_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreaminvites_invitetoken_5e7b1936 ON public.dreaminvites_invitetoken USING btree (owner_id);


--
-- Name: dreaminvites_invitetoken_courses_a5ff0c6e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreaminvites_invitetoken_courses_a5ff0c6e ON public.dreaminvites_invitetoken_courses USING btree (invitetoken_id);


--
-- Name: dreaminvites_invitetoken_courses_ea134da7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreaminvites_invitetoken_courses_ea134da7 ON public.dreaminvites_invitetoken_courses USING btree (course_id);


--
-- Name: dreaminvites_invitetoken_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreaminvites_invitetoken_dd64d6a4 ON public.dreaminvites_invitetoken USING btree (organisation_id);


--
-- Name: dreammarket_domain_organisations_662cbf12; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_domain_organisations_662cbf12 ON public.dreammarket_domain_organisations USING btree (domain_id);


--
-- Name: dreammarket_domain_organisations_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_domain_organisations_dd64d6a4 ON public.dreammarket_domain_organisations USING btree (organisation_id);


--
-- Name: dreammarket_sellable_categories_76931b53; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_sellable_categories_76931b53 ON public.dreammarket_sellable_categories USING btree (sellable_id);


--
-- Name: dreammarket_sellable_categories_b583a629; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_sellable_categories_b583a629 ON public.dreammarket_sellable_categories USING btree (category_id);


--
-- Name: dreammarket_sellable_domains_662cbf12; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_sellable_domains_662cbf12 ON public.dreammarket_sellable_domains USING btree (domain_id);


--
-- Name: dreammarket_sellable_domains_76931b53; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_sellable_domains_76931b53 ON public.dreammarket_sellable_domains USING btree (sellable_id);


--
-- Name: dreammarket_sellable_f8c461fd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_sellable_f8c461fd ON public.dreammarket_sellable USING btree (sku);


--
-- Name: dreammarket_sellable_sku_712b7990_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_sellable_sku_712b7990_like ON public.dreammarket_sellable USING btree (sku varchar_pattern_ops);


--
-- Name: dreammarket_sellable_starred_by_76931b53; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_sellable_starred_by_76931b53 ON public.dreammarket_sellable_starred_by USING btree (sellable_id);


--
-- Name: dreammarket_sellable_starred_by_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_sellable_starred_by_e8701ad4 ON public.dreammarket_sellable_starred_by USING btree (user_id);


--
-- Name: dreammarket_sellablecontent_76931b53; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammarket_sellablecontent_76931b53 ON public.dreammarket_sellablecontent USING btree (sellable_id);


--
-- Name: dreammessaging_message_6b4f059f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_message_6b4f059f ON public.dreammessaging_message USING btree (from_user_id);


--
-- Name: dreammessaging_message_6be37982; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_message_6be37982 ON public.dreammessaging_message USING btree (parent_id);


--
-- Name: dreammessaging_message_8273f993; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_message_8273f993 ON public.dreammessaging_message USING btree (room_id);


--
-- Name: dreammessaging_message_d7e6d55b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_message_d7e6d55b ON public.dreammessaging_message USING btree ("timestamp");


--
-- Name: dreammessaging_message_to_user_4ccaa172; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_message_to_user_4ccaa172 ON public.dreammessaging_message_to_user USING btree (message_id);


--
-- Name: dreammessaging_message_to_user_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_message_to_user_e8701ad4 ON public.dreammessaging_message_to_user USING btree (user_id);


--
-- Name: dreammessaging_room_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_0e939a4f ON public.dreammessaging_room USING btree (group_id);


--
-- Name: dreammessaging_room_3d4478eb; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_3d4478eb ON public.dreammessaging_room USING btree (jid);


--
-- Name: dreammessaging_room_4c9184f3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_4c9184f3 ON public.dreammessaging_room USING btree (public);


--
-- Name: dreammessaging_room_84566833; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_84566833 ON public.dreammessaging_room USING btree (role_id);


--
-- Name: dreammessaging_room_da8acdc9; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_da8acdc9 ON public.dreammessaging_room USING btree (roster_managed);


--
-- Name: dreammessaging_room_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_dd64d6a4 ON public.dreammessaging_room USING btree (organisation_id);


--
-- Name: dreammessaging_room_jid_5fb7e237_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_jid_5fb7e237_like ON public.dreammessaging_room USING btree (jid varchar_pattern_ops);


--
-- Name: dreammessaging_room_roster_8273f993; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_roster_8273f993 ON public.dreammessaging_room_roster USING btree (room_id);


--
-- Name: dreammessaging_room_roster_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_roster_e8701ad4 ON public.dreammessaging_room_roster USING btree (user_id);


--
-- Name: dreammessaging_room_topics_19b4d727; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_topics_19b4d727 ON public.dreammessaging_room_topics USING btree (topic_id);


--
-- Name: dreammessaging_room_topics_8273f993; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_room_topics_8273f993 ON public.dreammessaging_room_topics USING btree (room_id);


--
-- Name: dreammessaging_topic_4c9184f3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_topic_4c9184f3 ON public.dreammessaging_topic USING btree (public);


--
-- Name: dreammessaging_topic_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreammessaging_topic_dd64d6a4 ON public.dreammessaging_topic USING btree (organisation_id);


--
-- Name: dreampayments_order_76931b53; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreampayments_order_76931b53 ON public.dreampayments_order USING btree (sellable_id);


--
-- Name: dreampayments_order_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreampayments_order_e8701ad4 ON public.dreampayments_order USING btree (user_id);


--
-- Name: dreamsms_active_codes_unique; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX dreamsms_active_codes_unique ON public.dreamsms_onetimetoken USING btree (code, active) WHERE active;


--
-- Name: dreamsms_onetimetoken_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsms_onetimetoken_e8701ad4 ON public.dreamsms_onetimetoken USING btree (user_id);


--
-- Name: dreamsms_smsmessage_55d551ed; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsms_smsmessage_55d551ed ON public.dreamsms_smsmessage USING btree (token_id);


--
-- Name: dreamsocialqa_answer_70a17ffa; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_answer_70a17ffa ON public.dreamsocialqa_answer USING btree ("order");


--
-- Name: dreamsocialqa_answer_7aa0f6ee; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_answer_7aa0f6ee ON public.dreamsocialqa_answer USING btree (question_id);


--
-- Name: dreamsocialqa_answer_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_answer_e8701ad4 ON public.dreamsocialqa_answer USING btree (user_id);


--
-- Name: dreamsocialqa_answerrating_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_answerrating_e8701ad4 ON public.dreamsocialqa_answerrating USING btree (user_id);


--
-- Name: dreamsocialqa_answerrating_fb12e902; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_answerrating_fb12e902 ON public.dreamsocialqa_answerrating USING btree (answer_id);


--
-- Name: dreamsocialqa_contentconsumption_e14f02ad; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_contentconsumption_e14f02ad ON public.dreamsocialqa_contentconsumption USING btree (content_id);


--
-- Name: dreamsocialqa_contentconsumption_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_contentconsumption_e8701ad4 ON public.dreamsocialqa_contentconsumption USING btree (user_id);


--
-- Name: dreamsocialqa_networkconsumption_4e19114d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_networkconsumption_4e19114d ON public.dreamsocialqa_networkconsumption USING btree (network_id);


--
-- Name: dreamsocialqa_networkconsumption_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_networkconsumption_e8701ad4 ON public.dreamsocialqa_networkconsumption USING btree (user_id);


--
-- Name: dreamsocialqa_networkfeedback_4e19114d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_networkfeedback_4e19114d ON public.dreamsocialqa_networkfeedback USING btree (network_id);


--
-- Name: dreamsocialqa_networkfeedback_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_networkfeedback_e8701ad4 ON public.dreamsocialqa_networkfeedback USING btree (user_id);


--
-- Name: dreamsocialqa_question_4e19114d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_question_4e19114d ON public.dreamsocialqa_question USING btree (network_id);


--
-- Name: dreamsocialqa_question_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamsocialqa_question_e8701ad4 ON public.dreamsocialqa_question USING btree (user_id);


--
-- Name: dreamuserdb_authprovider_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_authprovider_dd64d6a4 ON public.dreamuserdb_authprovider USING btree (organisation_id);


--
-- Name: dreamuserdb_googleuser_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_googleuser_dd64d6a4 ON public.dreamuserdb_googleuser USING btree (organisation_id);


--
-- Name: dreamuserdb_googleuser_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_googleuser_e8701ad4 ON public.dreamuserdb_googleuser USING btree (user_id);


--
-- Name: dreamuserdb_group_3cfbd988; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_group_3cfbd988 ON public.dreamuserdb_group USING btree (rght);


--
-- Name: dreamuserdb_group_656442a0; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_group_656442a0 ON public.dreamuserdb_group USING btree (tree_id);


--
-- Name: dreamuserdb_group_6be37982; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_group_6be37982 ON public.dreamuserdb_group USING btree (parent_id);


--
-- Name: dreamuserdb_group_c9e9a848; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_group_c9e9a848 ON public.dreamuserdb_group USING btree (level);


--
-- Name: dreamuserdb_group_caf7cc51; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_group_caf7cc51 ON public.dreamuserdb_group USING btree (lft);


--
-- Name: dreamuserdb_group_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_group_dd64d6a4 ON public.dreamuserdb_group USING btree (organisation_id);


--
-- Name: dreamuserdb_organisation_016fb754; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_organisation_016fb754 ON public.dreamuserdb_organisation USING btree (default_service_id);


--
-- Name: dreamuserdb_organisation_owners_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_organisation_owners_dd64d6a4 ON public.dreamuserdb_organisation_owners USING btree (organisation_id);


--
-- Name: dreamuserdb_organisation_owners_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_organisation_owners_e8701ad4 ON public.dreamuserdb_organisation_owners USING btree (user_id);


--
-- Name: dreamuserdb_role_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_role_dd64d6a4 ON public.dreamuserdb_role USING btree (organisation_id);


--
-- Name: dreamuserdb_role_permissions_84566833; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_role_permissions_84566833 ON public.dreamuserdb_role_permissions USING btree (role_id);


--
-- Name: dreamuserdb_role_permissions_ead03ea0; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_role_permissions_ead03ea0 ON public.dreamuserdb_role_permissions USING btree (servicepermission_id);


--
-- Name: dreamuserdb_service_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_service_e8701ad4 ON public.dreamuserdb_service USING btree (user_id);


--
-- Name: dreamuserdb_service_entity_id_69759ae2_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_service_entity_id_69759ae2_like ON public.dreamuserdb_service USING btree (entity_id varchar_pattern_ops);


--
-- Name: dreamuserdb_service_organisations_b0dc1e29; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_service_organisations_b0dc1e29 ON public.dreamuserdb_service_organisations USING btree (service_id);


--
-- Name: dreamuserdb_service_organisations_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_service_organisations_dd64d6a4 ON public.dreamuserdb_service_organisations USING btree (organisation_id);


--
-- Name: dreamuserdb_servicepermission_b0dc1e29; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_servicepermission_b0dc1e29 ON public.dreamuserdb_servicepermission USING btree (service_id);


--
-- Name: dreamuserdb_user_016fb754; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_user_016fb754 ON public.dreamuserdb_user USING btree (default_service_id);


--
-- Name: dreamuserdb_user_eb55230c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_user_eb55230c ON public.dreamuserdb_user USING btree (active_organisation_id);


--
-- Name: dreamuserdb_user_organisations_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_user_organisations_dd64d6a4 ON public.dreamuserdb_user_organisations USING btree (organisation_id);


--
-- Name: dreamuserdb_user_organisations_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_user_organisations_e8701ad4 ON public.dreamuserdb_user_organisations USING btree (user_id);


--
-- Name: dreamuserdb_user_roles_84566833; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_user_roles_84566833 ON public.dreamuserdb_user_roles USING btree (role_id);


--
-- Name: dreamuserdb_user_roles_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_user_roles_e8701ad4 ON public.dreamuserdb_user_roles USING btree (user_id);


--
-- Name: dreamuserdb_user_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_user_user_groups_0e939a4f ON public.dreamuserdb_user_user_groups USING btree (group_id);


--
-- Name: dreamuserdb_user_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dreamuserdb_user_user_groups_e8701ad4 ON public.dreamuserdb_user_user_groups USING btree (user_id);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b068931c ON public.easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b454e115 ON public.easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON public.easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON public.easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON public.easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON public.easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON public.easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON public.easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON public.easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: guardian_groupobjectpermission_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_0e939a4f ON public.guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_417f1b1c ON public.guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_8373b171 ON public.guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_417f1b1c ON public.guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_8373b171 ON public.guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_e8701ad4 ON public.guardian_userobjectpermission USING btree (user_id);


--
-- Name: lifelearn_agpaiiregistrationform_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearn_agpaiiregistrationform_e8701ad4 ON public.lifelearn_agpaiiregistrationform USING btree (user_id);


--
-- Name: lifelearn_filecontent_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearn_filecontent_5e7b1936 ON public.lifelearn_filecontent USING btree (owner_id);


--
-- Name: lifelearn_usercoursebadge_ea134da7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearn_usercoursebadge_ea134da7 ON public.lifelearn_usercoursebadge USING btree (course_id);


--
-- Name: lifelearn_usercoursebadge_users_3c0d1440; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearn_usercoursebadge_users_3c0d1440 ON public.lifelearn_usercoursebadge_users USING btree (usercoursebadge_id);


--
-- Name: lifelearn_usercoursebadge_users_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearn_usercoursebadge_users_e8701ad4 ON public.lifelearn_usercoursebadge_users USING btree (user_id);


--
-- Name: lifelearncoins_lifecointransaction_ec4f071f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearncoins_lifecointransaction_ec4f071f ON public.lifelearncoins_lifecointransaction USING btree (wallet_id);


--
-- Name: lifelearncoins_lifecoinwallet_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearncoins_lifecoinwallet_e8701ad4 ON public.lifelearncoins_lifecoinwallet USING btree (user_id);


--
-- Name: lifelearnpushnotifications_eventcreatednotification_4437cfac; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnpushnotifications_eventcreatednotification_4437cfac ON public.lifelearnpushnotifications_eventcreatednotification USING btree (event_id);


--
-- Name: lifelearnpushnotifications_timelineeventcreatednotification6efe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnpushnotifications_timelineeventcreatednotification6efe ON public.lifelearnpushnotifications_timelineeventcreatednotification USING btree (event_id);


--
-- Name: lifelearnskills_point_4437cfac; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnskills_point_4437cfac ON public.lifelearnskills_point USING btree (event_id);


--
-- Name: lifelearnskills_point_d38d4c39; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnskills_point_d38d4c39 ON public.lifelearnskills_point USING btree (skill_id);


--
-- Name: lifelearnskills_point_d7e6d55b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnskills_point_d7e6d55b ON public.lifelearnskills_point USING btree ("timestamp");


--
-- Name: lifelearnskills_point_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnskills_point_e8701ad4 ON public.lifelearnskills_point USING btree (user_id);


--
-- Name: lifelearnskills_point_ea134da7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnskills_point_ea134da7 ON public.lifelearnskills_point USING btree (course_id);


--
-- Name: lifelearnskills_skill_courses_d38d4c39; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnskills_skill_courses_d38d4c39 ON public.lifelearnskills_skill_courses USING btree (skill_id);


--
-- Name: lifelearnskills_skill_courses_ea134da7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnskills_skill_courses_ea134da7 ON public.lifelearnskills_skill_courses USING btree (course_id);


--
-- Name: lifelearnskills_skill_dd64d6a4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lifelearnskills_skill_dd64d6a4 ON public.lifelearnskills_skill USING btree (organisation_id);


--
-- Name: social_auth_code_c1336794; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX social_auth_code_c1336794 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX social_auth_usersocialauth_e8701ad4 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: D23ffa2a057e9223b64dd0c59369d515; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_role_permissions
    ADD CONSTRAINT "D23ffa2a057e9223b64dd0c59369d515" FOREIGN KEY (servicepermission_id) REFERENCES public.dreamuserdb_servicepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: active_organisation_id_1e6e7246_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user
    ADD CONSTRAINT active_organisation_id_1e6e7246_fk_dreamuserdb_organisation_id FOREIGN KEY (active_organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_p_interval_id_b426ab02_fk_djcelery_intervalschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.djcelery_periodictask
    ADD CONSTRAINT djcelery_p_interval_id_b426ab02_fk_djcelery_intervalschedule_id FOREIGN KEY (interval_id) REFERENCES public.djcelery_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_per_crontab_id_75609bab_fk_djcelery_crontabschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.djcelery_periodictask
    ADD CONSTRAINT djcelery_per_crontab_id_75609bab_fk_djcelery_crontabschedule_id FOREIGN KEY (crontab_id) REFERENCES public.djcelery_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_taskstat_worker_id_f7f57a05_fk_djcelery_workerstate_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstat_worker_id_f7f57a05_fk_djcelery_workerstate_id FOREIGN KEY (worker_id) REFERENCES public.djcelery_workerstate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_ca_owner_id_54fbd2c0_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_category
    ADD CONSTRAINT dreamcards_ca_owner_id_54fbd2c0_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_ca_owner_id_9804841a_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card
    ADD CONSTRAINT dreamcards_ca_owner_id_9804841a_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_car_user_id_24ea18e5_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card_users
    ADD CONSTRAINT dreamcards_car_user_id_24ea18e5_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_card_category_id_af56147f_fk_dreamcards_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card
    ADD CONSTRAINT dreamcards_card_category_id_af56147f_fk_dreamcards_category_id FOREIGN KEY (category_id) REFERENCES public.dreamcards_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_card_group_group_id_9369c2d7_fk_dreamuserdb_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card_groups
    ADD CONSTRAINT dreamcards_card_group_group_id_9369c2d7_fk_dreamuserdb_group_id FOREIGN KEY (group_id) REFERENCES public.dreamuserdb_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_card_groups_card_id_6fe169fe_fk_dreamcards_card_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card_groups
    ADD CONSTRAINT dreamcards_card_groups_card_id_6fe169fe_fk_dreamcards_card_id FOREIGN KEY (card_id) REFERENCES public.dreamcards_card(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_card_permission_id_b4d45f44_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card
    ADD CONSTRAINT dreamcards_card_permission_id_b4d45f44_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_card_users_card_id_569c2378_fk_dreamcards_card_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_card_users
    ADD CONSTRAINT dreamcards_card_users_card_id_569c2378_fk_dreamcards_card_id FOREIGN KEY (card_id) REFERENCES public.dreamcards_card(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_cardpageassoc_card_id_d57c1030_fk_dreamcards_card_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_cardpageassociation
    ADD CONSTRAINT dreamcards_cardpageassoc_card_id_d57c1030_fk_dreamcards_card_id FOREIGN KEY (card_id) REFERENCES public.dreamcards_card(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_cardpageassoc_page_id_8810bbf6_fk_dreamcards_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_cardpageassociation
    ADD CONSTRAINT dreamcards_cardpageassoc_page_id_8810bbf6_fk_dreamcards_page_id FOREIGN KEY (page_id) REFERENCES public.dreamcards_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_des_user_id_15bcab7f_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_desktopuserprofile
    ADD CONSTRAINT dreamcards_des_user_id_15bcab7f_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_pa_owner_id_d355f4f0_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_page
    ADD CONSTRAINT dreamcards_pa_owner_id_d355f4f0_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_use_user_id_dd0515b1_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_usergroup_users
    ADD CONSTRAINT dreamcards_use_user_id_dd0515b1_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcards_use_usergroup_id_9c4ec788_fk_dreamcards_usergroup_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcards_usergroup_users
    ADD CONSTRAINT dreamcards_use_usergroup_id_9c4ec788_fk_dreamcards_usergroup_id FOREIGN KEY (usergroup_id) REFERENCES public.dreamcards_usergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamcommuni_sender_id_ad7153be_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamcommunication_message
    ADD CONSTRAINT dreamcommuni_sender_id_ad7153be_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (sender_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdevices__owner_id_ba4417a1_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdevices_device
    ADD CONSTRAINT dreamdevices__owner_id_ba4417a1_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdevices_a_user_id_8874d70a_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdevices_apisession
    ADD CONSTRAINT dreamdevices_a_user_id_8874d70a_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdevices_d_user_id_b4fb3397_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdevices_device_users
    ADD CONSTRAINT dreamdevices_d_user_id_b4fb3397_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdevices_devic_device_id_7a5154c0_fk_dreamdevices_device_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdevices_device_users
    ADD CONSTRAINT dreamdevices_devic_device_id_7a5154c0_fk_dreamdevices_device_id FOREIGN KEY (device_id) REFERENCES public.dreamdevices_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdi_organisation_id_1cc321b7_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_course
    ADD CONSTRAINT dreamdi_organisation_id_1cc321b7_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdi_organisation_id_75bd8068_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network
    ADD CONSTRAINT dreamdi_organisation_id_75bd8068_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_co_owner_id_3373ed0f_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contentnote
    ADD CONSTRAINT dreamdiary_co_owner_id_3373ed0f_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_co_owner_id_c6c3b4e4_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_course
    ADD CONSTRAINT dreamdiary_co_owner_id_c6c3b4e4_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_co_owner_id_e3ccf6c5_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_content
    ADD CONSTRAINT dreamdiary_co_owner_id_e3ccf6c5_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_co_owner_id_e8cefd89_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_color
    ADD CONSTRAINT dreamdiary_co_owner_id_e8cefd89_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_co_owner_id_f4b50530_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contentattachment
    ADD CONSTRAINT dreamdiary_co_owner_id_f4b50530_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_con_user_id_44639aa3_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contentaccess
    ADD CONSTRAINT dreamdiary_con_user_id_44639aa3_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_con_user_id_4f9ed054_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_content_participants
    ADD CONSTRAINT dreamdiary_con_user_id_4f9ed054_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_conte_answer_to_id_055e3839_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_content
    ADD CONSTRAINT dreamdiary_conte_answer_to_id_055e3839_fk_dreamdiary_content_id FOREIGN KEY (answer_to_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_content_color_id_412029ca_fk_dreamdiary_color_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_content
    ADD CONSTRAINT dreamdiary_content_color_id_412029ca_fk_dreamdiary_color_id FOREIGN KEY (color_id) REFERENCES public.dreamdiary_color(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_content_content_id_3e560d94_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contenttool
    ADD CONSTRAINT dreamdiary_content_content_id_3e560d94_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_content_content_id_5b96c530_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contentaccess
    ADD CONSTRAINT dreamdiary_content_content_id_5b96c530_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_content_content_id_62cf0871_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contentnote
    ADD CONSTRAINT dreamdiary_content_content_id_62cf0871_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_content_content_id_9e2a99c4_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_contentattachment
    ADD CONSTRAINT dreamdiary_content_content_id_9e2a99c4_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_content_content_id_f88269f2_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_content_participants
    ADD CONSTRAINT dreamdiary_content_content_id_f88269f2_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_content_network_id_fcf89f04_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_content
    ADD CONSTRAINT dreamdiary_content_network_id_fcf89f04_fk_dreamdiary_network_id FOREIGN KEY (network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_cou_user_id_b9b73a3e_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_course_participants
    ADD CONSTRAINT dreamdiary_cou_user_id_b9b73a3e_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_cou_usergroup_id_497fa17a_fk_dreamdiary_usergroup_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_course_usergroups
    ADD CONSTRAINT dreamdiary_cou_usergroup_id_497fa17a_fk_dreamdiary_usergroup_id FOREIGN KEY (usergroup_id) REFERENCES public.dreamdiary_usergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_course_pa_course_id_727481eb_fk_dreamdiary_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_course_participants
    ADD CONSTRAINT dreamdiary_course_pa_course_id_727481eb_fk_dreamdiary_course_id FOREIGN KEY (course_id) REFERENCES public.dreamdiary_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_course_us_course_id_33d71dac_fk_dreamdiary_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_course_usergroups
    ADD CONSTRAINT dreamdiary_course_us_course_id_33d71dac_fk_dreamdiary_course_id FOREIGN KEY (course_id) REFERENCES public.dreamdiary_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_ne_owner_id_fa57817f_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network
    ADD CONSTRAINT dreamdiary_ne_owner_id_fa57817f_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_net_user_id_85d2a987_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_networkaccess
    ADD CONSTRAINT dreamdiary_net_user_id_85d2a987_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_net_user_id_b6d20520_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network_participants
    ADD CONSTRAINT dreamdiary_net_user_id_b6d20520_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_net_usergroup_id_ce7987eb_fk_dreamdiary_usergroup_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network_usergroups
    ADD CONSTRAINT dreamdiary_net_usergroup_id_ce7987eb_fk_dreamdiary_usergroup_id FOREIGN KEY (usergroup_id) REFERENCES public.dreamdiary_usergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_network_color_id_f1d0e5be_fk_dreamdiary_color_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network
    ADD CONSTRAINT dreamdiary_network_color_id_f1d0e5be_fk_dreamdiary_color_id FOREIGN KEY (color_id) REFERENCES public.dreamdiary_color(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_network_course_id_c741b42f_fk_dreamdiary_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network
    ADD CONSTRAINT dreamdiary_network_course_id_c741b42f_fk_dreamdiary_course_id FOREIGN KEY (course_id) REFERENCES public.dreamdiary_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_network_network_id_1076e726_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network_usergroups
    ADD CONSTRAINT dreamdiary_network_network_id_1076e726_fk_dreamdiary_network_id FOREIGN KEY (network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_network_network_id_824d50f8_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network_participants
    ADD CONSTRAINT dreamdiary_network_network_id_824d50f8_fk_dreamdiary_network_id FOREIGN KEY (network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_network_network_id_c4eb88f4_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network_tags
    ADD CONSTRAINT dreamdiary_network_network_id_c4eb88f4_fk_dreamdiary_network_id FOREIGN KEY (network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_network_network_id_c750411b_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_networkaccess
    ADD CONSTRAINT dreamdiary_network_network_id_c750411b_fk_dreamdiary_network_id FOREIGN KEY (network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_network_tags_tag_id_1cd5a714_fk_dreamdiary_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_network_tags
    ADD CONSTRAINT dreamdiary_network_tags_tag_id_1cd5a714_fk_dreamdiary_tag_id FOREIGN KEY (tag_id) REFERENCES public.dreamdiary_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_re_reference_to_id_c1778f11_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_referencecontent
    ADD CONSTRAINT dreamdiary_re_reference_to_id_c1778f11_fk_dreamdiary_content_id FOREIGN KEY (reference_to_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_ref_content_ptr_id_192647d0_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_referencecontent
    ADD CONSTRAINT dreamdiary_ref_content_ptr_id_192647d0_fk_dreamdiary_content_id FOREIGN KEY (content_ptr_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_tas_content_ptr_id_df946329_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_task
    ADD CONSTRAINT dreamdiary_tas_content_ptr_id_df946329_fk_dreamdiary_content_id FOREIGN KEY (content_ptr_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_use_user_id_902820de_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_usernetwork
    ADD CONSTRAINT dreamdiary_use_user_id_902820de_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_use_user_id_98b4afef_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_usercourse
    ADD CONSTRAINT dreamdiary_use_user_id_98b4afef_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_usercours_course_id_47c18890_fk_dreamdiary_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_usercourse
    ADD CONSTRAINT dreamdiary_usercours_course_id_47c18890_fk_dreamdiary_course_id FOREIGN KEY (course_id) REFERENCES public.dreamdiary_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_usernet_network_id_f1c81b2b_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_usernetwork
    ADD CONSTRAINT dreamdiary_usernet_network_id_f1c81b2b_fk_dreamdiary_network_id FOREIGN KEY (network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamdiary_wor_content_ptr_id_b8783619_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamdiary_work
    ADD CONSTRAINT dreamdiary_wor_content_ptr_id_b8783619_fk_dreamdiary_content_id FOREIGN KEY (content_ptr_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreameventstim_origin_event_id_7b7b7c6c_fk_dreamevents_event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreameventstimeline_timelineevent
    ADD CONSTRAINT dreameventstim_origin_event_id_7b7b7c6c_fk_dreamevents_event_id FOREIGN KEY (origin_event_id) REFERENCES public.dreamevents_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamin_organisation_id_103619e5_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreaminvites_invitetoken
    ADD CONSTRAINT dreamin_organisation_id_103619e5_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamin_organisation_id_ad2b649f_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreaminvites_organisationsettings
    ADD CONSTRAINT dreamin_organisation_id_ad2b649f_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreaminv_invitetoken_id_dfd9397a_fk_dreaminvites_invitetoken_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreaminvites_invitetoken_courses
    ADD CONSTRAINT dreaminv_invitetoken_id_dfd9397a_fk_dreaminvites_invitetoken_id FOREIGN KEY (invitetoken_id) REFERENCES public.dreaminvites_invitetoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreaminvite_active_network_id_96d17997_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreaminvites_invitetoken
    ADD CONSTRAINT dreaminvite_active_network_id_96d17997_fk_dreamdiary_network_id FOREIGN KEY (active_network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreaminvites__owner_id_f2c6813c_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreaminvites_invitetoken
    ADD CONSTRAINT dreaminvites__owner_id_f2c6813c_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreaminvites_invitet_course_id_471d4b02_fk_dreamdiary_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreaminvites_invitetoken_courses
    ADD CONSTRAINT dreaminvites_invitet_course_id_471d4b02_fk_dreamdiary_course_id FOREIGN KEY (course_id) REFERENCES public.dreamdiary_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamma_organisation_id_f60a0747_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_domain_organisations
    ADD CONSTRAINT dreamma_organisation_id_f60a0747_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_domain__domain_id_3af45ae4_fk_dreammarket_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_domain_organisations
    ADD CONSTRAINT dreammarket_domain__domain_id_3af45ae4_fk_dreammarket_domain_id FOREIGN KEY (domain_id) REFERENCES public.dreammarket_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_se_user_id_09bf8120_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable_starred_by
    ADD CONSTRAINT dreammarket_se_user_id_09bf8120_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_sel_category_id_5966e70d_fk_dreammarket_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable_categories
    ADD CONSTRAINT dreammarket_sel_category_id_5966e70d_fk_dreammarket_category_id FOREIGN KEY (category_id) REFERENCES public.dreammarket_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_sel_sellable_id_1eb35037_fk_dreammarket_sellable_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable_domains
    ADD CONSTRAINT dreammarket_sel_sellable_id_1eb35037_fk_dreammarket_sellable_id FOREIGN KEY (sellable_id) REFERENCES public.dreammarket_sellable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_sel_sellable_id_406c9c10_fk_dreammarket_sellable_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable_categories
    ADD CONSTRAINT dreammarket_sel_sellable_id_406c9c10_fk_dreammarket_sellable_id FOREIGN KEY (sellable_id) REFERENCES public.dreammarket_sellable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_sel_sellable_id_c4f77468_fk_dreammarket_sellable_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable_starred_by
    ADD CONSTRAINT dreammarket_sel_sellable_id_c4f77468_fk_dreammarket_sellable_id FOREIGN KEY (sellable_id) REFERENCES public.dreammarket_sellable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_sel_sellable_id_fd73bb75_fk_dreammarket_sellable_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellablecontent
    ADD CONSTRAINT dreammarket_sel_sellable_id_fd73bb75_fk_dreammarket_sellable_id FOREIGN KEY (sellable_id) REFERENCES public.dreammarket_sellable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_sellab_content_id_696cd271_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellablecontent
    ADD CONSTRAINT dreammarket_sellab_content_id_696cd271_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_sellabl_domain_id_a36a3a31_fk_dreammarket_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable_domains
    ADD CONSTRAINT dreammarket_sellabl_domain_id_a36a3a31_fk_dreammarket_domain_id FOREIGN KEY (domain_id) REFERENCES public.dreammarket_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammarket_sellable_course_id_7909b493_fk_dreamdiary_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammarket_sellable
    ADD CONSTRAINT dreammarket_sellable_course_id_7909b493_fk_dreamdiary_course_id FOREIGN KEY (course_id) REFERENCES public.dreamdiary_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamme_organisation_id_5c36a19d_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room
    ADD CONSTRAINT dreamme_organisation_id_5c36a19d_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamme_organisation_id_7f4b444a_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_topic
    ADD CONSTRAINT dreamme_organisation_id_7f4b444a_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammess_from_user_id_700f080f_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_message
    ADD CONSTRAINT dreammess_from_user_id_700f080f_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (from_user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging__parent_id_cb84f191_fk_dreammessaging_message_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_message
    ADD CONSTRAINT dreammessaging__parent_id_cb84f191_fk_dreammessaging_message_id FOREIGN KEY (parent_id) REFERENCES public.dreammessaging_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging_messa_room_id_fc2f01ef_fk_dreammessaging_room_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_message
    ADD CONSTRAINT dreammessaging_messa_room_id_fc2f01ef_fk_dreammessaging_room_id FOREIGN KEY (room_id) REFERENCES public.dreammessaging_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging_message_id_05cbbb22_fk_dreammessaging_message_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_message_to_user
    ADD CONSTRAINT dreammessaging_message_id_05cbbb22_fk_dreammessaging_message_id FOREIGN KEY (message_id) REFERENCES public.dreammessaging_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging_roo_topic_id_c12a3f24_fk_dreammessaging_topic_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room_topics
    ADD CONSTRAINT dreammessaging_roo_topic_id_c12a3f24_fk_dreammessaging_topic_id FOREIGN KEY (topic_id) REFERENCES public.dreammessaging_topic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging_room__room_id_2047dbcf_fk_dreammessaging_room_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room_roster
    ADD CONSTRAINT dreammessaging_room__room_id_2047dbcf_fk_dreammessaging_room_id FOREIGN KEY (room_id) REFERENCES public.dreammessaging_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging_room__room_id_50c10baa_fk_dreammessaging_room_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room_topics
    ADD CONSTRAINT dreammessaging_room__room_id_50c10baa_fk_dreammessaging_room_id FOREIGN KEY (room_id) REFERENCES public.dreammessaging_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging_room_group_id_40db686e_fk_dreamuserdb_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room
    ADD CONSTRAINT dreammessaging_room_group_id_40db686e_fk_dreamuserdb_group_id FOREIGN KEY (group_id) REFERENCES public.dreamuserdb_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging_room_role_id_cf4f95d6_fk_dreamuserdb_role_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room
    ADD CONSTRAINT dreammessaging_room_role_id_cf4f95d6_fk_dreamuserdb_role_id FOREIGN KEY (role_id) REFERENCES public.dreamuserdb_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging_user_id_96da55c8_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_room_roster
    ADD CONSTRAINT dreammessaging_user_id_96da55c8_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammessaging_user_id_bd591eb5_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammessaging_message_to_user
    ADD CONSTRAINT dreammessaging_user_id_bd591eb5_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreammindmup_mindm_content_id_04c63f34_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreammindmup_mindmupcontent
    ADD CONSTRAINT dreammindmup_mindm_content_id_04c63f34_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreampayments__user_id_ed27bbe9_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreampayments_order
    ADD CONSTRAINT dreampayments__user_id_ed27bbe9_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreampayments_o_sellable_id_d4c1c04d_fk_dreammarket_sellable_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreampayments_order
    ADD CONSTRAINT dreampayments_o_sellable_id_d4c1c04d_fk_dreammarket_sellable_id FOREIGN KEY (sellable_id) REFERENCES public.dreammarket_sellable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsms_oneti_user_id_3ef55a50_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsms_onetimetoken
    ADD CONSTRAINT dreamsms_oneti_user_id_3ef55a50_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsms_smsmessa_token_id_158dff0a_fk_dreamsms_onetimetoken_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsms_smsmessage
    ADD CONSTRAINT dreamsms_smsmessa_token_id_158dff0a_fk_dreamsms_onetimetoken_id FOREIGN KEY (token_id) REFERENCES public.dreamsms_onetimetoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa__user_id_23c27550_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_networkfeedback
    ADD CONSTRAINT dreamsocialqa__user_id_23c27550_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa__user_id_3badd1c3_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_answerrating
    ADD CONSTRAINT dreamsocialqa__user_id_3badd1c3_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa__user_id_5837e303_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_answer
    ADD CONSTRAINT dreamsocialqa__user_id_5837e303_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa__user_id_ca1e8827_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_question
    ADD CONSTRAINT dreamsocialqa__user_id_ca1e8827_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa__user_id_e0b515de_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_contentconsumption
    ADD CONSTRAINT dreamsocialqa__user_id_e0b515de_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa__user_id_fa68beca_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_networkconsumption
    ADD CONSTRAINT dreamsocialqa__user_id_fa68beca_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa_ans_answer_id_500afe5a_fk_dreamsocialqa_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_answerrating
    ADD CONSTRAINT dreamsocialqa_ans_answer_id_500afe5a_fk_dreamsocialqa_answer_id FOREIGN KEY (answer_id) REFERENCES public.dreamsocialqa_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa_cont_content_id_cd2f802e_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_contentconsumption
    ADD CONSTRAINT dreamsocialqa_cont_content_id_cd2f802e_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa_netw_network_id_3a8a4102_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_networkconsumption
    ADD CONSTRAINT dreamsocialqa_netw_network_id_3a8a4102_fk_dreamdiary_network_id FOREIGN KEY (network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa_netw_network_id_d385bec2_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_networkfeedback
    ADD CONSTRAINT dreamsocialqa_netw_network_id_d385bec2_fk_dreamdiary_network_id FOREIGN KEY (network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa_ques_network_id_0eabd4c2_fk_dreamdiary_network_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_question
    ADD CONSTRAINT dreamsocialqa_ques_network_id_0eabd4c2_fk_dreamdiary_network_id FOREIGN KEY (network_id) REFERENCES public.dreamdiary_network(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamsocialqa_question_id_8b3802a3_fk_dreamsocialqa_question_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamsocialqa_answer
    ADD CONSTRAINT dreamsocialqa_question_id_8b3802a3_fk_dreamsocialqa_question_id FOREIGN KEY (question_id) REFERENCES public.dreamsocialqa_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamus_organisation_id_07c0a60c_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_role
    ADD CONSTRAINT dreamus_organisation_id_07c0a60c_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamus_organisation_id_0fd7c443_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user_organisations
    ADD CONSTRAINT dreamus_organisation_id_0fd7c443_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamus_organisation_id_499253f6_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_group
    ADD CONSTRAINT dreamus_organisation_id_499253f6_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamus_organisation_id_5d587561_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_authprovider
    ADD CONSTRAINT dreamus_organisation_id_5d587561_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamus_organisation_id_6a10d696_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_googleuser
    ADD CONSTRAINT dreamus_organisation_id_6a10d696_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamus_organisation_id_c9f24e52_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_service_organisations
    ADD CONSTRAINT dreamus_organisation_id_c9f24e52_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamus_organisation_id_e0e56715_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_organisation_owners
    ADD CONSTRAINT dreamus_organisation_id_e0e56715_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuser_default_service_id_8e5926a4_fk_dreamuserdb_service_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_organisation
    ADD CONSTRAINT dreamuser_default_service_id_8e5926a4_fk_dreamuserdb_service_id FOREIGN KEY (default_service_id) REFERENCES public.dreamuserdb_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuser_default_service_id_fa6b391c_fk_dreamuserdb_service_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user
    ADD CONSTRAINT dreamuser_default_service_id_fa6b391c_fk_dreamuserdb_service_id FOREIGN KEY (default_service_id) REFERENCES public.dreamuserdb_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_go_user_id_be679b78_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_googleuser
    ADD CONSTRAINT dreamuserdb_go_user_id_be679b78_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_group_parent_id_99e9c1c7_fk_dreamuserdb_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_group
    ADD CONSTRAINT dreamuserdb_group_parent_id_99e9c1c7_fk_dreamuserdb_group_id FOREIGN KEY (parent_id) REFERENCES public.dreamuserdb_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_or_user_id_20649ac1_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_organisation_owners
    ADD CONSTRAINT dreamuserdb_or_user_id_20649ac1_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_role_permis_role_id_ffe4a985_fk_dreamuserdb_role_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_role_permissions
    ADD CONSTRAINT dreamuserdb_role_permis_role_id_ffe4a985_fk_dreamuserdb_role_id FOREIGN KEY (role_id) REFERENCES public.dreamuserdb_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_se_user_id_739da773_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_service
    ADD CONSTRAINT dreamuserdb_se_user_id_739da773_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_servi_service_id_b7eb48a4_fk_dreamuserdb_service_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_servicepermission
    ADD CONSTRAINT dreamuserdb_servi_service_id_b7eb48a4_fk_dreamuserdb_service_id FOREIGN KEY (service_id) REFERENCES public.dreamuserdb_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_servi_service_id_ef3a3768_fk_dreamuserdb_service_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_service_organisations
    ADD CONSTRAINT dreamuserdb_servi_service_id_ef3a3768_fk_dreamuserdb_service_id FOREIGN KEY (service_id) REFERENCES public.dreamuserdb_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_us_user_id_41d102d5_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user_roles
    ADD CONSTRAINT dreamuserdb_us_user_id_41d102d5_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_us_user_id_4dc292c8_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user_organisations
    ADD CONSTRAINT dreamuserdb_us_user_id_4dc292c8_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_us_user_id_f8272d0d_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user_user_groups
    ADD CONSTRAINT dreamuserdb_us_user_id_f8272d0d_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_user_roles_role_id_18f0270e_fk_dreamuserdb_role_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user_roles
    ADD CONSTRAINT dreamuserdb_user_roles_role_id_18f0270e_fk_dreamuserdb_role_id FOREIGN KEY (role_id) REFERENCES public.dreamuserdb_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_user_user_group_id_71ec56e7_fk_dreamuserdb_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user_user_groups
    ADD CONSTRAINT dreamuserdb_user_user_group_id_71ec56e7_fk_dreamuserdb_group_id FOREIGN KEY (group_id) REFERENCES public.dreamuserdb_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamuserdb_user_user_ptr_id_c5c8acae_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamuserdb_user
    ADD CONSTRAINT dreamuserdb_user_user_ptr_id_c5c8acae_fk_auth_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamvuolearni_user_id_4e81af9b_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamvuolearning_vuoauthtoken
    ADD CONSTRAINT dreamvuolearni_user_id_4e81af9b_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamvuolearning_v_content_id_fce4d8e4_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamvuolearning_vuodocumentcontent
    ADD CONSTRAINT dreamvuolearning_v_content_id_fce4d8e4_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dreamyle_yleconten_content_id_5ad6cd72_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dreamyle_ylecontent
    ADD CONSTRAINT dreamyle_yleconten_content_id_5ad6cd72_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES public.easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES public.easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_gro_content_type_id_7ade36b8_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_gro_content_type_id_7ade36b8_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobje_permission_id_36572738_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobje_permission_id_36572738_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermissi_group_id_4bbbfb62_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermissi_group_id_4bbbfb62_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_use_content_type_id_2e892405_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_use_content_type_id_2e892405_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjec_permission_id_71807bfc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjec_permission_id_71807bfc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lif_usercoursebadge_id_49ec9b3b_fk_lifelearn_usercoursebadge_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_usercoursebadge_users
    ADD CONSTRAINT lif_usercoursebadge_id_49ec9b3b_fk_lifelearn_usercoursebadge_id FOREIGN KEY (usercoursebadge_id) REFERENCES public.lifelearn_usercoursebadge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifel_event_id_4d3073a7_fk_dreameventstimeline_timelineevent_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnpushnotifications_timelineeventcreatednotification
    ADD CONSTRAINT lifel_event_id_4d3073a7_fk_dreameventstimeline_timelineevent_id FOREIGN KEY (event_id) REFERENCES public.dreameventstimeline_timelineevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelea_organisation_id_e98c4aee_fk_dreamuserdb_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_skill
    ADD CONSTRAINT lifelea_organisation_id_e98c4aee_fk_dreamuserdb_organisation_id FOREIGN KEY (organisation_id) REFERENCES public.dreamuserdb_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelear_wallet_id_ef193550_fk_lifelearncoins_lifecoinwallet_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearncoins_lifecointransaction
    ADD CONSTRAINT lifelear_wallet_id_ef193550_fk_lifelearncoins_lifecoinwallet_id FOREIGN KEY (wallet_id) REFERENCES public.lifelearncoins_lifecoinwallet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearn_agpa_user_id_e0daefa5_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_agpaiiregistrationform
    ADD CONSTRAINT lifelearn_agpa_user_id_e0daefa5_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearn_fil_owner_id_e9e20acd_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_filecontent
    ADD CONSTRAINT lifelearn_fil_owner_id_e9e20acd_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearn_filecont_content_id_1111604e_fk_dreamdiary_content_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_filecontent
    ADD CONSTRAINT lifelearn_filecont_content_id_1111604e_fk_dreamdiary_content_id FOREIGN KEY (content_id) REFERENCES public.dreamdiary_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearn_user_user_id_4477e6d0_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_userprofile
    ADD CONSTRAINT lifelearn_user_user_id_4477e6d0_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearn_user_user_id_d356fac4_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_usercoursebadge_users
    ADD CONSTRAINT lifelearn_user_user_id_d356fac4_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearn_usercourse_course_id_5cf80dff_fk_dreamdiary_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearn_usercoursebadge
    ADD CONSTRAINT lifelearn_usercourse_course_id_5cf80dff_fk_dreamdiary_course_id FOREIGN KEY (course_id) REFERENCES public.dreamdiary_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearncoins_user_id_e7a143ee_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearncoins_lifecoinwallet
    ADD CONSTRAINT lifelearncoins_user_id_e7a143ee_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearnpushnot_event_id_f03e1989_fk_dreammessaging_message_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnpushnotifications_eventcreatednotification
    ADD CONSTRAINT lifelearnpushnot_event_id_f03e1989_fk_dreammessaging_message_id FOREIGN KEY (event_id) REFERENCES public.dreammessaging_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearnskill_user_id_e47d7005_fk_dreamuserdb_user_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_point
    ADD CONSTRAINT lifelearnskill_user_id_e47d7005_fk_dreamuserdb_user_user_ptr_id FOREIGN KEY (user_id) REFERENCES public.dreamuserdb_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearnskills_p_skill_id_c26e8e26_fk_lifelearnskills_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_point
    ADD CONSTRAINT lifelearnskills_p_skill_id_c26e8e26_fk_lifelearnskills_skill_id FOREIGN KEY (skill_id) REFERENCES public.lifelearnskills_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearnskills_poin_course_id_9b92126c_fk_dreamdiary_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_point
    ADD CONSTRAINT lifelearnskills_poin_course_id_9b92126c_fk_dreamdiary_course_id FOREIGN KEY (course_id) REFERENCES public.dreamdiary_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearnskills_point_event_id_0eb5bf53_fk_dreamevents_event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_point
    ADD CONSTRAINT lifelearnskills_point_event_id_0eb5bf53_fk_dreamevents_event_id FOREIGN KEY (event_id) REFERENCES public.dreamevents_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearnskills_s_skill_id_83bf76f5_fk_lifelearnskills_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_skill_courses
    ADD CONSTRAINT lifelearnskills_s_skill_id_83bf76f5_fk_lifelearnskills_skill_id FOREIGN KEY (skill_id) REFERENCES public.lifelearnskills_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lifelearnskills_skil_course_id_2193f672_fk_dreamdiary_course_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifelearnskills_skill_courses
    ADD CONSTRAINT lifelearnskills_skil_course_id_2193f672_fk_dreamdiary_course_id FOREIGN KEY (course_id) REFERENCES public.dreamdiary_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

