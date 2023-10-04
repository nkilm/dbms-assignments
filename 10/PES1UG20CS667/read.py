import streamlit as st 
import pandas as pd
from database import view_all_data

def read():
    data = view_all_data()

    data_df = pd.DataFrame(data,columns=['TrainNumber','TrainName','TrainType','Source','Destination','Availability'])

    with st.expander("View all Trains"):
        st.dataframe(data_df)