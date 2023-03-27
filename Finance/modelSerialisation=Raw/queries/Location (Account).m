let
  Source             = PowerPlatform.Dataflows ( null ), 
  Workspaces         = Source{[ Id = "Workspaces" ]}[Data], 
  Workspace          = Workspaces{[ workspaceName = "DW-Dataflows-Conformed" ]}[Data], 
  Dataflow           = Workspace{[ dataflowName = "Con-General" ]}[Data], 
  Entity             = Dataflow{[ entity = "dimSites", version = "" ]}[Data], 
  FilteredRows       = Table.SelectRows (
    Entity, 
    each (
      [Finance Location Code] <> "Global" 
    )
  ), 
  RemoveOtherColumns = Table.SelectColumns (
    FilteredRows, 
    { "SiteId", "Finance Location Code", "Education Location Code", "Academy Code", "Site Name" }
  )
in
  RemoveOtherColumns