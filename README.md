# CBLNotes

Este repositório contém o package Swift com componentes compartilhados entre os projetos, como utilitários e funções comuns.

## Estrutura

Os componentes deste repositório são independentes e podem ser reutilizados em qualquer parte do sistema.

## Pré-requisitos

- Certifique-se de que este repositório está na **mesma hierarquia de pastas** que o repositório do Aplicativo Principal.  
  Exemplo de estrutura de diretórios:
  ```
  /projeto
    ├── AplicativoPrincipal
    ├── CBLNotes
  ```

## Como usar

No projeto principal, importe este package no arquivo `Package.swift`:

```swift
.package(path: "../CBLNotes")
```

## Padrão de commit/branch
#### Padrão para branchs: 
- feat/issue-number
- fix/issue-number
- refactor/issue-number

#### Padrão para commits:
- item do checklist + o que foi feito
