#include <iostream>
#include <string>

using namespace std;

enum tiposDieta { ganho_de_massa, emagrecimento, dieta_dos_pontos };

struct Usuario {
  string nome;
  string senha;
  tiposDieta td;
};

Usuario usuarios[100];

void cadastro();
void login();
void menu();
void coletarInformacoes(Usuario usuario);

int main(int argc, char const *argv[]) {
  menu();
  return 0;
}

void menu(){
  cout << "\e[38:5:42m----- Bem Vindo ao Gerenciador de Alimentação! -----\n\e[39m";
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
    cout << "\e[2m\nEscolha uma opção:\e[22m\n\n1 - Realizar Login\n2 - Realizar Cadastro\n3 - Sair\n";
    cin >> opcao;
  } while(opcao != 3);

  cout << usuarios[0].nome;
  cout << usuarios[0].senha;

}

void login(){
  cout << "Olá login";
}

void cadastro(){

  Usuario usuario;

  cout << "\e[2m\nIniciando Cadastro\e[22m";
  cout << "\nUsername: ";
  cin >> usuario.nome;
  cout << "\nPassword: ";
  cin >> usuario.senha;
  usuarios[0] = usuario;

  coletarInformacoes(usuario);

  cout << "Cadastro Realizado com sucesso!!!\n";
}

void coletarInformacoes(Usuario usuario){

  cout << "\e[2m\nSobre Você\e[22m\n";
  cout << "Nome: \n";
  cout << "Idade: \n";
  cout << "Peso (Kg): \n";
  cout << "Altura (Cm): \n";
  cout << "Circunferência Abdominal (Cm): \n";
  cout << "Quadril (Cm): \n";

  cout << "\e[2m\nSelecione a dieta desejada:\e[22m";
  cout << "\n\n(1) Ganho de massa muscular";
  cout << "\n(2) Emagrecimento";
  cout << "\n(3) Dieta dos pontos\n";
  int dietaEscolhida;
  cin >> dietaEscolhida;

  if (dietaEscolhida == 1){
    usuario.td = tiposDieta::ganho_de_massa;
  } else if (dietaEscolhida == 2){
    usuario.td = tiposDieta::emagrecimento;
  } else if (dietaEscolhida == 3) {
    usuario.td = tiposDieta::dieta_dos_pontos;
  } else {
    cout << "\nDieta não existente no momento.\n";
  }
}
