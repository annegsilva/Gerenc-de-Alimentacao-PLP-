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

Usuario usuarios[100];
int num_usuarios = 0;

void cadastro();
bool login();
void menu();
void lerUsuarios();
vector<string> split(string str, char delimiter);
void mostrarUsuarios();

int main(int argc, char const *argv[]) {
  menu();
  return 0;
}

void menu(){
  lerUsuarios();
  mostrarUsuarios();
  cout << "Bem Vindo ao Gerenciador de Alimentacao! -----\n";
  int opcao;
  do {
    switch (opcao) {
      case 1:
      login();
      break;
      case 2:
      cadastro();
      break;
    }
    cout << "\nEscolha uma opcao:\n\n1 - Realizar Login\n2 - Realizar Cadastro\n3 - Sair\n";
    cin >> opcao;
  } while(opcao != 3);


}

bool login(){
  string username;
  string senha;
  int i;

  cout << "\nUsername: ";
  cin >> username;
  cout << "\nSenha: ";
  cin >> senha;

  for (i = 0; i < 99; i++) {
    if(usuarios[i].username == username && usuarios[i].senha == senha){
      cout << "encontrei o usuario e estou logaado";
      return true;
    }
  }
  return false;
}

void cadastro(){

  Usuario usuario;

  cout << "\nIniciando Cadastro";
  cout << "\nUsername: ";
  cin >> usuario.username;
  cout << "\nPassword: ";
  cin >> usuario.senha;

  cout << "\nSobre Voce\n";
  cout << "Nome: ";
  cin >> usuario.nome;
  cout << "\nIdade: ";
  cin >> usuario.idade;
  cout << "\nPeso (Kg): ";
  cin >> usuario.peso;
  cout << "\nAltura (Cm): ";
  cin >> usuario.altura;
  cout << "\nCircunferencia Abdominal (Cm): ";
  cin >> usuario.circunferencia_abdominal;
  cout << "\nQuadril (Cm): ";
  cin >> usuario.quadril;

  cout << "\nSelecione a dieta desejada:";
  cout << "\n\n(1) Ganho de massa muscular";
  cout << "\n(2) Emagrecimento";
  cout << "\n(3) Dieta dos pontos\n";
  int dietaEscolhida;
  cin >> dietaEscolhida;

  if (dietaEscolhida == 1){
    usuario.td = tipos_dieta::ganho_de_massa;
  } else if (dietaEscolhida == 2){
    usuario.td = tipos_dieta::emagrecimento;
  } else if (dietaEscolhida == 3) {
    usuario.td = tipos_dieta::dieta_dos_pontos;
  } else {
    cout << "\nDieta nao existente no momento.\n";
  }

  cout << "\nCadastro Realizado com sucesso!!!\n";
  usuarios[num_usuarios] = usuario;

  num_usuarios ++;
}

void lerUsuarios () {
  string line;
  ifstream myfile ("usuarios.txt");
  if (myfile.is_open())
  {
    while (! myfile.eof() )
    {
      getline (myfile,line);
      vector<string> saida = split(line,';');

      Usuario usuario;
      usuario.username = saida[0];
      usuario.senha = saida[1];
      usuario.nome = saida[2];
      usuario.idade = stoi(saida[3]);
      usuario.altura = stof(saida[4]);
      usuario.circunferencia_abdominal = stof(saida[5]);
      usuario.quadril = stof(saida[6]);
      usuarios[num_usuarios] = usuario; // usuario adicionado
      num_usuarios ++;
    }
    myfile.close();
  }

  else cout << "arquivo nao existe";

}

void mostrarUsuarios(){
  int i;
  for (i = 0; i < 99; i++) {
    cout << usuarios[i].username; // aqui nao existe mais usuario, algum problema com apontador
    cout << usuarios[i].senha;
    cout << usuarios[i].nome;
    cout << "\n";
  }
}

vector<string> split(string str, char delimiter) {
  vector<string> internal;
  stringstream ss(str);
  string tok;

  while(getline(ss, tok, delimiter)) {
    internal.push_back(tok);
  }

  return internal;
}
