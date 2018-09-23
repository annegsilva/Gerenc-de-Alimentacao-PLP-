# include <iostream>

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
	
	int proteina;
	int carboidrato;
	int gorduras;
	int vitaminas;
	int minerais;
	int pontos;

	void tipoDieta() {
		if (td == ganho_de_massa || td == emagrecimento) {
			menu1();
		} else {
			menu2();
		}
	}
	
	void menu1() {
		cout << "Informe a quantidade dos seguintes nutrientes em gramas (g): \n";
		cout << "Proteína: ";
		cin >> proteina;
		cout << "Carboidrato: ";
		cin >> carboidrato;
		cout << "Gorduras: ";
		cin >> gorduras;
		cout << "Vitaminas: ";
		cin >> vitaminas;
		cout << "Minerais: ";
		cin >> minerais;
		
		retorno1();
	}
	
	void menu2() {
		cout << "Informe a quantidade de pontos da sua refeição: ";
		cin >> pontos;
		
		retorno2();
	}
	
	void retorno1() {
		cout << "sua dieta esta x \n";
	}
	
	void retorno2() {
		cout << "sua dieta esta y \n";
	}

};

int main() {
	Usuario user;
	Usuario user2;
	user.td = ganho_de_massa;
	user2.td = dieta_dos_pontos;
	user.tipoDieta();
	user2.tipoDieta();
	return 0;
}
