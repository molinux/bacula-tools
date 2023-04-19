DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `country` varchar(100) default NULL,
  `city` varchar(255),
  `phone` varchar(100) default NULL,
  `company` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Zachary Hamilton","metus.in@aol.org","Brazil","Itajaí","(98) 94719-0815","Eget Industries"),
  ("Daryl Hayes","ac.mattis@icloud.couk","Brazil","Maracanaú","(86) 94758-2496","Eget Massa Suspendisse Corporation"),
  ("Marvin Robles","donec.fringilla@outlook.ca","Brazil","Campina Grande","(61) 98404-7841","Sagittis Felis Inc."),
  ("Ira Morse","nulla@yahoo.edu","Brazil","Chapecó","(43) 91361-8982","Faucibus Morbi Associates"),
  ("Germaine Parsons","mattis@outlook.net","Brazil","Luziânia","(45) 95637-4852","Nam Porttitor Associates"),
  ("Tad Lancaster","sed@google.com","Brazil","Luziânia","(33) 97722-3849","Massa Institute"),
  ("Alexander Ross","nisi.magna.sed@outlook.org","Brazil","Governador Valadares","(38) 90407-7887","In Cursus Et Consulting"),
  ("Akeem Anthony","aliquam.ultrices@hotmail.ca","Brazil","João Pessoa","(45) 91352-2693","In Institute"),
  ("Sydney Stout","phasellus.at.augue@protonmail.couk","Brazil","Betim","(53) 91757-1060","Magna Ltd"),
  ("Hamilton Gilmore","mollis.dui.in@hotmail.couk","Brazil","Timon","(78) 94388-5846","Sagittis Felis Donec LLP");
INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Mohammad Petty","vitae.odio@google.org","Brazil","Maranguape","(25) 97676-2832","Feugiat Metus Sit Industries"),
  ("Bradley Cantu","convallis@google.net","Brazil","Abaetetuba","(25) 97931-3421","Pede Ultrices A Inc."),
  ("Amos Sosa","nonummy.ultricies@outlook.couk","Brazil","Cascavel","(67) 90846-9368","Neque Non Ltd"),
  ("Ebony Stanley","arcu.vestibulum@aol.net","Brazil","Colombo","(41) 92745-7211","Mauris Corp."),
  ("Ferris Bradford","aliquam.eu.accumsan@hotmail.couk","Brazil","Campinas","(63) 94147-6847","Augue Associates"),
  ("Eugenia Clarke","cubilia.curae@protonmail.net","Brazil","Ipatinga","(85) 95845-7082","Malesuada Malesuada Associates"),
  ("Martina Floyd","pulvinar.arcu@protonmail.com","Brazil","Blumenau","(81) 98630-4139","Velit Egestas Corporation"),
  ("Honorato Mccall","urna@outlook.net","Brazil","Águas Lindas de Goiás","(34) 94176-2576","Mollis LLP"),
  ("Wyatt Williamson","duis@icloud.edu","Brazil","São Gonçalo","(23) 98738-1769","Scelerisque Neque Sed Associates"),
  ("Aileen Sandoval","eu.tellus@protonmail.edu","Brazil","Guarapuava","(28) 91430-1182","Sem Incorporated");
INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Buffy Estes","lorem.ac.risus@aol.couk","Brazil","Salvador","(43) 92143-1921","Nunc Pulvinar Company"),
  ("Isadora Charles","egestas.fusce@yahoo.couk","Brazil","Bayeux","(13) 96746-6297","Porttitor Scelerisque Corp."),
  ("Nayda Cotton","a.aliquet@outlook.couk","Brazil","Anápolis","(38) 93574-8882","Auctor Velit Aliquam Industries"),
  ("Kuame Craft","vehicula.aliquet.libero@protonmail.ca","Brazil","Blumenau","(46) 96726-6271","Pellentesque Habitant LLP"),
  ("Wallace Oneil","ullamcorper.eu.euismod@google.edu","Brazil","Criciúma","(28) 95208-2272","Vehicula Associates"),
  ("Fulton Nichols","sem.eget.massa@protonmail.net","Brazil","São João de Meriti","(78) 95422-6317","Auctor Quis Limited"),
  ("Unity Mullen","sagittis@icloud.couk","Brazil","Caucaia","(93) 98875-0819","Dapibus Ligula Incorporated"),
  ("Hayes Mccullough","lectus.pede.ultrices@google.couk","Brazil","Salvador","(48) 90589-0102","Aliquam Gravida Incorporated"),
  ("Kylynn Benjamin","dignissim.maecenas@yahoo.net","Brazil","Santa Maria","(46) 93253-2058","Quam Elementum At Limited"),
  ("Illana Herman","amet.consectetuer.adipiscing@icloud.ca","Brazil","Petrópolis","(78) 93383-0395","Amet Ornare Incorporated");
INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Hyacinth Collins","consequat.lectus.sit@protonmail.ca","Brazil","Sobral","(92) 91256-7441","Vestibulum Ante Ipsum Associates"),
  ("Kamal Cline","arcu@outlook.org","Brazil","Anápolis","(70) 94579-1373","Ut Quam Vel Institute"),
  ("Jameson Hubbard","dolor.donec.fringilla@aol.net","Brazil","Itajaí","(56) 98899-3561","Nullam Ut Corp."),
  ("Jared Mooney","donec.feugiat.metus@hotmail.org","Brazil","Contagem","(32) 91664-2259","Auctor Ullamcorper Inc."),
  ("Dora English","aliquam@aol.org","Brazil","Jaboatão dos Guararapes","(83) 96516-2294","Sit Amet Incorporated"),
  ("Jorden Langley","malesuada@protonmail.couk","Brazil","Campos dos Goytacazes","(86) 91877-3828","Tempor Industries"),
  ("Caesar Mack","ornare@outlook.couk","Brazil","Bayeux","(29) 90890-2754","Nam Porttitor Institute"),
  ("Gareth Britt","consequat.purus.maecenas@aol.ca","Brazil","Nova Iguaçu","(87) 91911-3277","Est Congue A PC"),
  ("Candice Hester","sem.egestas.blandit@yahoo.couk","Brazil","Osasco","(21) 94244-2512","Maecenas Ltd"),
  ("Quintessa Kennedy","a.facilisis.non@icloud.couk","Brazil","Sete Lagoas","(27) 98866-4324","Augue Id Industries");
INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Jael Perez","quis.tristique@google.couk","Brazil","Bayeux","(83) 98216-7013","Nunc Limited"),
  ("Serena Frederick","nunc.ut@hotmail.org","Brazil","Santarém","(44) 97812-5876","Turpis Corporation"),
  ("Owen Baker","ac.mattis@outlook.com","Brazil","Joinville","(32) 90518-0518","Sed Neque Sed Industries"),
  ("Branden Adams","torquent.per.conubia@protonmail.edu","Brazil","São José","(78) 99238-7786","Sed Neque Corp."),
  ("Aiko Barrett","amet.luctus@yahoo.ca","Brazil","Governador Valadares","(47) 92931-6835","Sed Incorporated"),
  ("Rinah Mitchell","luctus.curabitur@google.net","Brazil","Petrolina","(14) 98685-1549","Ut Pellentesque Institute"),
  ("Byron Ford","metus.sit.amet@protonmail.net","Brazil","Ponta Grossa","(83) 91140-4428","Amet Faucibus Ut LLP"),
  ("Xantha Atkinson","risus.varius.orci@google.ca","Brazil","Osasco","(85) 98745-0143","Consectetuer Institute"),
  ("Karly Flores","vestibulum.massa.rutrum@hotmail.couk","Brazil","Diadema","(31) 91849-1643","Pellentesque Habitant LLC"),
  ("Giacomo Fowler","sit.amet@protonmail.net","Brazil","Itabuna","(79) 91990-2467","Erat Nonummy Ultricies Inc.");
INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Blake Orr","tempor@outlook.edu","Brazil","Maranguape","(31) 98951-1377","Id Magna LLP"),
  ("Katell Hahn","in.hendrerit@yahoo.ca","Brazil","Nova Iguaçu","(76) 98425-1255","Mauris Consulting"),
  ("Aidan Cash","phasellus.elit@yahoo.org","Brazil","Anápolis","(66) 92299-6447","Non Justo Industries"),
  ("Venus Manning","scelerisque.mollis@yahoo.net","Brazil","Açailândia","(46) 92227-2463","Mi Eleifend LLP"),
  ("Benjamin Hobbs","lectus.sit.amet@yahoo.couk","Brazil","Cajazeiras","(70) 96462-5271","Duis A Mi LLP"),
  ("Bevis Mcmillan","porttitor.interdum.sed@icloud.couk","Brazil","Maranguape","(78) 96036-6358","Quis LLP"),
  ("Winter Wolf","magna.ut@icloud.edu","Brazil","Divinópolis","(88) 97370-0446","Tellus Suspendisse Sed Limited"),
  ("Kirby Sweet","nulla.interdum@hotmail.net","Brazil","Itajaí","(84) 96867-2114","Pharetra Nibh Inc."),
  ("Leigh Franklin","nulla.integer.vulputate@protonmail.com","Brazil","Blumenau","(62) 92152-8213","Lacus LLP"),
  ("Joshua Riley","feugiat.sed@google.org","Brazil","Salvador","(57) 97093-4758","Lorem Luctus Industries");
INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Igor Dyer","nunc.ut@outlook.com","Brazil","Codó","(84) 98756-4126","Venenatis Vel LLP"),
  ("Wang Baird","amet.orci@outlook.com","Brazil","Santa Luzia","(21) 98498-4094","Diam At Inc."),
  ("Jayme Bryan","mauris.erat.eget@hotmail.edu","Brazil","Bayeux","(72) 92715-4631","Sagittis Corp."),
  ("Curran Talley","ligula.nullam@icloud.org","Brazil","Itapipoca","(52) 95153-8668","Tristique Senectus Et Institute"),
  ("Vernon Curtis","ipsum.dolor@google.org","Brazil","Ribeirão Preto","(74) 97828-6743","Tristique Senectus Et Inc."),
  ("Jerry Terrell","lobortis.class@yahoo.couk","Brazil","Curitiba","(42) 96200-1936","Bibendum Sed Corp."),
  ("Cally Banks","metus.vivamus@hotmail.couk","Brazil","Nova Iguaçu","(90) 96081-5133","Tristique Limited"),
  ("Micah Monroe","nisl@icloud.edu","Brazil","Imperatriz","(34) 91906-7563","Auctor Nunc Foundation"),
  ("Whitney Yang","sollicitudin.adipiscing@aol.edu","Brazil","Guarapuava","(99) 98411-2727","Ornare Fusce Corp."),
  ("Yvette Soto","aenean@icloud.ca","Brazil","Nova Iguaçu","(36) 98715-7912","Nec Metus Incorporated");
INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Nasim Gross","fusce.aliquet@icloud.couk","Brazil","Cametá","(64) 97756-0528","Proin Mi Ltd"),
  ("Maia Chapman","mollis@yahoo.org","Brazil","Ponta Grossa","(51) 92553-2819","Vestibulum Corp."),
  ("Alma Stafford","mauris@aol.org","Brazil","Caruaru","(58) 98258-4635","Porttitor Scelerisque LLC"),
  ("Chase Holland","amet.diam@hotmail.ca","Brazil","Colombo","(78) 92437-1930","Neque Venenatis Foundation"),
  ("Owen Branch","elit.nulla@icloud.org","Brazil","Rio de Janeiro","(25) 96347-3573","Donec Industries"),
  ("Darius Church","nullam.lobortis.quam@google.net","Brazil","Maranguape","(26) 98465-3177","Amet Associates"),
  ("Caesar Massey","quisque@google.com","Brazil","Uberlândia","(71) 90324-9834","Curabitur Dictum Inc."),
  ("Kuame Cline","ac.facilisis@hotmail.org","Brazil","São José","(63) 91825-5671","Ornare Facilisis Eget LLP"),
  ("Stewart Gilmore","in.consectetuer@protonmail.edu","Brazil","Blumenau","(98) 91313-5188","Sit Amet Incorporated"),
  ("Lamar Stevenson","bibendum.ullamcorper.duis@hotmail.edu","Brazil","Canoas","(21) 93999-3215","Lacus Corporation");
INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Silas Brown","mattis.cras@icloud.org","Brazil","Belford Roxo","(86) 94616-8532","Cras Dictum Associates"),
  ("Ina Richmond","gravida@hotmail.couk","Brazil","Petrópolis","(73) 97319-0577","Ultricies Corp."),
  ("Kirestin Steele","ac.orci.ut@hotmail.couk","Brazil","Itapipoca","(39) 97783-3716","Donec Sollicitudin Incorporated"),
  ("Lawrence Hebert","dolor.nonummy.ac@yahoo.edu","Brazil","Paranaguá","(52) 95509-4117","Mi Corp."),
  ("Trevor Rowland","mollis.nec@protonmail.couk","Brazil","Chapecó","(47) 92233-7971","Aliquam Arcu Inc."),
  ("Hall Griffith","nunc@google.ca","Brazil","Campinas","(53) 96975-0131","Adipiscing Elit Etiam LLP"),
  ("Callie Roman","condimentum.donec@hotmail.org","Brazil","Bragança","(29) 92538-2517","Pede Cras LLC"),
  ("Paula Osborne","integer.id@icloud.edu","Brazil","Luziânia","(87) 92234-0283","Laoreet Libero Limited"),
  ("Hadley Cote","aliquam.ornare@google.couk","Brazil","Patos","(82) 91491-4561","Cras Pellentesque Associates"),
  ("Yeo Rhodes","pellentesque@yahoo.org","Brazil","Bacabal","(67) 93772-0234","Blandit Industries");
INSERT INTO `myTable` (`name`,`email`,`country`,`city`,`phone`,`company`)
VALUES
  ("Bertha Holman","non.lorem@icloud.com","Brazil","Santa Inês","(42) 94514-9443","Maecenas Industries"),
  ("Carol Lucas","vel.venenatis.vel@icloud.edu","Brazil","Castanhal","(35) 99242-7614","Odio Etiam Limited"),
  ("Patience Solomon","pede.praesent.eu@google.org","Brazil","Curitiba","(79) 96165-0431","Velit Corporation"),
  ("Nathaniel Carpenter","nibh.dolor@outlook.edu","Brazil","Maranguape","(35) 94545-8739","Ornare In Associates"),
  ("Helen Marsh","interdum@google.couk","Brazil","João Pessoa","(77) 91001-5125","Massa Non LLC"),
  ("Bell Dyer","commodo.auctor.velit@hotmail.com","Brazil","Rio Verde","(90) 97685-1874","Tortor Associates"),
  ("Hamish Harding","consectetuer.cursus@icloud.couk","Brazil","Nova Iguaçu","(47) 99117-5930","Ullamcorper Duis LLC"),
  ("Cooper Workman","et.risus@hotmail.net","Brazil","João Pessoa","(25) 96932-3171","Elementum Purus Inc."),
  ("Xaviera Bruce","faucibus.id@hotmail.org","Brazil","Codó","(95) 91303-6062","Urna Incorporated"),
  ("Marvin Aguirre","natoque.penatibus@protonmail.net","Brazil","Florianópolis","(36) 98317-4149","Tincidunt Nunc Corporation");
