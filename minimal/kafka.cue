package kafka

import "encoding/yaml"

apiVersion: "kudo.k8s.io/v1alpha1"
kind:       "FrameworkVersion"
metadata: {
	labels "controller-tools.k8s.io": "1.0"
	name:      "kafka-2.11-2.4.0"
	namespace: "default"
}

// TODO: Can we use `cue get go <..>` to import the structs from frameworkversion_types.go ?
spec: {
	framework: {
		name: "kafka"
		kind: "Framework"
	}
	version:          "2.11-2.4.0"
	connectionString: ""
	dependencies: [{
		referenceName: "zookeeper"
		type:          "Framework"
		name:          "zookeeper"
		version:       "^3.1.4"
	}]
	tasks deploy resources: ["service.yaml", "pdb.yaml", "configmap.yaml", "statefulset.yaml"]
	templates: {
		"service.yaml":     yaml.Marshal(_templates.service)
		"pdb.yaml":         yaml.Marshal(_templates.pdb)
		"configmap.yaml":   yaml.Marshal(_templates.configmap)
		"statefulset.yaml": yaml.Marshal(_templates.statefulset)
	}
	plans deploy: {
		strategy: "serial"
		phases: [{
			name:     "deploy-kafka"
			strategy: "serial"
			steps: [{
				name: "deploy"
				tasks: ["deploy"]
			}]
		}]
	}
}
