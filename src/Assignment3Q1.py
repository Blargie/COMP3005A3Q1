import psycopg
import getpass

#Function Definitions
def getAllStudents():
    with conn.cursor() as cursor: #Create a cursor to interact with the database
        cursor.execute("SELECT * FROM students") #Run the SELECT ALL FROM students Query
        students = cursor.fetchall() #Fetch the result of the query and store as a list
        for student in students: #Iterate through the list
            print(student) #Print a row of the list
    cursor.close() #Close the cursor
    conn.commit() #Commit the change made (none) to the database
    return

def addStudent(first_name, last_name, email, enrollment_date):
    with conn.cursor() as cursor: #Create a cursor to interact with the database
        cursor.execute("SELECT 1 FROM students WHERE email = %s", (email,)) #Check for students with email thats being created
        if cursor.fetchone(): #If there is a student with that email
            print(f"Student with email already exists.") #Cannot create a student there since email is unique, return
            return
        else:
            cursor.execute("INSERT INTO students (first_name, last_name, email, enrollment_date) VALUES (%s, %s, %s, %s)", (first_name, last_name, email, enrollment_date)) #Execute the Query to add a given student to the students table
    conn.commit() #Commit the change to the database
    return

def updateStudentEmail(student_id, new_email):
    with conn.cursor() as cursor: #Create a cursor to interact with the database
        cursor.execute("SELECT 1 FROM students WHERE email = %s", (new_email,)) #Check for students with email thats being created
        if cursor.fetchone(): #If there is a student with that email
            print(f"Student with email already exists.") #Cannot create a student there since email is unique, return
            return
        cursor.execute("UPDATE students SET email = %s WHERE student_id = %s", (new_email, student_id)) #Execute the query to update a specific students email
    conn.commit() #Commit the change to the database
    return

def deleteStudent(student_id):
    with conn.cursor() as cursor: #Create a cursor to interact with the database
        cursor.execute("SELECT 1 FROM students WHERE student_id = %s", (student_id,)) #Check for students with email thats attempting to be deleted
        if cursor.fetchone(): #If a student with the matching id is found
            cursor.execute("DELETE FROM students WHERE student_id = %s", (student_id,)) #Delete student
        else: #If student isn't found
            print(f"Student with Student ID does not exist") #Cannot Delete student since student doesn't exist
            return   
    conn.commit() #Commit the change to the database
    return

#Get Database Password
password = getpass.getpass("password: ") #Get password from terminal

#Establish Database Connection
try:
    conn = psycopg.connect(
        "dbname=A3Q1 user=postgres password=" + password + " host=localhost port=5432" #Connect to Database
    )
except psycopg.OperationalError as e: #Exception in case connection fails
    print(f"Error: {e}")
    exit(1)

#Function Calls
print("------Function 1--------")
getAllStudents()
print("------Function 2--------")
addStudent('Bob', 'John', 'bob_john@email.com', '2024-03-18')
getAllStudents()
print("------Function 3--------")
updateStudentEmail(2, 'jsmith12345@schoolmail.com')
getAllStudents()
print("------Function 4--------")
deleteStudent(1)
getAllStudents()

conn.close() #Close Connection