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


# define ADEQUATE_P "Sua refeição tem a quantidade: IDEAL DE PROTEÍNA!"<< endl;
# define LESS_P "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!"<< endl;
# define OVER_P "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! \nLembre-se que o nosso corpo tem um limite máximo de absorção."<< endl;

# define ADEQUATE_C "Sua refeição tem a quantidade: IDEAL DE CARBOIDRATOS!" << endl;
# define LESS_C "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE CARBOIDRATOS! \nLembre-se que para o ganho de massa muscular o consumo de carboidratos também é importante!" << endl;

# define ADEQUATE_G "Sua refeição tem a quantidade: IDEAL DE GORDURA!" << endl;
# define LESS_G "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE GORDURA! \nLembre-se que o consumo de gorduras BOAS também é importante!" << endl;


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

