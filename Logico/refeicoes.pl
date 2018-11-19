:- initialization main.

lerInt(Number) :- 
read_line_to_codes(user_input, Codes),
string_to_atom(Codes, Atom),
atom_number(Atom, Number).

%! Calcula o limite de gramas de proteinas consumidas por refeicao
limite_gramas(Taxa, Peso, Limite) :-
	Limite is (Taxa * Peso) /5 .

%! Retorna avaliacao das gramas de proteinas em uma refeicao
aval_proteina(Gramas, Dieta, Peso, Acumulado) :-
	writeln("\nSua refeição tem a quantidade: "),
	(Dieta == 1 ->
		limite_gramas(1.4, Peso, LimiteInferior),
		limite_gramas(2, Peso, LimiteSuperior),
		(Gramas < LimiteInferior -> writeln("MENOR QUE A IDEAL DE PROTEÍNA! (>_<) \nLembre-se que o consumo de proteínas é essencial para o ganho de massa.");
		Gramas > LimiteSuperior -> writeln("SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! (O.O) \nLembre-se que o nosso corpo tem um limite máximo de absorção.");
		writeln("IDEAL DE PROTEÍNA! (＾▽＾)")),
		Aux is round(LimiteSuperior),
		string_concat(Aux, " gramas de proteina devem ser sua média de consumo por refeição. ", Media),
		writeln(Media),
		string_concat(Acumulado, " gramas de proteína é o seu limite de consumo para o resto do dia.", Limite),
		writeln(Limite));
	
	(Dieta == 2 ->
		limite_gramas(0.8, Peso, LimiteInferior),
		limite_gramas(1.4, Peso, LimiteSuperior),
		(Gramas < LimiteInferior -> writeln("MENOR QUE A IDEAL DE PROTEÍNA! (>_<) \nLembre-se que o consumo de proteínas é essencial para o ganho de massa.");
		Gramas > LimiteSuperior -> writeln("SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! (O.O) \nLembre-se que o nosso corpo tem um limite máximo de absorção.");
		writeln("IDEAL DE PROTEÍNA! (＾▽＾) ")),
		Aux is round(LimiteSuperior),
		string_concat(Aux, " gramas de proteina devem ser sua média de consumo por refeição. ", Media),
		writeln(Media),
		string_concat(Acumulado, " gramas de proteína é o seu limite de consumo para o resto do dia.", Limite),
		writeln(Limite));

	writeln("Opção inválida").

%! Retorna avaliacao das gramas de carboidratos em uma refeicao
aval_carboidrato(Gramas, Dieta, Acumulado) :-
	writeln("\nSua refeição tem a quantidade: "),
	(Dieta == 1 ->
		LimiteInferior1 is 30,
		LimiteSuperior1 is 80,
		(Gramas < LimiteInferior1 -> writeln("MENOR QUE A IDEAL DE CARBOIDRATOS! (>_<) \nLembre-se que o consumo de carboitrados é de grande importância para o ganho de massa.");
		Gramas > LimiteSuperior1 -> writeln("SUPERIOR QUE A NECESSÁRIA DE CARBOIDRATOS! (O.O)\nLembre-se que um alto consumo de carboitrados pode engordar.");
		writeln("IDEAL DE CARBOIDRATOS! (＾▽＾) ")),
		string_concat(LimiteSuperior1, " gramas de carboitrados devem ser sua média de consumo por refeição. ", Media1),
		writeln(Media1),
		string_concat(Acumulado, " gramas de carboitrados é o seu limite de consumo para o resto do dia.", Limite1),
		writeln(Limite1));
	
	(Dieta == 2 ->
		LimiteInferior2 is 10,
		LimiteSuperior2 is 30,
		(Gramas < LimiteInferior2 -> writeln("MENOR QUE A IDEAL DE CARBOIDRATOS!(>_<) \nLembre-se que o consumo de carboitrados também é importante.");
		Gramas > LimiteSuperior2 -> writeln("SUPERIOR QUE A NECESSÁRIA DE CARBOIDRATOS! (O.O) \nLembre-se que um alto consumo de carboitrados pode engordar.");
		writeln("IDEAL DE CARBOIDRATOS! (＾▽＾)")),
		string_concat(LimiteSuperior2, " gramas de carboitrados devem ser sua média de consumo por refeição. ", Media2),
		writeln(Media2),
		string_concat(Acumulado, " gramas de carboitrados é o seu limite de consumo para o resto do dia.", Limite2),
		writeln(Limite2));

	writeln("Opção inválida").

%! Retorna avaliacao das gramas de gordura em uma refeicao
aval_gordura(Gramas, Acumulado) :-
	writeln("\nSua refeição tem a quantidade: "),
	LimiteInferior is 5.6,
	LimiteSuperior is 16.8,
	(Gramas < LimiteInferior -> writeln("MENOR QUE A IDEAL DE GORDURAS! (>_<)");
	Gramas > LimiteSuperior -> writeln("SUPERIOR QUE A NECESSÁRIA DE GORDURAS! (O.O) \nLembre-se que um alto consumo de gorduras é prejudicial à saúde.");	
	writeln("IDEAL DE GORDURAS! (＾▽＾)")),
	string_concat(LimiteSuperior, " gramas de gorduras devem ser sua média de consumo por refeição. ", Media),
	writeln(Media),
	string_concat(Acumulado, " gramas de gorduras é o seu limite de consumo para o resto do dia.", Limite),
	writeln(Limite).

%! Retorna avaliacao da quantidade de pontos em uma refeicao
aval_pontos(Pontos, Acumulado) :-
	writeln("\nSua refeição tem a quantidade: "),
	LimitePontos is 6,
	(Pontos < LimitePontos -> writeln("MENOR QUE A IDEAL DE PONTOS! (>_<) \nLembre-se em consumir seus pontos de forma equilibrada.");
	Pontos > LimitePontos -> writeln("MAIOR QUE A IDEAL DE PONTOS!  (O.O) \nLembre-se em consumir seus pontos de forma equilibrada.");	
	writeln("IDEAL DE PONTOS! (＾▽＾)")),
	string_concat(LimitePontos, " pontos devem ser sua média de consumo por refeição. ", Media),
	writeln(Media),
	string_concat(Acumulado, " pontos é o seu limite de consumo para o resto do dia.", Limite),
	writeln(Limite).


main:-
	lerInt(Gramas),
	lerInt(Acumulado),
	lerInt(Peso),
	aval_proteina(Gramas, 2, Peso, Acumulado),
	aval_carboidrato(Gramas, 2, Acumulado),
	aval_gordura(Gramas, Acumulado).
