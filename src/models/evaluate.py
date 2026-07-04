from sklearn.metrics import classification_report, confusion_matrix

def evaluate(model, X_test, y_test):
    preds = model.predict(X_test)
    print("Classification Report:\n", classification_report(y_test, preds))
    print("Confusion Matrix:\n", confusion_matrix(y_test, preds))
