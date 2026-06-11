{{/*
Render an ExternalSecret .data list, filling ESO's server-side default fields on
every remoteRef. Without this, a de-hooked (in-tree) ExternalSecret shows a
permanent OutOfSync in ArgoCD because the API server defaults these fields and the
client-side diff sees them as drift. Any value set explicitly in the consumer's
values (e.g. decodingStrategy: Base64) is preserved.
Call with the data list as the context, then nindent to the caller's level.
*/}}
{{- define "external-secrets-store-secret-plus.data" -}}
{{- $defaults := dict "conversionStrategy" "Default" "decodingStrategy" "None" "metadataPolicy" "None" "nullBytePolicy" "Ignore" -}}
{{- $out := list -}}
{{- range $d := . -}}
{{- $entry := deepCopy $d -}}
{{- if $d.remoteRef -}}
{{- $_ := set $entry "remoteRef" (merge (deepCopy $d.remoteRef) $defaults) -}}
{{- end -}}
{{- $out = append $out $entry -}}
{{- end -}}
{{- toYaml $out -}}
{{- end -}}

{{/*
Same as above for a .dataFrom list: fills the default fields on each entry's
extract block. find / rewrite / sourceRef pass through untouched.
*/}}
{{- define "external-secrets-store-secret-plus.dataFrom" -}}
{{- $defaults := dict "conversionStrategy" "Default" "decodingStrategy" "None" "metadataPolicy" "None" "nullBytePolicy" "Ignore" -}}
{{- $out := list -}}
{{- range $f := . -}}
{{- $entry := deepCopy $f -}}
{{- if $f.extract -}}
{{- $_ := set $entry "extract" (merge (deepCopy $f.extract) $defaults) -}}
{{- end -}}
{{- $out = append $out $entry -}}
{{- end -}}
{{- toYaml $out -}}
{{- end -}}
