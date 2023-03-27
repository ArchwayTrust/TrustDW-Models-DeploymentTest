let
  Source = Sql.Database("core-sys-dw01", "ALT-DW"),
  Nav = Source{[Schema = "fin", Item = "Dim_Accounts"]}[Data]
in
  Nav