import NimQml
import contact

proc mainProc() =
  var app = newQApplication()
  var contact = newContact()
  var engine = newQQmlApplicationEngine()
  var variant = newQVariant(contact)

  engine.setRootContextProperty("contact", variant)
  engine.load("main.qml")
  app.exec()

when isMainModule:
  mainProc()
  GC_fullcollect()
