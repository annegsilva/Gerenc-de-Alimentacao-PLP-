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
    float peso_atual = peso[refeicao - 1];
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
    float peso_atual = peso[refeicao - 1];
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
    cout << index;
    for (int i = 0; i < index; i++)
    {
      cout << "Seus indices da data " << indices[i][0] << " são\n:" << endl;
      cout << "IMC ...: " << indices[i][1] << endl;
      cout << "Análise: " << avaliacaoIMC(i) << "\n" << endl;
      cout << "RCQ....: " << indices[i][2] << endl;
      cout << "Análise: " << avaliacaoRCQ(i) << "\n" << endl;
    }
  }
  
  Usuario atualizarUsuario(int indice){
    Usuario newUsuario;
    newUsuario.username = username;
    newUsuario.senha = senha;
    newUsuario.nome = nome;
    newUsuario.sexo = sexo;
    std::copy(std::begin(peso), std::end(peso), std::begin(newUsuario.peso));
    std::copy(std::begin(circunferencia_abdominal), std::end(circunferencia_abdominal), std::begin(newUsuario.circunferencia_abdominal));
    std::copy(std::begin(quadril), std::end(quadril), std::begin(newUsuario.quadril));
    newUsuario.altura = altura;
    newUsuario.index = index;  
    return newUsuario;
  }
};

struct Gerenc_Alimentacao {

  Usuario usuarios[100];
  int num_usuarios;
  
  void login(){
    
    string username;
    string senha;
    cout << USERNAME;
    cin >> username;
    cout << PASSWORD;
    cin >> senha;
    
    int i;
    Usuario userlogado;
    for (i = 0; i < num_usuarios; i++) {
      if (usuarios[i].username == username && usuarios[i].senha == senha) {
        userlogado = usuarios[i];
        menuUsuario(userlogado,i);
      }
    }
    
    if(userlogado.username == "") { cout << "Usuario nao encontrado"; return;}
    
  }
  
  void cadastro(){
    Usuario usuario;
    usuario.index = 0;
    cout << REGISTERING;
    cout << USERNAME;
    cin >> usuario.username;
    cout << PASSWORD;
    cin >> usuario.senha;
    
    cout << ABOUT_YOU;
    cout << NAME;
    getline(cin.ignore(),usuario.nome);
    cout << AGE;
    cin >> usuario.idade;
    cout << SEX;
    cin >> usuario.sexo;
    cout << WEIGHT;
    cin >> usuario.peso[usuario.index];
    cout << HEIGHT;
    cin >> usuario.altura;
    cout << CIRCUMF;
    cin >> usuario.circunferencia_abdominal[usuario.index];
    cout << HIP;
    cin >> usuario.quadril[usuario.index];
    dietsMenu();
    cin>> usuario.dieta;
    usuario.index += 1;
    
    
    int l,k;
    for (l = 0; l < 3; l++) {
      for (k = 0; k < 10; k++) {
        usuario.indices[k][l] = 0;
      }
    }
    
    int i;
    for (i = 1; i < 10; i++) {
      usuario.peso[i] = 0;
      usuario.circunferencia_abdominal[i] = 0;
      usuario.quadril[i] = 0;
    }
    
    usuarios[num_usuarios] = usuario;
    num_usuarios += 1;
  }
  
  void menuUsuario(Usuario user,int indice){
    int option;
    do {
      opcoesUsuario();
      cin >> option;
      if(option == 1){
        inserirRefeicao(user);
      }
      
      if(option == 2){
        inserirMedidas(user);
      }
      
      if(option == 3){
        user.relatorioDeEvolucao();
      }
      
      if(option != 1 && option != 2 && option != 3 &&option != 4){
        cout << ERROR;
        break;
      }
      
    } while (option != 4);
    user.atualizarUsuario(indice);
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
    
    user.atualizarMedidas(data,peso,cintura,quadril);
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
  
  // Leitura dos usuarios gravados em usuarios.txt
  void lerUsuarios() {
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
          
          novoUsuario.dieta = usuario[36];
          
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
    
    usuario_g[36] = usuario.dieta;
    
    usuario_g[37] = to_string(usuario.index);
    
    int q,w;
    for (q = 0; q < 3; q++) {
      for (w = (10*q); w < (10*(q+1)); w++) {
        usuario_g[w+38] = to_string(usuario.indices[w%10][q]);
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
  
  void salvarUsuarios() {
    std::ofstream Hypnos;
    Hypnos.open("usuarios.txt", ios::out | ios::trunc);
    if (Hypnos.is_open()) {
      int i;
      for (i = 0; i < num_usuarios; i++) {
        string user = transformaUsuarioEmTexto(usuarios[i]);
        Hypnos << endl << user;
      }
    } else { 
      std::cout << "Erro ao abrir arquivo de texto.";
      Hypnos.close();
    }
    
  }
  
};


int main() {
  Gerenc_Alimentacao app;
  app.num_usuarios = 0;
  
  cout << WELCOME;
  
  app.lerUsuarios();
  int option;
  do {
    initialMenu();
    cin >> option;
    switch (option) {
      case 1:
      app.login();
      break;
      
      case 2:
      app.cadastro();
      break;
      
      default:
      cout << "Até a próxima!\n";
    }} while (option != 3);
    
    app.salvarUsuarios();
    return 0;
  }