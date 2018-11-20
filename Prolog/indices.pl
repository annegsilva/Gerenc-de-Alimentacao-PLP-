:- module(indices, [calcula_imc/3,aval_imc/1,calcula_rcq/3,aval_rcq/2,relatorio_indices/4]).

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
	(Sexo == "f" ->
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

relatorio_indices([],[],[],_) :- writeln("\n ---- Você ainda não atualizou suas medidas para gerar um relatorio -----").