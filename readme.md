# Projeto - Sistema de gerenciamento de usuários

Ele utiliza o **PHP 7.4**, **Apache**, **CodeIgniter 3** e **MariaDB** para implementar um sistema completo de autenticação, controle de usuários e um **WebService seguro**.

## Funcionalidades

- **Autenticação**: Login e logout seguros.
- **CRUD de Usuários e Endereços**:
	- Cadastro, edição e inativação de usuários (exclusão não permitida, apenas desativação).
	- Usuários podem ser reativados posteriormente.
	- No caso dos endereços, é possível realizar a exclusão definitiva.
	- Integração com a API **ViaCEP** para facilitar o cadastro de endereços.
- **Gerenciamento de Admins e Usuários**:
	- Existe um **usuário master** criado por padrão, que conta com todas as permissões, além de poder cadastrar novos administradores e novos usuários master.
	- Usuários admin podem gerenciar logs e usuários comuns.
- **Controle de Acessos**:
	- O sistema implementa um sistema de **roles**: `master`, `admin` e `usuario`.
	- Algumas rotas são restritas apenas ao **master** e ao **admin**.
- **Sistema de Logs**:
	- Todos os logs são armazenados e acessíveis via **WebService protegido por ApiKey**.
	- A dashboard permite ao usuários `master` e `admin` visualizar logs e usuários, além de gerar uma ApiKey própria.
- **Segurança**:
	- As senhas dos usuários são armazenadas de forma segura utilizando um algoritmo de hashing moderno, garantindo maior proteção contra ataques de força bruta e vazamentos de dados.

## WebService (API)
Um webservice de retorno de registros do sistema. A documentação completa do WebService está disponível em:
```
localhost:8081/api
```
Ela inclui todas as informações necessárias sobre autenticação, endpoints disponíveis e formato das requisições e respostas.

