
.PHONY: all lint kubeval test package debug debug-ui

all: lint kubeval test package

lint:
	helm lint charts/onechart/
	helm lint charts/cron-job/
	helm lint charts/namespaces/
	helm lint charts/static-site

kubeval:
	rm -rf manifests && true
	mkdir manifests
	helm template charts/onechart --output-dir manifests
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.20.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.24.0

	rm -rf manifests && true
	mkdir manifests
	helm template charts/cron-job --output-dir manifests
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.20.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.24.0

	rm -rf manifests && true
	mkdir manifests
	helm template charts/namespaces --output-dir manifests -f charts/namespaces/fixture.yaml
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.20.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.24.0

	rm -rf manifests && true
	mkdir manifests
	helm template charts/static-site --output-dir manifests
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.20.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.24.0

test:
	helm dependency update charts/onechart
	helm unittest charts/onechart

	helm dependency update charts/cron-job
	helm unittest charts/cron-job

	helm unittest charts/namespaces

	helm unittest charts/static-site

package:
	helm dependency update charts/onechart
	helm package charts/onechart
	mv onechart*.tgz docs

	helm dependency update charts/cron-job
	helm package charts/cron-job
	mv cron-job*.tgz docs

	helm package charts/namespaces
	mv namespaces*.tgz docs

	helm package charts/static-site
	mv static-site*.tgz docs

	helm repo index docs --url https://chart.onechart.dev

debug:
	helm dependency update charts/onechart
	helm template charts/onechart/ -f values.yaml --debug

debug-cron-job:
	helm dependency update charts/cron-job
	helm template charts/cron-job/ -f values-cron-job.yaml --debug

debug-ui:
	#gimlet chart configure -s charts/onechart/values.schema.json -u charts/onechart/helm-ui.json onechart/onechart
	/home/laszlo/projects/gimlet-cli/build/gimlet chart configure -s charts/onechart/values.schema.json -u charts/onechart/helm-ui.json onechart/onechart
