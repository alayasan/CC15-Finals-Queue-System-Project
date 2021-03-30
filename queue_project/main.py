# This Python file uses the following encoding: utf-8
import sys
import os
import datetime

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.setTime())
        self.timer.start(1000)

    # signals
    printTime = Signal(str)

    def setTime(self):  # time function
        now = datetime.datetime.now()
        formatDate = now.strftime("%H:%M:%S  |  %m/%d/%Y")
        self.printTime.emit(formatDate)


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
