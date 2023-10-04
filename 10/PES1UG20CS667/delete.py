import streamlit as st
import pandas as pd
from database import view_all_data  
from database import view_only_train_names
from database import delete_data

def delete():
    result = view_all_data()
    df = pd.DataFrame(result,columns=['TrainNumber','TrainName','TrainType','Source','Destination','Availability'])
    with st.expander('Current Data'):
        st.dataframe(df)
    list_of_train_names = [i[0] for i in view_only_train_names()]
    selected_train = st.selectbox("Task to Delete", list_of_train_names)
    st.warning("Do you want to delete ::{}".format(selected_train))
    if st.button("Delete Train"):
        print("This train name",selected_train)
        delete_data(selected_train)
        st.success("Train has been deleted successfully")
    new_result = view_all_data()
    df2 = pd.DataFrame(new_result, columns=['TrainNumber','TrainName','TrainType','Source','Destination','Availability'])
    with st.expander("Updated data"):
        st.dataframe(df2)
