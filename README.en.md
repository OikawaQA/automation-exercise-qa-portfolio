# AutomationExercise QA Portfolio

Automated test suite (UI + API) built on top of the public [AutomationExercise](https://automationexercise.com) website, as a portfolio project to demonstrate QA Automation skills.

> 🇧🇷 [Leia isso em Português](./README.md)

## 🎯 Project goals

This repository demonstrates hands-on skills in:

- UI test automation with **Robot Framework** + **Browser Library (Playwright)**
- API testing with **Postman**, executed via CLI using **Newman**
- Test design using **Page Object Model (POM)** and **BDD** syntax (Given/When/Then)
- Test design techniques: **equivalence class partitioning** and **boundary value analysis**
- Investigating and documenting **real bugs** found during testing
- *(In progress)* Continuous Integration with **GitHub Actions**

## 🧰 Tech stack

| Layer | Tools |
|---|---|
| UI Testing | Robot Framework, Browser Library (Playwright), Python |
| API Testing | Postman, Newman, JavaScript (pm scripts) |
| CI/CD | GitHub Actions *(in progress)* |
| Design patterns | Page Object Model (POM), BDD |

## 📁 Repository structure

```
├── ui-tests/
│   ├── pages/          # Page Objects
│   ├── components/     # Reusable UI components
│   ├── resources/       # Shared keywords (.resource)
│   └── tests/           # Test cases (.robot)
├── api-tests/
│   ├── collections/     # Postman Collections (.json)
│   └── environments/    # Postman Environments (.json)
├── .github/
│   └── workflows/       # CI/CD pipelines (GitHub Actions)
└── README.md
```

## ✅ Test coverage

### UI (Robot Framework)
- [ ] User registration
- [ ] Login / Logout
- [ ] Product search and filtering
- [ ] Shopping cart flow
- [ ] Full checkout flow

### API (Postman/Newman)
- [x] `GET /api/productsList` — schema and structure validation
- [x] `POST /api/searchProduct` — happy path + negative scenarios (missing parameter, no-result search)
- [x] `POST /api/createAccount` — account creation with dynamic data
- [x] `GET /api/getUserDetailByEmail` — persisted data validation
- [x] `POST /api/verifyLogin` — credential validation
- [ ] `PUT /api/updateAccount` — **see documented bug below**
- [ ] `DELETE /api/deleteAccount`

## 🐛 Bug found: PUT /api/updateAccount

While testing the account update endpoint, I identified an inconsistency: the API returns `404 - "Account not found!"` even when the submitted email and password correspond to an account that has been **independently confirmed to exist and be valid**.

**Investigation process:**
1. Account successfully created via `POST /api/createAccount` (`responseCode: 201`)
2. Account confirmed to exist via `GET /api/getUserDetailByEmail` (`responseCode: 200`, correct data returned)
3. Credentials confirmed valid via `POST /api/verifyLogin` (`responseCode: 200`, `"User exists!"`)
4. `PUT /api/updateAccount`, using the same credentials and a complete payload, still returns `404 - "Account not found!"`

Tested with: full payload, reduced payload, hardcoded values, and query-string parameters — behavior was consistent across all cases, ruling out payload or environment-variable errors on my end.

**Conclusion:** the PUT endpoint's behavior diverges from the official API documentation, even with valid preconditions confirmed by three independent calls. Documented here as a test finding, not as a test-environment failure.

## 🚀 Running the tests locally

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

## 📌 Next steps

- [ ] Finish UI test coverage (full checkout flow)
- [ ] CI/CD pipeline on GitHub Actions (separate jobs for UI and API)
- [ ] CTFL/ISTQB certification

## 👤 Author

**Matheus Oikawa** — QA Automation
[LinkedIn](https://www.linkedin.com/in/matheus-oikawa/) · [GitHub](#)
