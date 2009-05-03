use mysql;


# table qui stocke les infos necessaire aux logins

DROP table user_id;

CREATE TABLE user_id (
  id BIGINT unsigned NOT NULL auto_increment,
  human bool NOT NULL,
  name varchar(30) NOT NULL,
  local_email varchar(80),
  local_password varchar(32),
  facebook_id BIGINT unsigned,
  facebook_email varchar(80),
  facebook_picture BLOB,
  openid_id BIGINT unsigned,
  openid_password varchar(32),
  PRIMARY KEY (id)
);

CREATE INDEX idx_user_id ON user_id (id);



# table qui stocke tout le contenu necessaire pour la page d'accueil du site

DROP table entry_cache;

CREATE TABLE entry_cache (
  user_id BIGINT unsigned NOT NULL,
  content BLOB,
  PRIMARY KEY (user_id)
);

CREATE INDEX idx_entry_cache ON entry_cache (user_id);



# table qui stocke toutes les transactions créé par les utilisateurs

DROP table transaction;

CREATE table transaction (
  id BIGINT unsigned NOT NULL auto_increment,
  type char NOT NULL default 'T',
  creation_date DATE NOT NULL,
  modification_date DATE NOT NULL,
  tag varchar(15),
  content BLOB,
  PRIMARY KEY (id)
);

CREATE INDEX idx_transaction ON transaction (id);



# table qui permet de lié un utilisateur a ses transactions

DROP table jonction_men_tra;

CREATE table jonction_men_tra (
  user_id BIGINT NOT NULL,
  content BLOB
);

CREATE INDEX idx_jonction_men_tra ON jonction_men_tra (user_id);



# table qui stocke l'history-notif pour les utilisateurs

DROP table history;

CREATE table history (
  user_id BIGINT NOT NULL,
  num_content int NOT NULL,
  content BLOB
);

CREATE INDEX idx_history ON history (user_id);
