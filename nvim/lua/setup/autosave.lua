require('autosave').setup(
  {
    enabled = true,
    execution_message = '',
    events = {'InsertLeave', 'TextChanged'},
    conditions = {
      exists = true,
      modifiable = true,
    },
  }
)

