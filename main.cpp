# include <iostream>
# include <string>
# include <vector>
# include <iomanip>
# include <fstream>
# include <sstream> 
# include "display.cpp"

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

// Lista dos metodos do gerenciador
void cadastro();
void menu(Usuario usuarios[]);
void lerUsuarios(Usuario usuarios[]);
void salvarUsuario(string usuario);
void login(Usuario usuarios[]);
void mostrarUsuarios(Usuario usuarios[]);
const vector<string> explode(const string& s, const char& c);

int num_usuarios = 0;

int main(int argc, char const *argv[]) {
	Usuario usuarios[100];
	menu(usuarios);
	return 0;
}

// Metodo inicial. menu
void menu(Usuario usuarios[]) {
	lerUsuarios(usuarios);
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
	lerUsuarios(usuarios);
	cout << "\nEscolha uma opcao:";
	cout << "\n1 - Realizar Login";
	cout << "\n2 - Realizar Cadastro";
	cout << "\n3 - Sair\n\n";
	cin >> opcao;
	} while (opcao != 3);
}


void login(Usuario usuarios[]) {
	string username;
	string senha;
	int i;

	cout << "\nUsername: ";
	cin >> username;
	cout << "\nSenha: ";
	cin >> senha;
	
	for (i = 0; i < num_usuarios; i++) {
		if (usuarios[i].username == username && usuarios[i].senha == senha) {
			cout << "encontrei o usuario e estou logado";
		}
	}

	// abaixo fluxo de execucao após logar ???
	// funcionalidades 2 e 3
}


// menu de cadastro: coleta inicial de todas as informações do mesmo
void cadastro() {

	string usuario[9];
	cout << "\nIniciando Cadastro";
	cout << "\nUsername: ";
	cin >> usuario[0];
	cout << "\nPassword: ";
	cin >> usuario[1];

	cout << "\nSobre Voce";
	cout << "\nNome: ";
	getline(cin.ignore(),usuario[2]);
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

	/*
	Ao cadastrar cria string pronta para ser salva diretamente no arquivo
	*/
	string usuario_g;
	int i;
	for (i = 0; i < 9; i++) {
		usuario_g += usuario[i] + ';';
	}
	usuario_g += "fim";
	salvarUsuario(usuario_g);

	cout << "\nCadastro Realizado com sucesso!!!\n";
}

// Leitura dos usuarios gravados em usuarios.txt
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

			/*
			Cria novo usuario e o adiciona no fluxo de execução do programa
			*/
			Usuario novoUsuario;
			novoUsuario.username = usuario[0];
			novoUsuario.senha = usuario[1];
			novoUsuario.nome = usuario[2];
			int idade = 0;
			stringstream converter(usuario[3]); 
			converter >> idade;
			novoUsuario.idade = idade;
			novoUsuario.peso = strtof((usuario[4]).c_str(),0);
			novoUsuario.altura = strtof((usuario[5]).c_str(),0);
			novoUsuario.circunferencia_abdominal = strtof((usuario[6]).c_str(),0);
			novoUsuario.quadril = strtof((usuario[7]).c_str(),0);

			if(usuario[8] == "1"){
				novoUsuario.td = tipos_dieta::ganho_de_massa;
			} else if(usuario[8] == "2"){
				novoUsuario.td = tipos_dieta::emagrecimento;
			} else if(usuario[8] == "3"){
				novoUsuario.td = tipos_dieta::dieta_dos_pontos;
			}

			usuarios[num_usuarios] = novoUsuario;
			num_usuarios ++;
		}
		myfile.close();
	} else {
		cout << "arquivo nao existe";
	}
}

// Salva usuario em usuarios.txt
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

// Split para auxiliar na quebra de tokens da entrada (arquivo)
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

void mostrarUsuarios(Usuario usuarios[]) {
	int i;
	for (i = 0; i < num_usuarios; i++) {
		cout << usuarios[i].idade << endl;
	}
}
