import NimQml
import applicationlogic

proc mainProc() =
  let app = newQApplication()
  let logic = newApplicationLogic(app)
  let engine = newQQmlApplicationEngine()
  let logicVariant = newQVariant(logic)

  engine.setRootContextProperty("logic", logicVariant)
  engine.load("main.qml")
  app.exec()

when isMainModule:
  mainProc()
  GC_fullcollect()
