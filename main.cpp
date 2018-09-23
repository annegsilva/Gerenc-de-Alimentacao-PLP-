#include <iostream>
#include <string>
#include <vector>
#include <iomanip>
#include <fstream>

using namespace std;

enum tipos_dieta { ganho_de_massa, emagrecimento, dieta_dos_pontos };

struct Usuario {
	string username;
	string senha;
	string nome;
	int idade;
	float peso;
	float altura;
	float circunferencia_abdominal;
	float quadril;
	tipos_dieta td;
};

void cadastro();
void menu(Usuario usuarios[]);
void lerUsuarios(Usuario usuarios[]);
void salvarUsuario(string usuario);
bool login(Usuario usuarios[]);
const vector<string> explode(const string& s, const char& c);

int num_usuarios = 0;

int main(int argc, char const *argv[]) {
	Usuario usuarios[100];
	menu(usuarios);
	return 0;
}

mostrarUsuarios(Usuario usuarios[]) {
	int i;
	for (i = 0; i < num_usuarios; i++) {
		cout << usuarios[i].username << endl;
	}
}

void menu(Usuario usuarios[]) {
	lerUsuarios(usuarios);
	mostrarUsuarios(usuarios);
	cout << "Bem Vindo ao Gerenciador de Alimentacao! -----\n";
	int opcao;
	
	do {
		switch (opcao) {
			case 1:
			login(usuarios);
			break;
      
			case 2:
			cadastro();
			break;
		}
	cout << "\nEscolha uma opcao:";
	cout << "\n1 - Realizar Login";
	cout << "\n2 - Realizar Cadastro";
	cout << "\n3 - Sair\n\n"
	cin >> opcao;
	} while (opcao != 3);
}

bool login(Usuario usuarios[]) {
	string username;
	string senha;
	int i;

	cout << "\nUsername: ";
	cin >> username;
	cout << "\nSenha: ";
	cin >> senha;

	for (i = 0; i < num_usuarios; i++) {
		if (usuarios[i].username == username && usuarios[i].senha == senha) {
			cout << "encontrei o usuario e estou logaado";
			return true;
		}
	}
	
	return false;
}

void cadastro() {

	string usuario[9];
	cout << "\nIniciando Cadastro";
	cout << "\nUsername: ";
	cin >> usuario[0];
	cout << "\nPassword: ";
	cin >> usuario[1];

	cout << "\nSobre Voce";
	cout << "\nNome: ";
	cin >> usuario[2];
	cout << "\nIdade: ";
	cin >> usuario[3];
	cout << "\nPeso (kg): ";
	cin >> usuario[4];
	cout << "\nAltura (cm): ";
	cin >> usuario[5];
	cout << "\nCircunferencia Abdominal (cm): ";
	cin >> usuario[6];
	cout << "\nQuadril (cm): ";
	cin >> usuario[7];

	cout << "\nSelecione a dieta desejada:";
	cout << "\n\n(1) Ganho de massa muscular";
	cout << "\n(2) Emagrecimento";
	cout << "\n(3) Dieta dos pontos\n";
	cin >> usuario[8];

	string usuario_g;
	int i;
	for (i = 0; i < 9; i++) {
		usuario_g += usuario[i] + ';';
	}
	usuario_g += "fim";
	salvarUsuario(usuario_g);

	cout << "\nCadastro Realizado com sucesso!!!\n";
}

// Daqui pra baixo eh tudo arquivo

void lerUsuarios(Usuario usuarios[]) {
	string line;
	ifstream myfile ("usuarios.txt");
	
	if (myfile.is_open()) {
		int count;
		while (!myfile.eof()) {
			count = 0			;
			getline(myfile,line);
			vector<string> usuario{explode(line, ';')};
		
			for (auto n:usuario) {
				if (n != "fim") {
					usuario[count] = n;
					count++;
				}
			}

			Usuario novoUsuario;
			novoUsuario.username = usuario[0];
			novoUsuario.senha = usuario[1];
			novoUsuario.nome = usuario[2];
			usuarios[num_usuarios] = novoUsuario;
			num_usuarios ++;
		}
		myfile.close();
	} else {
		cout << "arquivo nao existe";
	}
}

void salvarUsuario(string usuario) {
	std::ofstream Hypnos_FILE;
	Hypnos_FILE.open("usuarios.txt", std::ios::app);
	
	if (Hypnos_FILE.is_open()) {
		Hypnos_FILE << endl << usuario;
	} else {
		std::cout << "Erro ao abrir arquivo de texto.";
		Hypnos_FILE.close();
	}
}

const vector<string> explode(const string& s, const char& c) {
	string buff{""};
	vector<string> v;

	for(auto n:s){
		if (n != c) 
			buff+=n;
		else if (n == c && buff != "") {
			v.push_back(buff); 
			buff = "";
		}
	}
	
	if (buff != "") 
		v.push_back(buff);

	return v;
}
