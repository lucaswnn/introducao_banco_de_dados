PRAGMA foreign_keys=OFF;


CREATE TABLE ORGAO_SUPERIOR
    (OSUPID INTEGER PRIMARY KEY,
    NOMEOSUP VARCHAR UNIQUE,
    CNPJ VARCHAR UNIQUE);


CREATE TABLE ORGAO_SOLICITANTE
    (OSOLICITID INTEGER PRIMARY KEY,
    NOMEOSOLICIT VARCHAR UNIQUE,
    CNPJ VARCHAR UNIQUE);


CREATE TABLE COMPANHIA_AEREA
    (COMPAEREAID INTEGER PRIMARY KEY,
    NOMECOMPAEREA VARCHAR UNIQUE,
    REGRATARIFA VARCHAR UNIQUE);


CREATE TABLE VIAGEM
    (LOCALIZADOR VARCHAR PRIMARY KEY,
    OSUPID INTEGER REFERENCES ORGAO_SUPERIOR (OSUPID),
    OSOLICITID INTEGER REFERENCES ORGAO_SOLICITANTE (OSOLICITID),
    PCDP VARCHAR,
    DATAEMISSAO DATE,
    DATAEMBARQUE DATE,
    COMPAEREAID INTEGER REFERENCES COMPANHIA_AEREA (COMPAEREAID),
    CTB VARCHAR);


CREATE TABLE TARIFA
    (LOCALIZADOR VARCHAR REFERENCES VIAGEM (LOCALIZADOR),
    VTC DECIMAL,
    PDA DECIMAL,
    VTG DECIMAL,
    VTE DECIMAL,
    VB DECIMAL,
    PRIMARY KEY(LOCALIZADOR));


CREATE TABLE REGISTRO
    (MESREGISTRO INTEGER,
    LOCALIZADOR REFERENCES VIAGEM (LOCALIZADOR),
    EMISSAO VARCHAR,
    NOSHOW VARCHAR,
    REMARCADO VARCHAR,
    CANCELADO VARCHAR,
    VALORMULTA DECIMAL,
    VALORREEMBOLSO DECIMAL,
    DIFTARIFA DECIMAL,
    SFB,
    PRIMARY KEY (MESREGISTRO, LOCALIZADOR));

INSERT INTO ORGAO_SUPERIOR VALUES(235880, "Ministério do Desenvolvimento Regional", 1);
INSERT INTO ORGAO_SUPERIOR VALUES(219925, "Ministério da Mulher, da Família e dos Direitos Humanos", 3);
INSERT INTO ORGAO_SUPERIOR VALUES(308800, "Ministério da Fazenda", 5);
INSERT INTO ORGAO_SUPERIOR VALUES(219924, "Secretaria-Geral da Presidência da República", 7);
INSERT INTO ORGAO_SUPERIOR VALUES(46, "Advocacia-Geral da União", 11);
INSERT INTO ORGAO_SUPERIOR VALUES(304, "Ministério da Saúde", 13);
INSERT INTO ORGAO_SUPERIOR VALUES(308816, "Ministério dos Direitos Humanos e da Cidadania", 15);
INSERT INTO ORGAO_SUPERIOR VALUES(2837, "Casa Civil da Presidência da República", 17);
INSERT INTO ORGAO_SUPERIOR VALUES(214460, "Controladoria-Geral da União", 19);
INSERT INTO ORGAO_SUPERIOR VALUES(235876, "Ministério da Economia", 25);
INSERT INTO ORGAO_SUPERIOR VALUES(26, "Presidência da República", 32);
INSERT INTO ORGAO_SUPERIOR VALUES(308798, "Ministério das Cidades", 34);
INSERT INTO ORGAO_SUPERIOR VALUES(308799, "Ministério da Integração e do Desenvolvimento Regional", 36);
INSERT INTO ORGAO_SUPERIOR VALUES(27, "Gabinete de Segurança Institucional da Presidência da República", 39);
INSERT INTO ORGAO_SUPERIOR VALUES(308803, "Ministério da Gestão e da Inovação em Serviços Públicos", 42);
INSERT INTO ORGAO_SUPERIOR VALUES(42673, "Secretaria de Relações Institucionais", 47);
INSERT INTO ORGAO_SUPERIOR VALUES(308822, "Secretaria de Comunicação Social da Presidência da República", 51);
INSERT INTO ORGAO_SUPERIOR VALUES(45013, "Agência Nacional de Saúde Suplementar", 80);
INSERT INTO ORGAO_SUPERIOR VALUES(308821, "Ministério da Cultura", 83);
INSERT INTO ORGAO_SUPERIOR VALUES(264359, "Ministério das Comunicações", 85);
INSERT INTO ORGAO_SUPERIOR VALUES(306112, "Coordenação da Equipe de Transição de Governo-2022-2023", 204);
INSERT INTO ORGAO_SUPERIOR VALUES(308815, "Ministério das Mulheres", 206);
INSERT INTO ORGAO_SUPERIOR VALUES(308823, "Ministério da Igualdade Racial", 208);
INSERT INTO ORGAO_SUPERIOR VALUES(308804, "Ministério do Planejamento e Orçamento", 212);
INSERT INTO ORGAO_SOLICITANTE VALUES(1, "Secretaria de Fomento e Parcerias com o Setor Privado", 2);
INSERT INTO ORGAO_SOLICITANTE VALUES(222998, "Coordenação-Geral de Gestão de Pessoas (Ministério da Mulher, da Família e dos Direitos Humanos)", 4);
INSERT INTO ORGAO_SOLICITANTE VALUES(2, "Gabinete (Ministério da Fazenda)", 6);
INSERT INTO ORGAO_SOLICITANTE VALUES(3, "Diretoria de Tecnologia (Secretaria-Geral da Presidência da República)", 8);
INSERT INTO ORGAO_SOLICITANTE VALUES(4, "Diretoria de Recursos Logísticos (Secretaria-Geral da Presidência da República)", 9);
INSERT INTO ORGAO_SOLICITANTE VALUES(5, "Subchefia para Assuntos Jurídicos", 10);
INSERT INTO ORGAO_SOLICITANTE VALUES(46, "Advocacia-Geral da União", 12);
INSERT INTO ORGAO_SOLICITANTE VALUES(306, "Conselho Nacional de Saúde", 14);
INSERT INTO ORGAO_SOLICITANTE VALUES(319, "Conselho Nacional dos Direitos Humanos", 16);
INSERT INTO ORGAO_SOLICITANTE VALUES(1222, "Secretaria de Controle Interno", 18);
INSERT INTO ORGAO_SOLICITANTE VALUES(1364, "Controladoria Regional da União no Estado do Acre", 20);
INSERT INTO ORGAO_SOLICITANTE VALUES(1365, "Controladoria Regional da União no Estado de Alagoas", 21);
INSERT INTO ORGAO_SOLICITANTE VALUES(1373, "Controladoria Regional da União no Estado do Mato Grosso do Sul", 22);
INSERT INTO ORGAO_SOLICITANTE VALUES(1377, "Controladoria Regional da União no Estado de Pernambuco", 23);
INSERT INTO ORGAO_SOLICITANTE VALUES(1696, "Secretaria do Tesouro Nacional", 24);
INSERT INTO ORGAO_SOLICITANTE VALUES(1795, "Coordenação-Geral de Operações da Dívida Pública", 26);
INSERT INTO ORGAO_SOLICITANTE VALUES(101068, "Conselho Administrativo de Recursos Fiscais", 27);
INSERT INTO ORGAO_SOLICITANTE VALUES(13875, "Procuradoria Regional da União em Porto Alegre-4ª Região", 28);
INSERT INTO ORGAO_SOLICITANTE VALUES(1796, "Coordenação-Geral de Controle e Pagamento da Dívida Pública", 29);
INSERT INTO ORGAO_SOLICITANTE VALUES(1797, "Coordenação-Geral de Sistemas e Tecnologia de Informação", 30);
INSERT INTO ORGAO_SOLICITANTE VALUES(1923, "Gabinete do Ministro (Ministério da Economia)", 31);
INSERT INTO ORGAO_SOLICITANTE VALUES(1949, "Gabinete Pessoal do Presidente da República", 33);
INSERT INTO ORGAO_SOLICITANTE VALUES(308920, "Secretaria-Executiva (Ministério das Cidades)", 35);
INSERT INTO ORGAO_SOLICITANTE VALUES(38348, "Secretaria Nacional de Proteção e Defesa Civil", 37);
INSERT INTO ORGAO_SOLICITANTE VALUES(309353, "Secretaria-Executiva do Conselho Nacional de Segurança Alimentar e Nutricional", 38);
INSERT INTO ORGAO_SOLICITANTE VALUES(221418, "Departamento de Segurança Presidencial", 40);
INSERT INTO ORGAO_SOLICITANTE VALUES(244460, "Secretaria de Administração", 41);
INSERT INTO ORGAO_SOLICITANTE VALUES(1986, "Secretaria de Gestão do Patrimônio da União", 43);
INSERT INTO ORGAO_SOLICITANTE VALUES(219925, "Ministério da Mulher, da Família e dos Direitos Humanos", 44);
INSERT INTO ORGAO_SOLICITANTE VALUES(215893, "Secretaria de Coordenação e Governança das Empresas Estatais", 45);
INSERT INTO ORGAO_SOLICITANTE VALUES(78055, "Secretaria Especial de Articulação e Monitoramento", 46);
INSERT INTO ORGAO_SOLICITANTE VALUES(1972, "Gabinete (Secretaria de Relações Institucionais)", 48);
INSERT INTO ORGAO_SOLICITANTE VALUES(42802, "Secretaria-Executiva (Ministério do Desenvolvimento Regional)", 49);
INSERT INTO ORGAO_SOLICITANTE VALUES(13216, "Procuradoria Regional da União em Brasília-1ª Região", 50);
INSERT INTO ORGAO_SOLICITANTE VALUES(308822, "Secretaria de Comunicação Social da Presidência da República", 52);
INSERT INTO ORGAO_SOLICITANTE VALUES(309194, "Secretaria Nacional de Participação Social", 53);
INSERT INTO ORGAO_SOLICITANTE VALUES(309210, "Secretaria Nacional de Diálogos Sociais e Articulação de Políticas Públicas", 54);
INSERT INTO ORGAO_SOLICITANTE VALUES(309225, "Secretaria de Relações Políticos Sociais", 55);
INSERT INTO ORGAO_SOLICITANTE VALUES(118489, "Assessoria de Comunicação Social", 56);
INSERT INTO ORGAO_SOLICITANTE VALUES(15984, "Procuradoria Regional da União em Pernambuco-5ª Região", 57);
INSERT INTO ORGAO_SOLICITANTE VALUES(277719, "Secretaria Nacional de Fundos e Instrumentos Financeiros", 58);
INSERT INTO ORGAO_SOLICITANTE VALUES(29028, "Secretária-Geral de Consultoria", 59);
INSERT INTO ORGAO_SOLICITANTE VALUES(309260, "Secretaria-Executiva do Conselho de Desenvolvimento Econômico Social Sustentável", 60);
INSERT INTO ORGAO_SOLICITANTE VALUES(314727, "Secretaria Nacional de Juventude", 61);
INSERT INTO ORGAO_SOLICITANTE VALUES(2837, "Casa Civil da Presidência da República", 62);
INSERT INTO ORGAO_SOLICITANTE VALUES(2951, "Superintendência Regional de Administração em Minas Gerais", 63);
INSERT INTO ORGAO_SOLICITANTE VALUES(6, "Subchefia de Análise Governamental", 64);
INSERT INTO ORGAO_SOLICITANTE VALUES(3152, "Secretaria Especial de Análise Governamental", 65);
INSERT INTO ORGAO_SOLICITANTE VALUES(3154, "Secretaria Especial para Assuntos Jurídicos", 66);
INSERT INTO ORGAO_SOLICITANTE VALUES(3319, "Conselho Nacional dos Direitos da Criança e do Adolescente", 67);
INSERT INTO ORGAO_SOLICITANTE VALUES(3515, "Gabinete do Ministro (Casa Civil da Presidência da República)", 68);
INSERT INTO ORGAO_SOLICITANTE VALUES(219924, "Secretaria-Geral da Presidência da República", 69);
INSERT INTO ORGAO_SOLICITANTE VALUES(214535, "Secretaria-Executiva (Gabinete de Segurança Institucional da Presidência da República)", 70);
INSERT INTO ORGAO_SOLICITANTE VALUES(3516, "Gabinete (Gabinete de Segurança Institucional da Presidência da República)", 71);
INSERT INTO ORGAO_SOLICITANTE VALUES(3618, "Gabinete (Advocacia-Geral da União)", 72);
INSERT INTO ORGAO_SOLICITANTE VALUES(3619, "Procuradoria-Geral da União", 73);
INSERT INTO ORGAO_SOLICITANTE VALUES(313800, "Secretaria Extraordinária de Segurança Imediata do Presidente da República", 74);
INSERT INTO ORGAO_SOLICITANTE VALUES(40322, "Secretaria de Assuntos de Defesa e Segurança Nacional", 75);
INSERT INTO ORGAO_SOLICITANTE VALUES(8836, "Secretaria-Executiva/CC", 76);
INSERT INTO ORGAO_SOLICITANTE VALUES(50934, "Escola da Advocacia-Geral da União", 77);
INSERT INTO ORGAO_SOLICITANTE VALUES(3621, "Corregedoria-Geral da Advocacia da União", 78);
INSERT INTO ORGAO_SOLICITANTE VALUES(3620, "Consultoria-Geral da União", 79);
INSERT INTO ORGAO_SOLICITANTE VALUES(46908, "Presidência/ANS", 81);
INSERT INTO ORGAO_SOLICITANTE VALUES(216627, "Secretaria Especial para o Programa de Parcerias de Investimentos", 82);
INSERT INTO ORGAO_SOLICITANTE VALUES(308864, "Secretaria-Executiva (Ministério da Cultura)", 84);
INSERT INTO ORGAO_SOLICITANTE VALUES(7, "Secretaria de Radiodifusão", 86);
INSERT INTO ORGAO_SOLICITANTE VALUES(3623, "Conselho Superior da Advocacia-Geral da União", 87);
INSERT INTO ORGAO_SOLICITANTE VALUES(4328, "Secretaria Federal de Controle Interno", 88);
INSERT INTO ORGAO_SOLICITANTE VALUES(266820, "Gabinete do Ministro (Ministério das Comunicações)", 89);
INSERT INTO ORGAO_SOLICITANTE VALUES(9848, "Controladoria Regional da União no Estado do Rio de Janeiro", 90);
INSERT INTO ORGAO_SOLICITANTE VALUES(42800, "Gabinete (Ministério do Desenvolvimento Regional)", 91);
INSERT INTO ORGAO_SOLICITANTE VALUES(13574, "Procuradoria Regional da União no Rio de Janeiro-2ª Região", 92);
INSERT INTO ORGAO_SOLICITANTE VALUES(13580, "Procuradoria da União no Estado do Espírito Santo", 93);
INSERT INTO ORGAO_SOLICITANTE VALUES(13625, "Coordenação-Geral de Haveres Financeiros", 94);
INSERT INTO ORGAO_SOLICITANTE VALUES(13673, "Procuradoria-Seccional da União em Niterói", 95);
INSERT INTO ORGAO_SOLICITANTE VALUES(13674, "Procuradoria Regional da União em São Paulo-3ª Região", 96);
INSERT INTO ORGAO_SOLICITANTE VALUES(308915, "Gabinete (Ministério da Integração e do Desenvolvimento Regional)", 97);
INSERT INTO ORGAO_SOLICITANTE VALUES(15987, "Procuradoria da União no Estado de Alagoas", 98);
INSERT INTO ORGAO_SOLICITANTE VALUES(15999, "Procuradoria da União no Estado do Ceará", 99);
INSERT INTO ORGAO_SOLICITANTE VALUES(16003, "Procuradoria da União no Estado da Paraíba", 100);
INSERT INTO ORGAO_SOLICITANTE VALUES(16006, "Procuradoria Seccional da União em Campina Grande", 101);
INSERT INTO ORGAO_SOLICITANTE VALUES(16010, "Procuradoria da União no Estado do Rio Grande do Norte", 102);
INSERT INTO ORGAO_SOLICITANTE VALUES(56856, "Superintendência de Administração em São Paulo", 103);
INSERT INTO ORGAO_SOLICITANTE VALUES(16012, "Procuradoria da União no Estado de Sergipe", 104);
INSERT INTO ORGAO_SOLICITANTE VALUES(308906, "Gabinete do Ministro MGI", 105);
INSERT INTO ORGAO_SOLICITANTE VALUES(23563, "Coordenação-Geral das Relações e Análise Financeira dos Estados e Municípios", 106);
INSERT INTO ORGAO_SOLICITANTE VALUES(26868, "Secretaria de Comunicação Social Eletrônica", 107);
INSERT INTO ORGAO_SOLICITANTE VALUES(236998, "Gabinete da SEDGG", 108);
INSERT INTO ORGAO_SOLICITANTE VALUES(29029, "Secretaria-Geral de Contencioso", 109);
INSERT INTO ORGAO_SOLICITANTE VALUES(34889, "Diretoria de Recursos Logísticos (Casa Civil da Presidência da República)", 110);
INSERT INTO ORGAO_SOLICITANTE VALUES(34891, "Diretoria de Tecnologia (Casa Civil da Presidência da República)", 111);
INSERT INTO ORGAO_SOLICITANTE VALUES(37003, "Secretaria de Gestão e Inovação", 112);
INSERT INTO ORGAO_SOLICITANTE VALUES(237202, "Secretaria de Integridade Privada", 113);
INSERT INTO ORGAO_SOLICITANTE VALUES(77634, "Procuradoria Regional Federal 2ª Região", 114);
INSERT INTO ORGAO_SOLICITANTE VALUES(42673, "Secretaria de Relações Institucionais", 115);
INSERT INTO ORGAO_SOLICITANTE VALUES(99799, "Procuradoria Regional Federal 4ª Região", 116);
INSERT INTO ORGAO_SOLICITANTE VALUES(41036, "Conselho Nacional dos Direitos da Pessoa com Deficiência", 117);
INSERT INTO ORGAO_SOLICITANTE VALUES(8, "Secretaria de Governo da Presidência da República", 118);
INSERT INTO ORGAO_SOLICITANTE VALUES(43032, "Secretaria Nacional de Segurança Hídrica", 119);
INSERT INTO ORGAO_SOLICITANTE VALUES(73537, "Secretaria de Telecomunicações", 120);
INSERT INTO ORGAO_SOLICITANTE VALUES(69685, "Procuradoria-Geral Federal", 121);
INSERT INTO ORGAO_SOLICITANTE VALUES(269033, "Secretaria Especial de Comunicação Social", 122);
INSERT INTO ORGAO_SOLICITANTE VALUES(77716, "Secretaria de Coordenação de Sistemas", 123);
INSERT INTO ORGAO_SOLICITANTE VALUES(45396, "Diretoria de Normas e Habilitação das Operadoras", 124);
INSERT INTO ORGAO_SOLICITANTE VALUES(45397, "Diretoria de Normas e Habilitação de Produtos", 125);
INSERT INTO ORGAO_SOLICITANTE VALUES(45398, "Diretoria de Fiscalização", 126);
INSERT INTO ORGAO_SOLICITANTE VALUES(45399, "Diretoria de Desenvolvimento Setorial", 127);
INSERT INTO ORGAO_SOLICITANTE VALUES(20448, "Procuradoria Seccional da União em Volta Redonda", 128);
INSERT INTO ORGAO_SOLICITANTE VALUES(45400, "Diretoria de Gestão", 129);
INSERT INTO ORGAO_SOLICITANTE VALUES(45939, "Controladoria Regional da União no Estado do Amapá", 130);
INSERT INTO ORGAO_SOLICITANTE VALUES(45940, "Controladoria Regional da União no Estado de Roraima", 131);
INSERT INTO ORGAO_SOLICITANTE VALUES(45941, "Controladoria Regional da União no Estado de Tocantins", 132);
INSERT INTO ORGAO_SOLICITANTE VALUES(52446, "Gerência Regional de Administração no Mato Grosso do Sul", 133);
INSERT INTO ORGAO_SOLICITANTE VALUES(52448, "Gerência Regional de Administração no Piauí", 134);
INSERT INTO ORGAO_SOLICITANTE VALUES(52513, "Coordenação-Geral de Planejamento Estratégico da Dívida Pública", 135);
INSERT INTO ORGAO_SOLICITANTE VALUES(54452, "Departamento de Cálculos e Perícias", 136);
INSERT INTO ORGAO_SOLICITANTE VALUES(56849, "Superintendência de Administração no Rio Grande do Sul", 137);
INSERT INTO ORGAO_SOLICITANTE VALUES(56851, "Superintendência de Administração em Pernambuco", 138);
INSERT INTO ORGAO_SOLICITANTE VALUES(56854, "Superintendência de Administração no Rio de Janeiro", 139);
INSERT INTO ORGAO_SOLICITANTE VALUES(74019, "Secretaria Nacional de Políticas de Desenvolvimento Regional e Territorial", 140);
INSERT INTO ORGAO_SOLICITANTE VALUES(74576, "Departamento de Segurança da Informação e Cibernética", 141);
INSERT INTO ORGAO_SOLICITANTE VALUES(70352, "Secretaria-Geral de Administração", 142);
INSERT INTO ORGAO_SOLICITANTE VALUES(71071, "Secretaria-Executiva da Comissão de Ética Pública", 143);
INSERT INTO ORGAO_SOLICITANTE VALUES(72080, "Assessoria Especial do Presidente da República", 144);
INSERT INTO ORGAO_SOLICITANTE VALUES(72104, "Secretaria Nacional de Desenvolvimento Regional e Urbano", 145);
INSERT INTO ORGAO_SOLICITANTE VALUES(72576, "Ouvidoria-Geral da União", 146);
INSERT INTO ORGAO_SOLICITANTE VALUES(72889, "Procuradoria Seccional da União em Petrópolis", 147);
INSERT INTO ORGAO_SOLICITANTE VALUES(72902, "Procuradoria Seccional da União em Petrolina", 148);
INSERT INTO ORGAO_SOLICITANTE VALUES(73013, "Diretoria de Planejamento, Orçamento, Finanças e Contabilidade", 149);
INSERT INTO ORGAO_SOLICITANTE VALUES(73665, "Gabinete da STN", 150);
INSERT INTO ORGAO_SOLICITANTE VALUES(74011, "Secretaria Nacional de Habitação", 151);
INSERT INTO ORGAO_SOLICITANTE VALUES(74015, "Secretaria Nacional de Saneamento", 152);
INSERT INTO ORGAO_SOLICITANTE VALUES(74378, "Secretaria Nacional de Promoção e Defesa dos Direitos Humanos", 153);
INSERT INTO ORGAO_SOLICITANTE VALUES(74380, "Secretaria Nacional dos Direitos da Criança e do Adolescente", 154);
INSERT INTO ORGAO_SOLICITANTE VALUES(74572, "Departamento de Gestão", 155);
INSERT INTO ORGAO_SOLICITANTE VALUES(74931, "Secretaria de Ciência, Tecnologia e Insumos Estratégicos", 156);
INSERT INTO ORGAO_SOLICITANTE VALUES(77635, "Procuradoria Regional Federal 3ª Região", 157);
INSERT INTO ORGAO_SOLICITANTE VALUES(84010, "Diretoria de Gestão de Pessoas", 158);
INSERT INTO ORGAO_SOLICITANTE VALUES(9, "Secretaria de Integridade Pública", 159);
INSERT INTO ORGAO_SOLICITANTE VALUES(86565, "Procuradoria Regional Federal 5ª Região", 160);
INSERT INTO ORGAO_SOLICITANTE VALUES(88353, "Secretaria-Executiva (Controladoria-Geral da União)", 161);
INSERT INTO ORGAO_SOLICITANTE VALUES(88772, "Secretaria de Transparência e Prevenção da Corrupção", 162);
INSERT INTO ORGAO_SOLICITANTE VALUES(89529, "Assessoria Especial", 163);
INSERT INTO ORGAO_SOLICITANTE VALUES(89763, "Secretaria-Executiva (Secretaria de Relações Institucionais)", 164);
INSERT INTO ORGAO_SOLICITANTE VALUES(96379, "Procuradoria Regional Federal 1ª Região", 165);
INSERT INTO ORGAO_SOLICITANTE VALUES(99688, "Procuradoria Federal no Estado da Bahia", 166);
INSERT INTO ORGAO_SOLICITANTE VALUES(99729, "Procuradoria Federal no Estado do Pará", 167);
INSERT INTO ORGAO_SOLICITANTE VALUES(99818, "Procuradoria Federal no Estado do Paraná", 168);
INSERT INTO ORGAO_SOLICITANTE VALUES(209853, "Secretaria Especial de Assuntos Federativos", 169);
INSERT INTO ORGAO_SOLICITANTE VALUES(109940, "Secretaria Executiva", 170);
INSERT INTO ORGAO_SOLICITANTE VALUES(219926, "Gabinete (Secretaria-Geral da Presidência da República)", 171);
INSERT INTO ORGAO_SOLICITANTE VALUES(118480, "Secretaria Especial de Acompanhamento Governamental", 172);
INSERT INTO ORGAO_SOLICITANTE VALUES(104328, "Ouvidoria Nacional de Direitos Humanos", 173);
INSERT INTO ORGAO_SOLICITANTE VALUES(105648, "Subsecretaria da Dívida Pública", 174);
INSERT INTO ORGAO_SOLICITANTE VALUES(105649, "Subsecretaria de Relações Financeiras Intergovernamentais", 175);
INSERT INTO ORGAO_SOLICITANTE VALUES(105930, "Coordenação-Geral de Análise, Informações e Execução de Transferências Financeiras Intergovernamentais", 176);
INSERT INTO ORGAO_SOLICITANTE VALUES(112946, "Coordenação-Geral de Normas de Contabilidade Aplicadas à Federação", 177);
INSERT INTO ORGAO_SOLICITANTE VALUES(112950, "Coordenação-Geral de Contabilidade da União", 178);
INSERT INTO ORGAO_SOLICITANTE VALUES(113092, "Secretaria de Segurança e Coordenação Presidencial", 179);
INSERT INTO ORGAO_SOLICITANTE VALUES(10, "Secretaria de Gestão e Desempenho de Pessoal", 180);
INSERT INTO ORGAO_SOLICITANTE VALUES(117788, "Secretaria de Gestão de Pessoas e Relações do Trabalho", 181);
INSERT INTO ORGAO_SOLICITANTE VALUES(122489, "Corregedoria", 182);
INSERT INTO ORGAO_SOLICITANTE VALUES(209852, "Secretaria Especial de Assuntos Parlamentares", 183);
INSERT INTO ORGAO_SOLICITANTE VALUES(210237, "Departamento de Coordenação do Sistema de Proteçãoao Programa Nuclear Brasileiro", 184);
INSERT INTO ORGAO_SOLICITANTE VALUES(301135, "Procuradoria Regional da União da 6ª Região", 185);
INSERT INTO ORGAO_SOLICITANTE VALUES(311386, "Secretaria Nacional de Acesso à Informação", 186);
INSERT INTO ORGAO_SOLICITANTE VALUES(265884, "Secretaria-Executiva (Ministério das Comunicações)", 187);
INSERT INTO ORGAO_SOLICITANTE VALUES(221420, "Departamento de Coordenação de Eventos, Viagens e Cerimonial Militar", 188);
INSERT INTO ORGAO_SOLICITANTE VALUES(223030, "Secretaria Nacional dos Direitos da Pessoa com Deficiência", 189);
INSERT INTO ORGAO_SOLICITANTE VALUES(223039, "Secretaria Nacional dos Direitos da Pessoa Idosa", 190);
INSERT INTO ORGAO_SOLICITANTE VALUES(236470, "Secretaria de Desenvolvimento da Indústria, Comércio e Serviços", 191);
INSERT INTO ORGAO_SOLICITANTE VALUES(11, "Secretaria de Combate à Corrupção", 192);
INSERT INTO ORGAO_SOLICITANTE VALUES(237217, "Gabinete da SEPEC", 193);
INSERT INTO ORGAO_SOLICITANTE VALUES(237339, "Diretoria de Orçamento, Finanças e Contabilidade", 194);
INSERT INTO ORGAO_SOLICITANTE VALUES(237341, "Diretoria de Tecnologia da Informação", 195);
INSERT INTO ORGAO_SOLICITANTE VALUES(237352, "Diretoria de Administração e Logística", 196);
INSERT INTO ORGAO_SOLICITANTE VALUES(12, "Gabinete da SGC MGI", 197);
INSERT INTO ORGAO_SOLICITANTE VALUES(245951, "Gabinete da SSC MGI", 198);
INSERT INTO ORGAO_SOLICITANTE VALUES(285071, "Diretoria de Apoio às Residências Oficiais", 199);
INSERT INTO ORGAO_SOLICITANTE VALUES(292516, "Diretoria de Gestão de Serviços e Unidades Descentralizadas", 200);
INSERT INTO ORGAO_SOLICITANTE VALUES(292613, "Coordenação-Geral de Informações de Custos e do Sistema Integrado de Gestão Patrimonial", 201);
INSERT INTO ORGAO_SOLICITANTE VALUES(301137, "Procuradoria Regional Federal da 6ª Região", 202);
INSERT INTO ORGAO_SOLICITANTE VALUES(301327, "Superintendência Regional de Administração da 6ª Região", 203);
INSERT INTO ORGAO_SOLICITANTE VALUES(306112, "Coordenação da Equipe de Transição de Governo-2022-2023", 205);
INSERT INTO ORGAO_SOLICITANTE VALUES(308815, "Ministério das Mulheres", 207);
INSERT INTO ORGAO_SOLICITANTE VALUES(308823, "Ministério da Igualdade Racial", 209);
INSERT INTO ORGAO_SOLICITANTE VALUES(308889, "Gabinete do Ministro (Ministério dos Direitos Humanos e da Cidadania", 210);
INSERT INTO ORGAO_SOLICITANTE VALUES(308890, "Secretaria-Executiva (Ministério dos Direitos Humanos e da Cidadania)", 211);
INSERT INTO ORGAO_SOLICITANTE VALUES(308902, "Gabinete do Ministro MPO", 213);
INSERT INTO ORGAO_SOLICITANTE VALUES(308910, "Gabinete do Ministro MF", 214);
INSERT INTO ORGAO_SOLICITANTE VALUES(308916, "Secretaria-Executiva (Ministério da Integração e do Desenvolvimento Regional)", 215);
INSERT INTO ORGAO_SOLICITANTE VALUES(309138, "Assessoria Especial de Assuntos Parlamentares e Federativos", 216);
INSERT INTO ORGAO_SOLICITANTE VALUES(309141, "Assessoria Especial de Assuntos Internacionais", 217);
INSERT INTO ORGAO_SOLICITANTE VALUES(309142, "Assessoria Especial de Controle Interno", 218);
INSERT INTO ORGAO_SOLICITANTE VALUES(309144, "Assessoria Especial de Defesa da Democracia, Memória e Verdade", 219);
INSERT INTO ORGAO_SOLICITANTE VALUES(309629, "Coordenação-Geral de Gestão de Pessoas (Ministério dos Direitos Humanos e da Cidadania)", 220);
INSERT INTO ORGAO_SOLICITANTE VALUES(309931, "Secretaria Nacional dos Direitos das Pessoas LGBTQIA", 221);
INSERT INTO ORGAO_SOLICITANTE VALUES(320863, "Secretaria de Relações de Trabalho", 222);
INSERT INTO COMPANHIA_AEREA VALUES(1, "AZUL LINHAS AÉREAS BRASILEIRA", "https://www.voeazul.com.br/para-sua-viagem/informacoes-para-viajar/remarcacao--cancelamento");
INSERT INTO COMPANHIA_AEREA VALUES(2, "LATAM AIRLINES BRASIL", "nan");
INSERT INTO COMPANHIA_AEREA VALUES(3, "GOL Linhas Aéreas Inteligentes", "https://www.voegol.com.br/pt/informacoes/tarifas");
INSERT INTO COMPANHIA_AEREA VALUES(4, "AVIANCA S.A.", "https://www.avianca.com.br/regras-de-tarifas");
