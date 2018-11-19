%! Ao carregar os arquivos pelo swipl lembrar de carregar todos, Ex: swipl file.pl main.pl 
use_module(util).
use_module(file).
use_module(refeicoes).
use_module(indices).

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
	getCarboidrato(User1,Carb),
	AcumuladoCarb is Carb + Carboitrados,

	aval_carboidrato(Carboitrados, Dieta, AcumuladoCarb),
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

atualizarMedidas(User):-
	writeln("----- Informe suas novas medidas! -----"),
	write("Peso.....(kg): "),
	read_int(PesoAtual),

	write("Cintura...(m): "),
	read_int(CinturaAtual),

	write("Quadril...(m): "),
	read_int(QuadrilAtual),

	getDataAtual(Data),
	string_concat("Data da Medição: ",Data,DataMedicao),
	writeln(DataMedicao),

	setPeso(User,PesoAtual,User1),
	setCintura(User1,CinturaAtual,User2),
	setQuadril(User2,QuadrilAtual,User3),

	getAltura(User,Altura),
	calcula_imc(PesoAtual,Altura,CalculoIMC),
	calcula_rcq(CinturaAtual,QuadrilAtual,CalculoRCQ),

	getDataUpdate(User3,DataUpdate),
	getIMC(User3,IMC),
	getRCQ(User3,RCQ),

	add_in_list(DataUpdate,Data,NewDataUpdate),
	add_in_list(IMC,CalculoIMC,NewIMC),
	add_in_list(RCQ,CalculoRCQ,NewRCQ),


	setDataUpdate(User3,NewDataUpdate,User4),
	setIMC(User4,NewIMC,User5),
	setRCQ(User5,NewRCQ,User6),

	writeln("----- Novas medidas atualizadas com Sucesso! ----- \n"),

	atualizarUsuario(User6).

gerarRelatorio(User):-
	getDataUpdate(User,DataUpdate),
	getIMC(User,IMC),
	getRCQ(User,RCQ),
	getSexo(User,Sexo),
	relatorio_indices(DataUpdate,IMC,RCQ,Sexo).

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
		(Dieta == 3 -> inserirPontos(User),
					   runMenuUser(User);
			inserirRefeicao(User),
			runMenuUser(User));
	Opcao == 2 -> 
		atualizarMedidas(User),
		runMenuUser(User);
	
	Opcao == 3 ->
		gerarRelatorio(User),
		runMenuUser(User);

	Opcao == 4 ->
		menuPrincipal;

	writeln("----- Entrada Inválida ----- \n"),runMenuUser(User)).

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
