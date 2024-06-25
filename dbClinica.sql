Drop database dbClinica;

create database dbClinica;

use dbCLinica;

create table tbPacientes(
idPaciente int not null auto_increment,
nmPaciente varchar(45),
telefonePaciente Varchar(9),
convenio varchar(45),
primary key (idPaciente)
);

create table tbReceitaMedica(
idReceitaMedica int not null auto_increment,
descricao varchar(500),
primary key (idReceitaMedica)
);

create table tbMedico(
idMedico int not null auto_increment,
nmMedico varchar(45),
telefoneMedico varchar(9),
primary key (idMedico)
);

create table tbConsulta(
idConsulta int not null auto_increment,
dt_consulta datetime,
Medico_idMedico int,
Paciente_idPaciente int,
ReceitaMedica_idReceitaMedica int,
primary key (idConsulta),
foreign key (Medico_idMedico) references tbMedico (idMedico),
foreign key (ReceitaMedica_idReceitaMedica) references tbReceitaMedica (idReceitaMedica),
foreign key (Paciente_idPaciente) references tbPacientes (idPaciente)
);


desc tbMedico;
desc tbPacientes;
desc tbReceitaMedica;
desc tbConsulta;


insert into tbMedico(nmMedico,telefoneMedico)values('Valdecir guimaraes','956840165');
insert into tbMedico(nmMedico,telefoneMedico)values('Samara lino','957260018');
insert into tbMedico(nmMedico,telefoneMedico)values('Jessica Oliveira','984830902');
insert into tbMedico(nmMedico,telefoneMedico)values('Rafaela Busnello','958304827');

insert into tbPacientes(nmPaciente,telefonePaciente)values('Jair Nicoden','947460139');
insert into tbPacientes(nmPaciente,telefonePaciente)values('Milena Sales','954071893');	
insert into tbPacientes(nmPaciente,telefonePaciente)values('Marcia Santos','947830163');	
insert into tbPacientes(nmPaciente,telefonePaciente)values('Vanessa Camargo','937270154');

insert into tbReceitaMedica(descricao)values('Fazer licao de casa');
insert into tbReceitaMedica(descricao)values('Tomar dipirona nas horas vagas');
insert into tbReceitaMedica(descricao)values('Andar de bicicleta regularmente');
insert into tbReceitaMedica(descricao)values('Sentar quando se sentir mal');

insert into tbConsulta(dt_consulta,Medico_idMedico,Paciente_idPaciente,ReceitaMedica_idReceitaMedica)values('2024/06/18',4,1,2);
insert into tbConsulta(dt_consulta,Medico_idMedico,Paciente_idPaciente,ReceitaMedica_idReceitaMedica)values('2024/06/18',2,3,3);	
insert into tbConsulta(dt_consulta,Medico_idMedico,Paciente_idPaciente,ReceitaMedica_idReceitaMedica)values('2024/06/18',1,4,4);	
insert into tbConsulta(dt_consulta,Medico_idMedico,Paciente_idPaciente,ReceitaMedica_idReceitaMedica)values('2024/06/18',3,2,1);	


select * from tbMedico;
select * from tbPacientes;
select * from tbReceitaMedica; 		
select * from tbConsulta;

select med.nmMedico as nomeMedico, pac.nmPaciente as nomePaciente, rec.descricao 
from tbConsulta as con 
inner join tbMedico as med on con.Medico_idMedico = med.idMedico 
inner join tbPacientes as pac on con.Paciente_idPaciente = pac.idPaciente 
inner join tbReceitaMedica as rec on con.ReceitaMedica_idReceitaMedica = rec.idReceitaMedica
where med.nmMedico like '%s'	;