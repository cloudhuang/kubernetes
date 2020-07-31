Kafka on Kubernetes
================================
Deploy kafka cluster on Kubernetes

kafka-mamanger: http://LOAD_BALANCER_IP:9000

## Deploy
```
kustomize build . | kubectl apply -f -
```

## Undeploy
```
kustomize build . | kubectl delete -f -
```

### Review Topic
```
    kafka-topics.sh --list --zookeeper zoo1-svc:2181
```

### Console Producer
```
kafka-console-producer.sh --broker-list localhost:9092 --topic test
```

### Console Consumer
```
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
```

### Benchmark

#### Producer
```
kafka-producer-perf-test.sh --topic test-topic --num-records 5000000 --throughput -1 --record-size 200 --producer-props bootstrap.servers=kafka1-svc:9092,kafka2-svc:9092,kafka3-svc:9092 acks=1
```

#### Comsumer
```
kafka-consumer-perf-test.sh --topic test-topic --threads 1 --messages 5000000 --broker-list kafka1-svc:9092,kafka2-svc:9092,kafka3-svc:9092
```

---

Problem:

如果用service ip的话，客户端链接会报unknowhost exception
如果用pod ip的话，客户端通过Service IP又无法链接到Pod

使用domain的方式?

> the network architecture of kafka is pretty poor regarding to this topic. The new consumer uses a list of brokers, which return the host of the zookeeper, but unfortunately this is in a different network, so it is not possible to reach it from your local client. The poor part of kafka is, that is not possible to specify the brokers AND the zookeeper servers. This prevents clients accessing the system from outside.

from https://stackoverflow.com/a/41869856/1128953