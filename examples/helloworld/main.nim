import NimQml

proc mainProc() =
  var app = newQApplication()

  var engine = newQQmlApplicationEngine()

  engine.load("main.qml")
  app.exec()

when isMainModule:
  mainProc()
  GC_fullcollect()
