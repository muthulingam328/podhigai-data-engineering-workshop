import streamlit as st 
import pandas as pd
import joblib 

model =joblib.load(r'C:\Users\Muthulingam\OneDrive\Documents\23082025\Salary_Prediction.pkl')


st.title('Salary Prediction')

dept =st.selectbox('Department',['IT', 'Finance', 'Support', 'Marketing', 'Sales', 'HR','Operations'])
Designation= st.selectbox('Designation',['Lead', 'Senior Dev', 'Manager', 'Director', 'Associate','Analyst', 'Intern'])
Experience =st.slider('Experience',0,20,2)
CollegeTier =st.selectbox('CollegeTier',['Tier 1', 'Tier 2', 'Tier 3'])

if st.button('Predit salary'):
        new_employee =pd.DataFrame (

                                [
                                {'Department' : dept ,
                                'Designation': Designation,
                                'Experience' : Experience ,
                                'CollegeTier' : CollegeTier
                                } 

                                ]
                                 )
        prediction = model.predict(new_employee)
        st.success(f'Estimated Salary {prediction.round()[0]}')