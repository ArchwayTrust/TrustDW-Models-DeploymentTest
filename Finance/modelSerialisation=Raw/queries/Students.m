let
  AnalysisQuery = AnalysisServices.Database(
    "powerbi://api.powerbi.com/v1.0/myorg/DW-Models", 
    "Education", 
    [
      Query
        = "EVALUATE
                VAR _InSIMS =
                    TREATAS ( { 1 }, Student[In SIMS] )
                VAR _Enrollment =
                    TREATAS (
                        { ""Single Registration"", ""Main - Dual Registration"" },
                        Student[Enrollment Status]
                    )
                VAR _AM =
                    TREATAS ( { 1 }, Attendance[AM] )

                RETURN
                    SUMMARIZECOLUMNS (
                        Site[SiteId],
                        'Calendar'[End of Month],
                        Student[NC Year],
                        _InSIMS,
                        _Enrollment,
                        ""Students"", [Number Of Students]
                    )", 
      Implementation = "2.0"
    ]
  ), 
  RenameCols = Table.RenameColumns(
    AnalysisQuery, 
    {
      {"Site[SiteId]", "LocationId"}, 
      {"Calendar[End of Month]", "End of Month"}, 
      {"Student[NC Year]", "NCYear"}, 
      {"[Students]", "Students"}
    }
  ), 
  ChangeTypes = Table.TransformColumnTypes(
    RenameCols, 
    {{"LocationId", Int64.Type}, {"End of Month", type date}, {"NCYear", Int64.Type}, {"Students", Int64.Type}}
  )
in
  ChangeTypes