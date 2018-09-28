#include <iostream>
#include <string>
#include <vector>
#include <iomanip>
#include <fstream>

using namespace std;

enum tipos_dieta { ganho_de_massa, emagrecimento, dieta_dos_pontos };
struct Usuario {
	// Funcionalidade 1
	string username;
	string senha;
	string nome;
	int idade;
	string sexo;
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
};
