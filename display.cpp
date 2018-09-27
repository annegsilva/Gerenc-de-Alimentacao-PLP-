# include <iostream>

using namespace std;

# define WELCOME "-----  Bem Vindo ao Gerenciador de Alimentacao! -----";
# define REGISTERING "-----  Iniciando Cadastro  -----" << endl << endl;
# define ABOUT_YOU endl << "-----  Sobre Voce  -----" << endl;
# define DIET_MENU1 endl << "Informe a quantidade dos seguintes nutrientes em gramas (g): " << endl;
# define DIET_MENU2 endl << "Informe a quantidade de pontos da sua refeição: " << endl;


# define USERNAME "Username: ";
# define PASSWORD "Senha: ";
# define ERROR "Erro";
# define NAME "Nome: ";
# define AGE "Idade: ";
# define WEIGHT "Peso (kg): ";
# define HEIGHT "Altura (cm): ";
# define CIRCUMF "Circunferência Abdominal (cm): ";
# define HIP "Quadril (cm): ";
# define REGISTERED "Cadastro Realizado com Sucesso!" << endl;
# define PROTEIN "Proteínas: ";
# define FATS "Gorduras: ";
# define CARBO "Carboidratos: ";


# define ADEQUATE "Muito bem! A quantidade de proteínas, carboidratos e gorduras estão adequados.";
# define LESS22 "É necessário diminuir a quantidade de gorduras (no máximo 22.2 gramas por dia) para um melhor resultado.";
# define PLUS150 "É necessário aumentar a quantidade de carboidratos (no mínimo 150 gramas por dia) para um melhor resultado.";
# define PLUS14 "É necessário aumentar a quantidade de proteínas (no mínimo 1.4 gramas por dia) para um melhor resultado.";

# define PLUS100 "É necessário aumentar a quantidade de carboidratos (no mínimo 100 gramas por dia) para um melhor resultado.";
# define LESS2 "É necessário diminuir a quantidade de proteínas (no máximo 2 gramas por dia) para um melhor resultado.";
# define LESS14 "É necessário diminuir a quantidade de proteínas (no máximo 1.4 gramas por dia) para um melhor resultado.";
# define PLUS8 "É necessário aumentar a quantidade de proteínas (no mínimo 0.8 gramas por dia) para um melhor resultado.";


void initialMenu() {
	cout << "Escolha uma opcao: " << endl;
	cout << "(1) Fazer Login" << endl;
	cout << "(2) Realizar Cadastro" << endl;
	cout << "(3) Sair" << endl;
}

void dietsMenu() {
	cout << endl << "-----  Selecione a dieta desejada  -----" << endl;
	cout << "(1) Ganho de massa muscular" << endl;
	cout << "(2) Emagrecimento" << endl;
	cout << "(3) Dieta dos pontos" << endl;
}

void evaluation(string plusLess, string info, string maxMin, float quantity) {
	cout << "É necessário " << plusLess << " a quantidade de " << info 
	<< " (no " << maxMin << quantity << " gramas por dia) para um melhor resultado.";
}
