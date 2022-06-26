# schedule-app



## Layout


- Splash
<p align="center">
  <img src="images/splash.png" width="150">
</p>

- Autenticação
<p align="center">
  <img src="images/login.png" width="150">
  <img src="images/forgot-password.png" width="150">
</p>

- Cadastro, listagem e detalhes de eventos
<p align="center">
  <img src="images/event-list.png" width="150">
  <img src="images/event-info.png" width="150">
  <img src="images/event-map.png" width="150">
    <img src="images/event-form.png" width="150">

</p>

- Erros e feedbacks
<p align="center">
  <img src="images/error-state.png" width="150">
  <img src="images/empty-state.png" width="150">
  <img src="images/feedback-success.png" width="150">
  <img src="images/feedback-error.png" width="150">
</p>


## Features

- Autenticação (Firebase)
- Listar eventos via consumo de API
- Ver detalhes do evento
- Ver local no Mapa
- Criar evento (armazenamento local)



## Arquitetura

Baseado nos conceitos de clean architecture prosposto por Robert C. Martin, a aplicação está dividida em 4 camadas:

- Regras de Negócio Corporativas
- Regras de Negócio da Aplicação
- Adaptadores de Interface
- Frameworks & Drivers (Externos)

<p align="center">
  <img src="https://raw.githubusercontent.com/Flutterando/Clean-Dart/master/imgs/img3.png" width="600">
</p>


