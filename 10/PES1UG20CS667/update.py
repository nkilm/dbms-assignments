import streamlit as st 
import pandas as pd
# from database import view_all_data
from database import  view_only_train_names
from database import get_train
from database import edit_train_data

def update():
    # result = view_all_data()
    # data_df = pd.DataFrame(result,columns=['TrainNumber','TrainName','TrainType','Source','Destination','Availability'])
    # with st.expander("Before update"):
    #     st.dataframe(data_df)
    list_of_train = [i[0] for i in view_only_train_names()]
    print(list_of_train)
    selected_train = st.selectbox("Dealer to Edit", list_of_train)
    selected_train = get_train(selected_train)
    if selected_train:
        train_no = selected_train[0][0]
        train_name = selected_train[0][1]
        train_type = selected_train[0][2]
        source = selected_train[0][3]
        destination = selected_train[0][4]
        availability = selected_train[0][5]

        col1, col2 = st.columns(2)
        with col1:
            new_train_no = st.text_input("trainNumber:", train_no)
            new_train_name = st.text_input("trainName:", train_name)
            train_type = st.selectbox(train_type, ["Suferfast", "Fast", "Mail"])
        with col2:
            source = st.text_input("Source:", source)
            destination = st.text_input("Destination:", destination)
            availability = st.text_input("Availability:", availability)
        if st.button("Update Train"):
            edit_train_data(new_train_no, new_train_name, train_type, source, destination, availability)
            st.success("Successfully updated:: {} to ::{}".format(train_name, new_train_name))
    # result2 = view_all_data()
    # df2 = pd.DataFrame(result2, columns=['TrainNumber','TrainName','TrainType','Source','Destination','Availability'])
    # with st.expander("Updated data"):
    #     st.dataframe(df2)
