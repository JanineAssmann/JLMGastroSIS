--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

-- Started on 2021-02-17 21:35:18

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
-- TOC entry 215 (class 1259 OID 25444)
-- Name: cardapio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapio (
    idcardapio integer NOT NULL,
    desccardapio character varying(50) NOT NULL,
    qtdepessoas integer NOT NULL,
    valorunitario double precision NOT NULL,
    valortotal double precision NOT NULL,
    buffetinterno boolean NOT NULL
);


ALTER TABLE public.cardapio OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25516)
-- Name: cardapio_dia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapio_dia (
    idcardapiodia integer NOT NULL,
    idcardapio integer NOT NULL,
    datacardapio date NOT NULL
);


ALTER TABLE public.cardapio_dia OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25514)
-- Name: cardapio_dia_idcardapiodia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cardapio_dia_idcardapiodia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardapio_dia_idcardapiodia_seq OWNER TO postgres;

--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 224
-- Name: cardapio_dia_idcardapiodia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cardapio_dia_idcardapiodia_seq OWNED BY public.cardapio_dia.idcardapiodia;


--
-- TOC entry 214 (class 1259 OID 25442)
-- Name: cardapio_idcardapio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cardapio_idcardapio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardapio_idcardapio_seq OWNER TO postgres;

--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 214
-- Name: cardapio_idcardapio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cardapio_idcardapio_seq OWNED BY public.cardapio.idcardapio;


--
-- TOC entry 227 (class 1259 OID 25529)
-- Name: cardapio_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapio_venda (
    idcardapiovenda integer NOT NULL,
    idvenda integer NOT NULL,
    idcardapio integer NOT NULL
);


ALTER TABLE public.cardapio_venda OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25527)
-- Name: cardapio_venda_idcardapiovenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cardapio_venda_idcardapiovenda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardapio_venda_idcardapiovenda_seq OWNER TO postgres;

--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 226
-- Name: cardapio_venda_idcardapiovenda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cardapio_venda_idcardapiovenda_seq OWNED BY public.cardapio_venda.idcardapiovenda;


--
-- TOC entry 205 (class 1259 OID 25378)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nome character varying(50) NOT NULL,
    tipo character varying(20) NOT NULL,
    cpf_cnpj character varying(18) NOT NULL,
    cep character varying(10),
    uf character varying(2),
    cidade character varying(50),
    bairro character varying(30),
    endereco character varying(50),
    numero integer,
    complemento character varying(15),
    telefone1 character varying(15) NOT NULL,
    telefone2 character varying(15),
    email character varying(50),
    datanascimento date
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25376)
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_idcliente_seq OWNER TO postgres;

--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 204
-- Name: cliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente.idcliente;


--
-- TOC entry 211 (class 1259 OID 25413)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra (
    idcompra integer NOT NULL,
    datacotacao date,
    datacompra date,
    dataentrada date,
    idfornecedor integer NOT NULL
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 25411)
-- Name: compra_idcompra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_idcompra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_idcompra_seq OWNER TO postgres;

--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 210
-- Name: compra_idcompra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_idcompra_seq OWNED BY public.compra.idcompra;


--
-- TOC entry 203 (class 1259 OID 25368)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedor (
    idfornecedor integer NOT NULL,
    nome character varying(50) NOT NULL,
    tipo character varying(20) NOT NULL,
    cpf_cnpj character varying(18) NOT NULL,
    cep character varying(10),
    uf character varying(2),
    cidade character varying(50),
    bairro character varying(30),
    endereco character varying(50),
    numero integer,
    complemento character varying(15),
    telefone1 character varying(15) NOT NULL,
    telefone2 character varying(15),
    email character varying(50),
    datacadastro date
);


ALTER TABLE public.fornecedor OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 25366)
-- Name: fornecedor_idfornecedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fornecedor_idfornecedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fornecedor_idfornecedor_seq OWNER TO postgres;

--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 202
-- Name: fornecedor_idfornecedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fornecedor_idfornecedor_seq OWNED BY public.fornecedor.idfornecedor;


--
-- TOC entry 201 (class 1259 OID 25358)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    idfuncionario integer NOT NULL,
    nome character varying(50) NOT NULL,
    cpf character varying(14) NOT NULL,
    cep character varying(10),
    uf character varying(2),
    cidade character varying(50),
    bairro character varying(30),
    endereco character varying(50),
    numero integer,
    complemento character varying(15),
    telefone1 character varying(15) NOT NULL,
    telefone2 character varying(15),
    email character varying(50),
    datanascimento date
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 25356)
-- Name: funcionario_idfuncionario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.funcionario_idfuncionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funcionario_idfuncionario_seq OWNER TO postgres;

--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 200
-- Name: funcionario_idfuncionario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.funcionario_idfuncionario_seq OWNED BY public.funcionario.idfuncionario;


--
-- TOC entry 223 (class 1259 OID 25499)
-- Name: ingrediente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingrediente (
    idproduto integer NOT NULL,
    idprato integer NOT NULL,
    qtde double precision NOT NULL,
    unmedida character varying(2) NOT NULL,
    valoringrediente double precision NOT NULL
);


ALTER TABLE public.ingrediente OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25426)
-- Name: item_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_compra (
    iditemcompra integer NOT NULL,
    qtdecompra double precision NOT NULL,
    unmedida character varying(2) NOT NULL,
    valorcompra double precision NOT NULL,
    idcompra integer NOT NULL,
    idproduto integer NOT NULL
);


ALTER TABLE public.item_compra OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 25424)
-- Name: item_compra_iditemcompra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_compra_iditemcompra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_compra_iditemcompra_seq OWNER TO postgres;

--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 212
-- Name: item_compra_iditemcompra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_compra_iditemcompra_seq OWNED BY public.item_compra.iditemcompra;


--
-- TOC entry 219 (class 1259 OID 25470)
-- Name: item_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_venda (
    iditemvenda integer NOT NULL,
    qtdevenda integer NOT NULL,
    valorvenda double precision NOT NULL,
    idcardapiovenda integer NOT NULL,
    idprato integer NOT NULL
);


ALTER TABLE public.item_venda OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25468)
-- Name: item_venda_iditemvenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_venda_iditemvenda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_venda_iditemvenda_seq OWNER TO postgres;

--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 218
-- Name: item_venda_iditemvenda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_venda_iditemvenda_seq OWNED BY public.item_venda.iditemvenda;


--
-- TOC entry 221 (class 1259 OID 25478)
-- Name: prato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato (
    idprato integer NOT NULL,
    nome character varying(50) NOT NULL,
    rendimento integer NOT NULL,
    tempopreparo integer NOT NULL,
    valorprato double precision NOT NULL,
    lucro double precision NOT NULL
);


ALTER TABLE public.prato OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25484)
-- Name: prato_cardapio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato_cardapio (
    idprato integer NOT NULL,
    idcardapio integer NOT NULL
);


ALTER TABLE public.prato_cardapio OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25476)
-- Name: prato_idprato_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prato_idprato_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prato_idprato_seq OWNER TO postgres;

--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 220
-- Name: prato_idprato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prato_idprato_seq OWNED BY public.prato.idprato;


--
-- TOC entry 209 (class 1259 OID 25405)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    idproduto integer NOT NULL,
    qtdeproduto double precision,
    unmedida character varying(2) NOT NULL,
    descricaoproduto character varying(30) NOT NULL
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 25403)
-- Name: produto_idproduto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_idproduto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_idproduto_seq OWNER TO postgres;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 208
-- Name: produto_idproduto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_idproduto_seq OWNED BY public.produto.idproduto;


--
-- TOC entry 207 (class 1259 OID 25388)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    nuser character varying(10) NOT NULL,
    senha character varying(10) NOT NULL,
    idfuncionario integer,
    email character varying(50) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25386)
-- Name: usuario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_idusuario_seq OWNER TO postgres;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 206
-- Name: usuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;


--
-- TOC entry 217 (class 1259 OID 25452)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda (
    idvenda integer NOT NULL,
    dataorcamento date,
    datapedido date,
    dataproducao date,
    idcliente integer NOT NULL,
    producao boolean NOT NULL
);


ALTER TABLE public.venda OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25450)
-- Name: venda_idvenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_idvenda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_idvenda_seq OWNER TO postgres;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 216
-- Name: venda_idvenda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_idvenda_seq OWNED BY public.venda.idvenda;


--
-- TOC entry 2937 (class 2604 OID 25447)
-- Name: cardapio idcardapio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio ALTER COLUMN idcardapio SET DEFAULT nextval('public.cardapio_idcardapio_seq'::regclass);


--
-- TOC entry 2941 (class 2604 OID 25519)
-- Name: cardapio_dia idcardapiodia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio_dia ALTER COLUMN idcardapiodia SET DEFAULT nextval('public.cardapio_dia_idcardapiodia_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 25532)
-- Name: cardapio_venda idcardapiovenda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio_venda ALTER COLUMN idcardapiovenda SET DEFAULT nextval('public.cardapio_venda_idcardapiovenda_seq'::regclass);


--
-- TOC entry 2932 (class 2604 OID 25381)
-- Name: cliente idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);


--
-- TOC entry 2935 (class 2604 OID 25416)
-- Name: compra idcompra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra ALTER COLUMN idcompra SET DEFAULT nextval('public.compra_idcompra_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 25371)
-- Name: fornecedor idfornecedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor ALTER COLUMN idfornecedor SET DEFAULT nextval('public.fornecedor_idfornecedor_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 25361)
-- Name: funcionario idfuncionario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario ALTER COLUMN idfuncionario SET DEFAULT nextval('public.funcionario_idfuncionario_seq'::regclass);


--
-- TOC entry 2936 (class 2604 OID 25429)
-- Name: item_compra iditemcompra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_compra ALTER COLUMN iditemcompra SET DEFAULT nextval('public.item_compra_iditemcompra_seq'::regclass);


--
-- TOC entry 2939 (class 2604 OID 25473)
-- Name: item_venda iditemvenda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda ALTER COLUMN iditemvenda SET DEFAULT nextval('public.item_venda_iditemvenda_seq'::regclass);


--
-- TOC entry 2940 (class 2604 OID 25481)
-- Name: prato idprato; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato ALTER COLUMN idprato SET DEFAULT nextval('public.prato_idprato_seq'::regclass);


--
-- TOC entry 2934 (class 2604 OID 25408)
-- Name: produto idproduto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN idproduto SET DEFAULT nextval('public.produto_idproduto_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 25391)
-- Name: usuario idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 25455)
-- Name: venda idvenda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda ALTER COLUMN idvenda SET DEFAULT nextval('public.venda_idvenda_seq'::regclass);


--
-- TOC entry 3142 (class 0 OID 25444)
-- Dependencies: 215
-- Data for Name: cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cardapio (idcardapio, desccardapio, qtdepessoas, valorunitario, valortotal, buffetinterno) VALUES (2, 'FIT', 4, 9.720000267028809, 38.880001068115234, false);
INSERT INTO public.cardapio (idcardapio, desccardapio, qtdepessoas, valorunitario, valortotal, buffetinterno) VALUES (1, 'FORMATURA', 2, 23.31999969482422, 46.63999938964844, false);
INSERT INTO public.cardapio (idcardapio, desccardapio, qtdepessoas, valorunitario, valortotal, buffetinterno) VALUES (3, 'TODOS OS SABORES', 4, 17.81999969482422, 71.29000091552734, false);
INSERT INTO public.cardapio (idcardapio, desccardapio, qtdepessoas, valorunitario, valortotal, buffetinterno) VALUES (4, 'BUFFET', 4, 19.530000686645508, 78.11000061035156, true);


--
-- TOC entry 3152 (class 0 OID 25516)
-- Dependencies: 225
-- Data for Name: cardapio_dia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cardapio_dia (idcardapiodia, idcardapio, datacardapio) VALUES (14, 4, '2021-02-17');
INSERT INTO public.cardapio_dia (idcardapiodia, idcardapio, datacardapio) VALUES (16, 4, '2021-02-18');
INSERT INTO public.cardapio_dia (idcardapiodia, idcardapio, datacardapio) VALUES (17, 4, '2021-02-19');
INSERT INTO public.cardapio_dia (idcardapiodia, idcardapio, datacardapio) VALUES (18, 4, '2021-02-22');
INSERT INTO public.cardapio_dia (idcardapiodia, idcardapio, datacardapio) VALUES (19, 4, '2021-02-23');
INSERT INTO public.cardapio_dia (idcardapiodia, idcardapio, datacardapio) VALUES (20, 4, '2021-02-24');
INSERT INTO public.cardapio_dia (idcardapiodia, idcardapio, datacardapio) VALUES (21, 4, '2021-02-25');


--
-- TOC entry 3154 (class 0 OID 25529)
-- Dependencies: 227
-- Data for Name: cardapio_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cardapio_venda (idcardapiovenda, idvenda, idcardapio) VALUES (1, 3, 2);
INSERT INTO public.cardapio_venda (idcardapiovenda, idvenda, idcardapio) VALUES (2, 3, 3);
INSERT INTO public.cardapio_venda (idcardapiovenda, idvenda, idcardapio) VALUES (3, 4, 3);


--
-- TOC entry 3132 (class 0 OID 25378)
-- Dependencies: 205
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente (idcliente, nome, tipo, cpf_cnpj, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datanascimento) VALUES (1, 'BEM VIVER CASA DE EVENTOS', 'PJ', '12585963000125', '', '', '', '', '', NULL, '', '', '', '', NULL);
INSERT INTO public.cliente (idcliente, nome, tipo, cpf_cnpj, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datanascimento) VALUES (2, 'A FESTA ALUGUEL DE TRAJES', 'PF', '12563252312', '', '', '', '', '', NULL, '', '', '', '', NULL);


--
-- TOC entry 3138 (class 0 OID 25413)
-- Dependencies: 211
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.compra (idcompra, datacotacao, datacompra, dataentrada, idfornecedor) VALUES (2, '2021-02-02', '2021-06-02', '2021-06-08', 6);
INSERT INTO public.compra (idcompra, datacotacao, datacompra, dataentrada, idfornecedor) VALUES (4, NULL, NULL, '2021-02-11', 7);
INSERT INTO public.compra (idcompra, datacotacao, datacompra, dataentrada, idfornecedor) VALUES (3, NULL, '2020-12-30', '2021-02-05', 1);
INSERT INTO public.compra (idcompra, datacotacao, datacompra, dataentrada, idfornecedor) VALUES (1, '2021-02-02', '2021-02-02', '2021-02-02', 3);


--
-- TOC entry 3130 (class 0 OID 25368)
-- Dependencies: 203
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fornecedor (idfornecedor, nome, tipo, cpf_cnpj, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datacadastro) VALUES (1, 'CASA DA CARNE', 'PJ', '12345678000120', '', '', '', '', '', NULL, '', '', '', '', NULL);
INSERT INTO public.fornecedor (idfornecedor, nome, tipo, cpf_cnpj, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datacadastro) VALUES (3, 'CASA DA FRUTA', 'PJ', '98765432000198', '', '', '', '', '', NULL, '', '', '', '', NULL);
INSERT INTO public.fornecedor (idfornecedor, nome, tipo, cpf_cnpj, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datacadastro) VALUES (6, 'MUNDO DO SABOR TEMPEROS', 'PJ', '98654321000585', '', '', '', '', '', NULL, '', '', '', '', NULL);
INSERT INTO public.fornecedor (idfornecedor, nome, tipo, cpf_cnpj, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datacadastro) VALUES (4, 'IMPLANTAÇÃO DE SALDO', 'PJ', '99999999000199', '', '', '', '', '', NULL, '', '', '', '', NULL);
INSERT INTO public.fornecedor (idfornecedor, nome, tipo, cpf_cnpj, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datacadastro) VALUES (7, 'VERDURAS BLUMENAU', 'PF', '52569632152', '', '', '', '', '', NULL, '', '', '', '', NULL);


--
-- TOC entry 3128 (class 0 OID 25358)
-- Dependencies: 201
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionario (idfuncionario, nome, cpf, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datanascimento) VALUES (1, 'JANINE ASSMANN', '25825825825', '', '', '', '', '', NULL, '', '', '', '', NULL);
INSERT INTO public.funcionario (idfuncionario, nome, cpf, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datanascimento) VALUES (2, 'LUZIA LUCHINI MENDES', '36936936936', '', '', '', '', '', NULL, '', '', '', '', NULL);
INSERT INTO public.funcionario (idfuncionario, nome, cpf, cep, uf, cidade, bairro, endereco, numero, complemento, telefone1, telefone2, email, datanascimento) VALUES (3, 'MARIA DE LOURDES PEREIRA', '14714714714', '', '', '', '', '', NULL, '', '', '', '', NULL);


--
-- TOC entry 3150 (class 0 OID 25499)
-- Dependencies: 223
-- Data for Name: ingrediente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingrediente (idproduto, idprato, qtde, unmedida, valoringrediente) VALUES (10, 1, 0.30000001192092896, 'KG', 4.699999809265137);
INSERT INTO public.ingrediente (idproduto, idprato, qtde, unmedida, valoringrediente) VALUES (13, 2, 0.5, 'KG', 18.75);
INSERT INTO public.ingrediente (idproduto, idprato, qtde, unmedida, valoringrediente) VALUES (8, 2, 0.20000000298023224, 'KG', 2.299999952316284);
INSERT INTO public.ingrediente (idproduto, idprato, qtde, unmedida, valoringrediente) VALUES (1, 4, 0.6000000238418579, 'KG', 13.5);
INSERT INTO public.ingrediente (idproduto, idprato, qtde, unmedida, valoringrediente) VALUES (2, 5, 0.5, 'KG', 6);
INSERT INTO public.ingrediente (idproduto, idprato, qtde, unmedida, valoringrediente) VALUES (9, 3, 0.5, 'KG', 6.800000190734863);


--
-- TOC entry 3140 (class 0 OID 25426)
-- Dependencies: 213
-- Data for Name: item_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (3, 2.299999952316284, 'KG', 5.429999828338623, 2, 5);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (4, 5, 'KG', 18.600000381469727, 2, 10);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (5, 7, 'KG', 16, 2, 8);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (6, 5, 'KG', 23, 2, 3);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (11, 0.800000011920929, 'KG', 25, 4, 12);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (12, 3.799999952316284, 'KG', 9.680000305175781, 4, 10);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (13, 5, 'KG', 15.760000228881836, 4, 7);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (33, 30, 'KG', 350, 3, 13);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (34, 5, 'KG', 250, 3, 11);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (35, 35, 'KG', 220, 3, 9);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (36, 3, 'KG', 100, 3, 4);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (39, 40, 'KG', 120, 1, 1);
INSERT INTO public.item_compra (iditemcompra, qtdecompra, unmedida, valorcompra, idcompra, idproduto) VALUES (40, 33, 'KG', 89, 1, 2);


--
-- TOC entry 3146 (class 0 OID 25470)
-- Dependencies: 219
-- Data for Name: item_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (1, 4, 42.15999984741211, 1, 3);
INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (2, 4, 83.72000122070312, 1, 4);
INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (3, 6, 183.1199951171875, 2, 2);
INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (4, 2, 21.079999923706055, 2, 3);
INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (5, 6, 55.79999923706055, 2, 5);
INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (6, 2, 41.86000061035156, 2, 4);
INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (15, 8, 244.16000366210938, 3, 2);
INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (16, 10, 105.4000015258789, 3, 3);
INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (17, 9, 83.69999694824219, 3, 5);
INSERT INTO public.item_venda (iditemvenda, qtdevenda, valorvenda, idcardapiovenda, idprato) VALUES (18, 9, 188.3699951171875, 3, 4);


--
-- TOC entry 3148 (class 0 OID 25478)
-- Dependencies: 221
-- Data for Name: prato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prato (idprato, nome, rendimento, tempopreparo, valorprato, lucro) VALUES (1, 'SALADA', 2, 20, 6.820000171661377, 45);
INSERT INTO public.prato (idprato, nome, rendimento, tempopreparo, valorprato, lucro) VALUES (2, 'COSTELA COM LARANJA', 2, 75, 30.520000457763672, 45);
INSERT INTO public.prato (idprato, nome, rendimento, tempopreparo, valorprato, lucro) VALUES (4, 'TIGELA DE AÇAI', 2, 10, 20.93000030517578, 55);
INSERT INTO public.prato (idprato, nome, rendimento, tempopreparo, valorprato, lucro) VALUES (5, 'COMPOTA DE AMORA', 2, 5, 9.300000190734863, 55);
INSERT INTO public.prato (idprato, nome, rendimento, tempopreparo, valorprato, lucro) VALUES (3, 'FRANGO COM SALADA', 2, 45, 10.539999961853027, 55);


--
-- TOC entry 3149 (class 0 OID 25484)
-- Dependencies: 222
-- Data for Name: prato_cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (3, 2);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (4, 2);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (1, 1);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (2, 1);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (5, 1);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (2, 3);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (3, 3);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (5, 3);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (4, 3);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (1, 4);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (2, 4);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (4, 4);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (5, 4);
INSERT INTO public.prato_cardapio (idprato, idcardapio) VALUES (3, 4);


--
-- TOC entry 3136 (class 0 OID 25405)
-- Dependencies: 209
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (11, 5, 'KG', 'FILÉ MIGNON');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (9, 5, 'KG', 'PEITO DE FRANGO');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (4, 3, 'KG', 'PICANHA');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (5, 2.299999952316284, 'KG', 'ESPINAFRE');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (13, 4, 'KG', 'COSTELA');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (3, 5, 'KG', 'ARROZ');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (1, 4, 'KG', 'AÇAI');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (2, 7, 'KG', 'AMORA');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (12, 0.800000011920929, 'KG', 'CHAMPIGNON');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (7, 5, 'KG', 'FEIJÃO');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (8, 2.1999998092651367, 'KG', 'LARANJA');
INSERT INTO public.produto (idproduto, qtdeproduto, unmedida, descricaoproduto) VALUES (10, 10.800000190734863, 'KG', 'TOMATE');


--
-- TOC entry 3134 (class 0 OID 25388)
-- Dependencies: 207
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario (idusuario, nuser, senha, idfuncionario, email) VALUES (1, 'ADMIN', 'admin', NULL, 'admin@admin.com.br');
INSERT INTO public.usuario (idusuario, nuser, senha, idfuncionario, email) VALUES (3, 'LUZIA', '123', 2, 'luzialuchini@gmail.com');
INSERT INTO public.usuario (idusuario, nuser, senha, idfuncionario, email) VALUES (4, 'MARIA', '123', 3, 'maria-lpereira@hotmail.com');
INSERT INTO public.usuario (idusuario, nuser, senha, idfuncionario, email) VALUES (2, 'JANINE', '123', 1, 'janine.assmann@gmail.com');


--
-- TOC entry 3144 (class 0 OID 25452)
-- Dependencies: 217
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venda (idvenda, dataorcamento, datapedido, dataproducao, idcliente, producao) VALUES (3, NULL, '2021-02-10', '2021-02-18', 2, true);
INSERT INTO public.venda (idvenda, dataorcamento, datapedido, dataproducao, idcliente, producao) VALUES (4, '2021-02-03', '2021-02-15', '2021-02-25', 1, false);


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 224
-- Name: cardapio_dia_idcardapiodia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapio_dia_idcardapiodia_seq', 21, true);


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 214
-- Name: cardapio_idcardapio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapio_idcardapio_seq', 4, true);


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 226
-- Name: cardapio_venda_idcardapiovenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapio_venda_idcardapiovenda_seq', 3, true);


--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 204
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_idcliente_seq', 2, true);


--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 210
-- Name: compra_idcompra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compra_idcompra_seq', 6, true);


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 202
-- Name: fornecedor_idfornecedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fornecedor_idfornecedor_seq', 7, true);


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 200
-- Name: funcionario_idfuncionario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funcionario_idfuncionario_seq', 3, true);


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 212
-- Name: item_compra_iditemcompra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_compra_iditemcompra_seq', 40, true);


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 218
-- Name: item_venda_iditemvenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_venda_iditemvenda_seq', 18, true);


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 220
-- Name: prato_idprato_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prato_idprato_seq', 5, true);


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 208
-- Name: produto_idproduto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_idproduto_seq', 13, true);


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 206
-- Name: usuario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_idusuario_seq', 5, true);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 216
-- Name: venda_idvenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venda_idvenda_seq', 4, true);


--
-- TOC entry 2980 (class 2606 OID 25521)
-- Name: cardapio_dia cardapio_dia_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio_dia
    ADD CONSTRAINT cardapio_dia_pk PRIMARY KEY (idcardapiodia);


--
-- TOC entry 2968 (class 2606 OID 25449)
-- Name: cardapio cardapio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio
    ADD CONSTRAINT cardapio_pk PRIMARY KEY (idcardapio);


--
-- TOC entry 2982 (class 2606 OID 25534)
-- Name: cardapio_venda cardapio_venda_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio_venda
    ADD CONSTRAINT cardapio_venda_pk PRIMARY KEY (idcardapiovenda);


--
-- TOC entry 2952 (class 2606 OID 25385)
-- Name: cliente cliente_cpf_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- TOC entry 2954 (class 2606 OID 25383)
-- Name: cliente cliente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY (idcliente);


--
-- TOC entry 2964 (class 2606 OID 25418)
-- Name: compra compra_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pk PRIMARY KEY (idcompra);


--
-- TOC entry 2948 (class 2606 OID 25375)
-- Name: fornecedor fornecedor_cpf_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- TOC entry 2950 (class 2606 OID 25373)
-- Name: fornecedor fornecedor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pk PRIMARY KEY (idfornecedor);


--
-- TOC entry 2944 (class 2606 OID 25365)
-- Name: funcionario funcionario_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_cpf_key UNIQUE (cpf);


--
-- TOC entry 2946 (class 2606 OID 25363)
-- Name: funcionario funcionario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pk PRIMARY KEY (idfuncionario);


--
-- TOC entry 2978 (class 2606 OID 25503)
-- Name: ingrediente ingrediente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediente
    ADD CONSTRAINT ingrediente_pk PRIMARY KEY (idproduto, idprato);


--
-- TOC entry 2966 (class 2606 OID 25431)
-- Name: item_compra item_compra_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_compra
    ADD CONSTRAINT item_compra_pk PRIMARY KEY (iditemcompra);


--
-- TOC entry 2972 (class 2606 OID 25475)
-- Name: item_venda item_venda_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_pk PRIMARY KEY (iditemvenda);


--
-- TOC entry 2976 (class 2606 OID 25488)
-- Name: prato_cardapio prato_cardapio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_cardapio
    ADD CONSTRAINT prato_cardapio_pk PRIMARY KEY (idprato, idcardapio);


--
-- TOC entry 2974 (class 2606 OID 25483)
-- Name: prato prato_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato
    ADD CONSTRAINT prato_pk PRIMARY KEY (idprato);


--
-- TOC entry 2962 (class 2606 OID 25410)
-- Name: produto produto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pk PRIMARY KEY (idproduto);


--
-- TOC entry 2956 (class 2606 OID 25397)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 2958 (class 2606 OID 25395)
-- Name: usuario usuario_nuser_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nuser_key UNIQUE (nuser);


--
-- TOC entry 2960 (class 2606 OID 25393)
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (idusuario);


--
-- TOC entry 2970 (class 2606 OID 25457)
-- Name: venda venda_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pk PRIMARY KEY (idvenda);


--
-- TOC entry 2994 (class 2606 OID 25522)
-- Name: cardapio_dia cardapio_dia_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio_dia
    ADD CONSTRAINT cardapio_dia_fk0 FOREIGN KEY (idcardapio) REFERENCES public.cardapio(idcardapio);


--
-- TOC entry 2995 (class 2606 OID 25535)
-- Name: cardapio_venda cardapio_venda_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio_venda
    ADD CONSTRAINT cardapio_venda_fk0 FOREIGN KEY (idvenda) REFERENCES public.venda(idvenda);


--
-- TOC entry 2996 (class 2606 OID 25540)
-- Name: cardapio_venda cardapio_venda_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio_venda
    ADD CONSTRAINT cardapio_venda_fk1 FOREIGN KEY (idcardapio) REFERENCES public.cardapio(idcardapio);


--
-- TOC entry 2984 (class 2606 OID 25419)
-- Name: compra compra_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_fk0 FOREIGN KEY (idfornecedor) REFERENCES public.fornecedor(idfornecedor);


--
-- TOC entry 2992 (class 2606 OID 25504)
-- Name: ingrediente ingrediente_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediente
    ADD CONSTRAINT ingrediente_fk0 FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);


--
-- TOC entry 2993 (class 2606 OID 25509)
-- Name: ingrediente ingrediente_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediente
    ADD CONSTRAINT ingrediente_fk1 FOREIGN KEY (idprato) REFERENCES public.prato(idprato);


--
-- TOC entry 2985 (class 2606 OID 25432)
-- Name: item_compra item_compra_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_compra
    ADD CONSTRAINT item_compra_fk0 FOREIGN KEY (idcompra) REFERENCES public.compra(idcompra);


--
-- TOC entry 2986 (class 2606 OID 25437)
-- Name: item_compra item_compra_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_compra
    ADD CONSTRAINT item_compra_fk1 FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);


--
-- TOC entry 2988 (class 2606 OID 25546)
-- Name: item_venda item_venda_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_fk0 FOREIGN KEY (idcardapiovenda) REFERENCES public.cardapio_venda(idcardapiovenda);


--
-- TOC entry 2989 (class 2606 OID 25551)
-- Name: item_venda item_venda_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_fk1 FOREIGN KEY (idprato) REFERENCES public.prato(idprato);


--
-- TOC entry 2990 (class 2606 OID 25489)
-- Name: prato_cardapio prato_cardapio_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_cardapio
    ADD CONSTRAINT prato_cardapio_fk0 FOREIGN KEY (idprato) REFERENCES public.prato(idprato);


--
-- TOC entry 2991 (class 2606 OID 25494)
-- Name: prato_cardapio prato_cardapio_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_cardapio
    ADD CONSTRAINT prato_cardapio_fk1 FOREIGN KEY (idcardapio) REFERENCES public.cardapio(idcardapio);


--
-- TOC entry 2983 (class 2606 OID 25398)
-- Name: usuario usuario_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_fk0 FOREIGN KEY (idfuncionario) REFERENCES public.funcionario(idfuncionario);


--
-- TOC entry 2987 (class 2606 OID 25458)
-- Name: venda venda_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_fk0 FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);


-- Completed on 2021-02-17 21:35:21

--
-- PostgreSQL database dump complete
--

