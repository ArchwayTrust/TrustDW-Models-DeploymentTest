let
    Source = Sql.Databases("core-sys-dw01"),
    DB = Source{[Name="ALT-DW"]}[Data],
    SQL = Value.NativeQuery(
            DB,
            "SELECT * FROM fin.vDim_FinancialCalendar",
            null,
            [EnableFolding = true]
  )
in
    SQL