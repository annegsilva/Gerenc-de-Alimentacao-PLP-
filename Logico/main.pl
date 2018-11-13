%! Ao carregar os arquivos pelo swipl lembrar de carregar todos, Ex: swipl file.pl main.pl 

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

cadastro:- 	write("\n----- Determine seu nome de usuario e senha -----"),
			write("\nUsername: "),
			read_line_to_string(user_input,Username),
			write("Password: "),
			read_line_to_string(user_input,Password),
			write("\n----- Agora nos conte mais sobre voce -----"),
			write("\nNome..........: "),
			read_line_to_string(user_input,Nome),
			split_string(Nome," ","",S),nth0(0,S,PrimeiroNome),
			write("Idade......(m): "),
			read_int(Idade),
			write("Sexo....(F)(M): "),
			read_line_to_string(user_input,Sexo),
			write("Altura.....(m): "),
			read_int(Altura),
			write("Peso......(kg): "),
			read_int(Peso),
			write("Cintura....(m): "),
			read_int(Cintura),
			write("Quadril....(m): "),
			read_int(Quadril),

			write("\n---- Escolha o tipo de dieta -----"),
			write("\n(1) Ganho de massa muscular"),
			write("\n(2) Emagrecimento"),
			write("\n(3) Dieta dos pontos\n"),
			read_int(Dieta),

			salvarUsuario(Username,Password,PrimeiroNome,Idade,Sexo,Altura,Peso,Cintura,Quadril,Dieta).

logarUser(User):- write("\nUsername: "),
				  read_line_to_string(user_input,Username),
				  write("Password: "),
				  read_line_to_string(user_input,Password),
				  login(Username,Password,Usuario),
				  User = Usuario.

runMenuUser(User):- write(User).

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