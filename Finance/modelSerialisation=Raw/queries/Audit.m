let
  Source = Sql.Database("core-sys-dw01", "ALT-DW"),
  Nav = Source{[Schema = "com", Item = "Dim_Audit"]}[Data]
in
  Nav