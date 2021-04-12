# This Python file uses the following encoding: utf-8
import sys
import os
import datetime
import db_config
import mysql.connector

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer

currentUser = ""
userPass = ""

# connecting to the database
mydb = mysql.connector.connect(
    host=db_config.DB_Host,
    user=db_config.DB_Username,
    password=db_config.DB_Password,
    database=db_config.DB
)

mycursor = mydb.cursor()


def checkUser(user):  # checks for duplicate usernames
    query = "SELECT EXISTS (SELECT * FROM userlist WHERE username = '{}');".format(user)
    mycursor.execute(query)
    result = mycursor.fetchone()[0]

    if result != 1:
        return True
    else:
        return False


def addAccount(user, password, name, course, year):
    query = "INSERT INTO userlist (username, password, name, course, year) VALUES ('{}', '{}', '{}', '{}', '{}')".format(user, password, name, course, year)
    mycursor.execute(query)

    mydb.commit()

    print(mycursor.lastrowid, "record inserted")


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.setTime())
        self.timer.start(1000)

    # signals
    printTime = Signal(str)
    accountCreated = Signal(bool)

    def setTime(self):  # time function
        now = datetime.datetime.now()
        formatDate = now.strftime("%I:%M:%S %p |  %m/%d/%Y")
        self.printTime.emit(formatDate)

    # starts registration
    @Slot(str, str, str, str, int)
    def registerUser(self, getUser, getPass, getName, getCourse, getYear):
        boolVal = checkUser(getUser)
        if boolVal:
            addAccount(getUser, getPass, getName.title(), getCourse, getYear)
            print("successful")
            self.accountCreated.emit(boolVal)
        else:
            print("username already used!")


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
