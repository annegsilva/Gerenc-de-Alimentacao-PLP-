%! Ao carregar os arquivos pelo swipl lembrar de carregar todos, Ex: swipl file.pl main.pl 
use_module(refeicoes).
use_module(util).
use_module(file).

printCreditos:- write("By:\n"),
				write("Anne Gabriele\n"),
				write("Gabryelle Soares\n"),
				write("Larissa Amorin\n"),
				write("Leonardo Lima\n"),
				write("Nathalya Raissa\n"),
				write("\n---------- Bem Vindo ao Gerenciador de Alimentacao! ----------\n").


printMenu:- write("\n---------- Voce esta no Menu Principal ----------\n \n"),
			write("----- O que deseja fazer -----\n"),
			write("(1) Fazer Login\n"),
			write("(2) Realizar Cadastro\n"),
			write("(3) Sair\n"),
			write("Digite sua opcao: ").

printMenuUser :-
	write("\n\n------------------ Você Está no Menu do Usuário ------------------\n\n"),
	write("\n----- O QUE DESEJA FAZER ----- \n"),
	writeln("(1) Inserir Refeição"),
	writeln("(2) Atualizar Medidas"),
	writeln("(3) Relatorio de Evolução"),
	writeln("(4) Voltar ao Menu Principal"),
	write("Digite sua opção: ").

cadastro:- 	write("\n----- Determine seu nome de usuario e senha -----"),
			write("\nUsername: "),
			read_line_to_string(user_input,Username),
			write("Password: "),
			read_line_to_string(user_input,Password),
			writeln("\n----- Agora nos conte mais sobre voce -----"),
			write("Sexo......(F)(M): "),
			read_line_to_string(user_input,Sexo),
			write("Altura.......(m): "),
			read_int(Altura),
			write("Peso........(kg): "),
			read_int(Peso),
			write("Cintura......(m): "),
			read_int(Cintura),
			write("Quadril......(m): "),
			read_int(Quadril),

			write("\n---- Escolha o tipo de dieta -----"),
			write("\n(1) Ganho de massa muscular"),
			write("\n(2) Emagrecimento"),
			write("\n(3) Dieta dos pontos\n"),
			read_int(Dieta),

			salvarUsuario(Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta).

inserirRefeicao(User) :-

	writeln("----------- Informe a quantidade dos seguintes nutrientes em gramas (g) ----------\n"),
	
	write("Proteínas....: "),
	read_int(Proteina),
	getProteina(User, AuxProt),
	AcumuladoProt is AuxProt + Proteina,

	getDieta(User, Dieta),
	getPeso(User, Peso),
	aval_proteina(Proteina, Dieta, Peso, AcumuladoProt),

	setProteina(User, AcumuladoProt, User1),
	
	write("Carboitrados.: "),
	read_int(Carboitrados),
	wrtie("aqui ta de boa"),
	getCarboidrato(User1, AuxCarb),
	wrtie("aqui tbm ta"),
	AcumuladoCarb is AuxCarb + Carboitrados,
	wrtie("ta massa"),

	aval_carboidrato(Carboitrados, Dieta, AcumuladoCarb),
	wrtie("nao ta mais"),
	setCarboidrato(User1, AcumuladoCarb, User2),

	write("Gorduras.....: "),
	read_int(Gorduras),
	getGordura(User2, AuxFat),
	AcumuladoFat is AuxFat + Gorduras,

	aval_gordura(Gorduras, AcumuladoFat),

	setGordura(User2, AcumuladoFat, UserFinal),
	writeln("\n ----- Refeição Registrada com Sucesso! ----- \n"),
	atualizarUsuario(UserFinal).

inserirPontos(User) :-
	writeln("----- Informe a quantidade de PONTOS equivalente a refeição a ser inserida  -----"),
	write("Pontos......: "),
	read_int(Pontos),
	getPontos(User, AuxPontos),
	AcumuladoPontos is AuxPontos + Pontos,
	setPontos(User, AcumuladoPontos, UserFinal),
	atualizarUsuario(UserFinal).


logarUser(User):- write("\nUsername: "),
				  read_line_to_string(user_input,Username),
				  write("Password: "),
				  read_line_to_string(user_input,Password),
				  login(Username,Password,Usuario),
				  User = Usuario.

runMenuUser(User):-
	printMenuUser,
	read_int(Opcao),
	(Opcao == 1 ->
		getDieta(User, Dieta),
		(Dieta == 3 -> inserirPontos(User);
			inserirRefeicao(User));
	writeln("ops")).


menuPrincipal:- printMenu,
				read_line_to_string(user_input,Opcao),
				(Opcao == "1" ->
					write("\n----- Iniciando Acesso -----\n"),
					logarUser(User),
					(User == "" ->
						menuPrincipal;

					runMenuUser(User));
				 Opcao == "2" ->
				 	write("\n----- Iniciando Cadastro -----\n"),
				 	cadastro,
				 	menuPrincipal;
				 Opcao == "3" ->
				 	write("Ate um outro dia amigo :)");
write("Opcao Invalida\n")).

:- initialization main.

main:- printCreditos,menuPrincipal.
