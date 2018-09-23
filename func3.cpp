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
  
	// Funcionalidade 3
	// matriz que salva em tres colunas 1: data, 2: imc, 3: rcq.
	float indices[10][3];

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
		if (indices[pos][1] < 17.0){
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
	
	string avaliacaoRCQ(int pos){
		string aval;
		if ((indices[pos][2] < 0.80 && sexo == 'F') || (indices[pos][2] < 0.95 && sexo == 'M')) {
				aval = "BAIXO RISCO DE SAUDE";
		} else if ((indices[pos][2] >= 0.80 && indices[pos][2] <= 0.85 && sexo == 'F') || (indices[pos][2] >= 0.95 && indices[pos][2] <= 1.0 && sexo == 'M')) {
				aval = "MODERADO RISCO DE SAUDE";
		} else if ((indices[pos][2] > 0.85 && sexo == 'F') || (indices[pos][2] > 1.0 && sexo == 'M')) {
				aval = "ALTO RISCO DE SAUDE";
		}
		
		return aval;
	}
	
	void atualizarMedidas(float data, float novoPeso, float novaCircAbdominal, float novoQuadril) {
		peso[index] = novoPeso;
		circunferencia_abdominal[index]=novaCircAbdominal;
		quadril[index]=novoQuadril;
		indices[index][0] = data; 
		indices[index][1] = calculaIMC(index);
		indices[index][2] = calculaRCQ(index);
		index++;
	}
	
	void relatorioDeEvolucao() {
		for (int i = 0; i < index; i++) {
			cout << "Seus indices da data " << indices[i][0] << " são:\n" << endl;
			cout << "IMC ...: " << indices[i][1] << "\n";
			cout << "Análise: " << avaliacaoIMC(i) << "\n" << endl; 
			cout << "RCQ....: " << indices[i][2] << "\n";
			cout << "Análise: " << avaliacaoRCQ(i) << "\n" << endl;
		}
	}
};

int main(){
	Usuario userTest;
	userTest.index = 0;
	userTest.sexo = 'F';
	userTest.altura =1.60;
	userTest.atualizarMedidas(20.07, 80.5, 1.6, 1.1);
	userTest.atualizarMedidas(22.09, 70.5, 0.7, 1.0);
	userTest.relatorioDeEvolucao();
	return 0;
}
