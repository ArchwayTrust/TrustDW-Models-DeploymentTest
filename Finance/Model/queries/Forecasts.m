let
    Source = Sql.Databases("core-sys-dw01"),
    DB = Source{[Name="ALT-DW"]}[Data],
    SQL = Value.NativeQuery(
            DB,
            "SELECT
                b.NominalLocationId,
                b.AccountLocationId,
                b.NominalId,
                b.AccountId,
                b.BudgetNameId AS [ForcastNameId],
                b.[Period End Date],
                b.SecurityId,
                b.AuditId,
                b.[Value]
            FROM fin.Fact_Budgets AS b
            INNER JOIN fin.Dim_BudgetNames AS n ON b.BudgetNameId = n.BudgetNameId 
            WHERE n.[Budget Code] LIKE '%FC%'
                OR n.[Budget Code] LIKE '%FOR%'",
            null,
            [EnableFolding = true]
  )
in
    SQL