:- initialization main.

lerInt(Number) :- 
read_line_to_codes(user_input, Codes),
string_to_atom(Codes, Atom),
atom_number(Atom, Number).

calcula_imc(Peso, Altura, IMC) :-
	IMC is Peso / (Altura**2).

aval_imc(IMC) :-
	(IMC < 17-> writeln("MUITO ABAIXO DO PESO");
	IMC >= 17, IMC < 18.5 -> writeln("ABAIXO DO PESO");
	IMC >= 18.5, IMC < 24.5 -> writeln("PESO NORMAL");
	IMC >= 24.5, IMC < 30 -> writeln("ACIMA DO PESO");
	IMC >= 30, IMC < 35 -> writeln("OBESIDADE I");
	IMC >= 35, IMC < 40 -> writeln("OBESIDADE II (severa)");
	writeln("OBESIDADE III (mórbida)")).

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
	
main:-
	lerInt(Peso),
	lerInt(Altura),
	calcula_imc(Peso, Altura, IMC),
	calcula_rcq(Peso, Altura, RCQ),
	writeln(IMC),
	writeln(RCQ),
	aval_imc(IMC),
	aval_rcq(RCQ, "F"),
	aval_rcq(RCQ, "M").
