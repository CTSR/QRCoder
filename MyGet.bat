@echo Off
set config=%1
if "%config%" == "" (
   set config=Release
)

echo Working dir: %cd%

dotnet clean -c %config%

dotnet build -c %config%

echo Assembly information

powershell -Command "[Reflection.Assembly]::ReflectionOnlyLoadFrom(\"%cd%\QRCoder\bin\%config%\net35\QRCoder.dll\").ImageRuntimeVersion"
certUtil -hashfile "QRCoder\bin\%config%\net35\QRCoder.dll" md5

powershell -Command "[Reflection.Assembly]::ReflectionOnlyLoadFrom(\"%cd%\QRCoder\bin\%config%\net40\QRCoder.dll\").ImageRuntimeVersion"
certUtil -hashfile "QRCoder\bin\%config%\net40\QRCoder.dll" md5

powershell -Command "[Reflection.Assembly]::ReflectionOnlyLoadFrom(\"%cd%\QRCoder\bin\%config%\netstandard1.1\QRCoder.dll\").ImageRuntimeVersion"
certUtil -hashfile "QRCoder\bin\%config%\netstandard1.1\QRCoder.dll" md5

powershell -Command "[Reflection.Assembly]::ReflectionOnlyLoadFrom(\"%cd%\QRCoder\bin\%config%\netstandard2.0\QRCoder.dll\").ImageRuntimeVersion"
certUtil -hashfile "QRCoder\bin\%config%\netstandard2.0\QRCoder.dll" md5

dotnet pack QRCoder\QRCoder.csproj -c %config% --no-build
