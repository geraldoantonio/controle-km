PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO "schema_migrations" VALUES('20180805034642');
INSERT INTO "schema_migrations" VALUES('20180805035119');
INSERT INTO "schema_migrations" VALUES('20180805035416');
INSERT INTO "schema_migrations" VALUES('20180805043008');
INSERT INTO "schema_migrations" VALUES('20180810192308');
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "ar_internal_metadata" VALUES('environment','development','2018-08-07 14:37:09.312332','2018-08-07 14:37:09.312332');
CREATE TABLE "functionaries" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "matriculation" varchar, "name" varchar, "function" varchar, "active" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "functionaries" VALUES(1,'0102053','Geraldo Antônio Santos Júnior','Técnico em Informática - N2',1,'2018-08-07 14:42:21.986984','2018-08-09 17:16:50.920076');
INSERT INTO "functionaries" VALUES(2,'2142143756','Deivison Pereira','Técnico em Informática - N2',1,'2018-08-08 04:38:24.599791','2018-08-08 04:38:24.599791');
INSERT INTO "functionaries" VALUES(3,'29104','Marcelo Fárias','Técnico em Informática - N2',0,'2018-08-09 04:16:09.188640','2018-08-10 16:01:35.919961');
CREATE TABLE "addresses" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar, "cep" varchar, "address" varchar, "city" varchar, "uf" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "addresses" VALUES(1,'SEFAZ - Paulo Afonso','48605-138','R. da Vitória, 43 - Amaury Alves de Menezes ','Paulo Afonso ','BA','2018-08-07 14:44:11.354695','2018-08-09 16:54:16.324935');
INSERT INTO "addresses" VALUES(2,'CASA - Geraldo Junior','48608-335','Tv. B(1º de Maio), 1 - Alves de Souza','Paulo Afonso','BA','2018-08-07 14:46:28.979122','2018-08-09 21:50:11.738860');
INSERT INTO "addresses" VALUES(3,'SAC - Paulo Afonso','48602-470','R. Luís Viana Filho - Vila Poty','Paulo Afonso','BA','2018-08-09 16:22:31.288744','2018-08-09 17:33:09.695517');
INSERT INTO "addresses" VALUES(4,'COLEM - Paulo Afonso','15035-010','R. dos Estudantes, s/n - Amaury Alves de Menezes','Paulo Afonso','BA','2018-08-09 16:57:30.340999','2018-08-09 16:57:30.340999');
INSERT INTO "addresses" VALUES(5,'FÓRUM - Paulo Afonso','48607-010','R. das Caraibeiras, Bairro General Dultra','Paulo Afonso','BA','2018-08-09 17:34:35.709656','2018-08-09 17:34:35.709656');
INSERT INTO "addresses" VALUES(6,'Correios - Paulo Afonso','48603-970 ',' R. da Providência , 192, Perpetuo Socorro','Paulo Afonso','BA','2018-08-09 21:33:01.574692','2018-08-09 21:33:01.574692');
INSERT INTO "addresses" VALUES(7,'FÓRUM - Abaré','48680-000','R. Cônego Pascoal, s/n','Abaré','BA','2018-08-09 21:52:20.723282','2018-08-09 21:55:07.587068');
INSERT INTO "addresses" VALUES(8,'FÓRUM - Antas','48420-000','R. João Nilo, 538','Antas','BA','2018-08-09 21:54:06.372633','2018-08-09 21:55:42.917326');
INSERT INTO "addresses" VALUES(9,'FÓRUM - Cícero Dantas','48410-000','Pç. Municipal','Cícero Dantas','BA','2018-08-09 22:02:50.294715','2018-08-09 22:21:45.068865');
INSERT INTO "addresses" VALUES(10,'FÓRUM - Jeremoabo','48540-000','Rua Dr. José Gonçalves de Sá, 206 - Centro','Jeremoabo','BA','2018-08-09 22:05:53.781290','2018-08-09 22:05:53.781290');
INSERT INTO "addresses" VALUES(11,'FÓRUM - Glória','48610-000','Pç. Eduardo Campos, S/N - Centro','Glória','BA','2018-08-09 22:07:15.118234','2018-08-09 22:22:07.766390');
INSERT INTO "addresses" VALUES(12,'NTE24 - SEC','48601-320 ','Av. José Hemetério de Carvalho, 133 - Centro','Paulo Afonso','BA','2018-08-09 22:09:43.675829','2018-08-09 22:09:43.675829');
INSERT INTO "addresses" VALUES(13,'Posto Fiscal Heráclito Barreto',' 48609-490','Rod. BR 110, Km 01','Paulo Afonso','BA','2018-08-09 22:11:20.603678','2018-08-09 22:11:20.603678');
INSERT INTO "addresses" VALUES(14,'POSTO SHELL - Paulo Afonso','48601-320','Av. José Hemetério de Carvalho, s/n - Centro ','Paulo Afonso','BA','2018-08-09 22:12:31.173481','2018-08-09 22:12:31.173481');
INSERT INTO "addresses" VALUES(15,'Fórum - Macururé','48650-000','R. Campo, s/n - Centro ','Macururé','BA','2018-08-09 22:13:59.229089','2018-08-09 22:22:56.387107');
INSERT INTO "addresses" VALUES(16,'FÓRUM - Rodelas','48630-000','Pç. Dep. José Lourenço, s/n, Centro','Rodelas','BA','2018-08-09 22:16:53.270401','2018-08-09 22:22:35.674487');
INSERT INTO "addresses" VALUES(17,'CASA - Deivison Pereira','48606-510','R. Caxias, 38 - Fazenda Chesf','Paulo Afonso','BA','2018-08-09 22:17:57.913979','2018-08-09 22:18:16.653068');
INSERT INTO "addresses" VALUES(18,'FÓRUM - Paripiranga','48430-000','Pç. Pedro Rabelo Matos - s/n','Paripiranga','BA','2018-08-09 22:21:23.573768','2018-08-09 22:21:23.573768');
INSERT INTO "addresses" VALUES(19,'Posto Fiscal Fautino Dias Lima',' 48430-000','Rod. BA 396, s/n','Paripiranga','BA','2018-08-09 22:24:06.788330','2018-08-09 22:24:06.788330');
CREATE TABLE "cars" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "plate" varchar, "mark" varchar, "modelType" varchar, "functionary_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_4c787f984f"
FOREIGN KEY ("functionary_id")
  REFERENCES "functionaries" ("id")
);
INSERT INTO "cars" VALUES(1,'QNL1068','FORD','K SE 1.0',1,'2018-08-07 14:43:01.861396','2018-08-09 17:10:45.071971');
INSERT INTO "cars" VALUES(3,'AAA9999','FIAT','PÁLIO 1.4 ',1,'2018-08-10 14:00:27.759908','2018-08-10 14:00:27.759908');
CREATE TABLE "displacements" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "car_id" integer, "functionary_id" integer, "dateDay" date, "osNumber" integer, "osProject" integer, "startHour" time, "endHour" time, "addressSrc_id" integer, "addressDst_id" integer, "kmStart" integer, "kmEnd" integer, "kmCount" integer, "annotation" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_9a77fd7a81"
FOREIGN KEY ("car_id")
  REFERENCES "cars" ("id")
, CONSTRAINT "fk_rails_6bb2d22816"
FOREIGN KEY ("functionary_id")
  REFERENCES "functionaries" ("id")
, CONSTRAINT "fk_rails_fc0601e429"
FOREIGN KEY ("addressSrc_id")
  REFERENCES "addresses" ("id")
, CONSTRAINT "fk_rails_10df7f2947"
FOREIGN KEY ("addressDst_id")
  REFERENCES "addresses" ("id")
);
INSERT INTO "displacements" VALUES(3,1,1,'2018-08-07',NULL,1,'2000-01-01 10:00:00','2000-01-01 10:10:00',2,1,16141,16144,3,'','2018-08-08 04:35:11.248337','2018-08-09 20:54:39.021766');
INSERT INTO "displacements" VALUES(5,1,1,'2018-08-07',NULL,1,'2000-01-01 14:00:00','2000-01-01 14:10:00',1,2,16144,16147,3,'','2018-08-09 00:19:29.710179','2018-08-09 20:55:51.459397');
INSERT INTO "displacements" VALUES(6,1,1,'2018-08-07',845379,1,'2000-01-01 15:30:00','2000-01-01 15:40:00',2,5,16147,16151,4,'','2018-08-09 00:20:22.521621','2018-08-09 20:57:14.977822');
INSERT INTO "displacements" VALUES(7,1,1,'2018-08-07',NULL,1,'2000-01-01 20:00:00','2000-01-01 20:10:00',1,2,16151,16155,4,'','2018-08-09 03:16:09.548294','2018-08-09 20:59:09.092967');
INSERT INTO "displacements" VALUES(8,1,2,'2018-08-08',NULL,2,'2000-01-01 10:00:00','2000-01-01 10:10:00',2,4,16155,16158,3,'','2018-08-09 15:46:38.023569','2018-08-09 21:03:40.181106');
INSERT INTO "displacements" VALUES(9,1,1,'2018-08-09',NULL,1,'2000-01-01 19:50:00','2000-01-01 20:05:00',1,2,16168,16172,4,'','2018-08-09 15:48:21.157008','2018-08-09 21:13:30.398820');
INSERT INTO "displacements" VALUES(10,1,1,'2018-08-09',846144,1,'2000-01-01 18:59:00','2000-01-01 19:12:00',2,1,16164,16168,4,'','2018-08-09 19:55:34.036468','2018-08-09 21:13:18.061417');
INSERT INTO "displacements" VALUES(11,1,1,'2018-08-08',NULL,2,'2000-01-01 14:30:00','2000-01-01 14:45:00',4,2,16158,16160,2,'','2018-08-09 21:05:11.312441','2018-08-09 21:12:26.106353');
INSERT INTO "displacements" VALUES(12,1,1,'2018-08-08',1156484,3,'2000-01-01 16:00:00','2000-01-01 16:10:00',2,5,16160,16162,2,'','2018-08-09 21:06:42.111563','2018-08-09 21:12:56.077313');
INSERT INTO "displacements" VALUES(13,1,1,'2018-08-08',NULL,3,'2000-01-01 20:00:00','2000-01-01 20:10:00',5,2,16162,16164,2,'','2018-08-09 21:08:05.688410','2018-08-09 21:11:28.696969');
INSERT INTO "displacements" VALUES(14,1,1,'2018-08-01',52571,2,'2000-01-01 15:20:00','2000-01-01 15:30:00',2,4,16111,16114,3,'','2018-08-09 21:22:01.031198','2018-08-09 21:22:01.031198');
INSERT INTO "displacements" VALUES(15,1,1,'2018-08-01',NULL,2,'2000-01-01 19:30:00','2000-01-01 19:45:00',4,2,16114,16117,3,'','2018-08-09 21:23:37.629776','2018-08-09 21:23:37.629776');
INSERT INTO "displacements" VALUES(16,1,1,'2018-08-02',843766,1,'2000-01-01 10:00:00','2000-01-01 10:15:00',2,1,16117,16120,3,'','2018-08-09 21:26:10.252432','2018-08-09 21:26:23.873274');
INSERT INTO "displacements" VALUES(17,1,1,'2018-08-02',1152184,3,'2000-01-01 12:25:00','2000-01-01 12:35:00',1,5,16120,16123,3,'','2018-08-09 21:28:10.593387','2018-08-09 21:28:10.593387');
INSERT INTO "displacements" VALUES(18,1,1,'2018-08-02',NULL,3,'2000-01-01 14:00:00','2000-01-01 14:10:00',5,2,16123,16125,2,'','2018-08-09 21:30:37.079614','2018-08-09 21:30:37.079614');
INSERT INTO "displacements" VALUES(19,1,1,'2018-08-03',NULL,0,'2000-01-01 15:30:00','2000-01-01 15:45:00',2,6,16125,16128,3,'','2018-08-09 21:33:50.861543','2018-08-09 21:34:06.769407');
INSERT INTO "displacements" VALUES(20,1,1,'2018-08-03',NULL,0,'2000-01-01 16:05:00','2000-01-01 16:15:00',6,2,16128,16130,2,'','2018-08-09 21:35:53.696855','2018-08-09 21:35:53.696855');
INSERT INTO "displacements" VALUES(21,1,1,'2018-08-06',1154565,3,'2000-01-01 10:00:00','2000-01-01 10:10:00',2,5,16130,16132,2,'','2018-08-09 21:37:41.196914','2018-08-09 21:37:41.196914');
INSERT INTO "displacements" VALUES(22,1,1,'2018-08-06',NULL,3,'2000-01-01 14:00:00','2000-01-01 14:10:00',5,2,16132,16134,2,'','2018-08-09 21:38:56.250201','2018-08-09 21:39:59.847979');
INSERT INTO "displacements" VALUES(23,1,1,'2018-08-06',NULL,1,'2000-01-01 16:55:00','2000-01-01 17:05:00',2,1,16134,16137,3,'','2018-08-09 21:41:59.006708','2018-08-09 21:41:59.006708');
INSERT INTO "displacements" VALUES(24,1,1,'2018-08-06',NULL,1,'2000-01-01 20:00:00','2000-01-01 20:10:00',1,2,16137,16141,4,'','2018-08-09 21:44:00.242756','2018-08-09 21:44:00.242756');
INSERT INTO "displacements" VALUES(26,1,2,'2019-01-01',999999,0,'2000-01-01 09:00:00','2000-01-01 13:00:00',2,18,10000,10320,320,'TESTE E VALIDAÇÕES','2018-08-10 14:09:09.089318','2018-08-10 14:36:09.404557');
CREATE TABLE "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "users" VALUES(1,'geraldo.junior@solutis.com.br','$2a$11$q/FMluW7Z1ecSgb5ZA4IK.sQdST/lNqar22/VITTY43IeH43sWj/K',NULL,NULL,NULL,1,'2018-08-10 19:26:10.269110','2018-08-10 19:26:10.269110','179.108.61.120','179.108.61.120','2018-08-10 19:26:10.223501','2018-08-10 19:26:10.270358');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('functionaries',3);
INSERT INTO "sqlite_sequence" VALUES('cars',3);
INSERT INTO "sqlite_sequence" VALUES('addresses',19);
INSERT INTO "sqlite_sequence" VALUES('displacements',26);
INSERT INTO "sqlite_sequence" VALUES('users',1);
CREATE INDEX "index_cars_on_functionary_id" ON "cars" ("functionary_id");
CREATE INDEX "index_displacements_on_car_id" ON "displacements" ("car_id");
CREATE INDEX "index_displacements_on_functionary_id" ON "displacements" ("functionary_id");
CREATE INDEX "index_displacements_on_addressSrc_id" ON "displacements" ("addressSrc_id");
CREATE INDEX "index_displacements_on_addressDst_id" ON "displacements" ("addressDst_id");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
COMMIT;
