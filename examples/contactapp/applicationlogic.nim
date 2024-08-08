import NimQml, contactlist

QtObject:
  type ApplicationLogic* = ref object of QObject
    contactList: ContactList
    app: QApplication

  proc setup(self: ApplicationLogic)

  proc newApplicationLogic*(app: QApplication): ApplicationLogic =
    new(result)
    result.contactList = newContactList()
    result.app = app
    result.setup()

  proc setup(self: ApplicationLogic) =
    self.QObject.setup

  proc getContactList(self: ApplicationLogic): QVariant {.slot.} =
    return newQVariant(self.contactList)

  proc onLoadTriggered(self: ApplicationLogic) {.slot.} =
    echo "Load Triggered"
    self.contactList.add("John", "Doo")

  proc onSaveTriggered(self: ApplicationLogic) {.slot.} =
    echo "Save Triggered"

  proc onExitTriggered(self: ApplicationLogic) {.slot.} =
    self.app.quit

  QtProperty[QVariant] contactList:
    read = getContactList
