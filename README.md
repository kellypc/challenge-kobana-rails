# Challenge Kobana

Este é um projeto desenvolvido para uma avaliação técnica da empresa Kobana.

O sistema oferece um CRUD para gestão de boletos.

## Tabela de Conteúdo

* [Instalação](#instalacao)
* [Funcionalidades](#funcionalidades)
* [Testes com RSpec](#testes-com-rspec)

## Instalação

1. Clone o projeto.

	~~~ sh
	$ git@github.com:kellypc/challenge-kobana-rails.git
	~~~

2. Entre no container(Docker)

	~~~ sh
	$ docker-compose run web bash
	~~~

3. Execute as migrações

~~~ sh
$ rails db:migrate
~~~

4. Inicie a aplicação

	~~~ sh
	$ rails s
	~~~

## Funcionalidades

## Testes com RSpec

O projeto foi construído com TDD (Test Driven Development). Para executar os testes, basta executar os testes com o RSpec.

1. Execute todos os  testes

	~~~ sh
	$ bundle exec rspec
	~~~
