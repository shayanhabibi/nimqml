import NimQml

proc mainProc() =
  var app = newQApplication()
  var engine = newQQmlApplicationEngine()
  var qVar1 = newQVariant(10)
  var qVar2 = newQVariant("Hello World")
  var qVar3 = newQVariant(false)
  var qVar4 = newQVariant(3.5.float)

  engine.setRootContextProperty("qVar1", qVar1)
  engine.setRootContextProperty("qVar2", qVar2)
  engine.setRootContextProperty("qVar3", qVar3)
  engine.setRootContextProperty("qVar4", qVar4)
  engine.load("main.qml")
  app.exec()

when isMainModule:
  mainProc()
  GC_fullcollect()
