PGDMP     .    /            	    {            plant_db    14.9    14.9 #               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    plant_db    DATABASE     e   CREATE DATABASE plant_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1252';
    DROP DATABASE plant_db;
                postgres    false            �            1259    16403    plant    TABLE     m   CREATE TABLE public.plant (
    plant_id integer NOT NULL,
    plant_name character varying(100) NOT NULL
);
    DROP TABLE public.plant;
       public         heap    postgres    false            �            1259    16402    plant_plant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.plant_plant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.plant_plant_id_seq;
       public          postgres    false    212                       0    0    plant_plant_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.plant_plant_id_seq OWNED BY public.plant.plant_id;
          public          postgres    false    211            �            1259    16396 	   plantuser    TABLE     �   CREATE TABLE public.plantuser (
    user_id integer NOT NULL,
    user_name character varying(30) NOT NULL,
    user_surname character varying(30) NOT NULL
);
    DROP TABLE public.plantuser;
       public         heap    postgres    false            �            1259    16410 
   user_plant    TABLE     �   CREATE TABLE public.user_plant (
    user_plant_id integer NOT NULL,
    user_id integer NOT NULL,
    plant_id integer NOT NULL
);
    DROP TABLE public.user_plant;
       public         heap    postgres    false            �            1259    16409    user_plant_user_plant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_plant_user_plant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.user_plant_user_plant_id_seq;
       public          postgres    false    214                       0    0    user_plant_user_plant_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.user_plant_user_plant_id_seq OWNED BY public.user_plant.user_plant_id;
          public          postgres    false    213            �            1259    16395    user_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public          postgres    false    210                       0    0    user_user_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.user_user_id_seq OWNED BY public.plantuser.user_id;
          public          postgres    false    209            �            1259    16417    watering_schedule    TABLE     �   CREATE TABLE public.watering_schedule (
    watering_id integer NOT NULL,
    user_plant_id integer NOT NULL,
    watering_time timestamp(0) without time zone
);
 %   DROP TABLE public.watering_schedule;
       public         heap    postgres    false            �            1259    16416 !   watering_schedule_watering_id_seq    SEQUENCE     �   CREATE SEQUENCE public.watering_schedule_watering_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.watering_schedule_watering_id_seq;
       public          postgres    false    216                       0    0 !   watering_schedule_watering_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.watering_schedule_watering_id_seq OWNED BY public.watering_schedule.watering_id;
          public          postgres    false    215            l           2604    16406    plant plant_id    DEFAULT     p   ALTER TABLE ONLY public.plant ALTER COLUMN plant_id SET DEFAULT nextval('public.plant_plant_id_seq'::regclass);
 =   ALTER TABLE public.plant ALTER COLUMN plant_id DROP DEFAULT;
       public          postgres    false    211    212    212            k           2604    16399    plantuser user_id    DEFAULT     q   ALTER TABLE ONLY public.plantuser ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);
 @   ALTER TABLE public.plantuser ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    210    209    210            m           2604    16413    user_plant user_plant_id    DEFAULT     �   ALTER TABLE ONLY public.user_plant ALTER COLUMN user_plant_id SET DEFAULT nextval('public.user_plant_user_plant_id_seq'::regclass);
 G   ALTER TABLE public.user_plant ALTER COLUMN user_plant_id DROP DEFAULT;
       public          postgres    false    214    213    214            n           2604    16420    watering_schedule watering_id    DEFAULT     �   ALTER TABLE ONLY public.watering_schedule ALTER COLUMN watering_id SET DEFAULT nextval('public.watering_schedule_watering_id_seq'::regclass);
 L   ALTER TABLE public.watering_schedule ALTER COLUMN watering_id DROP DEFAULT;
       public          postgres    false    216    215    216                      0    16403    plant 
   TABLE DATA           5   COPY public.plant (plant_id, plant_name) FROM stdin;
    public          postgres    false    212   <'                 0    16396 	   plantuser 
   TABLE DATA           E   COPY public.plantuser (user_id, user_name, user_surname) FROM stdin;
    public          postgres    false    210   n'       
          0    16410 
   user_plant 
   TABLE DATA           F   COPY public.user_plant (user_plant_id, user_id, plant_id) FROM stdin;
    public          postgres    false    214   �'                 0    16417    watering_schedule 
   TABLE DATA           V   COPY public.watering_schedule (watering_id, user_plant_id, watering_time) FROM stdin;
    public          postgres    false    216   �'                  0    0    plant_plant_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.plant_plant_id_seq', 1, false);
          public          postgres    false    211                       0    0    user_plant_user_plant_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.user_plant_user_plant_id_seq', 6, true);
          public          postgres    false    213                       0    0    user_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_user_id_seq', 1, false);
          public          postgres    false    209                       0    0 !   watering_schedule_watering_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.watering_schedule_watering_id_seq', 6, true);
          public          postgres    false    215            r           2606    16408    plant plant_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.plant
    ADD CONSTRAINT plant_pkey PRIMARY KEY (plant_id);
 :   ALTER TABLE ONLY public.plant DROP CONSTRAINT plant_pkey;
       public            postgres    false    212            p           2606    16401    plantuser user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.plantuser
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 =   ALTER TABLE ONLY public.plantuser DROP CONSTRAINT user_pkey;
       public            postgres    false    210            t           2606    16415    user_plant user_plant_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.user_plant
    ADD CONSTRAINT user_plant_pkey PRIMARY KEY (user_plant_id);
 D   ALTER TABLE ONLY public.user_plant DROP CONSTRAINT user_plant_pkey;
       public            postgres    false    214            v           2606    16422 (   watering_schedule watering_schedule_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.watering_schedule
    ADD CONSTRAINT watering_schedule_pkey PRIMARY KEY (watering_id);
 R   ALTER TABLE ONLY public.watering_schedule DROP CONSTRAINT watering_schedule_pkey;
       public            postgres    false    216            x           2606    16428    user_plant plant_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_plant
    ADD CONSTRAINT "plant_FK" FOREIGN KEY (plant_id) REFERENCES public.plant(plant_id) NOT VALID;
 ?   ALTER TABLE ONLY public.user_plant DROP CONSTRAINT "plant_FK";
       public          postgres    false    212    3186    214            w           2606    16423    user_plant user_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_plant
    ADD CONSTRAINT "user_FK" FOREIGN KEY (user_id) REFERENCES public.plantuser(user_id) NOT VALID;
 >   ALTER TABLE ONLY public.user_plant DROP CONSTRAINT "user_FK";
       public          postgres    false    3184    214    210            y           2606    16433    watering_schedule user_plant_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.watering_schedule
    ADD CONSTRAINT "user_plant_FK" FOREIGN KEY (user_plant_id) REFERENCES public.user_plant(user_plant_id) NOT VALID;
 K   ALTER TABLE ONLY public.watering_schedule DROP CONSTRAINT "user_plant_FK";
       public          postgres    false    214    3188    216               "   x�3���̩�2��,�,�2��/N����� Z�?         '   x�3�t�+���(-����2�K,����q��qqq 
A      
      x�3�4�4�2��\F���F\1z\\\ !�         C   x�3�4�4202�5��50T04�2 !.C4q#���!V��h�0�&�Fq#��)��%T<F��� y�{     