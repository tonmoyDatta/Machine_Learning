# Fraud Transaction Detection using Machine Learning

## Overview
This project is a Machine Learning-based Fraud Detection System designed to identify fraudulent financial transactions. It analyzes transaction patterns and predicts whether a transaction is fraudulent or legitimate.

This project was developed as a beginner-level exploration into Machine Learning applied to cybersecurity, focusing on real-world financial fraud detection.

---

## Motivation
Financial fraud is a major challenge in cybersecurity. Detecting fraudulent transactions early can help prevent significant financial losses.

The objectives of this project are:
- To understand transaction behavior
- To identify suspicious patterns
- To apply Machine Learning techniques for fraud detection

---

## Dataset
- Source: Kaggle Fraud Detection Dataset  
- Total Records: 6.3+ million transactions  

### Features:
- Transaction type (PAYMENT, TRANSFER, CASH_OUT, etc.)
- Transaction amount
- Sender and receiver account balances
- Fraud label (`isFraud`)
- Flagged fraud indicator (`isFlaggedFraud`)

---

## Technologies and Tools
- Python  
- Pandas (data manipulation)  
- NumPy (numerical operations)  
- Matplotlib and Seaborn (data visualization)  
- Scikit-learn (machine learning)

---

## Exploratory Data Analysis (EDA)

Key findings:
- Fraud transactions are extremely rare (~0.13%)
- Most fraud occurs in TRANSFER and CASH_OUT transaction types
- Transaction amounts are highly skewed
- Certain balance patterns indicate suspicious behavior

Visualizations include:
- Transaction type distribution
- Fraud rate by transaction type
- Log-transformed amount distribution
- Correlation heatmap

---

## Feature Engineering

The following features were created to improve model performance:
- `balanceDiffOrig = oldbalanceOrg - newbalanceOrig`
- `balanceDiffDest = oldbalanceDest - newbalanceDest`

These features help capture abnormal balance changes, which are useful indicators of fraud.

---

## Machine Learning Model

### Model Used:
- Logistic Regression

### Preprocessing Steps:
- Removed irrelevant columns (nameOrig, nameDest, isFlaggedFraud)
- Applied One-Hot Encoding to categorical variables
- Standardized numerical features using StandardScaler
- Split data into training and testing sets

---

## Model Evaluation

Evaluation metrics used:
- Confusion Matrix
- Precision
- Recall
- F1-score

Special emphasis was placed on Recall, as detecting fraudulent transactions is more critical than overall accuracy.

---

## Results

- The model successfully identified fraud patterns in the dataset
- Feature engineering improved detection capability
- The project highlighted the impact of class imbalance on model performance

---

## Challenges

- Highly imbalanced dataset (fraud cases are approximately 0.13%)
- Large dataset size leading to high memory usage
- Difficulty in selecting the most relevant features

---

## Future Improvements

- Implement advanced models such as Random Forest and XGBoost
- Address class imbalance using SMOTE or undersampling techniques
- Explore anomaly detection methods
- Build a real-time fraud detection system
- Apply deep learning approaches

---

## Cybersecurity Relevance

This project is relevant to:
- Financial fraud detection systems
- Intrusion detection in banking environments
- Behavioral anomaly detection

---


---

## Learning Outcomes

- Understanding of data preprocessing and exploratory data analysis
- Knowledge of feature engineering techniques
- Experience with handling imbalanced datasets
- Ability to build and evaluate machine learning models
- Insight into applying machine learning in cybersecurity

---


## Acknowledgment

Dataset provided by Kaggle.
