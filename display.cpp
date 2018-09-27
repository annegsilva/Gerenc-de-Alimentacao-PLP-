# include <iostream>

using namespace std;

# define REGISTER "-----  Iniciando Cadastro  -----" << endl << endl;
# define ABOUT_YOU endl << "-----  Sobre Voce  -----" << endl;
# define DIET_MENU1 "Informe a quantidade dos seguintes nutrientes em gramas (g): " << endl;
# define DIET_MENU2 "Informe a quantidade de pontos da sua refeição: " << endl;


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


void initialMenu() {
	cout << "-----  Bem Vindo ao Gerenciador de Alimentacao! -----" << endl;
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
