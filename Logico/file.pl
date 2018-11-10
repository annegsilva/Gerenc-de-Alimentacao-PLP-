:- module(file, [salvarUsuario/6,lerUsuario/2]).

%! Usuario padrão
usuario("leonardo","123","Leonardo",19,1.93,82.1).

salvarUsuario(Username,Senha,NomeUser,Idade,Altura,Peso):-
		downcase_atom(NomeUser,Nome),
		string_concat(Username,".abc",NomeArquivo),
		open(NomeArquivo,write,Stream),
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
	open(NomeArquivo, read, Stream),
	read_term(Stream, L,[]),
	close(Stream),
	Usuario = L.

%! Adicionar elemento em uma lista
add_in_list(L, E, R) :- append(L, [E], R).

%! Procurar elemento pelo indice
%! nth0(0,[a,b,c],X).

%! Retorna o segundo segundo elemento
list_second([_,Second,_,_,_,_], Second).