```markdown
# Telco Customer Churn Prediction: End-to-End MLOps Pipeline

[![CI/CD Pipeline](https://github.com/trantrongkhangttns/telco-churn-mlops/actions/workflows/ci.yml/badge.svg)](https://github.com/trantrongkhangttns/telco-churn-mlops/actions)
[![Docker Image Version](https://img.shields.io/badge/docker%20image-latest-blue?logo=docker)](https://hub.docker.com/r/khangtranttns/telco-churn-api)
[![Python 3.10](https://img.shields.io/badge/python-3.10-blue.svg)](https://www.python.org/downloads/release/python-3100/)

## 📖 Overview & Business Objective
Customer retention is one of the most critical metrics for telecommunication companies. Acquiring a new customer is significantly more expensive than retaining an existing one. 

This project implements an End-to-End Machine Learning system to predict customer churn. By identifying at-risk customers proactively based on their demographic data, account information, and usage patterns, the business can deploy targeted retention strategies, thereby reducing revenue leakage.

## 🏗 System Architecture
1. **Model Training:** Data preprocessing and training an **XGBoost** classifier. Model serialization is optimized using `skops` for fast, secure loading.
2. **Serving Layer:** A high-performance REST API built with **FastAPI**.
3. **Interactive UI:** A web interface built with **Gradio** for real-time inference and demonstration.
4. **Containerization:** The entire application is containerized using **Docker** with a multi-stage, security-hardened `Dockerfile`.
5. **CI/CD Automation:** **GitHub Actions** automatically triggers on every push to the `main` branch, building and pushing the latest Docker image directly to Docker Hub.

## 💻 Tech Stack
- **Machine Learning:** `scikit-learn`, `xgboost`, `pandas`, `skops`
- **API & Backend:** `FastAPI`, `uvicorn`, `pydantic`
- **Frontend / UI:** `Gradio`
- **DevOps & MLOps:** `Docker`, `GitHub Actions`

---

## 🚀 How to Run

### Method 1: Run via Docker 

```bash
docker run -p 8000:8000 khangtranttns/telco-churn-api:latest

```

Once the container starts, open your browser and navigate to:

* **Interactive UI:** [http://localhost:8000/ui](http://localhost:8000/ui)
* **API Swagger Docs:** [http://localhost:8000/docs](http://localhost:8000/docs)

### Method 2: Local Development

If you want to modify the code or train the model:

1. Clone the repository:

```bash
git clone [https://github.com/trantrongkhangttns/telco-churn-mlops.git](https://github.com/trantrongkhangttns/telco-churn-mlops.git)
cd telco-churn-mlops

```

2. Create a virtual environment and install dependencies:

```bash
python -m venv .venv
.\.venv\Scripts\activate  # On Windows
pip install -r requirements.txt

```

3. Start the FastAPI server:

```bash
uvicorn src.app.app:app --host 0.0.0.0 --port 8000

```

---

## 🧪 Testing (Automated)

To ensure the API and UI endpoints are functioning correctly, run the integration tests using `pytest`:

```bash
python -m pytest tests/ -W ignore

```

---

## 📡 API Documentation

The API exposes a `/predict` endpoint that accepts POST requests. Data validation is strictly handled by Pydantic.

**Endpoint:** `POST /predict`

**Example Request Payload (JSON):**

```json
{
  "gender": "Female",
  "SeniorCitizen": 0,
  "Partner": "Yes",
  "Dependents": "No",
  "tenure": 1,
  "PhoneService": "No",
  "MultipleLines": "No phone service",
  "InternetService": "DSL",
  "OnlineSecurity": "No",
  "OnlineBackup": "Yes",
  "DeviceProtection": "No",
  "TechSupport": "No",
  "StreamingTV": "No",
  "StreamingMovies": "No",
  "Contract": "Month-to-month",
  "PaperlessBilling": "Yes",
  "PaymentMethod": "Electronic check",
  "MonthlyCharges": 29.85,
  "TotalCharges": "29.85"
}

```

**Example Response:**

```json
{
  "prediction": "Churn",
  "probability": 0.85
}

```

---

## 📊 Model Performance

*Note: The current production model is based on XGBoost. Below are the evaluation metrics on the test set:*

* **Accuracy:** ~80%
* **ROC-AUC:** ~0.84
* **F1-Score:** ~0.62 *(Optimized for recall on churn class)*

---

```