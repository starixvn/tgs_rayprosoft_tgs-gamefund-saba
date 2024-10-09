{{/*
Expand the name of the chart.
*/}}
{{- define "game-gamefund-saba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "game-gamefund-saba.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "game-gamefund-saba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "game-gamefund-saba.labels" -}}
helm.sh/chart: {{ include "game-gamefund-saba.chart" . }}
{{ include "game-gamefund-saba.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "game-gamefund-saba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "game-gamefund-saba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app: {{ include "game-gamefund-saba.name" . }}
tgs.kind: game
tgs.game.kind: gamefund
tgs.gameprovider.kind: saba
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "game-gamefund-saba.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "game-gamefund-saba.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
