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
	
	float proteina;
	float carboidrato;
	float gorduras;
	int pontos;

	void tipoDieta() {
		if (td == ganho_de_massa) {
			menu1();
		} else if(td == emagrecimento){
			menu2();
		}else{
			menu3();
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

		
		retorno1(proteina, carboidrato, gorduras);
	}
	
	void menu2(){
		cout << "Informe a quantidade dos seguintes nutrientes em gramas (g): \n";
		cout << "Proteína: ";
		cin >> proteina;
		cout << "Carboidrato: ";
		cin >> carboidrato;
		cout << "Gorduras: ";
		cin >> gorduras;
		
		retorno2(proteina, carboidrato, gorduras);
	}
	
	void menu3() {
		cout << "Informe a quantidade de pontos da sua refeição: ";
		cin >> pontos;
		
		retorno3(pontos);
	}
	
	void retorno1(float &proteina, float &carboidrato, float &gorduras) {
		if((proteina >= 1.4 && proteina <= 2) && carboidrato >= 150 && gorduras <= 22.2){
			cout << "Muito bem! A quantidade de proteínas, carboidratos e gorduras estão adequados.";
		}
		
		if (gorduras > 22.2){
			cout << "É necessário diminuir a quantidade de gorduras (no máximo 22.2 gramas por dia) para um melhor resultado.";
		}
		
		if (carboidrato < 150){
			cout << "É necessário aumentar a quantidade de carboidratos (no mínimo 150 gramas por dia) para um melhor resultado.";
		}	
		if (proteina > 2){
			cout << "É necessário diminuir a quantidade de proteínas (no máximo 2 gramas por dia) para um melhor resultado.";
		}
		if (proteina < 1.4){
			cout << "É necessário aumentar a quantidade de proteínas (no mínimo 1.4 gramas por dia) para um melhor resultado.";
		}
	}
	
	void retorno2(float &proteina, float &carboidrato, float &gorduras) {
		if((proteina >= 0.8 && proteina <= 1.4) && carboidrato >= 100 && gorduras <= 22.2){
			"Muito bem! A quantidade de proteínas, carboidratos e gorduras estão adequados.";
		
		}
		
		if (gorduras > 22.2){
			cout << "É necessário diminuir a quantidade de gorduras (no máximo 22.2 gramas por dia) para um melhor resultado.";
		}
		
		if (carboidrato < 100){
			cout << "É necessário aumentar a quantidade de carboidratos (no mínimo 100 gramas por dia) para um melhor resultado.";
		}	
		if (proteina > 1.4){
			cout << "É necessário diminuir a quantidade de proteínas (no máximo 1.4 gramas por dia) para um melhor resultado.";

		}
		if (proteina < 0.8){
			cout << "É necessário aumentar a quantidade de proteínas (no mínimo 0.8 gramas por dia) para um melhor resultado.";
		}
		
	}
	
	void retorno3(int &pontos){
		// NATHALYA	
	}

};

int main() {
	Usuario user;
	Usuatia user2;
	Usuario user3;
	user.td = ganho_de_massa;
	user2.td = dieta_para_emagreciento;
	user3.td = dieta_dos_pontos;
	user.tipoDieta();
	user2.tipoDieta();
	user3.tipoDieta();
	
	
	return 0;
}
