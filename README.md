

# external-secrets-store-secret-plus

![Version: 0.7.0](https://img.shields.io/badge/Version-0.7.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.16.2](https://img.shields.io/badge/AppVersion-v0.16.2-informational?style=flat-square)

A chart to deploy one or more externalsecret CRD manifests

## Notes
* This chart can generate multiple ExternalSecret CRD manifests from https://github.com/external-secrets/external-secrets

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterExternalSecret.enabled | bool | `false` |  |
| clusterSecretStore.enabled | bool | `false` |  |
| externalSecret.enabled | bool | `false` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlbertasG | <grinkevicius.albertas@gmail.com> |  |