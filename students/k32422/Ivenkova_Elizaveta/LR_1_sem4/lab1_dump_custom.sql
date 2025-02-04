PGDMP     %    .                {            Session    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    Session    DATABASE     }   CREATE DATABASE "Session" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.utf8';
    DROP DATABASE "Session";
                postgres    false                        2615    16399    session    SCHEMA        CREATE SCHEMA session;
    DROP SCHEMA session;
                postgres    false            �           1247    16664    attestation_type    TYPE     �   CREATE TYPE session.attestation_type AS ENUM (
    'Экзамен',
    'Зачет',
    'Дифференцированный зачет'
);
 $   DROP TYPE session.attestation_type;
       session          postgres    false    6            �           1247    16654    classroom_type    TYPE     �   CREATE TYPE session.classroom_type AS ENUM (
    'Лекционная',
    'Лаборатория',
    'Практическая',
    'Другое'
);
 "   DROP TYPE session.classroom_type;
       session          postgres    false    6            �           1247    16638    learning_type    TYPE     |   CREATE TYPE session.learning_type AS ENUM (
    'Очный',
    'Дистанционный',
    'Смешанный'
);
 !   DROP TYPE session.learning_type;
       session          postgres    false    6            �           0    0    TYPE learning_type    COMMENT     H   COMMENT ON TYPE session.learning_type IS 'Форма обучения';
          session          postgres    false    915            �           1247    17497    qualification    TYPE     �   CREATE TYPE session.qualification AS ENUM (
    'Бакалавр',
    'Магистр',
    'Специалист',
    'Исследователь'
);
 !   DROP TYPE session.qualification;
       session          postgres    false    6            �           1247    16676    status    TYPE     �   CREATE TYPE session.status AS ENUM (
    'Обучается',
    'Академ',
    'Отчислен',
    'Восстановлен',
    'Выпускник'
);
    DROP TYPE session.status;
       session          postgres    false    6            �            1259    16493    attestation    TABLE     #  CREATE TABLE session.attestation (
    grade integer NOT NULL,
    attestation_date date NOT NULL,
    teacher_id integer NOT NULL,
    edu_plan_subject_id integer NOT NULL,
    student_in_group_id integer NOT NULL,
    attempt_count integer NOT NULL,
    attestation_id integer NOT NULL
);
     DROP TABLE session.attestation;
       session         heap    postgres    false    6            �           0    0    TABLE attestation    COMMENT     @   COMMENT ON TABLE session.attestation IS 'Аттестация';
          session          postgres    false    233            �            1259    16530    attestation_attestation_id_seq    SEQUENCE     �   CREATE SEQUENCE session.attestation_attestation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE session.attestation_attestation_id_seq;
       session          postgres    false    233    6            �           0    0    attestation_attestation_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE session.attestation_attestation_id_seq OWNED BY session.attestation.attestation_id;
          session          postgres    false    241            �            1259    16498    attestation_timetable    TABLE     '  CREATE TABLE session.attestation_timetable (
    group_id integer NOT NULL,
    edu_plan_subject_id integer NOT NULL,
    classroom_id integer NOT NULL,
    exam_date date NOT NULL,
    teacher_id integer NOT NULL,
    attestation_timetable_id integer NOT NULL,
    semester integer NOT NULL
);
 *   DROP TABLE session.attestation_timetable;
       session         heap    postgres    false    6            �           0    0    TABLE attestation_timetable    COMMENT     W   COMMENT ON TABLE session.attestation_timetable IS 'Расписание сессии';
          session          postgres    false    234            �            1259    16537 2   attestation_timetable_attestation_timetable_id_seq    SEQUENCE     �   CREATE SEQUENCE session.attestation_timetable_attestation_timetable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE session.attestation_timetable_attestation_timetable_id_seq;
       session          postgres    false    234    6            �           0    0 2   attestation_timetable_attestation_timetable_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE session.attestation_timetable_attestation_timetable_id_seq OWNED BY session.attestation_timetable.attestation_timetable_id;
          session          postgres    false    242            �            1259    16437    building    TABLE     �   CREATE TABLE session.building (
    building_id integer NOT NULL,
    address character varying(50) NOT NULL,
    building_name character varying(10) NOT NULL
);
    DROP TABLE session.building;
       session         heap    postgres    false    6            �           0    0    TABLE building    COMMENT     5   COMMENT ON TABLE session.building IS 'Корпус';
          session          postgres    false    219            �            1259    16436    building_building_id_seq    SEQUENCE     �   CREATE SEQUENCE session.building_building_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE session.building_building_id_seq;
       session          postgres    false    219    6            �           0    0    building_building_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE session.building_building_id_seq OWNED BY session.building.building_id;
          session          postgres    false    218            �            1259    16450 	   classroom    TABLE     �   CREATE TABLE session.classroom (
    classroom_id integer NOT NULL,
    capacity integer NOT NULL,
    room integer NOT NULL,
    building_id integer NOT NULL,
    classroom_type session.classroom_type NOT NULL
);
    DROP TABLE session.classroom;
       session         heap    postgres    false    918    6            �           0    0    TABLE classroom    COMMENT     <   COMMENT ON TABLE session.classroom IS 'Аудитория';
          session          postgres    false    222            �            1259    16453    classroom_classroom_id_seq    SEQUENCE     �   CREATE SEQUENCE session.classroom_classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE session.classroom_classroom_id_seq;
       session          postgres    false    222    6            �           0    0    classroom_classroom_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE session.classroom_classroom_id_seq OWNED BY session.classroom.classroom_id;
          session          postgres    false    223            �            1259    16431    edu_plan    TABLE     �   CREATE TABLE session.edu_plan (
    plan_id integer NOT NULL,
    program_id integer NOT NULL,
    start_year integer NOT NULL,
    learning_type session.learning_type NOT NULL
);
    DROP TABLE session.edu_plan;
       session         heap    postgres    false    6    915            �           0    0    TABLE edu_plan    COMMENT     @   COMMENT ON TABLE session.edu_plan IS 'Учебный план';
          session          postgres    false    217            �            1259    16468    edu_plan_subject    TABLE     �   CREATE TABLE session.edu_plan_subject (
    edu_plan_subject_id integer NOT NULL,
    subject_id integer NOT NULL,
    edu_plan_id integer NOT NULL,
    semester integer[] NOT NULL
);
 %   DROP TABLE session.edu_plan_subject;
       session         heap    postgres    false    6            �           0    0    TABLE edu_plan_subject    COMMENT     b   COMMENT ON TABLE session.edu_plan_subject IS 'Дисциплина в учебном плане';
          session          postgres    false    227            �            1259    16467 (   edu_plan_subject_edu_plan_subject_id_seq    SEQUENCE     �   CREATE SEQUENCE session.edu_plan_subject_edu_plan_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE session.edu_plan_subject_edu_plan_subject_id_seq;
       session          postgres    false    6    227            �           0    0 (   edu_plan_subject_edu_plan_subject_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE session.edu_plan_subject_edu_plan_subject_id_seq OWNED BY session.edu_plan_subject.edu_plan_subject_id;
          session          postgres    false    226            �            1259    16407    edu_program    TABLE     �   CREATE TABLE session.edu_program (
    track_id integer NOT NULL,
    program_id integer NOT NULL,
    name character varying(140) NOT NULL
);
     DROP TABLE session.edu_program;
       session         heap    postgres    false    6            �           0    0    TABLE edu_program    COMMENT     ]   COMMENT ON TABLE session.edu_program IS 'Образовательная программа';
          session          postgres    false    216            �            1259    16544    edu_program_program_id_seq    SEQUENCE     �   CREATE SEQUENCE session.edu_program_program_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE session.edu_program_program_id_seq;
       session          postgres    false    216    6            �           0    0    edu_program_program_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE session.edu_program_program_id_seq OWNED BY session.edu_program.program_id;
          session          postgres    false    243            �            1259    16400 	   edu_track    TABLE     �   CREATE TABLE session.edu_track (
    track_id integer NOT NULL,
    name character varying(140) NOT NULL,
    track_code character varying(20),
    qualification session.qualification
);
    DROP TABLE session.edu_track;
       session         heap    postgres    false    6    927            �           0    0    TABLE edu_track    COMMENT     U   COMMENT ON TABLE session.edu_track IS 'Направление подготовки';
          session          postgres    false    215            �            1259    16553    edu_track_track_id_seq    SEQUENCE     �   CREATE SEQUENCE session.edu_track_track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE session.edu_track_track_id_seq;
       session          postgres    false    6    215            �           0    0    edu_track_track_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE session.edu_track_track_id_seq OWNED BY session.edu_track.track_id;
          session          postgres    false    244            �            1259    16444    faculty    TABLE     �   CREATE TABLE session.faculty (
    faculty_id integer NOT NULL,
    building_id integer NOT NULL,
    faculty_name character varying(50) NOT NULL
);
    DROP TABLE session.faculty;
       session         heap    postgres    false    6            �           0    0    TABLE faculty    COMMENT     K   COMMENT ON TABLE session.faculty IS 'Подразделение вуза';
          session          postgres    false    221            �            1259    16443    faculty_faculty_id_seq    SEQUENCE     �   CREATE SEQUENCE session.faculty_faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE session.faculty_faculty_id_seq;
       session          postgres    false    6    221            �           0    0    faculty_faculty_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE session.faculty_faculty_id_seq OWNED BY session.faculty.faculty_id;
          session          postgres    false    220            �            1259    16522    group    TABLE     �   CREATE TABLE session."group" (
    group_id integer NOT NULL,
    study_year integer NOT NULL,
    group_name character varying(10) NOT NULL,
    semester integer NOT NULL,
    edu_plan_id integer NOT NULL
);
    DROP TABLE session."group";
       session         heap    postgres    false    6            �            1259    16521    group_group_id_seq    SEQUENCE     �   CREATE SEQUENCE session.group_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE session.group_group_id_seq;
       session          postgres    false    6    240            �           0    0    group_group_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE session.group_group_id_seq OWNED BY session."group".group_id;
          session          postgres    false    239            �            1259    16514    scholarship_payments    TABLE     �   CREATE TABLE session.scholarship_payments (
    student_id integer NOT NULL,
    scholarship_id integer NOT NULL,
    paid_scholarship_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
);
 )   DROP TABLE session.scholarship_payments;
       session         heap    postgres    false    6            �           0    0    TABLE scholarship_payments    COMMENT     P   COMMENT ON TABLE session.scholarship_payments IS 'История выплат';
          session          postgres    false    238            �            1259    16513 ,   scholarship_payments_paid_scholarship_id_seq    SEQUENCE     �   CREATE SEQUENCE session.scholarship_payments_paid_scholarship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE session.scholarship_payments_paid_scholarship_id_seq;
       session          postgres    false    238    6            �           0    0 ,   scholarship_payments_paid_scholarship_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE session.scholarship_payments_paid_scholarship_id_seq OWNED BY session.scholarship_payments.paid_scholarship_id;
          session          postgres    false    237            �            1259    16503    scholarship_type    TABLE     �   CREATE TABLE session.scholarship_type (
    scholarship_id integer NOT NULL,
    scholarship_type character varying(30) NOT NULL,
    amount integer NOT NULL
);
 %   DROP TABLE session.scholarship_type;
       session         heap    postgres    false    6            �           0    0    TABLE scholarship_type    COMMENT     J   COMMENT ON TABLE session.scholarship_type IS 'Тип стипендии';
          session          postgres    false    235            �            1259    16506 #   scholarship_type_scholarship_id_seq    SEQUENCE     �   CREATE SEQUENCE session.scholarship_type_scholarship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE session.scholarship_type_scholarship_id_seq;
       session          postgres    false    235    6            �           0    0 #   scholarship_type_scholarship_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE session.scholarship_type_scholarship_id_seq OWNED BY session.scholarship_type.scholarship_id;
          session          postgres    false    236            �            1259    16475    student    TABLE     �   CREATE TABLE session.student (
    surname character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    patronymic character varying(30),
    student_id integer NOT NULL
);
    DROP TABLE session.student;
       session         heap    postgres    false    6            �           0    0    TABLE student    COMMENT     6   COMMENT ON TABLE session.student IS 'Студент';
          session          postgres    false    229            �            1259    16481    student_in_group    TABLE     �   CREATE TABLE session.student_in_group (
    start_date date,
    end_date date NOT NULL,
    student_id integer NOT NULL,
    student_in_group_id integer NOT NULL,
    status session.status NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE session.student_in_group;
       session         heap    postgres    false    6    924            �           0    0    TABLE student_in_group    COMMENT     O   COMMENT ON TABLE session.student_in_group IS 'Студент в группе';
          session          postgres    false    230            �            1259    16474    student_student_id_seq    SEQUENCE     �   CREATE SEQUENCE session.student_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE session.student_student_id_seq;
       session          postgres    false    6    229            �           0    0    student_student_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE session.student_student_id_seq OWNED BY session.student.student_id;
          session          postgres    false    228            �            1259    16461    subject    TABLE     =  CREATE TABLE session.subject (
    subject_id integer NOT NULL,
    subject_name character varying(30) NOT NULL,
    lecture_hours integer NOT NULL,
    practice_hours integer NOT NULL,
    lab_hours integer NOT NULL,
    edu_practice_hours integer NOT NULL,
    attestation_type session.attestation_type NOT NULL
);
    DROP TABLE session.subject;
       session         heap    postgres    false    6    921            �           0    0    TABLE subject    COMMENT     <   COMMENT ON TABLE session.subject IS 'Дисциплина';
          session          postgres    false    225            �            1259    16460    subject_subject_id_seq    SEQUENCE     �   CREATE SEQUENCE session.subject_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE session.subject_subject_id_seq;
       session          postgres    false    225    6            �           0    0    subject_subject_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE session.subject_subject_id_seq OWNED BY session.subject.subject_id;
          session          postgres    false    224            �            1259    16487    teacher    TABLE       CREATE TABLE session.teacher (
    teacher_id integer NOT NULL,
    surname character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    patronymic character varying(30),
    "position" character varying(30) NOT NULL,
    faculty_id integer NOT NULL
);
    DROP TABLE session.teacher;
       session         heap    postgres    false    6            �           0    0    TABLE teacher    COMMENT     B   COMMENT ON TABLE session.teacher IS 'Преподаватель';
          session          postgres    false    232            �            1259    16486    teacher_teacher_id_seq    SEQUENCE     �   CREATE SEQUENCE session.teacher_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE session.teacher_teacher_id_seq;
       session          postgres    false    6    232            �           0    0    teacher_teacher_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE session.teacher_teacher_id_seq OWNED BY session.teacher.teacher_id;
          session          postgres    false    231            �           2604    17214    attestation attestation_id    DEFAULT     �   ALTER TABLE ONLY session.attestation ALTER COLUMN attestation_id SET DEFAULT nextval('session.attestation_attestation_id_seq'::regclass);
 J   ALTER TABLE session.attestation ALTER COLUMN attestation_id DROP DEFAULT;
       session          postgres    false    241    233            �           2604    17215 .   attestation_timetable attestation_timetable_id    DEFAULT     �   ALTER TABLE ONLY session.attestation_timetable ALTER COLUMN attestation_timetable_id SET DEFAULT nextval('session.attestation_timetable_attestation_timetable_id_seq'::regclass);
 ^   ALTER TABLE session.attestation_timetable ALTER COLUMN attestation_timetable_id DROP DEFAULT;
       session          postgres    false    242    234            �           2604    17216    building building_id    DEFAULT     ~   ALTER TABLE ONLY session.building ALTER COLUMN building_id SET DEFAULT nextval('session.building_building_id_seq'::regclass);
 D   ALTER TABLE session.building ALTER COLUMN building_id DROP DEFAULT;
       session          postgres    false    218    219    219            �           2604    17217    classroom classroom_id    DEFAULT     �   ALTER TABLE ONLY session.classroom ALTER COLUMN classroom_id SET DEFAULT nextval('session.classroom_classroom_id_seq'::regclass);
 F   ALTER TABLE session.classroom ALTER COLUMN classroom_id DROP DEFAULT;
       session          postgres    false    223    222            �           2604    17218 $   edu_plan_subject edu_plan_subject_id    DEFAULT     �   ALTER TABLE ONLY session.edu_plan_subject ALTER COLUMN edu_plan_subject_id SET DEFAULT nextval('session.edu_plan_subject_edu_plan_subject_id_seq'::regclass);
 T   ALTER TABLE session.edu_plan_subject ALTER COLUMN edu_plan_subject_id DROP DEFAULT;
       session          postgres    false    226    227    227            �           2604    17219    edu_program program_id    DEFAULT     �   ALTER TABLE ONLY session.edu_program ALTER COLUMN program_id SET DEFAULT nextval('session.edu_program_program_id_seq'::regclass);
 F   ALTER TABLE session.edu_program ALTER COLUMN program_id DROP DEFAULT;
       session          postgres    false    243    216            �           2604    17220    edu_track track_id    DEFAULT     z   ALTER TABLE ONLY session.edu_track ALTER COLUMN track_id SET DEFAULT nextval('session.edu_track_track_id_seq'::regclass);
 B   ALTER TABLE session.edu_track ALTER COLUMN track_id DROP DEFAULT;
       session          postgres    false    244    215            �           2604    17221    faculty faculty_id    DEFAULT     z   ALTER TABLE ONLY session.faculty ALTER COLUMN faculty_id SET DEFAULT nextval('session.faculty_faculty_id_seq'::regclass);
 B   ALTER TABLE session.faculty ALTER COLUMN faculty_id DROP DEFAULT;
       session          postgres    false    220    221    221            �           2604    17222    group group_id    DEFAULT     t   ALTER TABLE ONLY session."group" ALTER COLUMN group_id SET DEFAULT nextval('session.group_group_id_seq'::regclass);
 @   ALTER TABLE session."group" ALTER COLUMN group_id DROP DEFAULT;
       session          postgres    false    239    240    240            �           2604    17223 (   scholarship_payments paid_scholarship_id    DEFAULT     �   ALTER TABLE ONLY session.scholarship_payments ALTER COLUMN paid_scholarship_id SET DEFAULT nextval('session.scholarship_payments_paid_scholarship_id_seq'::regclass);
 X   ALTER TABLE session.scholarship_payments ALTER COLUMN paid_scholarship_id DROP DEFAULT;
       session          postgres    false    238    237    238            �           2604    17224    scholarship_type scholarship_id    DEFAULT     �   ALTER TABLE ONLY session.scholarship_type ALTER COLUMN scholarship_id SET DEFAULT nextval('session.scholarship_type_scholarship_id_seq'::regclass);
 O   ALTER TABLE session.scholarship_type ALTER COLUMN scholarship_id DROP DEFAULT;
       session          postgres    false    236    235            �           2604    17225    student student_id    DEFAULT     z   ALTER TABLE ONLY session.student ALTER COLUMN student_id SET DEFAULT nextval('session.student_student_id_seq'::regclass);
 B   ALTER TABLE session.student ALTER COLUMN student_id DROP DEFAULT;
       session          postgres    false    229    228    229            �           2604    17226    subject subject_id    DEFAULT     z   ALTER TABLE ONLY session.subject ALTER COLUMN subject_id SET DEFAULT nextval('session.subject_subject_id_seq'::regclass);
 B   ALTER TABLE session.subject ALTER COLUMN subject_id DROP DEFAULT;
       session          postgres    false    224    225    225            �           2604    17227    teacher teacher_id    DEFAULT     z   ALTER TABLE ONLY session.teacher ALTER COLUMN teacher_id SET DEFAULT nextval('session.teacher_teacher_id_seq'::regclass);
 B   ALTER TABLE session.teacher ALTER COLUMN teacher_id DROP DEFAULT;
       session          postgres    false    232    231    232            �          0    16493    attestation 
   TABLE DATA                 session          postgres    false    233   @�       �          0    16498    attestation_timetable 
   TABLE DATA                 session          postgres    false    234   3�       �          0    16437    building 
   TABLE DATA                 session          postgres    false    219   ��       �          0    16450 	   classroom 
   TABLE DATA                 session          postgres    false    222   ��       �          0    16431    edu_plan 
   TABLE DATA                 session          postgres    false    217   6�       �          0    16468    edu_plan_subject 
   TABLE DATA                 session          postgres    false    227   m�       �          0    16407    edu_program 
   TABLE DATA                 session          postgres    false    216   T�       �          0    16400 	   edu_track 
   TABLE DATA                 session          postgres    false    215   ��       �          0    16444    faculty 
   TABLE DATA                 session          postgres    false    221   ��       �          0    16522    group 
   TABLE DATA                 session          postgres    false    240   5�       �          0    16514    scholarship_payments 
   TABLE DATA                 session          postgres    false    238   ��       �          0    16503    scholarship_type 
   TABLE DATA                 session          postgres    false    235   �       �          0    16475    student 
   TABLE DATA                 session          postgres    false    229   ��       �          0    16481    student_in_group 
   TABLE DATA                 session          postgres    false    230   ��       �          0    16461    subject 
   TABLE DATA                 session          postgres    false    225   ��       �          0    16487    teacher 
   TABLE DATA                 session          postgres    false    232   �       �           0    0    attestation_attestation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('session.attestation_attestation_id_seq', 224, true);
          session          postgres    false    241            �           0    0 2   attestation_timetable_attestation_timetable_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('session.attestation_timetable_attestation_timetable_id_seq', 30, true);
          session          postgres    false    242            �           0    0    building_building_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('session.building_building_id_seq', 6, true);
          session          postgres    false    218            �           0    0    classroom_classroom_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('session.classroom_classroom_id_seq', 100, true);
          session          postgres    false    223            �           0    0 (   edu_plan_subject_edu_plan_subject_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('session.edu_plan_subject_edu_plan_subject_id_seq', 50, true);
          session          postgres    false    226            �           0    0    edu_program_program_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('session.edu_program_program_id_seq', 18, true);
          session          postgres    false    243            �           0    0    edu_track_track_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session.edu_track_track_id_seq', 7, true);
          session          postgres    false    244            �           0    0    faculty_faculty_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session.faculty_faculty_id_seq', 6, true);
          session          postgres    false    220            �           0    0    group_group_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('session.group_group_id_seq', 20, true);
          session          postgres    false    239            �           0    0 ,   scholarship_payments_paid_scholarship_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('session.scholarship_payments_paid_scholarship_id_seq', 100, true);
          session          postgres    false    237            �           0    0 #   scholarship_type_scholarship_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('session.scholarship_type_scholarship_id_seq', 5, true);
          session          postgres    false    236            �           0    0    student_student_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('session.student_student_id_seq', 100, true);
          session          postgres    false    228            �           0    0    subject_subject_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('session.subject_subject_id_seq', 18, true);
          session          postgres    false    224            �           0    0    teacher_teacher_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('session.teacher_teacher_id_seq', 37, true);
          session          postgres    false    231            �           2606    16687    attestation attempt count check    CHECK CONSTRAINT     �   ALTER TABLE session.attestation
    ADD CONSTRAINT "attempt count check" CHECK (((attempt_count >= 0) AND (attempt_count <= 3))) NOT VALID;
 G   ALTER TABLE session.attestation DROP CONSTRAINT "attempt count check";
       session          postgres    false    233    233            �           2606    16536    attestation attestation_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY session.attestation
    ADD CONSTRAINT attestation_pkey PRIMARY KEY (attestation_id);
 G   ALTER TABLE ONLY session.attestation DROP CONSTRAINT attestation_pkey;
       session            postgres    false    233            �           2606    16543 0   attestation_timetable attestation_timetable_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY session.attestation_timetable
    ADD CONSTRAINT attestation_timetable_pkey PRIMARY KEY (attestation_timetable_id);
 [   ALTER TABLE ONLY session.attestation_timetable DROP CONSTRAINT attestation_timetable_pkey;
       session            postgres    false    234            �           2606    16442    building building_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY session.building
    ADD CONSTRAINT building_pkey PRIMARY KEY (building_id);
 A   ALTER TABLE ONLY session.building DROP CONSTRAINT building_pkey;
       session            postgres    false    219            �           2606    16652    classroom capacity  check    CHECK CONSTRAINT        ALTER TABLE session.classroom
    ADD CONSTRAINT "capacity  check" CHECK (((capacity >= 0) AND (capacity <= 1000))) NOT VALID;
 A   ALTER TABLE session.classroom DROP CONSTRAINT "capacity  check";
       session          postgres    false    222    222            �           2606    17525    scholarship_type check amount    CHECK CONSTRAINT        ALTER TABLE session.scholarship_type
    ADD CONSTRAINT "check amount" CHECK (((amount > 0) AND (amount <= 25000))) NOT VALID;
 E   ALTER TABLE session.scholarship_type DROP CONSTRAINT "check amount";
       session          postgres    false    235    235            �           2606    16685    student_in_group check dates    CHECK CONSTRAINT     q   ALTER TABLE session.student_in_group
    ADD CONSTRAINT "check dates" CHECK ((start_date < end_date)) NOT VALID;
 D   ALTER TABLE session.student_in_group DROP CONSTRAINT "check dates";
       session          postgres    false    230    230    230    230            �           2606    16690     scholarship_payments check dates    CHECK CONSTRAINT     u   ALTER TABLE session.scholarship_payments
    ADD CONSTRAINT "check dates" CHECK ((start_date < end_date)) NOT VALID;
 H   ALTER TABLE session.scholarship_payments DROP CONSTRAINT "check dates";
       session          postgres    false    238    238    238    238            �           2606    17522    attestation check_grade    CHECK CONSTRAINT     t   ALTER TABLE session.attestation
    ADD CONSTRAINT check_grade CHECK (((grade >= 0) AND (grade <= 103))) NOT VALID;
 =   ALTER TABLE session.attestation DROP CONSTRAINT check_grade;
       session          postgres    false    233    233            �           2606    16459    classroom classroom_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY session.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (classroom_id);
 C   ALTER TABLE ONLY session.classroom DROP CONSTRAINT classroom_pkey;
       session            postgres    false    222            �           2606    16674     subject edu practice hours check    CHECK CONSTRAINT     v   ALTER TABLE session.subject
    ADD CONSTRAINT "edu practice hours check" CHECK ((edu_practice_hours > 0)) NOT VALID;
 H   ALTER TABLE session.subject DROP CONSTRAINT "edu practice hours check";
       session          postgres    false    225    225            �           2606    16435    edu_plan edu_plan_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY session.edu_plan
    ADD CONSTRAINT edu_plan_pkey PRIMARY KEY (plan_id);
 A   ALTER TABLE ONLY session.edu_plan DROP CONSTRAINT edu_plan_pkey;
       session            postgres    false    217            �           2606    16473 &   edu_plan_subject edu_plan_subject_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY session.edu_plan_subject
    ADD CONSTRAINT edu_plan_subject_pkey PRIMARY KEY (edu_plan_subject_id);
 Q   ALTER TABLE ONLY session.edu_plan_subject DROP CONSTRAINT edu_plan_subject_pkey;
       session            postgres    false    227            �           2606    16552    edu_program edu_program_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY session.edu_program
    ADD CONSTRAINT edu_program_pkey PRIMARY KEY (program_id);
 G   ALTER TABLE ONLY session.edu_program DROP CONSTRAINT edu_program_pkey;
       session            postgres    false    216            �           2606    16561    edu_track edu_track_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY session.edu_track
    ADD CONSTRAINT edu_track_pkey PRIMARY KEY (track_id);
 C   ALTER TABLE ONLY session.edu_track DROP CONSTRAINT edu_track_pkey;
       session            postgres    false    215            �           2606    16449    faculty faculty_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY session.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (faculty_id);
 ?   ALTER TABLE ONLY session.faculty DROP CONSTRAINT faculty_pkey;
       session            postgres    false    221            �           2606    16527    group group_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY session."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (group_id);
 =   ALTER TABLE ONLY session."group" DROP CONSTRAINT group_pkey;
       session            postgres    false    240            �           2606    16673    subject labs hours check    CHECK CONSTRAINT     e   ALTER TABLE session.subject
    ADD CONSTRAINT "labs hours check" CHECK ((lab_hours > 0)) NOT VALID;
 @   ALTER TABLE session.subject DROP CONSTRAINT "labs hours check";
       session          postgres    false    225    225            �           2606    16671    subject lecture hours check    CHECK CONSTRAINT     l   ALTER TABLE session.subject
    ADD CONSTRAINT "lecture hours check" CHECK ((lecture_hours > 0)) NOT VALID;
 C   ALTER TABLE session.subject DROP CONSTRAINT "lecture hours check";
       session          postgres    false    225    225            �           2606    16672    subject practice hours check    CHECK CONSTRAINT     n   ALTER TABLE session.subject
    ADD CONSTRAINT "practice hours check" CHECK ((practice_hours > 0)) NOT VALID;
 D   ALTER TABLE session.subject DROP CONSTRAINT "practice hours check";
       session          postgres    false    225    225            �           2606    17523    classroom room number check    CHECK CONSTRAINT     y   ALTER TABLE session.classroom
    ADD CONSTRAINT "room number check" CHECK (((room > 0) AND (room <= 10000))) NOT VALID;
 C   ALTER TABLE session.classroom DROP CONSTRAINT "room number check";
       session          postgres    false    222    222            �           2606    16519 .   scholarship_payments scholarship_payments_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY session.scholarship_payments
    ADD CONSTRAINT scholarship_payments_pkey PRIMARY KEY (paid_scholarship_id);
 Y   ALTER TABLE ONLY session.scholarship_payments DROP CONSTRAINT scholarship_payments_pkey;
       session            postgres    false    238            �           2606    16512 &   scholarship_type scholarship_type_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY session.scholarship_type
    ADD CONSTRAINT scholarship_type_pkey PRIMARY KEY (scholarship_id);
 Q   ALTER TABLE ONLY session.scholarship_type DROP CONSTRAINT scholarship_type_pkey;
       session            postgres    false    235            �           2606    16645    edu_plan start year constraint    CHECK CONSTRAINT     o   ALTER TABLE session.edu_plan
    ADD CONSTRAINT "start year constraint" CHECK ((start_year > 1899)) NOT VALID;
 F   ALTER TABLE session.edu_plan DROP CONSTRAINT "start year constraint";
       session          postgres    false    217    217            �           2606    16529 &   student_in_group student_in_group_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY session.student_in_group
    ADD CONSTRAINT student_in_group_pkey PRIMARY KEY (student_in_group_id);
 Q   ALTER TABLE ONLY session.student_in_group DROP CONSTRAINT student_in_group_pkey;
       session            postgres    false    230            �           2606    16480    student student_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY session.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);
 ?   ALTER TABLE ONLY session.student DROP CONSTRAINT student_pkey;
       session            postgres    false    229            �           2606    16466    subject subject_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY session.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (subject_id);
 ?   ALTER TABLE ONLY session.subject DROP CONSTRAINT subject_pkey;
       session            postgres    false    225            �           2606    16492    teacher teacher_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY session.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacher_id);
 ?   ALTER TABLE ONLY session.teacher DROP CONSTRAINT teacher_pkey;
       session            postgres    false    232            �           2606    16572    classroom building    FK CONSTRAINT     �   ALTER TABLE ONLY session.classroom
    ADD CONSTRAINT building FOREIGN KEY (building_id) REFERENCES session.building(building_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 =   ALTER TABLE ONLY session.classroom DROP CONSTRAINT building;
       session          postgres    false    219    222    3295            �           2606    17517    faculty building_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.faculty
    ADD CONSTRAINT building_id FOREIGN KEY (building_id) REFERENCES session.building(building_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 >   ALTER TABLE ONLY session.faculty DROP CONSTRAINT building_id;
       session          postgres    false    3295    219    221                       2606    16617 "   attestation_timetable classroom_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.attestation_timetable
    ADD CONSTRAINT classroom_id FOREIGN KEY (classroom_id) REFERENCES session.classroom(classroom_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 M   ALTER TABLE ONLY session.attestation_timetable DROP CONSTRAINT classroom_id;
       session          postgres    false    3299    222    234            �           2606    17483    edu_plan_subject edu_plan_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.edu_plan_subject
    ADD CONSTRAINT edu_plan_id FOREIGN KEY (edu_plan_id) REFERENCES session.edu_plan(plan_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 G   ALTER TABLE ONLY session.edu_plan_subject DROP CONSTRAINT edu_plan_id;
       session          postgres    false    227    3293    217            
           2606    17529    group edu_plan_id    FK CONSTRAINT     �   ALTER TABLE ONLY session."group"
    ADD CONSTRAINT edu_plan_id FOREIGN KEY (edu_plan_id) REFERENCES session.edu_plan(plan_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 >   ALTER TABLE ONLY session."group" DROP CONSTRAINT edu_plan_id;
       session          postgres    false    240    3293    217                       2606    16597    attestation edu_plan_subject_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.attestation
    ADD CONSTRAINT edu_plan_subject_id FOREIGN KEY (edu_plan_subject_id) REFERENCES session.edu_plan_subject(edu_plan_subject_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 J   ALTER TABLE ONLY session.attestation DROP CONSTRAINT edu_plan_subject_id;
       session          postgres    false    3303    227    233                       2606    17512 )   attestation_timetable edu_plan_subject_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.attestation_timetable
    ADD CONSTRAINT edu_plan_subject_id FOREIGN KEY (edu_plan_subject_id) REFERENCES session.edu_plan_subject(edu_plan_subject_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 T   ALTER TABLE ONLY session.attestation_timetable DROP CONSTRAINT edu_plan_subject_id;
       session          postgres    false    3303    234    227            �           2606    16567    edu_plan edu_program    FK CONSTRAINT     �   ALTER TABLE ONLY session.edu_plan
    ADD CONSTRAINT edu_program FOREIGN KEY (program_id) REFERENCES session.edu_program(program_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 ?   ALTER TABLE ONLY session.edu_plan DROP CONSTRAINT edu_program;
       session          postgres    false    217    216    3291                        2606    16587    teacher faculty    FK CONSTRAINT     �   ALTER TABLE ONLY session.teacher
    ADD CONSTRAINT faculty FOREIGN KEY (faculty_id) REFERENCES session.faculty(faculty_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 :   ALTER TABLE ONLY session.teacher DROP CONSTRAINT faculty;
       session          postgres    false    221    232    3297                       2606    16607    attestation_timetable group_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.attestation_timetable
    ADD CONSTRAINT group_id FOREIGN KEY (group_id) REFERENCES session."group"(group_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 I   ALTER TABLE ONLY session.attestation_timetable DROP CONSTRAINT group_id;
       session          postgres    false    240    3319    234            �           2606    17488    student_in_group group_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.student_in_group
    ADD CONSTRAINT group_id FOREIGN KEY (group_id) REFERENCES session."group"(group_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 D   ALTER TABLE ONLY session.student_in_group DROP CONSTRAINT group_id;
       session          postgres    false    230    3319    240                       2606    16632 #   scholarship_payments scholarship_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.scholarship_payments
    ADD CONSTRAINT scholarship_id FOREIGN KEY (scholarship_id) REFERENCES session.scholarship_type(scholarship_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY session.scholarship_payments DROP CONSTRAINT scholarship_id;
       session          postgres    false    235    238    3315            �           2606    16582    student_in_group student_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.student_in_group
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES session.student(student_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 F   ALTER TABLE ONLY session.student_in_group DROP CONSTRAINT student_id;
       session          postgres    false    3305    230    229            	           2606    16627    scholarship_payments student_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.scholarship_payments
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES session.student(student_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 J   ALTER TABLE ONLY session.scholarship_payments DROP CONSTRAINT student_id;
       session          postgres    false    229    238    3305                       2606    17507    attestation student_in_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.attestation
    ADD CONSTRAINT student_in_group_id FOREIGN KEY (student_in_group_id) REFERENCES session.student_in_group(student_in_group_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 J   ALTER TABLE ONLY session.attestation DROP CONSTRAINT student_in_group_id;
       session          postgres    false    3307    230    233            �           2606    16577    edu_plan_subject subject_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.edu_plan_subject
    ADD CONSTRAINT subject_id FOREIGN KEY (subject_id) REFERENCES session.subject(subject_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 F   ALTER TABLE ONLY session.edu_plan_subject DROP CONSTRAINT subject_id;
       session          postgres    false    227    3301    225                       2606    16592    attestation teacher_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.attestation
    ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id) REFERENCES session.teacher(teacher_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 A   ALTER TABLE ONLY session.attestation DROP CONSTRAINT teacher_id;
       session          postgres    false    233    3309    232                       2606    16622     attestation_timetable teacher_id    FK CONSTRAINT     �   ALTER TABLE ONLY session.attestation_timetable
    ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id) REFERENCES session.teacher(teacher_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY session.attestation_timetable DROP CONSTRAINT teacher_id;
       session          postgres    false    3309    234    232            �           2606    16562    edu_program track    FK CONSTRAINT     �   ALTER TABLE ONLY session.edu_program
    ADD CONSTRAINT track FOREIGN KEY (track_id) REFERENCES session.edu_track(track_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 <   ALTER TABLE ONLY session.edu_program DROP CONSTRAINT track;
       session          postgres    false    3289    215    216            �           0    16481    student_in_group    ROW SECURITY     ?   ALTER TABLE session.student_in_group ENABLE ROW LEVEL SECURITY;          session          postgres    false    230            �   �  x��]�nG��+�&��~7r����uk�8Hd�Z�������T -v��C�Yd������o�my����������O�?�n����m��������zY���n�7��Ç��_�?=^��������_�����&_>�^�O����_?�|�/�����v�����m����,����o]^�|Y��J�5}���e��Ņ���eY/K*o~x���Ulw��7�}�,�N�lo�����Ulϛ�e33;lE�%������^7�������k3���w]��Ղf3:F�����z۝c۳zз�qm�}Ј���s���\�i];�S�O�"��n9�Z��<UK5����	��D]�W�oF����W�3���.�i����
��-�{�o!CU�$G<0����IWG
N������̕�}{+�
0��>O��R�p�qr\0��Y^j�g5�����w|�;rdҘ�FW�'JoeÖ�`p�r��㳦IN5ۃ`t��7�(6<l!��0���GM�<)ż�d^}�%�k�(��5�S��,_�6�+0�����UYpRT`xM���I5ﴇ����.����������je�P�Q�-��� _��d�sa�t�Vdxus���T��蚆��e���5\s�m_�֨��VJ}���%�Խ������)f��*��+0��>j$�{�� fI���kΝ�;3̉��a�_}�ky&�9j��yZ�6�:�Jl+�D+0��:��j3B�®�[O$eP����1�@����7��h&�8n�b4�ì�9�;���Ւ%0̦�4��4Β%ì�+*g��fM"`����1G�	�.	f���,�I.�,�0����1��7���s�ғp�,�4�l=0Β;�%��q։0к!r� �`���P-_Z�H��ٔg㥪G�C�@;p ��i�����m*{�ʄl�[�!̤eR��d��Y:�8Q�*�qvb\]S��-�� U4(��=0�֡��
�Xmoa����<2����l�s7�[OH�z`�̓Ư6�oU��<0к0�8RV�6�}���׎�[cb���F �蠳f~ �����.��L�36��P;H�����d�<0�?�z��	F�y`��Ca����s�x`��kK�.���&���lD[;wY������sS�$���(KC3��ʔ�Q	e�9U!*��0��aԓ۽��r?�D�AvPZJ�D=�D�z`�u�;���ZY`���n���[��l=�7�dC� ���F\YSZʉ�ٝ�9�l6��1U ��q�P�GK�a6��we�Mq���Q���#��]���,{>�l�u8�&�k��A�����n�����)�lI�빮�]	������kO�'d1?@ZVAy����@�}���ʒ}�x���`\�q=0Ύ7������OeC_]6ͥ�>�����Gv~�CN��a�Ϲ^����dH��qvT�y��8�'kK0���XW�+�0̖��u6�_�MlG���{�������c�
!�`V<��p�m������)�X9�Ue�b=2��k���#��&!�z(QI��|������Y���MB^����Ջ��q�
y�Ӑ-w�3�D�=C^�4H.U��j�`U=��4�*���$�랪�����1�B^��L{]�F����J<�7��[�O!/|�q�7RZ�K�.G�����)�wJ8���9���M�el=�ҧ<\*	&Pg��1�k�h�K��M�Q!�}r��n��q�y�S��~Q��,A�g���l�	��b��A8'J]V(�p�(��Oa�,��8_��%��O�RW�q�:y��9�I�$ɦ��˟���#�&E�1h��ƻ����f�b=0�~�*�^Ԩ�P�Z���=���&�P�Ԏ�E*2����Na�l8kc}�=P��#��	��Q/�Jڕ���i��z�XL�çyԘpVK����t�A�:��܌����(�O�$�]:.����0;\���8�KoA���CW�@mעC���c�lb]�p��@�Su�	�.�9�5Pg�ۙp˞y�Y����A`��gѮ�ӱ��!��*�@=�klm����l<���F��rW��j�W�l�(�|TɥC�5le�/@JC����0{^�-?�eSB�=0ΆSmY�/!g��l*�f�ֲP��	��u��eu[���l;0Ў"���6��{;��@{�}V�VI0ʎb��ߒ^J)4��jhI�gC��8�%Pw&(�wa��"/�����fP��P�^�ώ$�      �   N  x�՘�j1��~
ݜ���4�KO=�`()4i������}��HJ�u� �Â�]�O�o>}������Ob���MLq����OcJqJc��C��c�wQ��:N��vӉ�9���e�N��:���8M��a_^�;�͘b'R׿�1߾������$o��/_�?��;�\'���R����흴�NȀW'���Ŋ/���H�3�����_R���W~M��)p���ߨG����&�x�F4�KՊ�!��Kr��	�ԇK��x����ڂޝ��(!��ĮL.��+�>��g/}�v��N7���	���7�)����/�k(?�C[~���_��$}ة��o��Իt1w~_��ʶ�~����%��Q?�~Re!i�w/��P+�r��=��v�r3�&;@__�P����fg�߽٧��P�����+w�G�ky�rz�c��?��	LӋ��49^�	L���擻B�+���.�"�~ۀ+�}i @T�	Q�:���yʚYhѿ*M̼��R��:оh���=��/Wt�'9��� ��.Y��͟'(R�O�y�5E+��z���k�#�Y,�5\k�      �   %  x����J�@�{�bnia+&�V�'=���^��"���ݤ�Ao
>C�ڔ��0�Fδ��z����2��L����G���4�Jv�o�I'�����H�(���C��k2�7����7�����W����XbA�@S\��P�V��J�ۦoMS��s�]'��%��3s��W��,qe��Ǌrڔ��%�V2���
+m@ː6x^��!�`�\�P��%=1��b�'� F��*S���Ķe�ޮO��B�h�.��Ж�M����=�3�l0V����q� ��q�      �   `  x��Z�jUQ���S� w����E@|���5��tQAK;A�@�7��G�5�ܫ��w6�$���=3k֬��;�o�{0��ypwX=[��G���8X�^��n�}�|:���˓�q�?�Ó7�O����n����ٵ����o���8�4���C�˕���l�~�1]N�W������xx1�$V .d�7��Ϧo�����b�q:_��~N�֟v��"�
��|�`�O� U!��Ů��q( $	��ߦ( a��;��P'��m��+��E��_�cgP   sR�]ʨ�D��	�e��ĥ�)RC��7U퉦UQ.=�U��^Tҹ�<�"Ʉ�Q��]�CD�Tj�ꄨ_��!��M'�W�qd�S>^X*�f�&�w�ܨ���9_}�SІ*�GBA�A�rt�.����"�ˊ�8p�o�b�P�.t�� ����w�yD ���̫&*�7p/ކ��M��[Hm*�V�5"�nbrR�+��֟Q��d�Qh9~A5#s��׷P
4ѵtn��܃�![�E���^t�b
J3�F
��P���U�*�j3R2uGԃ�<�-=�?�crl��M��oí��r�}���ȸ�Sm�w���K[i�0^,�s��ّ�<g� A�����e��B���-͵���%{�b�_��w�o������7ᶲ���X�s�PEО��Sж)Q*8U:Jn�s��/�EJwh�<#Ty� _$�OoX6Z-1<� �l������l����{@í=��N��f�+c��;��`�,=�M��yܘ�;�`���a>�!B�F���=�)36і�|l_E٬���mPZ4�YԿ5�M��YD��0DۂX1*��wi^�1� N5W
xE����#䱲f�b�T*�A�F�%��#|V�)Ұ��vN� E���h�EX�׍����aB��O���B��Or�6�{�F}�B�y�Gہh�B�����*䤭�����UE)bG�>�i�:0��:�C��$��(ȑb7�9�`�K��;�O���IG�@�Tt&�at>F5;�4Z�bq;	�&H|h��k����g��N��{�˅f
n-�R����ϡl��= ���I-{{�fw�]      �   '  x���v
Q���W(N-.����KM)�/�I�S� ��):
E��E��`vqIbQI|ejb��B����K�/�,H�Ts�	uV�0�Q04�Q02 ���]l���b�����\�4��HG�l���\�z��{im�1Ы`����Sx�Z��FS����\�q��b(p/�]�qa��_3D ����hX�@�t�`���g����wCCT'����@74E������*ׁ������wSX}B�B��R�ȀޞƯ]�0P62���Ēޞŧ!��7 H��      �   �  x�Ř�j�0��y
ݜ�(^im���C��B���Ƈ�6-ur2}���M�`'����X�j��ݘn��1C?���E�;m�_�����?�����~g����H?���p�?����n�6s��|\��b�lm�g���u���FV1:�-�^�s �#Ԛ*���@*����N�b��� ��:Z@r��\O�` �M`J[f3�=�U��G�I&;���4��*FB�c�#ܕ��L,m�!CzE����Z��X�y���\p�?&sty6�&��\���t��	h)qr8�9i����"c���,֦K���X�r"(TfIݵ�V�QQ��5� N��D��fɼ��9���CgO��S�b&d�uy��������TL�R�u��~�8��"b�Y^5L��g.EJ��%���m!�lX�,�K��s8C�5�UY�]IF�,p�-kѲF=�W����hĭp�Ul���~�=�}���      �   �  x����nQ�{?��HbccQQ����DmdE(	���7���D��-�����ů0��g�z��ӝm|�=���?3�������#�n�ۧ緛'��_�.��gj�U�����鉧�K���q��QO<|���+��=�E?H���RH1%�R�H+Z�7�iNt���S��g����&�-���I�d��s�Tw�Y��.s~A�#sɴ�H��8O�^n�.b^�hg8UO��'⥀Ms���S`�B��� ,c̢�\@���O�>n�D��\�S���P3)��]���zW�n���d��L��$��͑rMC���C��cUP�*|eUV;��>A�5�9Km }�RXD��"��� �l�Ln�BG-J�+���G��{L�Q�=�F�Up����c��k�M�Ɍ��5R����4/	g���ʝ���|��o2n�:���,񑐦��Iv-		�Җ#\�%�5��_׸�[�4{حJe˶Ƒ��oXb�=�v���W�q�7jL�/��	Z�1�
/	��`�9ХܒS�k̞B4',~���޸
3�e�Y.i�l~oT����vcK�Ȑ���/�6�F2b�j�k�Nݠ�_M b-3��Q���4��1��%
}���K����+�`wr���Z�qJ���$�~      �   �  x�œ�j�@��>��T��h��z� ��*A-��J�ޣ�ϡ��[)�R�5mP_a�����PLOՂ�gw�7�|[���uV���Y����ݎ�n��y�2riح�Xg�[}7�-��֩}l7�>.e����a��2Z���;�ӌ��Ҕr�=��y�*�.#?
�%�����F��P
E��WZ�ǯu���C>JgwR�?o /�=��*1���g����`�N=��`?�.{^��T��l��C��p^��I��n3��̃߮�������{
���E[M�	fr.���d]Tz���&�w�0�0s��|I�m���F���M^����5� #iA��a�;
�mG(.K�F���;,�jo�Lx �CZ����
D�����'%�d      �   �   x���v
Q���W(N-.����KKL.�)�TЀ2�3St�J3sR2����D^bn��B��O�k������_XraÅ]�/��s���֋M
���\�T��HG��UFԶ�XG��U�Զ�DG��U&Զ�TG��U�Զ�LG��Uf ��� K��      �   T  x���ϊ�0��>E����L�?���=�n�`m�"��֖Z}�I��E� ��f��R�ۺaվ�a���ux[�ޯ�m���ݞ{����?ۧ���]��E�EU�O�����;}|���0����$Ҙ����{TyŢ��!!��
�\1sf�@��!�Ε�[S��f��Z�pmμs37^�qEW�/�E�P�B���.�pјʿ�J��g�#�Y��D�i�qCz�1�S��*$z�I��Ep��Ҫ&$!L�]\�(&�1t��*�-].�K��Ԛz�%(t:��Y�0\L��s�L��,�5@�x�� a	�`3aq�N-D}��^R+���:��      �   [  x��[=kA��+��wa4_�H�!8;i�#w���6�K���h��M�r��M��4zOO��?<�}}����~�/�ϯ?�����m���k�r����{7��9�V�����߶����?����q����a��k?��?}�v�8ܨ���h5\��:�u�k��֡�S���xu�>�\D�W'd������ |�-x���%>C�8>�\9!�Y�h�hQ|Q[r���K|���Qj�c��'����Um��S�t�/��;?�!gg"�sp���#7�!X��H� j�K0U�@�F-��iFP�Z:͸�P�E� r�	R��x�7�;}:0��8>���ebD�0{/j�dW�+$R�F
�̡�t�u���
0�[���D;O�-	�ȣe8X�qLgG��/�{�;�2��0���*t)N��mO5���-��:@F{��Ѿ������PS\�)I&TW\ܶgXKbhaB�b-��:_5~�7�$n�rE`�Ov�U�
*O��W��Z&N-�֒���XuL�JD�io�
�#IMFJFeiuKW
�����2��KXC�[��"I~+S�+��*y�Pa��ɯe*�z��U\a����'��Ah)�5$ѫ��*I�ERQ{�~OQa�$�ܣ
j�/���6-�J�ꦓa϶�*�#j��[&�ݶۀzǰJb� �hKȫ��6��f�e{oYP����eEmf���j��  춝�dF`�m�0eY`g[�G�+t���� &�eKE� �'8¨ ��+�D]�֑�U�T%�)
kH�o�4�6�6���X�Б�f�7�nHv�E�k��J��� �Ҡ���G[�iVG�����WW���      �   �   x���v
Q���W(N-.����+N���I,*��,�/�,HU�@�L�Q@W�����_�W�������a���~a����/�\l��|�����t/6]�ta�ņ���^l������:
�F��\�4r��5/�[�ta�{aV���jc���.l��	�1��[��í7���& ��-k9(.� ����n�+�\�t������	)>�i�*S����������X�� ���      �   �  x�ś�nI��y
�R���c{ĉ�H����ВC�Á[�����(a#��llKC�W�y���i��tU�g��YE����.WU��_5��;�nݽ�Z�s���pm8\�qm������f�����GO�VZ��G�ϟn�|���JK����㫭7o�|�^�ʲ�*bq&����ֲ�3�ɞ�ëS1�t[$pU�+{�}���*�%�j���<Nę����]]9#q�n�w�$݁k�%'���#zE�����'ʞ��C�z�}�c�~�����s��WX��������{����a��,Bz��}�����ά���S����L��Xڧ�ɮ���!����LF ��X��|Lt~��nik2��=G�TL��Q�?p��-�Y��n�V��%��4��X�������4��ΈҪ<[-���u�ݐ?�����q.�!vZ�����ff��4��i�݉�6?A�u���1�j��Lm�C�K��>v!'��=qamd�7>�*y�.}��0�H����@ZBW&=&z����O�?���"}��Z(֦\�*���(=U�G Z{�9_�/�r�U�$��a�L���8}��:������*4�s�D�F�V���|Ő7��QBTP$��)�<�U���3�Q.<�19B�,�g�ɥa�)UM��=Q��G���A]}Js�T
h��2+H��s�/���#?*�-���W��t@���?O˪L�sG�t�鉷�i�]U����f��*�?9��,��d�39�) �_sSʵD�Oϯ��svյB��+�I�T��-F}��iT���J��̥�3����ӕʙ����������~���Q{�냷�>[4>���ֵ�q[Az�	�z�4B{����-�Xt���r#��ܤO�y�'h�'ta���V󶤦��.?k�O��~��[����!�&C4)����+=[[�r�M���9�e�O[=(�zh3�2;l�����Ik���]��9}([<3r�%�kC~�R��JHm�q�+�|�����;��,��u8�s�����B����)k�B�֦l�������̖��I����<O詪R�nZ�<���0�<�'�{�^46��c5������"�TѸ�Ĕ��Lfm?����E)�53����}h\�X�\���1G���A��}~Һ��X(P�P��;^vKF+۾eKa��~��>�e{���j� � �#4M�(X�t��Y��^����N���G5Dd���v�9Bƿ���}g��W:8����2���1�Q� ~���W���&N�YCH�����ֻ�1h�\,V�4_��u�M���ML\=!Հ��KIlW�lg��?�雚�jC���'�.5qB���?�v�:U}V#��o�OwD�����8۾cz��\FͰ��Ջ[�������м�y�����B"�1�\�hA�Ӹ�`I��)�p�c{����%z���,qS�      �   �  x��ZKnQ��o�D�y��yb�"K(H$��,�B�8(3> �`	'� ��37���Kt�_���3I�J�������������ye�]������a����������9�����n�]ev������mO^��p3��<>�0o_�|sym��\mӲ�{V���˺[z��m*c���m�1}�>��Ǉ���a�B_���r��S��1�Pǘ������a�M��-
�I=����[W�#���{�8�	f��c��F8B�[�s�����h�m���u�u�t�l�mH���;�@'��k�
��kV[a��N���V���S�y�˕�`�1�JQ���EA�d�s4b�@������'8�����"��h���t��$��/�F����`�+�@�lR8�/��$M��:�@����I	O�U��vg<�Wgè��g�N���� �DXt�N�RDR5'�^�$��2V/$=�GE$��R�S���^e�,w1�o�chz�B<�{J�#2h�|�8t*����+,���-"Y�M��V��L�ܻhd��r��Oi	c���p4k�"�R�* �OmD��֚K��"HE��yh�@�:�� �p��^�7�a��e!�޿r&�<��1�Q�y�kM�m\���՚M���KgԘ�x.�׵�߄T��5�s�N���rSi\��a�+�n/
3��ANZp>��,�w��t�$/ ��_m      �   d  x�ݗ�n�P��y��s+�i���."�"��6rSK�����4 TDXT� �`��R��i���7��\;��k)׾Ve>��3�����U��y�|��[��������d�h��*��/=[�c�i{�燝�o����Z������n��Nc�k7<?p�Y#xu䭪g=��V+��,��O��>�1Et��F��Ɩ��2֚�*��"��}
u�B��7��RLhH\���4��~�[z��B=[�%���ň<҃���S�,�>e�`���b<�n ٘�LQ�rf��1p�� Jy�r�u��Q5�1�Z�s�?� �G�Ĩ�$����j=�R�_�B�C��ȚiV!ߜ�ɮZ.,��� W�_/e��]1M���b�HLD��Z4n�a���S|do��wL-�2W�w��3h��~6���arN˸f�.�Fl��~ ���+��4��È�ɇte��R�����A���,�-��l$���=_��o�{����*��@47�J��I�ˠ��~&p�Yg���ad8�@��R��Tu��wa�v�a�v�Z�Ar�-U#��W�B�b�tq�s�#�X�,�-%������������@=�4wgv[����޼
���۽      �   �  x��XKO�@��WX\ )��M��8 UT*��*���<D[m��H� -���k�4ĕ!8������u�ƻnఎ"Y�����73�������ekaq��U.�˥���ba�uqӚ^�^f����Za����q�P�\_�^-�d����r�O�e�W���7�mxd�z����%k��Z�䌴H�tI��q�rB��'�8�^׾��Fz�
����̂��P��@���n��G���HL\��wk�9��E�����"7��Gn�����=ҥu�yڐ}.�"��0�-f�%�0��];h�O�p�+ ��WZ,8��3|�}�z.������u����Y�����8���{���@O�z��2�<�u��{�ƚ& ���ͷ��/�F<��=�?�9�`���0�e��r2����^;�Z��Jg��G�=s�4>��݈U�J��S��)u��R��s!:AH%��l�J���|{�m�r����f��/����֛��`�H��ć�D�TR�wMY���#䠧`�o�κĔx�5Uml�?�.�������+^�O17/�[i����O �
���8D��f���#����B��E�0�	�kH��$ R�v���w�L�z�X��wuFDnڳ:�6ت�K)�g�1�k�w�A��ʪ4���65w�����PD�
�>ӻ�������Խ�m���m�9��:^�Ӓ0�����hQ�@�����H-i�������fn��q]5I4����S����zc��c���Uӟ�]��sfTB8ƛ;�Oc;��Mp7#���,��U��;�f�LWm���z�U�y`>�b~O���v8ds�v"Z����im-��^�ȨU�k�U��6r���F���$����HBo���>��4����%7��Z��(F*���s�h�Aj;�Ӕ����$�0��?�nkz     