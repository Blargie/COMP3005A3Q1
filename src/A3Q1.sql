PGDMP                      |           A3Q2    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25072    A3Q2    DATABASE     z   CREATE DATABASE "A3Q2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';
    DROP DATABASE "A3Q2";
                postgres    false            �            1259    25074    students    TABLE     �   CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    enrollment_date date
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    25084    StudentView    VIEW     �   CREATE VIEW public."StudentView" AS
 SELECT student_id,
    first_name,
    last_name,
    email,
    enrollment_date
   FROM public.students;
     DROP VIEW public."StudentView";
       public          postgres    false    216    216    216    216    216            �            1259    25073    students_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.students_student_id_seq;
       public          postgres    false    216            �           0    0    students_student_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;
          public          postgres    false    215                       2604    25077    students student_id    DEFAULT     z   ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);
 B   ALTER TABLE public.students ALTER COLUMN student_id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    25074    students 
   TABLE DATA           ]   COPY public.students (student_id, first_name, last_name, email, enrollment_date) FROM stdin;
    public          postgres    false    216   �       �           0    0    students_student_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.students_student_id_seq', 3, true);
          public          postgres    false    215                        2606    25083    students students_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.students DROP CONSTRAINT students_email_key;
       public            postgres    false    216            "           2606    25081    students students_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    216            �   _   x�uʱ@0���wq��l"��VKqI�8�0x|��}�W��cȂT�k�Nn��&�d�5��L[��,����+ ���7pQыW��<|WK�`!(     