let
    Source = Sql.Database("core-sys-dw01", "ALT-DW"),
    Nav = Source{[Schema = "fin", Item = "Fact_Commitments"]}[Data],
    RemoveCol = Table.RemoveColumns(Nav, {"FinancialPeriodId"})
in
  RemoveCol