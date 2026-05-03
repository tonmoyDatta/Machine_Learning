# XSS Detection Using Machine Learning

A Machine Learning-based Cross-Site Scripting (XSS) detection system built using Python and Scikit-learn.  
This project extracts security-related features from web payloads and classifies them as **Benign** or **Malicious (XSS)** using supervised learning algorithms.

---

# Features

- Custom feature extraction for XSS payload analysis
- Detection of:
  - `<script>` tags
  - JavaScript functions
  - Event handlers
  - Dangerous HTML tags
  - Encoded payload indicators
- Machine Learning classification using:
  - Decision Tree
  - Support Vector Machine (SVM)
- Confusion Matrix visualization
- Accuracy and classification report generation
- Custom payload testing support
- Model saving/loading using Joblib

---

# Dataset

Dataset used from Kaggle:

**Cross Site Scripting (XSS) Dataset for Deep Learning**

Dataset Author: `syedsaqlainhussain`

---

# Technologies Used

- Python
- Pandas
- NumPy
- Scikit-learn
- Matplotlib
- Seaborn
- Regex (re)
- Joblib

---

# Project Workflow

```text
Dataset Loading
       ↓
Feature Extraction
       ↓
Train/Test Split
       ↓
Model Training
       ↓
Prediction
       ↓
Evaluation
```

---

# Feature Extraction

The project extracts several important security-related features such as:

- Payload length
- Script tags
- iframe/object/svg tags
- JavaScript functions (`alert`, `eval`, `confirm`)
- Event handlers (`onerror`, `onload`, `onclick`)
- Dangerous protocols (`javascript:`)
- Encoded payload indicators
- Special character frequency

---

# Model Performance

## Decision Tree

- Accuracy: **99.19%**

Classification Report:

              precision    recall  f1-score   support

           0       0.99      1.00      0.99      1263
           1       1.00      0.99      0.99      1475

    accuracy                           0.99      2738
   macro avg       0.99      0.99      0.99      2738
weighted avg       0.99      0.99      0.99      2738

<img width="452" height="393" alt="image" src="https://github.com/user-attachments/assets/6ce99e1a-e900-445c-995c-3e83c690e87c" />

## SVM

- Accuracy: **99.01%**

Classification Report:

              precision    recall  f1-score   support

           0       0.98      1.00      0.99      1263
           1       1.00      0.98      0.99      1475

    accuracy                           0.99      2738
   macro avg       0.99      0.99      0.99      2738
weighted avg       0.99      0.99      0.99      2738

Both models achieved excellent precision, recall, and F1-score on the testing dataset.

---





# Example Prediction

```python
payload = '<script>alert("XSS")</script>'

features = pd.DataFrame([extract_features(payload)])

prediction = model.predict(features)

print("XSS" if prediction[0] == 1 else "Benign")
```

Output:

```text
XSS
```

---

# Saving the Model

```python
import joblib

joblib.dump(model, "xss_detector_model.pkl")
```

Load later:

```python
model = joblib.load("xss_detector_model.pkl")
```

---

# Visualization

The project includes:

- Confusion Matrix
- Accuracy metrics
- Classification Report
- ROC Curve visualization

---



# Future Scope

Possible future enhancements:

- Real-time web request inspection
- Flask API integration
- Browser extension support
- Burp Suite extension
- Larger real-world payload datasets

---

# Author

Tonmoy Datta

---
