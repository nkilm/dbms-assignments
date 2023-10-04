import streamlit as st
from database import add_data

def create():
    col1, col2 = st.columns(2)
    with col1:
        train_no = st.text_input("Train_No:")
        train_name = st.text_input("Name:")
        train_type = st.selectbox("Train_type", ["Superfast", "Fast", "Mail"])
    with col2:
        source = st.text_input("Source")
        destination = st.text_input("Destination")
        availability = st.text_input("Availability:")

    if st.button("Add Train"):
        add_data(train_no, train_name, train_type, source, destination,availability)
        st.success("Successfully added train: {}".format(train_name))
