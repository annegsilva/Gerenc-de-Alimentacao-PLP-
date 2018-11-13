:- initialization main.

lerInt(Number) :- 
read_line_to_codes(user_input, Codes),
string_to_atom(Codes, Atom),
atom_number(Atom, Number).

calcula_imc(Peso, Altura, IMC) :-
	IMC is Peso / (Altura**2).

aval_imc(IMC) :-
	(IMC < 17-> write("MUITO ABAIXO DO PESO");
	IMC >= 17, IMC < 18.5 -> write("ABAIXO DO PESO");
	IMC >= 18.5, IMC < 24.5 -> write("PESO NORMAL");
	IMC >= 24.5, IMC < 30 -> write("ACIMA DO PESO");
	IMC >= 30, IMC < 35 -> write("OBESIDADE I");
	IMC >= 35, IMC < 40 -> write("OBESIDADE II (severa)");
	write("OBESIDADE III (mórbida)")).

calcula_rcq(Cintura, Quadril, RCQ) :-
	RCQ is Cintura / Quadril.

aval_rcq(RCQ, Sexo) :-
	(Sexo == "F" ->
		(RCQ < 0.8 -> writeln("BAIXO RISCO DE SAÚDE");
		RCQ > 0.85 -> writeln("ALTO RISCO DE SAÚDE");
		writeln("MODERADO RISCO DE SAÚDE"));
	(RCQ < 0.95 -> writeln("BAIXO RISCO DE SAÚDE");
	RCQ > 1 -> writeln("ALTO RISCO DE SAÚDE");
	writeln("MODERADO RISCO DE SAÚDE"))).	
	
relatorio_indices([X|XS], [Y|YS], [Z|ZS], Sexo) :-
	write("\n----- Seus índices da data "), write(X), writeln(" são -----\n"),
	write("IMC ...: "), writeln(Y), 
	write("Análise: "), aval_imc(Y),
	write("\nRCQ ...: "), writeln(Z), 
	write("Análise: "), aval_rcq(Z, Sexo),
	(XS == [] -> write("");
	relatorio_indices(XS, YS, ZS, Sexo)).
	
	
main:-
	lerInt(Peso),
	lerInt(Altura),
	calcula_imc(Peso, Altura, IMC),
	calcula_rcq(Peso, Altura, RCQ),
	writeln(IMC),
	writeln(RCQ),
	aval_imc(IMC),
	aval_rcq(RCQ, "F"),
	aval_rcq(RCQ, "M"),
	read_line_to_string(user_input,Sexo),
	relatorio_indices(["15/10/18","09/11/18"],[17, 20], [0.7, 0.8], Sexo).
