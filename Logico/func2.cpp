# include <iostream>
# include "display.cpp"

using namespace std;

enum tipos_dieta { ganho_de_massa, emagrecimento, dieta_dos_pontos };

struct Usuario {
	string username;
	string senha;
	string nome;
	int idade;
	char sexo;
	float peso;
	float altura;
	float circunferencia_abdominal;
	float quadril;
	tipos_dieta td;
	
	float proteina;
	float carboidrato;
	float gorduras;
	int pontos;

	void tipoDieta() {
		if (td == ganho_de_massa) {
			menu1();
		} else if (td == emagrecimento) {
			menu2();
		} else {
			menu3();
		}
	}
	
	void menu1() {
		cout << DIET_MENU1;
		cout << PROTEIN;
		cin >> proteina;
		cout << CARBO;
		cin >> carboidrato;
		cout << FATS;
		cin >> gorduras;

		retorno1(proteina, carboidrato, gorduras);
	}
	
	void menu2() {
		cout << DIET_MENU1;
		cout << PROTEIN;
		cin >> proteina;
		cout << CARBO;
		cin >> carboidrato;
		cout << FATS;
		cin >> gorduras;
		
		retorno2(proteina, carboidrato, gorduras);
	}
	
	void menu3() {
		cout << DIET_MENU2;
		cin >> pontos;
		
		retorno3(pontos);
	}
	
	void retorno1(float &proteina, float &carboidrato, float &gorduras) {
		if ((proteina >= 1.4 && proteina <= 2) && carboidrato >= 150 && gorduras <= 22.2) {
			cout << ADEQUATE;
		}
		if (gorduras > 22.2) {
			cout << LESS22;
		}
		if (carboidrato < 150) {
			cout << PLUS150;
		}	
		if (proteina > 2) {
			cout << LESS2;
		}
		if (proteina < 1.4) {
			cout << PLUS14;
		}
	}
	
	void retorno2(float &proteina, float &carboidrato, float &gorduras) {
		if ((proteina >= 0.8 && proteina <= 1.4) && carboidrato >= 100 && gorduras <= 22.2) {
			cout << ADEQUATE;
		}
		if (gorduras > 22.2) {
			cout << LESS22;
		}
		if (carboidrato < 100) {
			cout << PLUS100;
		}	
		if (proteina > 1.4) {
			cout << LESS14;
		}
		if (proteina < 0.8) {
			cout << PLUS8;
		}
	}
	
	void retorno3(int &pontos) {
		// NATHALYA	
	}

};

int main() {
	Usuario user;
	Usuario user2;
	Usuario user3;
	user.td = ganho_de_massa;
	user2.td = emagrecimento;
	user3.td = dieta_dos_pontos;
	user.tipoDieta();
	user2.tipoDieta();
	user3.tipoDieta();
	
	return 0;
}
