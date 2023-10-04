import streamlit as st 
from create import create
from read import read
from update import update
from  delete import  delete
from database import create_table

def main():
    st.title("RAILWAY RESERVATION SYSTEM")
    menu = ["Add", "View", "Edit", "Remove"]
    choice = st.sidebar.selectbox("Menu", menu)
    create_table()
    if choice == "Add":
        st.subheader("Enter Train Details:")
        create()
    elif choice == "View":
        st.subheader("View Train Details:")
        read()
    elif choice == "Edit":
        st.subheader("Update created Task:")
        update()
    elif choice == "Remove":
        st.subheader("Delete created tasks")
        delete()
    # else:
    #     st.subheader("About tasks")
if __name__ == '__main__':
    main()
