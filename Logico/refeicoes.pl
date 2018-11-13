:- initialization main.

lerInt(Number) :- 
read_line_to_codes(user_input, Codes),
string_to_atom(Codes, Atom),
atom_number(Atom, Number).

%! Calcula o limite de gramas de proteinas consumidas por refeicao
limite_gramas(Taxa, Peso, Limite) :-
	Limite is (Taxa * Peso) /5 .

%! Retorna avaliacao das gramas de proteinas em uma refeicao
aval_proteina(Gramas, Dieta, Peso) :-
	(Dieta == 1 ->
		limite_gramas(1.4, Peso, LimiteInferior),
		limite_gramas(2, Peso, LimiteSuperior),
		(Gramas < LimiteInferior -> writeln("Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!");
		Gramas > LimiteSuperior -> writeln("Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! \nLembre-se que o nosso corpo tem um limite máximo de absorção."
);
		writeln("Sua refeição tem a quantidade: IDEAL DE PROTEÍNA!
"));
	Dieta == 2 ->
		limite_gramas(0.8, Peso, LimiteInferior),
		limite_gramas(1.4, Peso, LimiteSuperior),
		(Gramas < LimiteInferior -> writeln("Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!");
		Gramas > LimiteSuperior -> writeln("Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! \nLembre-se que o nosso corpo tem um limite máximo de absorção."
);
		writeln("Sua refeição tem a quantidade: IDEAL DE PROTEÍNA!
"));

	writeln("Opção inválida")).

%! Retorna avaliacao das gramas de carboidratos em uma refeicao
aval_carboidrato(Gramas, Dieta) :-
	(Dieta == 1 ->
		LimiteInferior1 is 30,
		LimiteSuperior1 is 80,
		(Gramas < LimiteInferior1 -> writeln("Sua refeição tem a quantidade: MENOR QUE A IDEAL DE CARBOIDRATOS!");
		Gramas > LimiteSuperior1 -> writeln("Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE CARBOIDRATOS! \nLembre-se que um alto consumo de carboitrados pode engordar."
);
		writeln("Sua refeição tem a quantidade: IDEAL DE CARBOIDRATOS!
"));
	Dieta == 2 ->
		LimiteInferior2 is 10,
		LimiteSuperior2 is 30,
		(Gramas < LimiteInferior2 -> writeln("Sua refeição tem a quantidade: MENOR QUE A IDEAL DE CARBOIDRATOS!");
		Gramas > LimiteSuperior2 -> writeln("Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE CARBOIDRATOS!  \nLembre-se que um alto consumo de carboitrados pode engordar."
);
		writeln("Sua refeição tem a quantidade: IDEAL DE CARBOIDRATOS!
"));

	writeln("Opção inválida")).

%! Retorna avaliacao das gramas de gordura em uma refeicao
aval_gordura(Gramas) :-
	LimiteInferior is 5.6,
	LimiteSuperior is 16.8,
	(Gramas < LimiteInferior -> writeln("Sua refeição tem a quantidade: MENOR QUE A IDEAL DE GORDURAS!");
	Gramas > LimiteSuperior -> writeln("Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE GORDURAS! \nLembre-se que um alto consumo de gorduras é prejudicial à saúde.");	
	writeln("Sua refeição tem a quantidade: IDEAL DE GORDURAS!")).

%! Retorna avaliacao da quantidade de pontos em uma refeicao
aval_pontos(Gramas) :-
	LimitePontos is 6,
	(Gramas < LimitePontos -> writeln("Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PONTOS! \nLembre-se em consumir seus pontos de forma equilibrada.");
	Gramas > LimitePontos -> writeln("Sua refeição tem a quantidade: MAIOR QUE A IDEAL DE PONTOS! \nLembre-se em consumir seus pontos de forma equilibrada."
);	
	writeln("Sua refeição tem a quantidade: IDEAL DE PONTOS! (para 5 refeições diárias)")).

main:-
	lerInt(Pontos),
	aval_pontos(Pontos).
