
all: package

package:
	helm package onechart
	mv onechart*.tgz docs
	helm repo index docs --url https://onechart.github.io/onechart
