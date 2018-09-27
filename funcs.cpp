#include <iostream>
#include <string>
#include <vector>
#include <iomanip>
#include <fstream>
#include <math.h>

# include "display.cpp"


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
	float carboidrato[5];
	float gordura[5];
	float pontos[5];


//Funcionalidade 2

void proteina_tipo1(float prot, int refeicao){
	float peso_atual = peso[index - 1];
	proteina[refeicao - 1] = prot;
	float prot_total;
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
	cout << "Seu limite de PROTEÍNAS no dia é " << limite << "gramas.\n" << endl;

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
		cout << ADEQUATE_P;
	}

	if(prot < (0.8 * peso_atual)/5){
		cout << LESS_P;
	}

	if(prot >(1.4 * peso_atual)/5){
        cout << OVER_P;
	}
	cout << "Tente consumir em média " << media << " gramas de PROTEÍNA por refeição." << endl;
	cout << "Seu limite de PROTEÍNAS no dia é " << limite << "gramas\n." << endl;

}

void carboidrato_tipo1(float carb, int refeicao){
	carboidrato[refeicao - 1] = carb;

	float carb_total;
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
	cout << "Seu limite de CARBOIDRATOS no dia é " << limite << "gramas\n." << endl;

}

void carboidrato_tipo2(float carb, int refeicao){
	carboidrato[refeicao - 1] = carb;

	float carb_total;
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
	cout << "Seu limite de CARBOIDRATOS no dia é " << limite << "gramas\n." << endl;

}

void gorduras(float gord, int refeicao){
	gordura[refeicao - 1] = gord;

	float gord_total;
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
	cout << "Seu limite de GORDURA no dia é " << limite << "gramas\n." << endl;

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
        if ((indices[pos][2] < 0.80 && sexo == 'F') || (indices[pos][2] < 0.95 && sexo == 'M'))
        {
            aval = "BAIXO RISCO DE SAUDE";
        }
        else if ((indices[pos][2] >= 0.80 && indices[pos][2] <= 0.85 && sexo == 'F') || (indices[pos][2] >= 0.95 && indices[pos][2] <= 1.0 && sexo == 'M'))
        {
            aval = "MODERADO RISCO DE SAUDE";
        }
        else if ((indices[pos][2] > 0.85 && sexo == 'F') || (indices[pos][2] > 1.0 && sexo == 'M'))
        {
            aval = "ALTO RISCO DE SAUDE";
        }

        return aval;
    }

    void atualizarMedidas(float data, float novoPeso, float novaCircAbdominal, float novoQuadril)
    {
        peso[index] = novoPeso;
        circunferencia_abdominal[index]=novaCircAbdominal;
        quadril[index]=novoQuadril;
        indices[index][0] = data;
        indices[index][1] = calculaIMC(index);
        indices[index][2] = calculaRCQ(index);
        index += 1;
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
    userTest.carboidrato_tipo1(40.5,1);
    userTest.gorduras(10.5,1);

    Usuario user2;
    user2.index = 0;
    user2.sexo = 'M';
    user2.altura = 1.6;
    user2.atualizarMedidas(27.09,54.5,0.7,1.0);
    user2.proteina_tipo2(28.2, 1);
    user2.carboidrato_tipo2(15.5,1);

    return 0;
}
