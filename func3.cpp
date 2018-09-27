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
};
//Funcionalidade 2

void proteina_tipo1(Usuario user, float proteina, int refeicao){
	float peso = user.peso[user.index - 1];
	user.proteina[refeicao] = proteina;
	float prot_total;
	for(int i = 0; i < 5; i++){
		prot_total += user.proteina[i];
	}
	float limite = (2 * peso) - prot_total;
	if(proteina >= (1.4 * peso)/5 && proteina <= (2 * peso)/5){
		cout << "Sua refeição tem a quantidade: IDEAL DE PROTEÍNA !" << endl;
	}
	
	if(proteina > (1.4 * peso)/5){
		cout << "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!" << endl;
	}
	
	if(proteina >(2 * peso)/5){
		cout << "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA!" << endl;
		cout << "Lembre-se que o nosso corpo tem um limite máximo de absorção" << endl;
	}
	cout << "Tente consumir em média " << (2 * peso)/5 << " gramas de proteína por refeição." << endl;
	cout << "Seu limite de proteinas no dia é " << limite << "gramas." << endl;

}


//Funcionalidade 3
float calculaIMC(Usuario user, int pos)
    {
        float imc;
        imc = user.peso[pos] / pow(user.altura, 2);
        return imc;
    }
   
    float calculaRCQ(Usuario user, int pos)
    {
        float rcq;
        rcq = user.circunferencia_abdominal[pos] / user.quadril[pos];
        return rcq;
    }
string avaliacaoIMC(Usuario user, int pos)
    {
        string aval;
        if (user.indices[pos][1] < 17.0)
        {
            aval = "MUITO ABAIXO DO PESO";
        }
        else if (user.indices[pos][1] >= 17.0 && user.indices[pos][1] < 18.5)
        {
            aval = "ABAIXO DO PESO";
        }
        else if (user.indices[pos][1] >= 18.5 && user.indices[pos][1] < 24.5)
        {
            aval = "PESO NORMAL";
        }
        else if (user.indices[pos][1] >= 24.5 && user.indices[pos][1] < 30)
        {
            aval = "ACIMA DO PESO";
        }
        else if (user.indices[pos][1] >= 30 && user.indices[pos][1] < 35)
        {
            aval = "OBESIDADE I";
        }
        else if (user.indices[pos][1] >= 35 && user.indices[pos][1] < 40)
        {
            aval = "OBESIDADE II (severa)";
        }
        else if (user.indices[pos][1] >= 40)
        {
            aval = "OBESIDADE III (mórbida)";
        }

        return aval;
    }

    string avaliacaoRCQ(Usuario user, int pos)
    {
        string aval;
        if ((user.indices[pos][2] < 0.80 && user.sexo == 'F') || (user.indices[pos][2] < 0.95 && user.sexo == 'M'))
        {
            aval = "BAIXO RISCO DE SAUDE";
        }
        else if ((user.indices[pos][2] >= 0.80 && user.indices[pos][2] <= 0.85 && user.sexo == 'F') || (user.indices[pos][2] >= 0.95 && user.indices[pos][2] <= 1.0 && user.sexo == 'M'))
        {
            aval = "MODERADO RISCO DE SAUDE";
        }
        else if ((user.indices[pos][2] > 0.85 && user.sexo == 'F') || (user.indices[pos][2] > 1.0 && user.sexo == 'M'))
        {
            aval = "ALTO RISCO DE SAUDE";
        }

        return aval;
    }

    void atualizarMedidas(Usuario user, float data, float novoPeso, float novaCircAbdominal, float novoQuadril)
    {
        int index = user.index;
        user.peso[index] = novoPeso;
        user.circunferencia_abdominal[index]=novaCircAbdominal;
        user.quadril[index]=novoQuadril;
        user.indices[index][0] = data;
        user.indices[index][1] = calculaIMC(user, index);
        user.indices[index][2] = calculaRCQ(user, index);
        user.index += 1;
    }

    void relatorioDeEvolucao(Usuario user)
    {
        for (int i = 0; i < user.index; i++)
        {
            cout << "Seus indices da data " << user.indices[i][0] << " são\n:" << endl;
            cout << "IMC ...: " << user.indices[i][1] << endl;
            cout << "Análise: " << avaliacaoIMC(user, i) << "\n" << endl;
            cout << "RCQ....: " << user.indices[i][2] << endl;
            cout << "Análise: " << avaliacaoRCQ(user, i) << "\n" << endl;
        }
    }

//Main para testes dos metodos das funcionalidades 
int main()
{
    Usuario userTest;
    userTest.index = 0;
    userTest.sexo = 'F';
    userTest.altura =1.60;
    atualizarMedidas(userTest, 20.07, 80.5, 1.6, 1.1);
    atualizarMedidas(userTest, 22.09, 70.5, 0.7, 1.0);
    relatorioDeEvolucao(userTest);
    return 0;
}
