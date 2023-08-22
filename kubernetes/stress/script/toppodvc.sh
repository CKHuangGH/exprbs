TimerForPodVC=1
NameForPodVC=kubetopPodVC.csv
PodVCTime=0
update_file_podVC() {
  kubectl top pod -A -l app=vcluster | tr -s '[:blank:]' ',' | tee --append $NameForPodVC;
  echo $(date +'%s.%N') | tee --append $NameForPodVC;
}

while ((PodVCTime < 14400))
do
  update_file_podVC
  sleep $TimerForPodVC;
  PodVCTime=$PodVCTime+1
done