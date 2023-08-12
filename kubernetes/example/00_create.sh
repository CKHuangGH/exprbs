clusteradm create work namespace-test -f namespace.yaml --clusters cluster1
clusteradm create work storageclass-test -f storageclass.yaml --clusters cluster1
clusteradm create work job-test -f job.yaml --clusters cluster1
clusteradm create work pod-test -f pod.yaml --clusters cluster1

clusteradm create work daemoset-test -f daemoset.yaml --clusters cluster1

clusteradm create work deployment-test -f deployment.yaml --clusters cluster1
clusteradm create work service-nodeport-test -f service-nodeport.yaml --clusters cluster1

clusteradm create work ingress-test -f ingress.yaml --clusters cluster1

clusteradm create work pv-test -f pv.yaml --clusters cluster1

clusteradm create work pv2-test -f pv2.yaml --clusters cluster1
clusteradm create work pvc-test -f pvc.yaml --clusters cluster1

clusteradm create work cfmap-test -f cfmap.yaml --clusters cluster1
clusteradm create work cfmap-run-test -f cfmap-test.yaml --clusters cluster1

clusteradm create work secret-test -f secret.yaml --clusters cluster1

clusteradm create work statefulset-test -f statefulset.yaml --clusters cluster1