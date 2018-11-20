:- module(util, [read_int/1,add_in_list/3,convertArrayCharToStr/2,getTimeValue/2,getDataAtual/1,
		  getUsername/2,getSenha/2,getSexo/2,getAltura/2,getPeso/2,getCintura/2,getQuadril/2,getDieta/2,
		  getProteina/2,getCarboidrato/2,getGordura/2,getPontos/2,getDataUpdate/2,getIMC/2,getRCQ/2,
		  setUsername/3,setSenha/3,setSexo/3,setAltura/3,setPeso/3,setCintura/3,setQuadril/3,setDieta/3,
		  setProteina/3,setCarboidrato/3,setGordura/3,setPontos/3,setDataUpdate/3,setIMC/3,setRCQ/3, valida_inteiro/2, valida_sexo/2]).

sexo("F").
sexo("f").
sexo("M").
sexo("m").

valida_sexo(Label, Retorno) :-
	write(Label),
	read_line_to_string(user_input, Sexo),
	(sexo(Sexo) -> Retorno is Sexo);
	(writeln("Entrada Inválida! Tente Novamente. q´• ʖ̯ •`p \n"),
	valida_sexo(Label, Retorno)).

valida_inteiro(Label, Retorno) :-
	write(Label),
	read_int(Entrada),
	((integer(Entrada); float(Entrada)) -> Retorno is Entrada);
	(writeln("Entrada Inválida! Tente Novamente. q´• ʖ̯ •`p \n"),
	valida_inteiro(Label, Retorno)).

%! Captura data atual
getTimeValue(Key, Value):-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(Key, DateTime, Value).

%! Retorna string da data atual
getDataAtual(Date):-
	getTimeValue(day,X),
	getTimeValue(month,Y),
	getTimeValue(year,Z),
	string_concat(X,"/",Saida1),
	string_concat(Saida1,Y,Saida2),
	string_concat(Saida2,"/",Saida3),
	string_concat(Saida3,Z,Date).

%! Adicionar elemento em uma lista
add_in_list(L, E, R) :- append(L, [E], R).

%! Procurar elemento pelo indice
%! nth0(0,[a,b,c],X).

%! Le numeros inteiros e ponto flutuante
read_int(Number):- read_line_to_codes(user_input, Codes),
				   string_to_atom(Codes, Atom),
				   atom_number(Atom, Number).	

%! Converte um array de char para string 
convertArrayCharToStr(Atributo,Saida):- atom_chars(Atributo,Chars),
										string_codes(Saida,Chars).

%! Retorna o username do usuario
getUsername([Username,_,_,_,_,_,_,_,_,_,_,_,_,_,_], Username).

%! Retorna a Senha do usuario
getSenha([_,Senha,_,_,_,_,_,_,_,_,_,_,_,_,_], Senha).

%! Retorna o sexo do usuario
getSexo([_,_,Sexo,_,_,_,_,_,_,_,_,_,_,_,_], Sexo).

%! Retorna a altura do usuario
getAltura([_,_,_,Altura,_,_,_,_,_,_,_,_,_,_,_], Altura).

%! Retorna o peso do usuario
getPeso([_,_,_,_,Peso,_,_,_,_,_,_,_,_,_,_], Peso).

%! Retorna a cintura do usuario
getCintura([_,_,_,_,_,Cintura,_,_,_,_,_,_,_,_,_], Cintura).

%! Retorna o quadril do usuario
getQuadril([_,_,_,_,_,_,Quadril,_,_,_,_,_,_,_,_], Quadril).

%! Retorna a dieta do usuario
getDieta([_,_,_,_,_,_,_,Dieta,_,_,_,_,_,_,_], Dieta).

%! Retorna a proteina do usuario
getProteina([_,_,_,_,_,_,_,_,Proteina,_,_,_,_,_,_], Proteina).

%! Retorna o carboidrato do usuario
getCarboidrato([_,_,_,_,_,_,_,_,_,Carboidrato,_,_,_,_,_], Carboidrato).

%! Retorna a gordura do usuario
getGordura([_,_,_,_,_,_,_,_,_,_,Gordura,_,_,_,_], Gordura).

%! Retorna os pontos do usuario
getPontos([_,_,_,_,_,_,_,_,_,_,_,Pontos,_,_,_], Pontos).

%! Retorna a dataUpdate do usuario
getDataUpdate([_,_,_,_,_,_,_,_,_,_,_,_,DataUpdate,_,_], DataUpdate).

%! Retorna o IMC do usuario
getIMC([_,_,_,_,_,_,_,_,_,_,_,_,_,IMC,_], IMC).


%! Retorna o RCQ do usuario
getRCQ([_,_,_,_,_,_,_,_,_,_,_,_,_,_,RCQ], RCQ).


%! Seta a Username do usuario
setUsername([_,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
			Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ],
		   NewUsername,
		   [NewUsername,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		    Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta a Senha do usuario
setSenha([Username,_,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ],
		NewPassword,
		[Username,NewPassword,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta o sexo do usuario
setSexo([Username,Password,_,Altura,Peso,Cintura,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ],
	   NewSexo,
	   [Username,Password,NewSexo,Altura,Peso,Cintura,Quadril,Dieta,
	    Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta a altura do usuario
setAltura([Username,Password,Sexo,_,Peso,Cintura,Quadril,Dieta,
			Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ],
		   NewAltura,
		   [Username,Password,Sexo,NewAltura,Peso,Cintura,Quadril,Dieta,
		    Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta o Peso do usuario
setPeso([Username,Password,Sexo,Altura,_,Cintura,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ],
		NewPeso,
		[Username,Password,Sexo,Altura,NewPeso,Cintura,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta a cintura do usuario
setCintura([Username,Password,Sexo,Altura,Peso,_,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ],
	   NewCintura,
	   [Username,Password,Sexo,Altura,Peso,NewCintura,Quadril,Dieta,
	    Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta o quadril do usuario
setQuadril([Username,Password,Sexo,Altura,Peso,Cintura,_,Dieta,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ],
	   NewQuadril,
	   [Username,Password,Sexo,Altura,Peso,Cintura,NewQuadril,Dieta,
	    Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta a dieta do usuario
setDieta([Username,Password,Sexo,Altura,Peso,Cintura,Quadril,_,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ],
	   NewDieta,
	   [Username,Password,Sexo,Altura,Peso,Cintura,Quadril,NewDieta,
	    Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta a proteina do usuario
setProteina([Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		_, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ],
	   NewProteina,
	   [Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
	    NewProteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta o carboidrato do usuario
setCarboidrato([Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		Proteina, _, Gordura, Pontos, DataUpdate, IMC, RCQ],
	   NewCarboidrato,
	   [Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
	    Proteina, NewCarboidrato, Gordura, Pontos, DataUpdate, IMC, RCQ]).

%! Seta a gordura do usuario
setGordura([Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		Proteina, Carboidrato,_, Pontos, DataUpdate, IMC, RCQ],
	   NewGordura,
	   [Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
	    Proteina, Carboidrato,NewGordura, Pontos, DataUpdate, IMC, RCQ]).


%! Seta os pontos do usuario
setPontos([Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, _, DataUpdate, IMC, RCQ],
	   NewPontos,
	   [Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
	    Proteina, Carboidrato, Gordura, NewPontos, DataUpdate, IMC, RCQ]).

%! Seta a dataUpdate do usuario
setDataUpdate([Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, Pontos,_, IMC, RCQ],
	   NewDataUpdate,
	   [Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
	    Proteina, Carboidrato, Gordura, Pontos, NewDataUpdate, IMC, RCQ]).

%! Seta o IMC do usuario
setIMC([Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, _, RCQ],
	   NewIMC,
	   [Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
	    Proteina, Carboidrato, Gordura, Pontos, DataUpdate, NewIMC, RCQ]).

%! Seta O RCQ do usuario
setRCQ([Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
		Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC,_],
	   NewRCQ,
	   [Username,Password,Sexo,Altura,Peso,Cintura,Quadril,Dieta,
	    Proteina, Carboidrato, Gordura, Pontos, DataUpdate, IMC, NewRCQ]).
