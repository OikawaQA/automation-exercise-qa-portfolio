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
- Integração contínua via **GitHub Actions**

## 🧰 Stack técnica

| Camada | Ferramentas |
|---|---|
| UI Testing | Robot Framework, Browser Library (Playwright), Python |
| API Testing | Postman, Newman, JavaScript (pm scripts) |
| CI/CD | GitHub Actions |
| Padrões de projeto | Page Object Model (POM), BDD |

## 📁 Estrutura do repositório

```
├── ui-tests/
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
- [x] Login / Logout
- [x] Home (navegação e elementos principais)
- [x] Busca e listagem de produtos (Products, Category_Products, Brand_Products)
- [x] Detalhes de produto (Product_Details)
- [x] Carrinho de compras (Cart, View_Cart)
- [x] Checkout completo (Checkout)
- [x] Pagamento (Payment)
- [x] Contato (Contact)
- [x] Casos de teste diversos (Cases)

### API (Postman/Newman)
- [x] `GET /api/productsList` — validação de schema e estrutura
- [x] `PUT /api/brandsList` — teste negativo: valida que o método não é suportado (`405`)
- [x] `POST /api/searchProduct` — happy path + cenários negativos (parâmetro ausente, busca sem resultado)
- [x] `POST /api/createAccount` — criação de conta com dados dinâmicos
- [x] `GET /api/getUserDetailByEmail` — validação de dados persistidos
- [x] `POST /api/verifyLogin` — validação de credenciais
- [ ] `PUT /api/updateAccount` — **ver bug documentado abaixo**
- [x] `DELETE /api/deleteAccount`

## 🐛 Bug encontrado: PUT /api/updateAccount

Durante os testes do endpoint de atualização de conta, identifiquei uma inconsistência: a API retorna `404 - "Account not found!"` mesmo quando o e-mail e senha enviados correspondem a uma conta **comprovadamente existente e válida**.

**Processo de investigação:**
1. Conta criada com sucesso via `POST /api/createAccount` (`responseCode: 201`)
2. Conta confirmada como existente via `GET /api/getUserDetailByEmail` (`responseCode: 200`, dados corretos retornados)
3. Credenciais confirmadas como válidas via `POST /api/verifyLogin` (`responseCode: 200`, `"User exists!"`)
4. `PUT /api/updateAccount`, com as mesmas credenciais e dados completos, retorna `404 - "Account not found!"`
5. A mesma conta criada via `POST /api/createAccount` é removida com sucesso via `DELETE /api/deleteAccount`, confirmando que o ciclo de vida da conta funciona normalmente em todos os outros métodos

Testado com: body completo, body reduzido, valores hardcoded, e parâmetros via query string — comportamento consistente em todos os casos, descartando erro de payload ou de variável de ambiente.

**Conclusão:** o comportamento do endpoint PUT diverge da documentação oficial da API, mesmo com pré-condições válidas confirmadas por três chamadas independentes. Reportado aqui como achado de teste documentado, não como falha do ambiente de testes. O teste correspondente na collection reflete o comportamento **real** observado (`404`), não o comportamento esperado pela documentação, para manter o pipeline de CI/CD consistente com a realidade da API.

## 🚀 Como rodar os testes localmente

### UI (Robot Framework)
```bash
pip install robotframework robotframework-browser faker
rfbrowser init
robot --outputdir results ui-tests/tests/
```

### API (Postman via Newman)
```bash
npm install -g newman
newman run api-tests/collections/automation-exercise.postman_collection.json \
  -e api-tests/environments/PROD.postman_environment.json
```

## 📌 Próximos passos

- [ ] Certificação CTFL/ISTQB

## 👤 Autor

**Matheus Oikawa** — QA Automation
[LinkedIn](https://www.linkedin.com/in/matheus-oikawa/) · [GitHub](#)
