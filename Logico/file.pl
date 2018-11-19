:- module(file, [salvarUsuario/10,login/3]).

use_module(util).

%! Usuario padrão
%! Username, Senha, Sexo, Altura, Peso, Cintura, Quadril, Dieta, Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ
usuario("leonardo","123","Leonardo",19,1.93,82.1).

salvarUsuario(Username,Password,PrimeiroNome,Idade,Sexo,Altura,Peso,Cintura,Quadril,Dieta):-
		downcase_atom(PrimeiroNome,Nome),
		string_concat(Username,".abc",NomeArquivo),
		string_concat("users/",NomeArquivo,NomeArquivoFinal),
		open(NomeArquivoFinal,write,Stream),
		add_in_list([],Username,UserFile),
		add_in_list(UserFile,Password,SenhaFile),
		add_in_list(SenhaFile,Nome,NomeFile),
		add_in_list(NomeFile,Idade,IdadeFile),
		add_in_list(IdadeFile,Sexo,SexoFile),
		add_in_list(SexoFile,Altura,AlturaFile),
		add_in_list(AlturaFile,[Peso],PesoFile),
		add_in_list(PesoFile,[Cintura],CinturaFile),
		add_in_list(CinturaFile,[Quadril],QuadrilFile),
		add_in_list(QuadrilFile,Dieta,File),
		write(Stream,File),
		write(Stream,"."),
		close(Stream),
		write("\n----- Salvo com Sucesso! -----\n"). 

lerUsuario(Username,Usuario):-
	string_chars(Username,Chars),
	atom_chars(A,Chars),
	string_concat(A,".abc",NomeArquivo),
	string_concat("users/",NomeArquivo,NomeArquivoFinal),
	open(NomeArquivoFinal, read, Stream),
	read_term(Stream, L,[]),
	nth0(0,L,Username1),
	nth0(1,L,Password1),
	nth0(2,L,Nome1),
	convertArrayCharToStr(Username1,NewUsername),
	convertArrayCharToStr(Password1,NewPassword),
	convertArrayCharToStr(Nome1,NewNome),
	setUsername(L,NewUsername,Usuario1),
	setSenha(Usuario1,NewPassword,Usuario2),
	setNome(Usuario2,NewNome,UsuarioFinal),
	close(Stream),
	Usuario = UsuarioFinal.

login(Username,Password,Usuario):-
	lerUsuario(Username,User),
	getSenha(User,Senha),
	(Senha == Password ->
		Usuario = User,
		write("\n----- Logado com Sucesso! -----\n");
	 Usuario = "").
