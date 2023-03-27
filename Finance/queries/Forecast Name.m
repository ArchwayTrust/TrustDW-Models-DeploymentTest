let
    Source = Sql.Databases("core-sys-dw01"),
    DB = Source{[Name="ALT-DW"]}[Data],
    SQL = Value.NativeQuery(
            DB,
            "SELECT
                n.BudgetNameId AS [ForecastNameId],
                n.[Budget Code] AS [Forecast Code],
                n.[Budget Title] AS [Forecast Title]
            FROM fin.Dim_BudgetNames AS n
            WHERE n.[Budget Code] LIKE '%FC%' 
                OR n.[Budget Code] LIKE '%FOR%'",
            null,
            [EnableFolding = true]
  )
in
    SQL