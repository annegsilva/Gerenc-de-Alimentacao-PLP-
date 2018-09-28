# include <iostream>
# include <string>
# include <vector>
# include <iomanip>
# include <fstream>
# include <sstream> 
# include "display.cpp"
# include "usuario.h"

using namespace std;

// Lista dos metodos do gerenciador
void cadastro();
void menu(Usuario usuarios[]);
void lerUsuarios(Usuario usuarios[]);
void salvarUsuario(string usuario);
void salvarUsuarios(Usuario usuarios[]);
void login(Usuario usuarios[]);
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
	cout << WELCOME;
	
	int option;
	
	do {
		initialMenu();
		cin >> option;
		switch (option) {
			case 1:
			login(usuarios);
			break;
			
			case 2:
			cadastro();
			break;
			
			default:
			cout << ERROR;
		}
		lerUsuarios(usuarios);
		
	} while (option != 3);
	salvarUsuarios(usuarios);
}

// copia daqui pra baixo, se quiser usar esse login :)

void login(Usuario usuarios[]) {
	string username;
	string senha;
	int i;
	
	cout << USERNAME;
	cin >> username;
	cout << PASSWORD;
	cin >> senha;
	
	Usuario userlogado;
	for (i = 0; i < num_usuarios; i++) {
		if (usuarios[i].username == username && usuarios[i].senha == senha) {
			cout << "encontrei o usuario e estou logado";
			userlogado = usuarios[i];
		}
	}
	
	if(userlogado.nome == "") { cout << "Usuario nao encontrado"; return;}
	userlogado.nome = "ola mundo";
	// abaixo fluxo de execucao após logar ???
	// funcionalidades 2 e 3
}


// menu de cadastro: coleta inicial de todas as informações do mesmo
void cadastro() {
	
	string usuario[68];
	cout << REGISTERING;
	cout << USERNAME;
	cin >> usuario[0];
	cout << PASSWORD;
	cin >> usuario[1];
	
	cout << ABOUT_YOU;
	cout << NAME;
	getline(cin.ignore(),usuario[2]);
	cout << AGE;
	cin >> usuario[3];
	cout << SEX;
	cin >> usuario[4];
	cout << WEIGHT;
	cin >> usuario[5];
	cout << HEIGHT;
	cin >> usuario[15];
	cout << CIRCUMF;
	cin >> usuario[16];
	cout << HIP;
	cin >> usuario[26];
	
	int h,j,k,o;
	for (h = 6; h < 15; h++) {
		usuario[h] = "0";
	}
	for (j = 17; j < 26; j++) {
		usuario[j] = "0";
	}
	for (k = 27; k < 36; k++) {
		usuario[k] = "0";
	}
	
	dietsMenu();
	cin >> usuario[36];
	
	usuario[37] = "0"; // index
	
	/*
	Ao cadastrar cria string pronta para ser salva diretamente no arquivo
	*/
	string usuario_g;
	int i;
	for (i = 0; i < 68; i++) {
		if(i >= 38){ usuario[i] = "0"; }
		usuario_g += usuario[i] + ';';
	}
	usuario_g += "fim";
	salvarUsuario(usuario_g);
	num_usuarios ++;
	cout << REGISTERED;
}

// Leitura dos usuarios gravados em usuarios.txt
void lerUsuarios(Usuario usuarios[]) {
	string line;
	ifstream myfile ("usuarios.txt");
	
	if (myfile.is_open()) {
		
		int count;
		while (!myfile.eof()) {
			count = 0;
			getline(myfile,line);
			
			if(line != ""){
				
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
				novoUsuario.sexo = usuario[4];
				
				int j;
				for (j = 0; j < 10; j++) {
					if(usuario[j + 5] == "0"){
						novoUsuario.peso[j] = 0;
					} else { novoUsuario.peso[j] = strtof((usuario[j + 5]).c_str(),0);} 
				}
				
				novoUsuario.altura = strtof((usuario[15]).c_str(),0);
				
				int l;
				for (l = 0; l < 10; l++) {
					if(usuario[l + 16] == ""){
						novoUsuario.circunferencia_abdominal[l] = 0;
					} else { novoUsuario.circunferencia_abdominal[l] = strtof((usuario[l + 16]).c_str(),0);} 
				}
				
				int m;
				for (m = 0; m < 10; m++) {
					if(usuario[m + 26] == ""){
						novoUsuario.quadril[m] = 0;
					} else { novoUsuario.quadril[m] = strtof((usuario[m + 26]).c_str(),0);} 
				}
				
				if(usuario[36] == "1"){
					novoUsuario.td = tipos_dieta::ganho_de_massa;
				} else if(usuario[8] == "2"){
					novoUsuario.td = tipos_dieta::emagrecimento;
				} else if(usuario[8] == "3"){
					novoUsuario.td = tipos_dieta::dieta_dos_pontos;
				}
				
				int index = 0;
				stringstream cv(usuario[37]); 
				cv >> index;
				novoUsuario.index = index;
				
				int z = 0;
				int x = 0;
				for (z = 0; z < 3; z++) {
					for (x = (10*z); x < (10*(z+1)); x++) {
						if(usuario[38 + x] == "0"){
							novoUsuario.indices[x%10][z] = 0;
						} else {
							novoUsuario.indices[x%10][z] = strtof((usuario[38 + x]).c_str(),0);
						}
					}
				}
				
				usuarios[num_usuarios] = novoUsuario;
				num_usuarios ++;
			}
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

string transformaUsuarioEmTexto(Usuario usuario){
	string usuario_g[68];
	usuario_g[0] = usuario.username;
	usuario_g[1] = usuario.senha;
	usuario_g[2] = usuario.nome;
	usuario_g[3] = to_string(usuario.idade);
	usuario_g[4] = usuario.sexo;
	int i;
	for (i = 5; i < 15; i++) {
		usuario_g[i] = to_string(usuario.peso[i-5]);
	}
	usuario_g[15] = to_string(usuario.altura);
	int k;
	for (k = 16; k < 26; k++) {
		usuario_g[k]= to_string(usuario.circunferencia_abdominal[k-16]);
	}
	int j;
	for (j = 26; j < 36; j++) {
		usuario_g[j] = to_string(usuario.quadril[j-26]);
	}
	
	if(usuario.td == tipos_dieta::ganho_de_massa){
		usuario_g[36] = "1";
	} else if(usuario.td == tipos_dieta::emagrecimento){
		usuario_g[36] = "2";
	} else if(usuario.td == tipos_dieta::dieta_dos_pontos){
		usuario_g[36] = "3";
	}
	
	usuario_g[37] = to_string(usuario.index);
	
	int q,w;
	for (q = 0; q < 3; q++) {
		for (w = (10*q); w < (10*(q+1)); w++) {
			usuario_g[w+38] = to_string(usuario.indices[w][q]);
		}
	}
	
	string user;
	int o;
	for (o = 0; o < 68; o++) {
		user += usuario_g[o] + ';';
	}
	user += "fim";
	
	return user;
}

void salvarUsuarios(Usuario usuarios[]) {
	std::ofstream Hypnos;
	Hypnos.open("usuarios.txt", ios::out);
	if (Hypnos.is_open()) {
			int i;
			for (i = 0; i < num_usuarios-1; i++) {
				string user = transformaUsuarioEmTexto(usuarios[i]);
				Hypnos << endl << user;
			}
	} else { 
		std::cout << "Erro ao abrir arquivo de texto.";
		Hypnos.close();
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
