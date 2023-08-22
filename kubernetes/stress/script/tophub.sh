TimerForPodHUB=1
NameForPodHUB=kubetopPodHUB.csv
PodHUBTime=0
update_file_podHUB() {
  kubectl top pod -n open-cluster-management-hub | tr -s '[:blank:]' ',' | tee --append $NameForPodHUB;
  echo $(date +'%s.%N') | tee --append $NameForPodHUB;
}

while ((PodHUBTime < 14400))
do
  update_file_podHUB
  sleep $TimerForPodHUB;
  PodHUBTime=$PodHUBTime+1
done