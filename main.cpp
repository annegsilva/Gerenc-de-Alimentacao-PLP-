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
void addUsuario(Usuario usuarios[],vector<string> saida);
void salvarUsuario(string usuario);
bool login(Usuario usuarios[]);
void split(string str, char delimiter,vector<string> saida);

int num_usuarios = 0;

int main(int argc, char const *argv[]) {
  Usuario usuarios[100];
  menu(usuarios);
  return 0;
}

void menu(Usuario usuarios[]){
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
    cout << "\nEscolha uma opcao:\n\n1 - Realizar Login\n2 - Realizar Cadastro\n3 - Sair\n";
    cin >> opcao;
  } while(opcao != 3);


}

bool login(Usuario usuarios[]){
  string username;
  string senha;
  int i;

  cout << "\nUsername: ";
  cin >> username;
  cout << "\nSenha: ";
  cin >> senha;

  for (i = 0; i < num_usuarios; i++) {
    if(usuarios[i].username == username && usuarios[i].senha == senha){
      cout << "encontrei o usuario e estou logaado";
      return true;
    }
  }
  return false;
}

void cadastro(){

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
  cout << "\nPeso (Kg): ";
  cin >> usuario[4];
  cout << "\nAltura (Cm): ";
  cin >> usuario[5];
  cout << "\nCircunferencia Abdominal (Cm): ";
  cin >> usuario[6];
  cout << "\nQuadril (Cm): ";
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

  salvarUsuario(usuario_g);

  cout << "\nCadastro Realizado com sucesso!!!\n";
}

// Daqui pra baixo eh tudo arquivo

void lerUsuarios (Usuario usuarios[]) {
  string line;
  ifstream myfile ("usuarios.txt");
  if (myfile.is_open())
  {
    while (! myfile.eof() )
    {
      getline (myfile,line);
      vector<string> saida;
      split(line,';', saida);

      addUsuario(usuarios,saida);
    }
    myfile.close();
  }

  else cout << "arquivo nao existe";

}

void addUsuario(Usuario usuarios[], vector<string> saida){
  Usuario usuario;
}

void salvarUsuario (string usuario) {
  std::ofstream Hypnos_FILE;
  Hypnos_FILE.open("usuarios.txt", std::ios::app);
  if (Hypnos_FILE.is_open())
  {
    Hypnos_FILE << usuario << endl;
  }
  else
     std::cout << "Erro ao abrir arquivo de texto.";
  Hypnos_FILE.close();
}

void split(string str, char delimiter, vector<string> internal) {
  Usuario usuario;
  stringstream ss(str);
  string tok;
  while(getline(ss, tok, delimiter)) {
    internal.push_back(tok);
  }

  int i;
  for (i = 0; i < internal.size(); i++) {
    usuario.username = internal.at(0);
  }

}
