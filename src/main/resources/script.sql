USE test;
create table pointslist
(
  id INT NOT NULL AUTO_INCREMENT,
  pointname VARCHAR(45) NOT NULL,
  pointcontext VARCHAR(255) NOT NULL,
  pointclose INT(1) NOT NULL,
  PRIMARY KEY (id)
  ) engine=InnoDB;

set names 'utf8';

insert into pointslist (pointname, pointcontext, pointclose)
values ('Тестовое задание', 'Написать тестовое задание для JavaRush', 1);
insert into pointslist (pointname, pointcontext, pointclose)
values ('Заполнение базы', 'Написать скрипт для заполнения базы MySQL', 1);
insert into pointslist (pointname, pointcontext, pointclose)
values ('Пройти практику', 'Пройти практику с JavaRush', 0);
insert into pointslist (pointname, pointcontext, pointclose)
values ('Написать резюме', 'После практики написать и разослать резюме', 0);
insert into pointslist (pointname, pointcontext, pointclose)
values ('Выучить английский', 'Поднять уровень своего английского до уровня разговорного', 0);
insert into pointslist (pointname, pointcontext, pointclose)
values ('Найти работу', 'Найти работу Java разработчика', 0);