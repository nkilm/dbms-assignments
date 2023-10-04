import mysql.connector

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    database='pes1ug20cs667_railway_reservation'
)

c = mydb.cursor()

def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS train(train_no int,train_name varchar(20),train_type varchar(20),source varchar(20),destination varchar(20),availability varchar(10));')
    mydb.commit()


def add_data(train_no, train_name, train_type, source, destination,availability):
    c.execute("INSERT INTO train(train_no,train_name,train_type,source,destination,availability) VALUES(%s,%s,%s,%s,%s,%s);",(train_no, train_name, train_type, source, destination,availability))
    mydb.commit()

def view_all_data():
    c.execute('SELECT *From train; ')
    data = c.fetchall()
    return data
def view_only_train_names():
    c.execute('SELECT train_name FROM train;')
    data = c.fetchall()
    return data 
def get_train(selected_train): 
    c.execute('SELECT * FROM train WHERE train_name="{}";'.format(selected_train)) 
    data = c.fetchall()
    return  data
def edit_train_data(new_train_no, new_train_name, train_type, source, destination, availability):
    c.execute('UPDATE train SET train_name=%s,train_type=%s,source=%s,destination=%s,availability=%s where train_no=%s ;',(new_train_name, train_type, source, destination, availability,new_train_no ))
    mydb.commit()

def delete_data(selected_train):
    c.execute('DELETE FROM train WHERE train_name="{}";'.format(selected_train))
    mydb.commit()
