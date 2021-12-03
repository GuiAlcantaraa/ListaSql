USE BD040684

	
	//EXERCICIO 1 (OK)//

	SELECT * FROM Funcionario

	//EXERCICIO 2 (OK)//

	SELECT NOME, CPF
	FROM Funcionario

	//EXERCICIO 3 (OK)//

	SELECT * FROM Funcionario (NOLOCK) WHERE Sexo = 'F'

	//EXERCICIO 4 (OK)//

	SELECT * FROM Funcionario (NOLOCK) WHERE Sexo = 'M'

	//EXERCICIO 5 (OK)//

	SELECT * FROM Dependente (NOLOCK) WHERE Sexo = 'M'

	//EXERCICIO 6 (OK)//

	SELECT * FROM Funcionario (NOLOCK) WHERE Nome LIKE 'M%'

	//EXERCICIO 7 (OK)//

	SELECT * FROM Dependente (NOLOCK) WHERE Nome LIKE 'P%'

	//EXERCICIO 8 (OK)//

	SELECT * FROM Funcionario (NOLOCK) WHERE Nome LIKE '%CRUZ%'

	//EXERCICIO 9 (OK)//

	SELECT * FROM Dependente (NOLOCK) WHERE Nome LIKE '%CRUZ'

	//EXERCICIO 10 (OK)//

	select 
	Projeto.Nome,
	Min(TrabalhaProjeto.QtdeHoras)	
	from TrabalhaProjeto
	inner join Projeto 
	on Projeto.ProjetoID = TrabalhaProjeto.ProjetoID
	group by Projeto.Nome

	//EXERCICIO 11 (OK)//

	select 
	Projeto.Nome,
	AVG(TrabalhaProjeto.QtdeHoras) as MediaHoras
	from TrabalhaProjeto
	inner join Projeto on Projeto.ProjetoID = TrabalhaProjeto.ProjetoID
	group by Projeto.Nome


	//EXERCICIO 12 (OK)//

	select Sexo, 
	count(FuncionarioID) as Quantidade
	from Funcionario
	group by sexo

	//EXERCICIO 13 (OK)//

	select top 2
	Nome,
	DataNascimento
	from Funcionario 
	order by DataNascimento

	//EXERCICIO 14 (N�O)//

	SELECT TOP 3
	Nome,
	DataNascimento
	from Funcionario
	where Sexo ='m' 
	order by DataNascimento desc

	//EXERCICIO 15 (OK)//

	SELECT  
	Dependente.DependenteID,
	Dependente.Nome,
	FUNCIONARIO.FuncionarioID,
	Funcionario.Nome
	FROM Dependente
	inner JOIN Funcionario
	ON Funcionario.FuncionarioID = Dependente.FuncionarioID

	//EXERCICIO 16 (N�O)//

	SELECT * FROM Funcionario
	INNER JOIN

	//EXERCICIO 17 (OK)//

	select*from Projeto
	INNER JOIN TrabalhaProjeto
	ON TrabalhaProjeto.ProjetoID = Projeto.ProjetoID
	INNER JOIN Funcionario
	ON TrabalhaProjeto.FuncionarioID = Funcionario.FuncionarioID


	//EXERCICIO 18 (OK)//

	select *from Funcionario
	left join Dependente
	on Funcionario.FuncionarioID = Dependente.FuncionarioID
	where Dependente.DependenteID is null

	//EXERCICIO 19 (OK)//

	select 
	Funcionario.Nome,
	count (Dependente.DependenteID) QuantidadeDeDependentes
	from Funcionario
	inner join Dependente
	on Funcionario.FuncionarioID = Dependente.FuncionarioID
	group by Funcionario.Nome

	//EXERCICIO 20 (OK)//

	select 
	Funcionario.Nome,
	ISNULL(sum(TrabalhaProjeto.QtdeHoras), 0) HorasTrabalhadas
	from  Funcionario
	left join TrabalhaProjeto
	on Funcionario.FuncionarioID = TrabalhaProjeto.FuncionarioID
	group by Funcionario.Nome

	//EXERCICIO 21 (N�O)//

	//EXERCICIO 22 (N�O)//

	//EXERCICIO 23 (N�O)//

	//EXERCICIO 24 (N�O)//


	//EXERCICIO 25 (OK)//

	select Month(DataNascimento) Mes,
	count(FuncionarioID) QTDE
	from Funcionario
	group by Month(DataNascimento) 
	order by Mes


	//EXERCICIO 26 (OK)//

	select 
	Year(DataNascimento) Ano,
	Month(DataNascimento) Mes,
	count(FuncionarioID) QTDE
	from Funcionario
	group by Month(DataNascimento), Year(DataNascimento)
	order by Ano


	//EXERCICIO 27 (OK)//

	select Nome,
	DataNascimento,
	DATEDIFF(month, DataNascimento, getdate()) / 12
	FROM Funcionario


	//EXERCICIO 28 (OK)//

	create view VwFuncionarios
	as 
	select Nome,
	FuncionarioID,
	DataNascimento
	from Funcionario

	select * from VwFuncionarios

	//EXERCICIO 29 (N�O)//

	//EXERCICIO 30 (N�O)//

	//EXERCICIO 31 (N�O)//

	//EXERCICIO 32 (N�O)//

	//EXERCICIO 33 (N�O)//



