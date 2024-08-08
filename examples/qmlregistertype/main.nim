import NimQml
import contact
import macros

proc mainProc() =
  var app = newQApplication()
  let id = qmlRegisterType("ContactModule", 1, 0, "Contact", proc(): Contact = newContact());
  var engine = newQQmlApplicationEngine()

  engine.load("main.qml")
  app.exec()

when isMainModule:
  mainProc()
  GC_fullcollect()
