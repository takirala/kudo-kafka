package kafka

spec parameters: [{
		name:        "BROKER_COUNT"
		description: "Number of brokers spun up for Kafka"
		default:     "3"
		displayName: "Broker Count"
	}, {
		name:        "BROKER_CPUS"
		description: "CPUs allocated to the Kafka Broker pods"
		default:     "200m"
	}, {
		name:        "BROKER_MEM"
		description: "Memory (limit) allocated to the Kafka Broker pods"
		default:     "200m"
	}, {
		name:        "BROKER_PORT"
		description: "Port brokers run on"
		default:     "9093"
	}, {
		name:        "KAFKA_NUM_PARTITIONS"
		description: "Number of partitions for Kafka topics"
		default:     "3"
	}, {
		name:        "KAFKA_ZOOKEEPER_URI"
		description: "host and port information for Zookeeper connection. E.g. zk:2181,zk2:2181,zk3:2181"
		required:    true
	}, {
		name:        "KAFKA_ZOOKEEPER_PATH"
		description: "Path inside of KAFKA_ZOOKEEPER_URI to host data"
		default:     "/kafka"
	}, {
		name:    "KAFKA_AUTO_CREATE_TOPICS_ENABLE"
		default: "true"
	}, {
		name:    "KAFKA_AUTO_LEADER_REBALANCE_ENABLE"
		default: "true"
	}, {
		name:    "KAFKA_BACKGROUND_THREADS"
		default: "10"
	}, {
		name:    "KAFKA_COMPRESSION_TYPE"
		default: "producer"
	}, {
		name:    "KAFKA_DELETE_TOPIC_ENABLE"
		default: "true"
	}, {
		name:    "KAFKA_LEADER_IMBALANCE_CHECK_INTERVAL_SECONDS"
		default: "300"
	}, {
		name:    "KAKFA_LEADER_IMBALANCE_PER_BROKER_PERCENTAGE"
		default: "10"
	}, {
		name:    "KAFKA_LOG_FLUSH_INTERVAL_MESSAGES"
		default: "9223372036854775807"
	}, {
		name:    "KAFKA_LOG_FLUSH_INTERVAL_MS"
		default: "60000"
	}]
    

_parameters: {
	BROKER_PORT:     >0
	NAME:            string
	FRAMEWORK_NAME:  string
	NAMESPACE:       string
	BROKER_COUNT:    >0
	KAFKA_HEAP_OPTS: string
	BROKER_CPUS:     >0
	BROKER_MEM:      >0
}

// Ideally, this is created by user (may be in a different file).
_parameters: {
	BROKER_PORT:     1234
	NAME:            "kafkaname"
	FRAMEWORK_NAME:  "somename"
	NAMESPACE:       "default"
	BROKER_COUNT:    3
	BROKER_CPUS:     1
	BROKER_MEM:      1
}
