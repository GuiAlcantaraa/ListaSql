		
	// EXERCICIO 1 //

	SELECT * FROM Funcionario

	// EXERCICIO 2 //

	SELECT NOME, CPF
	FROM Funcionario

	// EXERCICIO 3 //

	SELECT * FROM Funcionario (NOLOCK) WHERE Sexo = 'F'

	// EXERCICIO 4 //

	SELECT * FROM Funcionario (NOLOCK) WHERE Sexo = 'M'

	// EXERCICIO 5 //

	SELECT * FROM Dependente (NOLOCK) WHERE Sexo = 'M'

	// EXERCICIO 6 //

	SELECT * FROM Funcionario (NOLOCK) WHERE Nome LIKE 'M%'

	// EXERCICIO 7 //

	SELECT * FROM Dependente (NOLOCK) WHERE Nome LIKE 'P%'

	// EXERCICIO 8 //

	SELECT * FROM Funcionario (NOLOCK) WHERE Nome LIKE '%CRUZ%'

	// EXERCICIO 9 //

	SELECT * FROM Dependente (NOLOCK) WHERE Nome LIKE '%CRUZ'

	// EXERCICIO 10 //

	select * from TrabalhaProjeto

	select 
	min(QtdeHoras) menor_hora
	FROM TrabalhaProjeto

	
	// EXERCICIO 11 //

	SELECT 
	PROJETOID,
	AVG(QtdeHoras)
	FROM TrabalhaProjeto
	GROUP BY ProjetoID

