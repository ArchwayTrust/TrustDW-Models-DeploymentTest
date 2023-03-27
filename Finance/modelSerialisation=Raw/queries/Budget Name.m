let
    Source = Sql.Databases("core-sys-dw01"),
    DB = Source{[Name="ALT-DW"]}[Data],
    SQL = Value.NativeQuery(
            DB,
            "SELECT
	            n.BudgetNameId,
	            n.[Budget Code],
                n.[Budget Title]
            FROM fin.Dim_BudgetNames AS n
            WHERE NOT (n.[Budget Code] LIKE '%FC%'
                OR n.[Budget Code] LIKE '%FOR%')",
            null,
            [EnableFolding = true]
  )
in
    SQL