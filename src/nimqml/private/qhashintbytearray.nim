proc setup*(self: QHashIntByteArray) =
  ## Setup the QHash
  self.vptr = dos_qhash_int_qbytearray_create()

proc insert*(self: QHashIntByteArray, key: int, value: cstring) =
  ## Insert the value at the given key
  dos_qhash_int_qbytearray_insert(self.vptr, key, value)

proc value*(self: QHashIntByteArray, key: int): string =
  ## Return the value associated at the given key
  let str = dos_qhash_int_qbytearray_value(self.vptr, key)
  result = $str
  dos_chararray_delete(str)
