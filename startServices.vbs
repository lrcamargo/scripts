Set wmi = GetObject("winmgmts://./root/cimv2")

qry = "SELECT * FROM Win32_Service WHERE Name = 'NomeServico01'"
For Each svc In wmi.ExecQuery(qry)
  If svc.State <> "Running" Then svc.StartService
Next

  query = "SELECT * FROM Win32_Service WHERE Name = 'NomeServico02'"
For Each svc In wmi.ExecQuery(query)
  If svc.State <> "Running" Then svc.StartService
Next
