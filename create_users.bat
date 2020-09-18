for /L %%i in (1,1,#) do (
  net user usuario%%i senha /add
  net localgroup teste usuario%%i /add
)
