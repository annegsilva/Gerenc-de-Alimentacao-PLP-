# include <iostream>
# include <string>
# include <vector>
# include <iomanip>
# include <fstream>
# include <sstream> 
# include "display.cpp"
# include <math.h>

using namespace std;

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
	//M: ganho de massa E:emagrecismento P: pontos
	string dieta;
	// primeiro indice livre
	int index;
	// matriz que salva em tres colunas 1: data, 2: imc, 3: rcq.
	float indices[10][3];
	// vetor que salva os dados das 5 refeicoes diarias
	float proteina [5];
	float carboidrato[5];
	float gordura[5];
	int pontos[5];
	

//Funcionalidade 2
//Metodo para avaliar a porcao de proteina da dieta (1)
void proteina_tipo1(float prot, int refeicao){
	float peso_atual = peso[index - 1];
	proteina[refeicao - 1] = prot;
	float prot_total = 0;
	float media = (2 * peso_atual)/5;
	for(int i = 0; i < refeicao; i++){
		prot_total += proteina[i];
	}
	float limite = (2 * peso_atual) - prot_total;
	if(prot >= (1.4 * peso_atual)/5 && prot <= (2 * peso_atual)/5){
        cout << ADEQUATE_P;
	}

	if(prot < (1.4 * peso_atual)/5){
		cout << LESS_P;
	}

	if(prot >(2 * peso_atual)/5){
		cout << OVER_P;
	}
	cout << "Tente consumir em média " << media << " gramas de PROTEÍNA por refeição." << endl;
	cout << "Seu limite de PROTEÍNAS no dia é " << limite << " gramas.\n" << endl;

}

//Metodo para avaliar a porcao de proteina da dieta (2)
void proteina_tipo2(float prot, int refeicao){
	float peso_atual = peso[index - 1];
	proteina[refeicao - 1] = prot;
	float prot_total = 0;
	for(int i = 0; i < refeicao; i++){
		prot_total += proteina[i];
	}
	float media = (1.4 * peso_atual)/5;
	float limite = (1.4 * peso_atual) - prot_total;
	if(prot >= (0.8 * peso_atual)/5 && prot <= (1.4 * peso_atual)/5){
		cout << ADEQUATE_P;
	}

	if(prot < (0.8 * peso_atual)/5){
		cout << LESS_P;
	}

	if(prot >(1.4 * peso_atual)/5){
        cout << OVER_P;
	}
	cout << "Tente consumir em média " << media << " gramas de PROTEÍNA por refeição." << endl;
	cout << "Seu limite de PROTEÍNAS no dia é " << limite << " gramas\n." << endl;

}

//Metodo para avaliar a porcao de carboidrato da dieta (1)
void carboidrato_tipo1(float carb, int refeicao){
	carboidrato[refeicao - 1] = carb;

	float carb_total = 0;
	for(int i = 0; i < refeicao; i++){
		carb_total += carboidrato[i];
	}

	float media = 200/5;
	float limite = 200 - carb_total;

	if(carb >= media){
		cout << ADEQUATE_C;
	}

	if(carb < media){
		cout << LESS_C;
	}
	cout << "Tente consumir em média " << media << " gramas de CARBOIDRATO por refeição." << endl;
	cout << "Seu limite de CARBOIDRATOS no dia é " << limite << " gramas\n." << endl;

}

//Metodo para avaliar a porcao de carboidrato da dieta (2)
void carboidrato_tipo2(float carb, int refeicao){
	carboidrato[refeicao - 1] = carb;

	float carb_total = 0;
	for(int i = 0; i < refeicao; i++){
		carb_total += carboidrato[i];
	}

	float media = 100/5;
	float limite = 100 - carb_total;

	if(carb >= media){
		cout << ADEQUATE_C;
	}

	if(carb < media){
		cout << LESS_C;
	}
	cout << "Tente consumir em média " << media << " gramas de CARBOIDRATO por refeição." << endl;
	cout << "Seu limite de CARBOIDRATOS no dia é " << limite << " gramas\n." << endl;

}

//Metodo para avaliar a porcao de gordura das dietas (1 e 2)
void gorduras(float gord, int refeicao){
	gordura[refeicao - 1] = gord;

	float gord_total = 0;
	for(int i = 0; i < refeicao; i++){
		gord_total += gordura[i];
	}

	float media = 22.2/5;
	float limite = 22.2 - gord_total;

	if(gord >= media){
		cout << ADEQUATE_G;
	}

	if(gord < media){
		cout << LESS_G;
	}
	cout << "Tente consumir em média " << media << " gramas de GORDURA por refeição." << endl;
	cout << "Seu limite de GORDURA no dia é " << limite << " gramas\n." << endl;

}

//Metodo para avaliar e calcular os pontos da dieta (3)
void calculaPontos(int ponto, int refeicao){
	pontos[refeicao - 1] = ponto;
	
	int pontos_total = 0;
	for(int i = 0; i < refeicao; i++){
		pontos_total += pontos[i];
	}
	int media = 30/5;
	int limite = 30 - pontos_total;
	
	if(ponto == media){
		cout << ADEQUATE_PO;
	}

	if(ponto < media){
		cout << LESS_PO;
	}
	
	if(ponto > media){
		cout << OVER_PO;
	}
	cout << "Tente consumir em média 6 pontos por refeição. \nSeu limite de PONTOS no dia é " << limite << endl;
	}


//Funcionalidade 3
float calculaIMC(int pos)
    {
        float imc;
        imc = peso[pos] / pow(altura, 2);
        return imc;
    }

    float calculaRCQ(int pos)
    {
        float rcq;
        rcq = circunferencia_abdominal[pos] / quadril[pos];
        return rcq;
    }
string avaliacaoIMC(int pos)
    {
        string aval;
        if (indices[pos][1] < 17.0)
        {
            aval = "MUITO ABAIXO DO PESO";
        }
        else if (indices[pos][1] >= 17.0 && indices[pos][1] < 18.5)
        {
            aval = "ABAIXO DO PESO";
        }
        else if (indices[pos][1] >= 18.5 && indices[pos][1] < 24.5)
        {
            aval = "PESO NORMAL";
        }
        else if (indices[pos][1] >= 24.5 && indices[pos][1] < 30)
        {
            aval = "ACIMA DO PESO";
        }
        else if (indices[pos][1] >= 30 && indices[pos][1] < 35)
        {
            aval = "OBESIDADE I";
        }
        else if (indices[pos][1] >= 35 && indices[pos][1] < 40)
        {
            aval = "OBESIDADE II (severa)";
        }
        else if (indices[pos][1] >= 40)
        {
            aval = "OBESIDADE III (mórbida)";
        }

        return aval;
    }

    string avaliacaoRCQ(int pos)
    {
        string aval;
        if ((indices[pos][2] < 0.80 && sexo == "F") || (indices[pos][2] < 0.95 && sexo == "M"))
        {
            aval = "BAIXO RISCO DE SAUDE";
        }
        else if ((indices[pos][2] >= 0.80 && indices[pos][2] <= 0.85 && sexo == "F") || (indices[pos][2] >= 0.95 && indices[pos][2] <= 1.0 && sexo == "M"))
        {
            aval = "MODERADO RISCO DE SAUDE";
        }
        else if ((indices[pos][2] > 0.85 && sexo == "F") || (indices[pos][2] > 1.0 && sexo == "M"))
        {
            aval = "ALTO RISCO DE SAUDE";
        }

        return aval;
    }

    void atualizarMedidas(float data, float novoPeso, float novaCircAbdominal, float novoQuadril)
    {
        index ++;
        peso[index] = novoPeso;
        circunferencia_abdominal[index]=novaCircAbdominal;
        quadril[index]=novoQuadril;
        indices[index][0] = data;
        indices[index][1] = calculaIMC(index);
        indices[index][2] = calculaRCQ(index);
    }

    void relatorioDeEvolucao()
    {
        for (int i = 0; i < index; i++)
        {
            cout << "Seus indices da data " << indices[i][0] << " são\n:" << endl;
            cout << "IMC ...: " << indices[i][1] << endl;
            cout << "Análise: " << avaliacaoIMC(i) << "\n" << endl;
            cout << "RCQ....: " << indices[i][2] << endl;
            cout << "Análise: " << avaliacaoRCQ(i) << "\n" << endl;
        }
    }
};

struct Gerenc_Alimentacao {
	
Usuario menuUsuario(Usuario user){
	int option;
	
	do {
		opcoesUsuario();
		cin >> option;
		switch (option) {
			case 1:
			inserirRefeicao(user);
			break;
			
			case 2:
			inserirMedidas(user);
			break;
			
			case 3:
			gerarRelatorio(user);
			break;
			
			case 4:
			break;
			
			default:
			cout << ERROR;
		}
		
	} while (option != 4);
	
	return user;
}
	
void inserirRefeicao(Usuario user){
	float carb, prot, fat;
	int refeicao;
	if(user.dieta == "M"  || user.dieta == "m" ){
		cout << REFEICAO;
		cin >> refeicao;
		cout << DIET_MENU1;

		//recebe proteina
		cout << PROTEIN;
		cin >> prot;
		user.proteina_tipo1(prot, refeicao);
		
		//recebe carboitrado
		cout << CARB;
		cin >> carb;
		user.carboidrato_tipo1(carb, refeicao);
		
		//recebe gordura
		cout << FATS;
		cin >> fat;
		user.gorduras(fat, refeicao);
	}
	
	if(user.dieta == "E"  || user.dieta == "e" ){
		cout << DIET_MENU1;

		//recebe proteina
		cout << PROTEIN;
		cin >> prot;
		user.proteina_tipo2(prot, refeicao);
		
		//recebe carboitrado
		cout << CARB;
		cin >> carb;
		user.carboidrato_tipo2(carb, refeicao);
		
		//recebe gordura
		cout << FATS;
		cin >> fat;
		user.gorduras(fat, refeicao);
	}
	
	if(user.dieta == "P"  || user.dieta == "p" ){
		int ponto;
		cout << DIET_MENU2;

		//recebe proteina
		cout << PONTOS;
		cin >> ponto;
		user.calculaPontos(ponto, refeicao);
	}
	
}

void inserirMedidas(Usuario user){
	float data, peso, cintura, quadril;
	cout << UPDATE_MEDS;
	
	cout << DATE;
	cin >> data;
	
	cout << WEIGHT;
	cin >> peso;
	
	cout << CIRCUMF;
	cin >> cintura;
	
	cout << HIP;
	cin >> quadril;
	
	user.atualizarMedidas(data, peso, cintura, quadril);
}

void gerarRelatorio(Usuario user){
	user.relatorioDeEvolucao();
	}

};
