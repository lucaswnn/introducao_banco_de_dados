import pandas as pd

#criar arquivo .sql
sql_file = open('sql_commands.sql', 'w', encoding='utf-8')

disable_foreign = 'PRAGMA foreign_keys=OFF;\nBEGIN TRANSACTION;\n'

tab1 = \
'''
CREATE TABLE ORGAO_SUPERIOR
    (OSUPID INTEGER PRIMARY KEY,
    NOMEOSUP VARCHAR UNIQUE,
    CNPJ VARCHAR UNIQUE);\n
'''
tab2 = \
'''
CREATE TABLE ORGAO_SOLICITANTE
    (OSOLICITID INTEGER PRIMARY KEY,
    NOMEOSOLICIT VARCHAR UNIQUE,
    CNPJ VARCHAR UNIQUE);\n
'''
tab3 = \
'''
CREATE TABLE COMPANHIA_AEREA
    (COMPAEREAID INTEGER PRIMARY KEY,
    NOMECOMPAEREA VARCHAR UNIQUE,
    REGRATARIFA VARCHAR UNIQUE);\n
'''
tab4 = \
'''
CREATE TABLE VIAGEM
    (LOCALIZADOR VARCHAR PRIMARY KEY,
    OSUPID INTEGER REFERENCES ORGAO_SUPERIOR (OSUPID),
    OSOLICITID INTEGER REFERENCES ORGAO_SOLICITANTE (OSOLICITID),
    PCDP VARCHAR,
    DATAEMISSAO DATE,
    DATAEMBARQUE DATE,
    COMPAEREAID INTEGER REFERENCES COMPANHIA_AEREA (COMPAEREAID),
    CTB VARCHAR);\n
'''
tab5 = \
'''
CREATE TABLE TARIFA
    (LOCALIZADOR VARCHAR REFERENCES VIAGEM (LOCALIZADOR),
    VTC DECIMAL,
    PDA DECIMAL,
    VTG DECIMAL,
    VTE DECIMAL,
    VB DECIMAL,
    PRIMARY KEY(LOCALIZADOR));\n
'''
tab6 = \
'''
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
    PRIMARY KEY (MESREGISTRO, LOCALIZADOR));\n
'''

csv_dump = pd.read_csv('merged_csv_utf8.csv', sep=';')
tab6_inserts = list()
tab1_dict, tab2_dict, tab3_dict, tab4_5_dict = dict(), dict(), dict(), dict()

cnpj = 1
tab3_key = 1

def formato_data(string):
    data = string.split('/')
    return f'{data[2]}/{data[1]}/{data[0]}'

for index, linha in csv_dump.iterrows():
    #processar tabela REGISTRO
    tab6_inserts.append(f'INSERT INTO REGISTRO VALUES({linha["mes_registro"]}, "{linha["localizador"]}", "{linha["emissao"]}", "{linha["no_show"]}", "{linha["remarcado"]}", "{linha["cancelado"]}", {linha["valor_multas"]}, {linha["valor_reembolso"]}, {linha["diferenca_tarifa"]}, "{linha["situacao_bilhete"]}");\n')
    
    tab1_key = linha['codigo_orgao_superior']
    if tab1_key not in tab1_dict:
        tab1_nome = linha['nome_orgao_superior']
        tab1_dict[tab1_key] = [tab1_nome, cnpj]
        cnpj += 1
    
    tab2_key = linha['codigo_orgao_solicitante']
    if tab2_key not in tab2_dict:
        tab2_nome = linha['nome_orgao_solicitante']
        tab2_dict[tab2_key] = [tab2_nome, cnpj]
        cnpj += 1
    
    tab3_nome = linha['companhia_aerea']
    if tab3_nome not in tab3_dict:
        tab3_regra = linha['regra_tarifaria']
        tab3_dict[tab3_nome] = [tab3_key, tab3_regra]
        tab3_key += 1
    
    tab4_key = linha['localizador']
    if tab4_key not in tab4_5_dict:
        tab4_sup_id = linha['codigo_orgao_superior']
        tab4_sol_id = linha['codigo_orgao_solicitante']
        tab4_pcdp = linha['numero_pcdp']
        tab4_emissao = formato_data(linha['data_emissao'])
        tab4_embarque = formato_data(linha['data_embarque'])
        tab4_comp_id = tab3_dict[linha['companhia_aerea']][0]
        tab4_classe = linha['classe_tarifaria']
        tab5_vtc = linha['valor_tarifa_comercial']
        tab5_desc = linha['percentual_desconto_aplicado']
        tab5_vtg = linha['valor_tarifa_governo']
        tab5_vte = linha['valor_tarifa_embarque']
        tab5_vb = linha['valor_bilhete']
        
        tab4_5_dict[tab4_key] = [[tab4_sup_id, tab4_sol_id, tab4_pcdp, tab4_emissao, tab4_embarque,
                                  tab4_comp_id, tab4_classe], [tab5_vtc, tab5_desc, tab5_vtg,
                                  tab5_vte, tab5_vb]]

tab1_inserts = []
for key in tab1_dict:
    tab1_inserts.append(f'INSERT INTO ORGAO_SUPERIOR VALUES({key}, "{tab1_dict[key][0]}", {tab1_dict[key][1]});\n')

tab2_inserts = []
for key in tab2_dict:
    tab2_inserts.append(f'INSERT INTO ORGAO_SOLICITANTE VALUES({key}, "{tab2_dict[key][0]}", {tab2_dict[key][1]});\n')

tab3_inserts = []
for key in tab3_dict:
    tab3_inserts.append(f'INSERT INTO COMPANHIA_AEREA VALUES({tab3_dict[key][0]}, "{key}", "{tab3_dict[key][1]}");\n')

tab4_inserts = []
tab5_inserts = []
for key in tab4_5_dict:
    tab4_inserts.append(f'INSERT INTO VIAGEM VALUES("{key}", {tab4_5_dict[key][0][0]}, {tab4_5_dict[key][0][1]}, "{tab4_5_dict[key][0][2]}", "{tab4_5_dict[key][0][3]}", "{tab4_5_dict[key][0][4]}", {tab4_5_dict[key][0][5]}, "{tab4_5_dict[key][0][6]}");\n')
    tab5_inserts.append(f'INSERT INTO TARIFA VALUES("{key}", {tab4_5_dict[key][1][0]}, {tab4_5_dict[key][1][1]}, {tab4_5_dict[key][1][2]}, {tab4_5_dict[key][1][3]}, {tab4_5_dict[key][1][4]});\n')

sql_file.write(disable_foreign + '\n')
sql_file.write(tab1 + tab2 + tab3 + tab4 + tab5 + tab6)

sql_file.writelines(tab1_inserts)
sql_file.writelines(tab2_inserts)
sql_file.writelines(tab3_inserts)
sql_file.writelines(tab4_inserts)
sql_file.writelines(tab5_inserts)
sql_file.writelines(tab6_inserts)

sql_file.write('COMMIT;')
sql_file.close()