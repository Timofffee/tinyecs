type
  Component* = ref object of RootObj
    entity*: Entity
    typename*: string

  Entity* = ref object of RootObj
    id*: int
    components*: seq[Component]