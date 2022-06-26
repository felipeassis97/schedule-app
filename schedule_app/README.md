# schedule_app

## Layout


- Empty state
- Search result
- Favorites

<p align="center">
  <img src="layout-images/empty-state.png" width="200">
  <img src="layout-images/search-result.png" width="200">
  <img src="layout-images/favorites.png" width="200">
</p>



## Features

- Listar detalhes de um endereço à partir de um cep
- Favoritar endereço utilizando o armazenamento local
- Ver endereço no mapa



## Arquitetura

Baseado nos conceitos de clean architecture prosposto por Robert C. Martin, a aplicação está dividida em 4 camadas:

- Regras de Negócio Corporativas
- Regras de Negócio da Aplicação
- Adaptadores de Interface
- Frameworks & Drivers (Externos)

<p align="center">
  <img src="https://raw.githubusercontent.com/Flutterando/Clean-Dart/master/imgs/img3.png" width="600">
</p>
