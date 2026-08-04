from sklearn.linear_model import LinearRegression
import numpy as np

# Input data
X=np.array([1,2,3,4,5]).reshape(-1,1)

# Output data
y=np.array([35,45,55,65,75])

# Create model
model=LinearRegression()

# Train model
model.fit(X,y)

# Prediction
prediction=model.predict([[6]])

print('m ->',model.coef_)
print('c ->',model.intercept_)
print('y ->',prediction)


# Linear Regression is a Machine Learning algorithm used to predict future values based on historical data. 
# In this example, study hours are taken as input data and student marks are taken as output data. 
# The NumPy library is used to store numerical values, while LinearRegression from scikit-learn is used to build the prediction model. 
# he model is trained using historical records through the fit() function, where it learns the relationship between study hours and marks. 
# During training, the model automatically calculates the slope (m) and intercept (c) and forms the equation y = mx + c. 
# After learning the pattern, the predict() function is used to estimate marks for new input values. 
# For example, if a student studies for 6 hours, the model predicts the expected marks using the learned equation. 
# This process demonstrates how Machine Learning learns from past data and makes future predictions.