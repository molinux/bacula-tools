DROP DATABASE IF EXISTS `cadastro`;

CREATE DATABASE `cadastro`;

USE `cadastro`;

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `country` varchar(100) default NULL,
  `city` varchar(255),
  `phone` varchar(100) default NULL,
  `company` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Clio Araujo","dolor@protonmail.org","Brazil","Campina Grande","(50) 95005-8608","Arcu Institute"),
  ("Kenneth Mendes","dui@google.com.br","Brazil","Uberaba","(12) 91644-7846","Mauris Blandit Enim Associates"),
  ("Barclay Bento","donec@protonmail.com.br","Brazil","Sete Lagoas","(35) 93684-0075","Eu Institute"),
  ("Amber de Abreu","cursus.vestibulum@yahoo.org","Brazil","Juazeiro do Norte","(32) 91230-5230","Rhoncus Donec Corp."),
  ("Carly Bento","tellus.phasellus@protonmail.org","Brazil","Codó","(92) 95164-8294","Enim Curabitur PC"),
  ("Anjolie Antunes","eros.proin.ultrices@yahoo.org","Brazil","Santarém","(25) 96391-4018","Gravida Mauris Institute"),
  ("Louis Ferreira","nunc.ac@google.com","Brazil","Belford Roxo","(64) 95575-4389","Posuere Enim Nisl Corp."),
  ("Berk Paulino","nec.luctus.felis@protonmail.edu","Brazil","Piracicaba","(89) 91184-7372","Elit Pretium Et Foundation"),
  ("Mia de Campos","arcu@aol.edu","Brazil","Marabá","(57) 95423-6815","Blandit Mattis Cras Ltd"),
  ("Callum Bastos","nec@hotmail.net","Brazil","Paulista","(92) 92384-4455","Nunc Associates");
INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Josephine Queiroz","proin.nisl@hotmail.net","Brazil","Crato","(73) 95422-3167","Consectetuer Cursus Inc."),
  ("Ali Moreira","sed@icloud.com.br","Brazil","Caxias do Sul","(54) 92195-6606","Suspendisse Commodo Inc."),
  ("Yoko Paiva","aliquam.auctor.velit@hotmail.com.br","Brazil","Cametá","(22) 92383-6692","Eu Inc."),
  ("Jason Soares","vulputate.velit@aol.net","Brazil","Nova Iguaçu","(44) 94258-8671","Enim Commodo LLP"),
  ("Mollie do Nascimento","vivamus@yahoo.net","Brazil","Blumenau","(34) 92374-6321","Tristique Corp."),
  ("Carlos Faria","integer.aliquam@google.com.br","Brazil","Nova Iguaçu","(78) 90431-5356","Hendrerit A Arcu Corp."),
  ("Tamekah Muniz","euismod.ac@outlook.edu","Brazil","Ipatinga","(42) 98231-2546","Eros Proin Ltd"),
  ("Mollie da Rosa","risus.donec@google.org","Brazil","Osasco","(59) 97976-4556","Proin Mi Foundation"),
  ("Jemima Inacio","purus.ac@yahoo.edu","Brazil","Porto Alegre","(58) 96267-6016","Duis A Incorporated"),
  ("Sasha Moura","quis.lectus@aol.edu","Brazil","Ribeirão Preto","(48) 97620-6673","Erat Vel Pede LLP");
INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Declan da Conceiçao","bibendum@protonmail.com.br","Brazil","Sobral","(62) 94110-4528","Amet Orci Ut Corporation"),
  ("Xanthus Teodoro","arcu.curabitur@yahoo.org","Brazil","Maranguape","(52) 92674-1362","Sed Eget Lacus Associates"),
  ("Phyllis Antunes","aenean.gravida@icloud.edu","Brazil","Foz do Iguaçu","(80) 93806-8605","Elit Company"),
  ("Vladimir Das Chagas","aliquet.odio@aol.org","Brazil","Ribeirão das Neves","(53) 91432-1418","Dolor Nonummy Foundation"),
  ("Rhonda da Conceiçao","eu.accumsan@aol.com.br","Brazil","Santa Inês","(81) 97380-5345","Nulla PC"),
  ("Jemima Galdino","ullamcorper.nisl.arcu@icloud.net","Brazil","Porto Alegre","(16) 93337-1944","Non Lobortis Quis LLP"),
  ("Merritt Batista","vulputate.nisi@yahoo.net","Brazil","Caxias do Sul","(93) 98868-8145","Sem Institute"),
  ("Charles da Silveira","erat.sed.nunc@hotmail.edu","Brazil","Chapecó","(82) 91707-8370","Mauris Incorporated"),
  ("Xavier Fonseca","ipsum.ac.mi@outlook.com.br","Brazil","Itapipoca","(85) 92108-4378","Odio Phasellus PC"),
  ("Emerson Moura","per.inceptos@protonmail.org","Brazil","Cajazeiras","(64) 91640-8546","Dui In Sodales Foundation");
INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Marny de Santana","auctor@aol.org","Brazil","Fortaleza","(48) 96727-5463","Tellus Institute"),
  ("Hakeem Guedes","ipsum.dolor@icloud.net","Brazil","Florianópolis","(14) 97901-6502","Mauris Id Sapien Incorporated"),
  ("TaShya Maciel","magna.a@protonmail.edu","Brazil","São Luís","(83) 95497-5617","Fusce Aliquet Magna Incorporated"),
  ("Amanda de Paula","dui@outlook.com.br","Brazil","Bacabal","(74) 93652-8501","Proin Dolor Incorporated"),
  ("Belle Peixoto","aliquet@yahoo.org","Brazil","Novo Hamburgo","(29) 93376-8264","Sociis Natoque Limited"),
  ("Lareina Guedes","habitant@icloud.net","Brazil","Criciúma","(87) 94219-4055","Phasellus At Corp."),
  ("Thor Antunes","magna.et.ipsum@icloud.com","Brazil","Campos dos Goytacazes","(13) 90388-5461","Purus Corp."),
  ("Velma Queiroz","tellus.imperdiet.non@yahoo.com","Brazil","Maracanaú","(72) 91147-2658","Fermentum Industries"),
  ("Hayden Sampaio","luctus.et@icloud.org","Brazil","São José","(82) 96852-5183","Faucibus Orci Luctus Institute"),
  ("Axel Barreto","nec@google.net","Brazil","Timon","(73) 95741-2432","Natoque Penatibus Et Corporation");
INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Warren Guimaraes","eget.dictum.placerat@protonmail.net","Brazil","Rio Grande","(37) 96327-0357","Libero Lacus Varius Incorporated"),
  ("Kay Rezende","sit.amet@yahoo.com.br","Brazil","Foz do Iguaçu","(52) 91591-8875","Fringilla Ornare LLP"),
  ("Ariana dos Santos","tincidunt.neque.vitae@icloud.com.br","Brazil","Juazeiro","(83) 98936-2353","Libero PC"),
  ("Ina Martins","auctor.non.feugiat@protonmail.org","Brazil","Belém","(35) 97855-0854","Purus Accumsan LLC"),
  ("Isabelle do Nascimento","integer.tincidunt.aliquam@outlook.com","Brazil","Foz do Iguaçu","(52) 94627-1275","Odio Sagittis Semper Company"),
  ("Vanna da Conceiçao","elit.pellentesque.a@icloud.edu","Brazil","Bragança","(55) 95374-6919","Vel Venenatis Vel LLC"),
  ("Logan da Rocha","vulputate@yahoo.org","Brazil","Colombo","(61) 97695-7153","Phasellus In Felis Industries"),
  ("Maile de Azevedo","orci@yahoo.com","Brazil","Piracicaba","(11) 95880-4488","At Nisi Associates"),
  ("Riley Bueno","egestas.fusce@hotmail.com","Brazil","Caucaia","(34) 98112-3218","Phasellus Dolor Elit Limited"),
  ("Abigail Andrade","dis@google.edu","Brazil","Fortaleza","(50) 95605-1154","Tellus Sem Mollis Corp.");
INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Tyler do Carmo","tellus.suspendisse.sed@protonmail.edu","Brazil","Lauro de Freitas","(54) 97737-4212","Ut Molestie Company"),
  ("Megan Barboza","cras@yahoo.com.br","Brazil","Sobral","(11) 94989-3288","In Corp."),
  ("Ashely Antunes","congue@google.com.br","Brazil","Duque de Caxias","(80) 92126-3628","Tellus Non Magna Corporation"),
  ("Alan Firmino","aliquam.iaculis@outlook.org","Brazil","João Pessoa","(68) 96346-5330","Montes Nascetur LLP"),
  ("Quin Fernandes","elementum.purus.accumsan@outlook.edu","Brazil","Itapipoca","(72) 96332-2732","Et Nunc Quisque PC"),
  ("Carly da Silva","aenean.euismod@google.com.br","Brazil","Maringá","(81) 99745-5576","Lorem Donec Inc."),
  ("Marsden Das Neves","faucibus.orci@icloud.com.br","Brazil","Petrópolis","(51) 96856-3057","Neque Corp."),
  ("Dawn Rocha","maecenas.iaculis@hotmail.com.br","Brazil","Mauá","(46) 98311-7258","Sed Diam Corp."),
  ("Sean Moura","ac.mattis@icloud.com","Brazil","São José dos Pinhais","(87) 94187-3952","Fringilla Donec Associates"),
  ("Rhonda Domingues","et.ultrices@icloud.com","Brazil","Timon","(61) 97041-4334","Urna Corporation");
INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Donovan de Carvalho","ac.libero@aol.org","Brazil","Salvador","(18) 93404-5154","Non Ante Ltd"),
  ("Lareina Sántos","mauris.eu@outlook.com.br","Brazil","Ribeirão Preto","(27) 95171-8868","Urna Ut Ltd"),
  ("Willow de Sousa","augue.id@yahoo.com","Brazil","Ribeirão das Neves","(73) 97242-8506","Odio Phasellus Company"),
  ("Ishmael Martins","aliquam.tincidunt@hotmail.com.br","Brazil","Balsas","(54) 91699-1790","Elit Curabitur Sed Incorporated"),
  ("Herman Monteiro","facilisis.facilisis.magna@icloud.net","Brazil","Santa Maria","(34) 93161-5132","Magna Limited"),
  ("Solomon Soares","nulla.vulputate@icloud.com.br","Brazil","Santa Maria","(22) 92511-2155","Donec Elementum Consulting"),
  ("Mariam Franco","est.mollis@yahoo.com.br","Brazil","Gravataí","(84) 91816-5513","Sed Eu Foundation"),
  ("Damon Leal","justo.proin.non@outlook.com","Brazil","Mauá","(16) 96428-9381","Nulla Donec LLC"),
  ("Ryder Diniz","eleifend.egestas.sed@icloud.com.br","Brazil","Caucaia","(37) 92750-8648","Netus Et Institute"),
  ("Tate de Abreu","ante.dictum@hotmail.com.br","Brazil","Bragança","(22) 93541-4703","Luctus Et Ultrices Foundation");
INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Trevor de Lourdes","pede@yahoo.com","Brazil","Imperatriz","(74) 99148-3012","Augue Porttitor Corporation"),
  ("Beck Antunes","ac@yahoo.edu","Brazil","Rio Verde","(63) 93632-6322","Eu Institute"),
  ("Cara de Morais","facilisis.lorem@hotmail.com.br","Brazil","Fortaleza","(41) 93484-8244","Tortor Dictum Eu Limited"),
  ("Norman Chaves","nam@outlook.org","Brazil","Açailândia","(54) 97534-1566","Nulla In Associates"),
  ("Shana Guedes","tellus.non@outlook.com.br","Brazil","Santa Maria","(74) 99435-8974","Lacus Pede Sagittis Associates"),
  ("Justin Moraes","nec@hotmail.com.br","Brazil","Cajazeiras","(34) 96528-6304","Posuere Vulputate Lacus Consulting"),
  ("Oleg Ramos","tincidunt.aliquam.arcu@outlook.com.br","Brazil","Governador Valadares","(48) 94286-1585","Nec Mollis Associates"),
  ("Levi Bastos","curabitur.massa@hotmail.edu","Brazil","Jaboatão dos Guararapes","(61) 97723-1231","Ornare Corp."),
  ("Steel Inacio","cursus.purus@aol.org","Brazil","Luziânia","(16) 90670-5288","Curae Incorporated"),
  ("Willow Nascimento","nulla.aliquet@aol.com","Brazil","Guarulhos","(41) 90415-5055","Justo Limited");
INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Igor de Fatima","justo.faucibus@outlook.com.br","Brazil","Vitória da Conquista","(88) 97743-5537","Nullam Corp."),
  ("Aphrodite Custodio","at@icloud.net","Brazil","Marabá","(75) 91235-7834","Scelerisque Mollis Limited"),
  ("Alden de Freitas","mauris.id@hotmail.net","Brazil","Caucaia","(89) 96795-6738","Arcu Foundation"),
  ("Jasper Mota","neque.vitae.semper@hotmail.net","Brazil","Castanhal","(85) 93361-2588","Augue Sed Inc."),
  ("Ishmael Faria","mollis.phasellus.libero@yahoo.org","Brazil","Jaboatão dos Guararapes","(44) 97415-4384","Eleifend Egestas Incorporated"),
  ("Frances Barbosa","sem.nulla@google.com","Brazil","Recife","(28) 95538-3265","Molestie LLC"),
  ("Christen Franca","nulla@icloud.com","Brazil","Sobral","(84) 98812-5210","Eros Nec LLC"),
  ("Echo de Matos","convallis.erat.eget@yahoo.net","Brazil","Juazeiro","(31) 95239-8156","Cras Eget LLP"),
  ("Nash de Morais","auctor.vitae.aliquet@aol.org","Brazil","Camaçari","(66) 92382-1287","Lorem Industries"),
  ("Hanna Barros","sed.nunc.est@protonmail.edu","Brazil","Fortaleza","(71) 96237-8739","Cursus Et Magna LLP");
INSERT INTO `usuarios` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Joelle Gomes","mattis.ornare@hotmail.org","Brazil","Crato","(98) 91675-9189","Fringilla Cursus Purus Industries"),
  ("Thaddeus Henrique","posuere.cubilia.curae@icloud.com.br","Brazil","Cascavel","(26) 90475-1241","Ut Odio Industries"),
  ("Amery Matos","vel@yahoo.net","Brazil","Osasco","(56) 95406-6373","Amet Associates"),
  ("Nash Figueiredo","sit@hotmail.net","Brazil","Divinópolis","(75) 90518-2435","Fermentum Corporation"),
  ("Jin Abreu","dis.parturient@google.com","Brazil","Porto Alegre","(48) 98624-8342","Egestas Blandit LLP"),
  ("Cadman de Moraes","fusce@outlook.com.br","Brazil","Chapadinha","(87) 95731-6227","Elit Ltd"),
  ("Olympia dos Santos","orci.ut@yahoo.org","Brazil","Caxias do Sul","(46) 91519-0855","Rhoncus Id Mollis Industries"),
  ("Kai Antunes","erat.nonummy.ultricies@yahoo.net","Brazil","Gravataí","(84) 92656-2669","Cubilia Incorporated"),
  ("Lane Martins","mi.aliquam@icloud.edu","Brazil","Itajaí","(58) 94896-9266","Odio Ltd"),
  ("Lacey Messias","nisi@outlook.com.br","Brazil","Cametá","(10) 98153-5711","Lectus Pede Inc.");
