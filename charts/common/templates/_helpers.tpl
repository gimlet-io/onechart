{{/* vim: set filetype=mustache: */}}

{{/*
Create robustName that can be used as Kubernetes resource name, and as subdomain as well
\w – Latin letters, digits, underscore '_' .
\W – all but \w .
*/}}
{{- define "common.robustName" -}}
{{ regexReplaceAll "\\W+" . "-" | replace "_" "-" | lower | trunc 63 | trimSuffix "-" }}
{{- end }}
