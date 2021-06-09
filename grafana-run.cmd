@echo off
set BUNDLE_DIR=%~dp0
set DASHBOARD_HOME=%BUNDLE_DIR%
set CONF_DIR=%DASHBOARD_HOME%\conf
set APPS_DIR=%DASHBOARD_HOME%\apps

set GRAF_DIR=%APPS_DIR%\grafana-7.5.7
set PROM_DIR=%APPS_DIR%\prometheus-2.27.1.windows-amd64

set PATH=%GRAF_DIR%\bin;%PROM_DIR%;%APPS_DIR%;%PATH%

set EXPO_WIN=%APPS_DIR%\windows_exporter-0.14.0-amd64.exe
set EXPO_GRA=%APPS_DIR%\graphite_exporter.exe

start "grafana"    /D %GRAF_DIR% %GRAF_DIR%\bin\grafana-server.exe -config %CONF_DIR%\defaults.ini & timeout /T 3 /NOBREAK
start "prometheus" /D %PROM_DIR% %PROM_DIR%\prometheus.exe --config.file %CONF_DIR%\prometheus.yml & timeout /T 3 /NOBREAK
start "exporter_win"   /D %APPS_DIR% %EXPO_WIN% --log.level="fatal" & timeout /T 3 /NOBREAK
start "exporter_gra"   /D %APPS_DIR% %EXPO_GRA% --log.level="warn"  & timeout /T 3 /NOBREAK
