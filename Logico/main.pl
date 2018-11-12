%! Ao carregar os arquivos pelo swipl lembrar de carregar todos, Ex: swipl file.pl main.pl 

use_module(file).

printCreditos:- write("By:\n"),
				write("Anne Gabriele\n"),
				write("Gabryelle Soares\n"),
				write("Larissa Amorin\n"),
				write("Leonardo Lima\n"),
				write("Nathalya Raissa\n"),
				write("---------- Bem Vindo ao Gerenciador de Alimentacao! ----------\n").


printMenu:- write("---------- Voce esta no Menu Principal ----------\n \n"),
			write("----- O que deseja fazer -----\n"),
			write("(1) Fazer Login\n"),
			write("(2) Realizar Cadastro\n"),
			write("(3) Sair\n"),
			write("Digite sua opcao: ").

cadastro:- write("cadastro").

logarUser(User):- User = "".

runMenuUser(User):- write(User).

menuPrincipal:- printMenu,
				read_line_to_string(user_input,Opcao),
				(Opcao == "1" ->
					write("Login Selecionado"),
					logarUser(User),
					(User  == "" ->
						menuPrincipal;

					runMenuUser(User));
				 Opcao == "2" ->
				 	write("Cadastro Selecionado"),
				 	cadastro,
				 	menuPrincipal;
				 Opcao == "3" ->
				 	write("Sair Selecionado");
				 write("Opcao Invalida")).

:- initialization main.

main:- printCreditos,menuPrincipal.