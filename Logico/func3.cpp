#include <iostream>
#include <string>
#include <vector>
#include <iomanip>
#include <fstream>
#include <math.h>


using namespace std;
enum tipos_dieta { ganho_de_massa, emagrecimento, dieta_dos_pontos };
struct Usuario {
	// Funcionalidade 1
	string username;
	string senha;
	string nome;
	int idade;
	char sexo;
	float peso[10];
	float altura;
	float circunferencia_abdominal[10];
	float quadril[10];
	tipos_dieta td;
	// primeiro indice livre
	int index;
	// matriz que salva em tres colunas 1: data, 2: imc, 3: rcq.
	float indices[10][3];
	// vetor que salva a porc de nutriente por refeição i
	float proteina [5];
	float carb[5];
	float gordura[5];
	float pontos[5];


//Funcionalidade 2

void proteina_tipo1(float prot, int refeicao){
	float peso_atual = peso[index - 1];
	proteina[refeicao - 1] = prot;
	float prot_total;
	for(int i = 0; i < refeicao; i++){
		prot_total += proteina[i];
	}
	float limite = (2 * peso_atual) - prot_total;
	if(prot >= (1.4 * peso_atual)/5 && prot <= (2 * peso_atual)/5){
		cout << "Sua refeição tem a quantidade: IDEAL DE PROTEÍNA !" << endl;
	}

	if(prot < (1.4 * peso_atual)/5){
		cout << "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!" << endl;
	}

	if(prot >(2 * peso_atual)/5){
		cout << "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA!" << endl;
		cout << "Lembre-se que o nosso corpo tem um limite máximo de absorção" << endl;
	}
	cout << "Tente consumir em média " << (2 * peso_atual)/5 << " gramas de proteína por refeição." << endl;
	cout << "Seu limite de proteinas no dia é " << limite << "gramas.\n" << endl;

}

void proteina_tipo2(float prot, int refeicao){
	float peso_atual = peso[index - 1];
	proteina[refeicao - 1] = prot;
	float prot_total;
	for(int i = 0; i < refeicao; i++){
		prot_total += proteina[i];
	}
	float media = (1.4 * peso_atual)/5;
	float limite = (1.4 * peso_atual) - prot_total;
	if(prot >= (0.8 * peso_atual)/5 && prot <= (1.4 * peso_atual)/5){
		cout << "Sua refeição tem a quantidade: IDEAL DE PROTEÍNA !" << endl;
	}

	if(prot < (0.8 * peso_atual)/5){
		cout << "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!" << endl;
	}

	if(prot >(1.4 * peso_atual)/5){
		cout << "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA!" << endl;
		cout << "Lembre-se que o nosso corpo tem um limite máximo de absorção" << endl;
	}
	cout << "Tente consumir em média " << media << " gramas de proteína por refeição." << endl;
	cout << "Seu limite de proteinas no dia é " << limite << "gramas\n." << endl;

}


//Funcionalidade 3
float calculaIMC(int pos) {
	float imc;
	imc = peso[pos] / pow(altura, 2);
	return imc;
}

float calculaRCQ(int pos) {
	float rcq;
	rcq = circunferencia_abdominal[pos] / quadril[pos];
	return rcq;
}

string avaliacaoIMC(int pos) {
	string aval;
	if (indices[pos][1] < 17.0) {
		aval = "MUITO ABAIXO DO PESO";
	} else if (indices[pos][1] >= 17.0 && indices[pos][1] < 18.5) {
		aval = "ABAIXO DO PESO"; 
	} else if (indices[pos][1] >= 18.5 && indices[pos][1] < 24.5) {
		aval = "PESO NORMAL";
	} else if (indices[pos][1] >= 24.5 && indices[pos][1] < 30) {
		aval = "ACIMA DO PESO";
	} else if (indices[pos][1] >= 30 && indices[pos][1] < 35) {
		aval = "OBESIDADE I";
	} else if (indices[pos][1] >= 35 && indices[pos][1] < 40) {
	aval = "OBESIDADE II (severa)";
	} else if (indices[pos][1] >= 40) {
		aval = "OBESIDADE III (mórbida)";
	}

	return aval;
}

string avaliacaoRCQ(int pos) {
	string aval;
	int index = indices[pos][2];
	
	
	if ((index < 0.80 && sexo == 'F') || (index < 0.95 && sexo == 'M')) {
		aval = "BAIXO RISCO DE SAUDE";
	} else if ((index >= 0.80 && index <= 0.85 && sexo == 'F') || (index >= 0.95 && index <= 1.0 && sexo == 'M')) {
            aval = "MODERADO RISCO DE SAUDE";
	} else if ((index > 0.85 && sexo == 'F') || (index > 1.0 && sexo == 'M')) {
		aval = "ALTO RISCO DE SAUDE";
	}

	return aval;
}

void atualizarMedidas(float data, float novoPeso, float novaCircAbdominal, float novoQuadril) {
	peso[index] = novoPeso;
    circunferencia_abdominal[index] = novaCircAbdominal;
    quadril[index] = novoQuadril;
    indices[index][0] = data;
    indices[index][1] = calculaIMC(index);
    indices[index][2] = calculaRCQ(index);
    index += 1;
}

void relatorioDeEvolucao() {
	for (int i = 0; i < index; i++) {
		std::cout << "Seus indices da data " << indices[i][0] << " são\n:" << endl;
		std::cout << "IMC ...: " << indices[i][1] << endl;
		std::cout << "Análise: " << avaliacaoIMC(i) << "\n" << endl;
		std::cout << "RCQ....: " << indices[i][2] << endl;
		std::cout << "Análise: " << avaliacaoRCQ(i) << "\n" << endl;
	}
}

};

//Main para testes dos metodos das funcionalidades
int main()
{
    Usuario userTest;
    userTest.index = 0;
    userTest.sexo = 'F';
    userTest.altura =1.75;
    userTest.atualizarMedidas(20.07, 80.5, 1.6, 1.1);
    userTest.atualizarMedidas(22.09, 70.5, 0.7, 1.0);
    userTest.relatorioDeEvolucao();
    userTest.proteina_tipo1(28.2, 1);
    userTest.proteina_tipo1(40.0, 2);


    Usuario user2;
    user2.index = 0;
    user2.sexo = 'M';
    user2.altura = 1.6;
    user2.atualizarMedidas(27.09,54.5,0.7,1.0);
    user2.proteina_tipo2(28.2, 1);
    return 0;
}
