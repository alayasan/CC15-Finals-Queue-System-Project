# This Python file uses the following encoding: utf-8
import sys
import os
import datetime
import db_config
import mysql.connector

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer

currentUser = "admin"

# connecting to the database
mydb = mysql.connector.connect(
    host = db_config.DB_Host,
    user = db_config.DB_Username,
    password = db_config.DB_Password,
    database = db_config.DB
)

mycursor = mydb.cursor()

def checkUser(user):  # checks for duplicate usernames
    query = "SELECT EXISTS (SELECT * FROM userlist WHERE username = '{}');".format(user)
    mycursor.execute(query)
    result = mycursor.fetchone()[0]

    if result != 1:
        return True  # if user does not exist, register
    else:
        return False


def addUser(user, password):
    query = "INSERT INTO userlist (username, password) VALUES ('{}', '{}')".format(user, password)
    mycursor.execute(query)

    mydb.commit()

    print(mycursor.lastrowid, "record inserted")


def addUserDetails(user, firstName, lastName, course, year):
    query = "INSERT INTO userdetails (username, firstname, lastname, course, year) VALUES ('{}', '{}', '{}', '{}', '{}')".format(user, firstName, lastName, course, year)
    mycursor.execute(query)

    mydb.commit()

    print(mycursor.lastrowid, "record inserted")


def checkLogin(user, password):
    query = "SELECT EXISTS (SELECT * FROM userlist WHERE username = '{}' AND password = '{}');".format(user, password)
    mycursor.execute(query)
    result = mycursor.fetchone()[0]

    print(user, password, result)

    if result == 1:
        return True  # if user exist, and password match, login
    else:
        return False


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.setTime())
        self.timer.start(1000)

    # signals
    printTime = Signal(str)
    accountCreated = Signal(bool)
    loggedIn = Signal(bool)
    facultyRowCount = Signal(int)
    facultyNameList = Signal(str)
    pullAppointmentDetails = Signal(str, str, str, str, str)
    rowAppointmentDetails = Signal(int)
    profileButtonSize = Signal(int)

    def setTime(self):  # time function
        now = datetime.datetime.now()
        formatDate = now.strftime("%I:%M:%S %p |  %m/%d/%Y")
        self.printTime.emit(formatDate)

    # starts registration
    @Slot(str, str, str, str, str, int)
    def registerUser(self, getUser, getPass, getFirstName, getLastName, getCourse, getYear):
        boolVal = checkUser(getUser)
        if boolVal:
            addUser(getUser, getPass)
            addUserDetails(getUser, getFirstName.title(), getLastName.title(), getCourse, getYear)
            print("successful")
            self.accountCreated.emit(boolVal)
        else:
            print("username already used!")

    # login
    @Slot(str, str)
    def userLogin(self, getUser, getPass):
        global currentUser
        boolVal = checkLogin(getUser, getPass)
        if boolVal:
            currentUser = getUser
            self.loggedIn.emit(boolVal)
        else:
            self.loggedIn.emit(boolVal)
            print("unsuccessful login")

    # get faculty details (for the dropdown)
    @Slot(int)
    def fetchFacultyDetails(self, index):
        query = "SELECT CONCAT(lastname, ', ', firstname) AS facultyname FROM facultydetails ORDER BY facultyname"
        mycursor.execute(query)

        result = mycursor.fetchall()
        row = mycursor.rowcount

        if row < 1:
            self.facultyNameList.emit("EMPTY!")

        if index < row:
            facname = result[index]
            self.facultyNameList.emit(facname[0])
        
        self.facultyRowCount.emit(row)

    # push appointment details to db
    @Slot(str, str, str, str)
    def pushAppointmentDetails(self, getFacultyName, getTime, getDate, getReason):
        global currentUser
        print(getTime)
        query = " ".join(("INSERT INTO appointmentHistory",
                        "(appointmentFrom, appointmentWith, time, date, reason)",
                        "VALUES ('{}', '{}', '{}', '{}', '{}');".format(currentUser, getFacultyName, getTime, getDate, getReason)
                    ))
        mycursor.execute(query)

        mydb.commit()
        print("Insert Successful!")

    # populating the appointment history
    @Slot(int)
    def fetchAppointmentDetails(self, index):
        query = " ".join(("SELECT * FROM appointmenthistory",
                        "WHERE appointmentFrom = '{}'".format(currentUser),
                        "ORDER BY referenceID;"
                    ))
        mycursor.execute(query)

        result = mycursor.fetchall()
        rowcount = mycursor.rowcount
        self.rowAppointmentDetails.emit(rowcount)

        if index < rowcount:
            datetimestr = str(result[index][3]) + '\n' + result[index][4]
            self.pullAppointmentDetails.emit(str(result[index][0]), result[index][2], datetimestr, result[index][5], result[index][6])

    # bad structure but still wanna do it
    @Slot(int)
    def profileButtonResizer(self, size):
        self.profileButtonSize.emit(size)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # get context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
