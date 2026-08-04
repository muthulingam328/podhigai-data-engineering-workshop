import warnings
warnings.filterwarnings("ignore", category=FutureWarning)

import os
os.environ["TF_CPP_MIN_LOG_LEVEL"] = "3"

import numpy as np

# Temporary fix for Python 3.13 / NumPy
if not hasattr(np, "object"):
    np.object = object

import tensorflow as tf

import os

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'
os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'

import tensorflow as tf
import numpy as np

# Historical data
x=np.array([1,2,3,4,5],dtype=float)

y=np.array([35,45,55,65,75],dtype=float)

# Model
model=tf.keras.Sequential([
    tf.keras.Input(shape=(1,)),
    tf.keras.layers.Dense(1)
])

# Compile
model.compile(
optimizer='sgd',
loss='mean_squared_error'
)

# Train
model.fit(
x,
y,
epochs=500,
verbose=0
)

# Prediction
prediction=model.predict(
np.array([[6]]),
verbose=0
)

print(
"Predicted Marks:",
prediction[0][0]
)