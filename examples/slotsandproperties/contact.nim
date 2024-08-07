import NimQml

QtObject:
  type Contact* = ref object of QObject
    m_name: string

  proc setup(self: Contact)
  proc newContact*(): Contact =
    new(result)
    result.m_name = "InitialName"
    result.setup

  proc setup(self: Contact) =
    self.QObject.setup

  proc getName*(self: Contact): string {.slot.} =
    result = self.m_name

  proc nameChanged*(self: Contact, name: string) {.signal.}

  proc setName*(self: Contact, name: string) {.slot.} =
    if self.m_name == name:
      return
    self.m_name = name
    self.nameChanged(name)

  QtProperty[string] name:
    read = getName
    write = setName
    notify = nameChanged
