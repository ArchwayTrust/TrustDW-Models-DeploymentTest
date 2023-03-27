let
    Source = Sql.Database("core-sys-dw01","ALT-DW"),
    Data = Source{[Schema="fin",Item="Dim_AgedDocuments"]}[Data]
in
    Data