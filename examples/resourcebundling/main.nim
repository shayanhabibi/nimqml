import nimqml

proc mainProc() =
  let app = newQApplication()
  let engine = newQQmlApplicationEngine()
  let appDirPath = app.applicationDirPath & "/" & "main.rcc"
  QResource.registerResource(appDirPath)
  engine.load(newQUrl("qrc:///main.qml"))

  app.exec()

when isMainModule:
  mainProc()
  GC_fullcollect()
