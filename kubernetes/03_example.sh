clusteradm create work namespace-test -f example/namespace.yaml --clusters cluster1

clusteradm create work job-test -f example/job.yaml --clusters cluster1
clusteradm create work pod-test -f example/pod.yaml --clusters cluster1

clusteradm create work daemoset-test -f example/daemoset.yaml --clusters cluster1


clusteradm create work deployment-test -f example/deployment.yaml --clusters cluster1
clusteradm create work service-nodeport-test -f example/service-nodeport.yaml --clusters cluster1

clusteradm create work endpointslice-test -f example/endpointslice.yaml --clusters cluster1
clusteradm create work ingress-test -f example/ingress.yaml --clusters cluster1

clusteradm create work pv-test -f example/pv.yaml --clusters cluster1
clusteradm create work pvc-test -f example/pvc.yaml --clusters cluster1

clusteradm create work cfmap-test -f example/cfmap.yaml --clusters cluster1
clusteradm create work cfmap-run-test -f example/cfmap-test.yaml --clusters cluster1

clusteradm create work secret-test -f example/secret.yaml --clusters cluster1