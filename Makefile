
all: lint kubeval test package

lint:
	helm lint charts/onechart/
	helm lint charts/cron-job/

kubeval:
	rm -rf manifests && true
	mkdir manifests
	helm template charts/onechart --output-dir manifests
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.13.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.18.0

	rm -rf manifests && true
	mkdir manifests
	helm template charts/cron-job --output-dir manifests
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.13.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.18.0

test:
	helm unittest charts/onechart
	helm unittest charts/cron-job

package:
	helm package charts/onechart
	mv onechart*.tgz docs

	helm package charts/cron-job
	mv cron-job*.tgz docs

	helm repo index docs --url https://chart.onechart.dev
