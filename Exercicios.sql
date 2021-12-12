USE BD040684

	
	--EXERCICIO 1 (OK)//

	SELECT * FROM Funcionario

	--EXERCICIO 2 (OK)//

	SELECT NOME, CPF
	FROM Funcionario

	--EXERCICIO 3 (OK)//

	SELECT * FROM Funcionario (NOLOCK) WHERE Sexo = 'F'

	--EXERCICIO 4 (OK)//

	SELECT * FROM Funcionario (NOLOCK) WHERE Sexo = 'M'

	--EXERCICIO 5 (OK)//

	SELECT * FROM Dependente (NOLOCK) WHERE Sexo = 'M'

	--EXERCICIO 6 (OK)//

	SELECT * FROM Funcionario (NOLOCK) WHERE Nome LIKE 'M%'

	--EXERCICIO 7 (OK)//

	SELECT * FROM Dependente (NOLOCK) WHERE Nome LIKE 'P%'

	--EXERCICIO 8 (OK)//

	SELECT * FROM Funcionario (NOLOCK) WHERE Nome LIKE '%CRUZ%'

	--EXERCICIO 9 (OK)//

	SELECT * FROM Dependente (NOLOCK) WHERE Nome LIKE '%CRUZ'

	--EXERCICIO 10 (OK)//

	select 
	Projeto.Nome,
	Min(TrabalhaProjeto.QtdeHoras)	
	from TrabalhaProjeto
	inner join Projeto 
	on Projeto.ProjetoID = TrabalhaProjeto.ProjetoID
	group by Projeto.Nome

	--EXERCICIO 11 (OK)//

	select 
	Projeto.Nome,
	AVG(TrabalhaProjeto.QtdeHoras) as MediaHoras
	from TrabalhaProjeto
	inner join Projeto on Projeto.ProjetoID = TrabalhaProjeto.ProjetoID
	group by Projeto.Nome


	--EXERCICIO 12 (OK)//

	select Sexo, 
	count(FuncionarioID) as Quantidade
	from Funcionario
	group by sexo

	--EXERCICIO 13 (OK)//

	select top 2
	Nome,
	DataNascimento
	from Funcionario 
	order by DataNascimento

	--EXERCICIO 14 (OK)//

	SELECT TOP 3
	Nome,
	DataNascimento
	from Funcionario
	order by DataNascimento desc

	--EXERCICIO 15 (OK)//

	SELECT  
	Dependente.DependenteID,
	Dependente.Nome,
	FUNCIONARIO.FuncionarioID,
	Funcionario.Nome
	FROM Dependente
	inner JOIN Funcionario
	ON Funcionario.FuncionarioID = Dependente.FuncionarioID

	--EXERCICIO 16 (NÃO)//
	SELECT  Funcionario.FuncionarioID,
        Funcionario.CPF,
        Funcionario.Nome,
        Funcionario.DataNascimento,
        Funcionario.Sexo,
        TrabalhaProjeto.ProjetoID
	FROM Funcionario
	INNER JOIN TrabalhaProjeto
	ON Funcionario.FuncionarioID = TrabalhaProjeto.FuncionarioID


	--EXERCICIO 17 (OK)//

	select*from Projeto
	INNER JOIN TrabalhaProjeto
	ON TrabalhaProjeto.ProjetoID = Projeto.ProjetoID
	INNER JOIN Funcionario
	ON TrabalhaProjeto.FuncionarioID = Funcionario.FuncionarioID


	--EXERCICIO 18 (OK)//

	select *from Funcionario
	left join Dependente
	on Funcionario.FuncionarioID = Dependente.FuncionarioID
	where Dependente.DependenteID is null

	--EXERCICIO 19 (OK)//

	select 
	Funcionario.Nome,
	count (Dependente.DependenteID) QuantidadeDeDependentes
	from Funcionario
	inner join Dependente
	on Funcionario.FuncionarioID = Dependente.FuncionarioID
	group by Funcionario.Nome

	--EXERCICIO 20 (OK)//

	select 
	Funcionario.Nome,
	ISNULL(sum(TrabalhaProjeto.QtdeHoras), 0) HorasTrabalhadas
	from  Funcionario
	left join TrabalhaProjeto
	on Funcionario.FuncionarioID = TrabalhaProjeto.FuncionarioID
	group by Funcionario.Nome

	--EXERCICIO 21 (OK)//
		select
		Funcionario.Nome,
		count( Dependente.Nome)
		from Funcionario
		inner join Dependente
		on Funcionario.FuncionarioID = Dependente.FuncionarioID
		group by Funcionario.Nome

	--EXERCICIO 22 (OK)//

		select
		Departamento.Nome,
		sum( TrabalhaProjeto.QtdeHoras) as qtde_horas
		from Departamento
		inner join Projeto
		on Departamento.DepartamentoID = Projeto.DepartamentoID
		inner join TrabalhaProjeto
		on TrabalhaProjeto.ProjetoID = Departamento.DepartamentoID
		group by Departamento.Nome

	--EXERCICIO 23 (OK)//
		select 
		Departamento.*,
		ProjetoID
		from Departamento
		left join Projeto
		on Departamento.DepartamentoID= Projeto.DepartamentoID
		WHERE ProjetoID is null

	--EXERCICIO 24 (OK)//
		select
		Funcionario.*
		from Funcionario
		left join Dependente
		on Funcionario.FuncionarioID= Dependente.FuncionarioID
		WHERE DependenteID is null


	--EXERCICIO 25 (OK)//

		select Month(DataNascimento) Mes,
		count(FuncionarioID) QTDE
		from Funcionario
		group by Month(DataNascimento) 
		order by Mes


	--EXERCICIO 26 (OK)//

		select 
		Year(DataNascimento) Ano,
		Month(DataNascimento) Mes,
		count(FuncionarioID) QTDE
		from Funcionario
		group by Month(DataNascimento), Year(DataNascimento)
		order by Ano


	--EXERCICIO 27 (OK)//

		select Nome,
		DataNascimento,
		DATEDIFF(month, DataNascimento, getdate()) / 12
		FROM Funcionario


	--EXERCICIO 28 (OK)//

	create view VwFuncionarios
	as 
	select Nome,
	FuncionarioID,
	DataNascimento
	from Funcionario

	select * from VwFuncionarios

	--EXERCICIO 29 (OK)//

	--EXERCICIO 30 (NÃO)//

	CREATE PROCEDURE PrParticipantesProjeto
		as
		SELECT 
				FuncionarioID,
				COUNT(ProjetoID) Projetos
		FROM TrabalhaProjeto 
		GROUP BY FuncionarioID
		GO

		EXEC PrParticipantesProjeto;

	--EXERCICIO 31 (OK)//
	CREATE PROCEDURE PrTrabalhaProjeto
		AS
		SELECT 
			ProjetoID,
			COUNT(FuncionarioID) QtdeFuncionario
		FROM TrabalhaProjeto
		GROUP BY ProjetoID
		GO

		EXEC PrTrabalhaProjeto

	--EXERCICIO 32 (OK)//

	CREATE PROCEDURE PrDataFuncionario
		AS
		DECLARE @DataPesquisa as DATETIME =  '2002/01/03'

		SELECT * FROM Funcionario
		WHERE DataNascimento > @DataPesquisa
		ORDER BY DataNascimento
		GO

		EXEC PrDataFuncionario

	--EXERCICIO 33 (OK)//

	CREATE PROCEDURE PrAttDataNascimentoFuncionario 
		AS
		DECLARE @AttDataNascimento as DATETIME = '2002-07-17'
		
		UPDATE Funcionario SET DataNascimento = @AttDataNascimento where FuncionarioID = 60001

		SELECT 
				FuncionarioID,
				DataNascimento
		FROM Funcionario
		GO

		EXEC PrAttDataNascimentoFuncionario



