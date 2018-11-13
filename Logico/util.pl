:- module(util, [add_in_list/3,convertArrayCharToStr/2,getSenha/2,setUsername/3,setSenha/3,setNome/3,read_int/1]).

%! Adicionar elemento em uma lista
add_in_list(L, E, R) :- append(L, [E], R).

%! Procurar elemento pelo indice
%! nth0(0,[a,b,c],X).

%! Converte um array de char para string 
convertArrayCharToStr(Atributo,Saida):- atom_chars(Atributo,Chars),
										string_codes(Saida,Chars).

%! Retorna a Senha do usuario
getSenha([_,Senha,_,_,_,_,_,_,_,_], Senha).

%! Seta a Username do usuario
setUsername([_,Password,PrimeiroNome,Idade,Sexo,Altura,Peso,Cintura,Quadril,Dieta],
		   NewUsername,
		   [NewUsername,Password,PrimeiroNome,Idade,Sexo,Altura,Peso,Cintura,Quadril,Dieta]).

%! Seta a Senha do usuario
setSenha([Username,_,PrimeiroNome,Idade,Sexo,Altura,Peso,Cintura,Quadril,Dieta],
		NewPassword,
		[Username,NewPassword,PrimeiroNome,Idade,Sexo,Altura,Peso,Cintura,Quadril,Dieta]).

%! Seta a Nome do usuario
setNome([Username,Password,_,Idade,Sexo,Altura,Peso,Cintura,Quadril,Dieta],
	   NewNome,
	   [Username,Password,NewNome,Idade,Sexo,Altura,Peso,Cintura,Quadril,Dieta]).

%! Le numeros inteiros e ponto flutuante
read_int(Number):- read_line_to_codes(user_input, Codes),
				   string_to_atom(Codes, Atom),
				   atom_number(Atom, Number).	