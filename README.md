# App Todo List

O App deve ter a funcionalidade de criar listas de tarefas, dentro de cada lista criaremos as devidas tarefas, podendo marcar 
como concluído ou excluindo as tarefas. O App também terá um login social com a conta do Google Gmail.

Este App será feito com o Framework Flutter e a parte de Back-end será feito na plataforma Firebase.

## Arquitetura
    - Clean Dart

## Gerencia de Estado
    - Bloc

## Gerencia de Rotas e Injeção de Dependências
    - Modular

### Exemplo:
```
├── lib
│   ├── app
│   │   ├── modules	
│   │   │   ├── auth
│   │   │   └── item
│   │   │   	  ├── domain
│   │   │   	  │	  ├── item_entity.dart
│   │   │   	  │	  ├── item_usecase.dart
│   │   │   	  │	  └── item_repository.dart
│   │   │   	  ├── infra
│   │   │   	  │	  ├── item_datasource.dart
│   │   │   	  │	  └── item_repository_impl.dart
│   │   │   	  ├── external
│   │   │   	  │	  ├── item_datasource_impl.dart
│   │   │   	  │	  └── item_mapper.dart
│   │   │   	  └── presenter
│   │   │   	      ├── Bloc
│   │   │   	      │   ├── item_states.dart
│   │   │   	      │   ├── item_events.dart
│   │   │   	      │   └── item_bloc.dart
│   │   │   	      └── item_page.dart
│   │   ├── shared
│   │   │   ├── components
│   │   │   └── services	
│   │   ├── themes
│   │   │   ├── app_colors.dart
│   │   │   └── app_text_style.dart
│   │   ├── app_module.dart
│   │   └── app_widget.dart
│   └── main.dart
├── test
├── pubspec.lock
└── pubspec.yaml
```

## Tecnologias
    - Flutter
    - Dart
    - Firebase
    - Bloc
    - Modular
    - Dartz