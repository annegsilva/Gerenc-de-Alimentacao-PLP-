# include <iostream>

using namespace std;

# define WELCOME "-----  Bem Vindo ao Gerenciador de Alimentacao! -----" << endl; 
# define REGISTERING "-----  Iniciando Cadastro  -----" << endl << endl;
# define ABOUT_YOU endl << "-----  Sobre Voce  -----" << endl;
# define DIET_MENU1 endl << "Informe a quantidade dos seguintes nutrientes em gramas (g): " << endl;
# define DIET_MENU2 endl << "Informe a quantidade de pontos da sua refeição: " << endl;
# define REFEICAO endl << "Informe o número da refeição correspondente: (1,2,3,4,5 )" << endl;
# define UPDATE_MEDS endl << "Informe as suas novas medidas: " << endl;
# define DATE "Data da medição: ";
#define OPCAO "Digite sua opção: ";

# define USERNAME "Username: ";
# define PASSWORD "Senha: ";
# define ERROR "Opção inválida";
# define NAME "Nome: ";
# define AGE "Idade: ";
# define SEX "Sexo F(Feminino) M(Masculino): "
# define WEIGHT "Peso (kg): ";
# define HEIGHT "Altura (m): ";
# define CIRCUMF "Circunferência Abdominal (m): ";
# define HIP "Quadril (m): ";
# define REGISTERED "Cadastro Realizado com Sucesso!" << endl;

# define PONTOS "Pontos: ";
# define CARB "Carboidratos: ";
# define PROTEIN "Proteínas: ";
# define FATS "Gorduras: ";

# define ADEQUATE_P "Sua refeição tem a quantidade: IDEAL DE PROTEÍNA!"<< endl;
# define LESS_P "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!"<< endl;
# define OVER_P "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! \nLembre-se que o nosso corpo tem um limite máximo de absorção."<< endl;

# define ADEQUATE_C "Sua refeição tem a quantidade: IDEAL DE CARBOIDRATOS!" << endl;
# define LESS_C "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE CARBOIDRATOS! \nLembre-se que para o ganho de massa muscular o consumo de carboidratos também é importante!" << endl;

# define ADEQUATE_G "Sua refeição tem a quantidade: IDEAL DE GORDURA!" << endl;
# define LESS_G "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE GORDURA! \nLembre-se que o consumo de gorduras BOAS também é importante!" << endl;

# define ADEQUATE_PO "Sua refeição tem a quantidade: IDEAL DE PONTOS! (para 5 refeições diárias)" << endl;
# define LESS_PO "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PONTOS! \nLembre-se em consumir seus pontos de forma equilibrada." << endl;
# define OVER_PO "Sua refeição tem a quantidade: MAIOR QUE A IDEAL DE PONTOS! \nLembre-se em consumir seus pontos de forma equilibrada." << endl; 

void opcoesUsuario() {
	cout << "O QUE DESEJA FAZER: " << endl;
	cout << "(1) Inserir Refeição" << endl;
	cout << "(2) Atualizar Medidas" << endl;
	cout << "(3) Relatorio de Evolução" << endl;
	cout << "(4) Voltar ao Menu Principal" << endl;
}

void initialMenu() {
	cout << "O QUE DESEJA FAZER: " << endl;
	cout << "(1) Fazer Login" << endl;
	cout << "(2) Realizar Cadastro" << endl;
	cout << "(3) Sair" << endl;
}

void dietsMenu() {
	cout << endl << "-----  Selecione a dieta desejada  -----" << endl;
	cout << "(M) Ganho de massa muscular" << endl;
	cout << "(E) Emagrecimento" << endl;
	cout << "(P) Dieta dos pontos" << endl;
}

void evaluation(string plusLess, string info, string maxMin, float quantity) {
	cout << "É necessário " << plusLess << " a quantidade de " << info 
	<< " (no " << maxMin << quantity << " gramas por dia) para um melhor resultado.";
}
