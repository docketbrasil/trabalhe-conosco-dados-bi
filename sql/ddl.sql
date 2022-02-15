CREATE TABLE bi.estado (
	id int8 NOT NULL,
	nome varchar(50) NOT NULL,
	uf varchar(2) NOT NULL,
	CONSTRAINT estado_pk PRIMARY KEY (id)
);

INSERT INTO bi.estado (id, nome, uf) VALUES(1, 'Bahia', 'BA');  
INSERT INTO bi.estado (id, nome, uf) VALUES(2, 'Goiás', 'GO');  
INSERT INTO bi.estado (id, nome, uf) VALUES(3, 'Maranhão', 'MA'); 
INSERT INTO bi.estado (id, nome, uf) VALUES(4, 'Minas Gerais', 'MG'); 
INSERT INTO bi.estado (id, nome, uf) VALUES(5, 'Rio de Janeiro', 'RJ'); 
INSERT INTO bi.estado (id, nome, uf) VALUES(6, 'São Paulo', 'SP'); 


CREATE TABLE bi.cidade (
	id int8 NOT NULL,	
	nome varchar(100) NOT NULL,
	estado_id int8 NOT NULL,
	CONSTRAINT cidade_pk PRIMARY KEY (id)
);
ALTER TABLE bi.cidade ADD CONSTRAINT cidade_estado_id_fk FOREIGN KEY (estado_id) REFERENCES bi.estado(id);

INSERT INTO bi.cidade (id, nome, estado_id) VALUES(1, 'Salvador', 1);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(2, 'Ponto Novo', 1);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(3, 'Novo Horizonte', 1);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(4, 'Feira de Santana', 1);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(5, 'Maragogipe', 1);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(6, 'Jataí', 2);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(7, 'Itumbiara', 2);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(8, 'Mineiros', 2);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(9, 'Goiânia', 2);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(10, 'Nova Roma', 2);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(11, 'Lago Verde', 3);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(12, 'Chapadinha', 3);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(13, 'Imperatriz', 3);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(14, 'Paulino Neves', 3);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(15, 'São Luís', 3);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(16, 'Uberaba', 4);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(17, 'Fortaleza de Minas', 4);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(18, 'Congonhas', 4);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(19, 'Belo Horizonte', 4);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(20, 'Ouro Fino', 4);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(21, 'Nova Iguaçu', 5);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(22, 'Paraty', 5);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(23, 'Petrópolis', 5);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(24, 'Rio de Janeiro', 5);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(25, 'Paracambi', 5);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(26, 'Jaci', 6);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(27, 'Ilhabela', 6);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(28, 'Floreal', 6);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(29, 'Valentim Gentil', 6);
INSERT INTO bi.cidade (id, nome, estado_id) VALUES(30, 'São Paulo', 6);


CREATE TABLE bi.cartorio (
	id int8 NOT NULL,	
	nome varchar(100) NOT NULL,
	cidade_id int8 NOT NULL,
	CONSTRAINT cartorio_pk PRIMARY KEY (id)
);
ALTER TABLE bi.cartorio ADD CONSTRAINT cartorio_cidade_id_fk FOREIGN KEY (cidade_id) REFERENCES bi.cidade(id);

INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(1, '1º Cartório de Salvador', 1);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(2, '12º Cartório de Salvador', 1);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(3, '1º Cartório de Maragogipe', 5);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(4, '2º Cartório de Maragogipe', 5);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(5, '1º Cartório de Itumbiara', 7);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(6, '1º Cartório de São Luís', 15);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(7, '9º Cartório de São Luís', 15);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(8, '1º Cartório de Belo Horizonte', 19);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(9, '11º Cartório de Belo Horizonte', 19);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(10, '1º Cartório de Nova Iguaçu', 21);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(11, '8º Cartório do Rio de Janeiro', 24);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(12, '10º Cartório do Rio de Janeiro', 24);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(13, '1º Cartório de Floreal', 28);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(14, '1º Cartório de São Paulo', 30);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(15, '5º Cartório de São Paulo', 30);
INSERT INTO bi.cartorio (id, nome, cidade_id) VALUES(16, '14º Cartório de São Paulo', 30);


CREATE TABLE bi.documento (
	id int8 NOT NULL,	
	nome varchar(254) NULL,
	cartorio_id int8 NOT NULL,
	emissao_online bool NULL,
	CONSTRAINT documentos_pk PRIMARY KEY (id)
);
ALTER TABLE bi.documento ADD CONSTRAINT documento_cartorio_id_fk FOREIGN KEY (cartorio_id) REFERENCES bi.cartorio(id);

INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(1, 'TST', false, 3);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(2, 'Justiça Federal', false, 11);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(3, 'Petição inicial', false, 6);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(4, 'TRT', false, 15);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(5, 'Auto Vistoria do Corpo de Bombeiros', false, 8);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(6, 'Certidão de Nascimento', true, 14);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(7, 'Certidão de Óbito', true, 15);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(8, 'Declaração de União Estável', true, 16);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(9, 'Imposto de Transmissão de Bens Imóveis - ITBI - Emissão da Guia para Pagamento', true, 10);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(10, '2° Via de Certidão de Casamento', true, 1);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(11, 'Escritura de Posse', true, 7);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(12, 'Carnê de IPTU - Emissão', true, 4);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(13, 'Ficha de Dados Cadastrais', true, 5);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(14, 'Ficha Cadastral Completa', false, 8);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(15, 'Comprovante de Situação Cadastral no CPF', true, 12);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(16, 'Certidão de Contrato Registrado', true, 9);
INSERT INTO bi.documento (id, nome, emissao_online, cartorio_id) VALUES(17, 'Cartão do Simples Nacional', false, 13);