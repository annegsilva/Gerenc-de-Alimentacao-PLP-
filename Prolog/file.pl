:- module(file, [salvarUsuario/8,login/3,atualizarUsuario/1]).

use_module(util).

%! Username, Senha, Sexo, Altura, Peso, Cintura, Quadril, Dieta,
%! Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ 

salvarUsuario(Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta):-
		downcase_atom(Sexo,SexoS),
		string_concat(Username,".abc",NomeArquivo),
		string_concat("users/",NomeArquivo,NomeArquivoFinal),
		open(NomeArquivoFinal,write,Stream),
		add_in_list([],Username,UserFile),
		add_in_list(UserFile,Password,SenhaFile),
		add_in_list(SenhaFile,SexoS,SexoFile),
		add_in_list(SexoFile,Altura,AlturaFile),
		add_in_list(AlturaFile,Peso,PesoFile),
		add_in_list(PesoFile,Cintura,CinturaFile),
		add_in_list(CinturaFile,Quadril,QuadrilFile),
		add_in_list(QuadrilFile,Dieta,DietaFile),
		add_in_list(DietaFile,0,ProteinaFile),
		add_in_list(ProteinaFile,0,CarboidratoFile),
		add_in_list(CarboidratoFile,0,GorduraFile),
		add_in_list(GorduraFile,0,PontosFile),
		add_in_list(PontosFile,[],DataUpdateFile),
		add_in_list(DataUpdateFile,[],IMCFile),
		add_in_list(IMCFile,[],File),
		write(Stream,File),
		write(Stream,"."),
		close(Stream),
		write("\n----- Salvo com Sucesso! -----\n"). 

atualizarUsuario(User):-
	getUsername(User,Username),
	string_concat(Username,".abc",NomeArquivo),
	string_concat("users/",NomeArquivo,NomeArquivoFinal),
	open(NomeArquivoFinal,write,Stream),
	write(Stream,User),
	write(Stream,"."),
	close(Stream),
	write("\n----- Alterações realizadas com Sucesso! -----\n").

lerUsuario(Username,Usuario):-
	string_chars(Username,Chars),
	atom_chars(A,Chars),
	string_concat(A,".abc",NomeArquivo),
	string_concat("users/",NomeArquivo,NomeArquivoFinal),
	( exists_file(NomeArquivoFinal) -> 
		open(NomeArquivoFinal, read, Stream),
		read_term(Stream, L,[]),
		nth0(0,L,Username1),
		nth0(1,L,Password1),
		convertArrayCharToStr(Username1,NewUsername),
		convertArrayCharToStr(Password1,NewPassword),
		setUsername(L,NewUsername,Usuario1),
		setSenha(Usuario1,NewPassword,UsuarioFinal),
		close(Stream),
		Usuario = UsuarioFinal;

	writeln("----- Usuario não existente -----")).

login(Username,Password,Usuario):-
	lerUsuario(Username,User),
	getSenha(User,Senha),
	(Senha == Password ->
		Usuario = User,
		write("\n----- Logado com Sucesso! -----\n");
	 Usuario = "").