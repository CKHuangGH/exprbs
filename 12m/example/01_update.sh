clusteradm create work job-test -f update/job.yaml --clusters cluster1
clusteradm create work pod-test -f update/pod.yaml --clusters cluster1

clusteradm create work daemoset-test -f update/daemoset.yaml --clusters cluster1


clusteradm create work deployment-test -f update/deployment.yaml --clusters cluster1
clusteradm create work service-nodeport-test -f update/service-nodeport.yaml --clusters cluster1

clusteradm create work endpointslice-test -f update/endpointslice.yaml --clusters cluster1
clusteradm create work ingress-test -f update/ingress.yaml --clusters cluster1

clusteradm create work pv-test -f update/pv.yaml --clusters cluster1
clusteradm create work pvc-test -f update/pvc.yaml --clusters cluster1

clusteradm create work cfmap-test -f update/cfmap.yaml --clusters cluster1
clusteradm create work cfmap-run-test -f update/cfmap-test.yaml --clusters cluster1

clusteradm create work secret-test -f update/secret.yaml --clusters cluster1

clusteradm create work storageclass-test -f update/storageclass.yaml --clusters cluster1