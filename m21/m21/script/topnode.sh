TimerForPodnode=1
NameForPodnode=kubetopPodnode.csv
PodnodeTime=0
update_file_podnode() {
  kubectl top node -A | tr -s '[:blank:]' ',' | tee --append $NameForPodnode;
  echo $(date +'%s.%N') | tee --append $NameForPodnode;
}

while ((PodnodeTime < 54000))
do
  update_file_podnode
  sleep $TimerForPodnode;
  PodnodeTime=$PodnodeTime+1
done