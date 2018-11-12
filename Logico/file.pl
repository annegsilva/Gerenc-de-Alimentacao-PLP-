:- module(file, [salvarUsuario/6,login/3]).

%! Usuario padrão
usuario("leonardo","123","Leonardo",19,1.93,82.1).

salvarUsuario(Username,Senha,NomeUser,Idade,Altura,Peso):-
		downcase_atom(NomeUser,Nome),
		string_concat(Username,".abc",NomeArquivo),
		string_concat("users/",NomeArquivo,NomeArquivoFinal),
		open(NomeArquivoFinal,write,Stream),
		add_in_list([],Username,UserFile),
		add_in_list(UserFile,Senha,SenhaFile),
		add_in_list(SenhaFile,Nome,NomeFile),
		add_in_list(NomeFile,Idade,IdadeFile),
		add_in_list(IdadeFile,Altura,AlturaFile),
		add_in_list(AlturaFile,[Peso],File),
		write(Stream,File),
		write(Stream,"."),
		close(Stream). 

lerUsuario(Username,Usuario):-
	string_concat(Username,".abc",NomeArquivo),
	string_concat("users/",NomeArquivo,NomeArquivoFinal),
	open(NomeArquivoFinal, read, Stream),
	read_term(Stream, L,[]),
	close(Stream),
	Usuario = L.


login(Username,Password,Usuario):-
	lerUsuario(Username,User),
	getSenha(User,Senha),
	(Senha == Password ->
		Usuario = User;
	 Usuario = "").

%! Adicionar elemento em uma lista
add_in_list(L, E, R) :- append(L, [E], R).

%! Procurar elemento pelo indice
%! nth0(0,[a,b,c],X).

%! Retorna a Senha do usuario
getSenha([_,Senha,_,_,_,_], Senha).