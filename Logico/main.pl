%! Ao carregar os arquivos pelo swipl lembrar de carregar todos, Ex: swipl file.pl main.pl 

use_module(file).

:- initialization main.

main:- lerUsuario(leonardo,Usuario),write(Usuario).