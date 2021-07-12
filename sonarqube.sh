#dotnet sonarscanner begin /k:Numbers /d:sonar.host.url=http://localhost:9000 /d:sonar.login=admin /d:sonar.password=123456 /d:sonar.cs.opencover.reportsPaths=Numbers.Test/TestResults/*/coverage.opencover.xml /d:sonar.cs.vstest.reportsPaths=Numbers.Test/TestResults/*.trx /d:sonar.coverage.exclusions="**Test*.cs"
#dotnet test --settings coverlet.runsettings --loger trx
#dotnet sonarscanner end /d:sonar.login=admin /d:sonar.password=123456

dotnet build-server shutdown
dotnet-sonarscanner begin -d:sonar.login=admin -d:sonar.password=123456 -d:sonar.host.url="http://localhost:9000" -k:"Numbers" -d:sonar.cs.opencover.reportsPaths="Numbers.Test/TestResults/**/coverage.opencover.xml" -d:sonar.cs.vstest.reportsPaths="Numbers.Tests/TestResults/*.trx"
dotnet build
dotnet test --settings coverlet.runsettings --logger trx
dotnet-sonarscanner end -d:sonar.login=admin -d:sonar.password=123456