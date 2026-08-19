# AutomationExercise QA Portfolio

Suite de testes automatizados (UI + API) construída sobre o site público [AutomationExercise](https://automationexercise.com), como projeto de portfólio para demonstração de habilidades em QA Automation.

> 🇬🇧 [Read this in English](./README.en.md)

## 🎯 Objetivo do projeto

Este repositório demonstra habilidades práticas em:

- Automação de testes de UI com **Robot Framework** + **Browser Library (Playwright)**
- Testes de API com **Postman**, com execução via CLI usando **Newman**
- Design de testes usando **Page Object Model (POM)** e sintaxe **BDD** (Given/When/Then)
- Técnicas de design de testes: **equivalência de classes** e **análise de valor limite**
- Investigação e documentação de **bugs reais** encontrados durante os testes
- *(Em progresso)* Integração contínua via **GitHub Actions**

## 🧰 Stack técnica

| Camada | Ferramentas |
|---|---|
| UI Testing | Robot Framework, Browser Library (Playwright), Python |
| API Testing | Postman, Newman, JavaScript (pm scripts) |
| CI/CD | GitHub Actions *(em andamento)* |
| Padrões de projeto | Page Object Model (POM), BDD |

## 📁 Estrutura do repositório

```
├── ui-tests/
│   ├── pages/          # Page Objects
│   ├── components/     # Componentes reutilizáveis de UI
│   ├── resources/       # Keywords compartilhadas (.resource)
│   └── tests/           # Casos de teste (.robot)
├── api-tests/
│   ├── collections/     # Postman Collections (.json)
│   └── environments/    # Postman Environments (.json)
├── .github/
│   └── workflows/       # Pipelines de CI/CD (GitHub Actions)
└── README.md
```

## ✅ Cobertura de testes

### UI (Robot Framework)
- [ ] Cadastro de usuário
- [ ] Login / Logout
- [ ] Busca e filtro de produtos
- [ ] Fluxo de carrinho de compras
- [ ] Checkout completo

### API (Postman/Newman)
- [x] `GET /api/productsList` — validação de schema e estrutura
- [x] `POST /api/searchProduct` — happy path + cenários negativos (parâmetro ausente, busca sem resultado)
- [x] `POST /api/createAccount` — criação de conta com dados dinâmicos
- [x] `GET /api/getUserDetailByEmail` — validação de dados persistidos
- [x] `POST /api/verifyLogin` — validação de credenciais
- [ ] `PUT /api/updateAccount` — **ver bug documentado abaixo**
- [ ] `DELETE /api/deleteAccount`

## 🐛 Bug encontrado: PUT /api/updateAccount

Durante os testes do endpoint de atualização de conta, identifiquei uma inconsistência: a API retorna `404 - "Account not found!"` mesmo quando o e-mail e senha enviados correspondem a uma conta **comprovadamente existente e válida**.

**Processo de investigação:**
1. Conta criada com sucesso via `POST /api/createAccount` (`responseCode: 201`)
2. Conta confirmada como existente via `GET /api/getUserDetailByEmail` (`responseCode: 200`, dados corretos retornados)
3. Credenciais confirmadas como válidas via `POST /api/verifyLogin` (`responseCode: 200`, `"User exists!"`)
4. `PUT /api/updateAccount`, com as mesmas credenciais e dados completos, retorna `404 - "Account not found!"`

Testado com: body completo, body reduzido, valores hardcoded, e parâmetros via query string — comportamento consistente em todos os casos, descartando erro de payload ou de variável de ambiente.

**Conclusão:** o comportamento do endpoint PUT diverge da documentação oficial da API, mesmo com pré-condições válidas confirmadas por três chamadas independentes. Reportado aqui como achado de teste documentado, não como falha do ambiente de testes.

## 🚀 Como rodar os testes localmente

### UI (Robot Framework)
```bash
pip install robotframework robotframework-browser
rfbrowser init
robot --outputdir results ui-tests/tests/
```

### API (Postman via Newman)
```bash
npm install -g newman
newman run api-tests/collections/automation-exercise.postman_collection.json \
  -e api-tests/environments/automation-exercise.postman_environment.json
```

## 📌 Próximos passos

- [ ] Finalizar cobertura de testes de UI (checkout completo)
- [ ] Pipeline de CI/CD no GitHub Actions (jobs separados para UI e API)
- [ ] Certificação CTFL/ISTQB

## 👤 Autor

**Oikawa** — QA Automation
[LinkedIn](#) · [GitHub](#)
