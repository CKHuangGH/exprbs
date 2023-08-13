TimerForPodwa=1
NameForPodwa=kubetopPodWA.csv
PodwaTime=0
update_file_podwa() {
  kubectl top pod -A -l app=klusterlet-manifestwork-agent | tr -s '[:blank:]' ',' | tee --append $NameForPodwa;
  echo $(date +'%s.%N') | tee --append $NameForPodwa;
}

while ((PodwaTime < 2400))
do
  update_file_podD
  sleep $TimerForPodwa;
  PodwaTime=$PodwaTime+1
done