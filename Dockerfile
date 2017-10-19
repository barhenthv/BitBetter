FROM bitwarden/api

COPY bin/Debug/netcoreapp2.0/publish/* /bitBetter/
COPY cert.cert /newLicensing.cer

RUN dotnet /bitBetter/bitBetter.dll && \
    mv /app/Core.dll /app.Core.orig.dll && \
    mv /app/modified.dll /app/Core.dll && \
    rm -rf /bitBetter && rm -rf /newLicensing.cer