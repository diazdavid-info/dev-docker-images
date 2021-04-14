#!/bin/sh

DOMAIN=https://back.sesametime.com
#DOMAIN=https://enui21fykvhulxu.m.pipedream.net

log_in() {
  curl -s -o /dev/null $DOMAIN'/api/v3/security/login' \
    -H 'content-type: application/' \
    -d '{"platformData":{"platformName":"Chrome","platformSystem":"Mac/iOS","platformVersion":"89"},"email":"'"$USER_NAME"'","password":"'"$USER_PASS"'"}' \
    -c cookies.txt
}

work_status() {
  STATUS=$(curl -s $DOMAIN'/api/v3/security/me' \
    -b cookies.txt |
    jq '.data[0].workStatus' | sed "s/\"//g")

  echo "$STATUS"
}

user_id() {
  USER_ID=$(curl -s $DOMAIN'/api/v3/security/me' \
    -b cookies.txt |
    jq .'data[0].id' | sed "s/\"//g")

  echo "$USER_ID"
}

pause() {
  id=$(user_id)
  curl -s -o /dev/null $DOMAIN'/api/v3/employees/'"$id"'/pause' \
    -H 'content-type: application/json;charset=UTF-8' \
    -d '{"origin":"web","coordinates":{"latitude":null,"longitude":null},"workBreakId":"5fd6f242-85cb-46cf-9ffc-5e89f590aefa"}' \
    -b cookies.txt
}

check_in() {
  status=$(work_status)
  if [ "$status" = "remote" ]; then
    printf "Estado trabajando....\n"
    return
  fi

  id=$(user_id)
  curl -s -o /dev/null $DOMAIN'/api/v3/employees/'"$id"'/check-in' \
    -H 'content-type: application/json;charset=UTF-8' \
    -d '{"origin":"web","coordinates":{"latitude":null,"longitude":null}}' \
    -b cookies.txt
}

normal_flow() {
  printf "Es día laboral de lunes a jueves\n"
  current_hour=$(date +"%H")
  while [ "$current_hour" -ne "09" ]; do
    printf "Aun no son las 09:00... me duermo\n"
    current_hour=$(date +"%H")
    sleep 1m
  done

  check_in

  current_hour=$(date +"%H")
  while [ "$current_hour" -ne "14" ]; do
    printf "Aun no son las 14:00... me duermo\n"
    current_hour=$(date +"%H")
    sleep 1m
  done

  pause

  current_hour=$(date +"%H")
  while [ "$current_hour" -ne "15" ]; do
    printf "Aun no son las 15:00... me duermo\n"
    current_hour=$(date +"%H")
    sleep 1m
  done

  check_in

  current_day=$(date +"%d")
  while [ "$DAY" = "$current_day" ]; do
    printf "Mismo día... me duermo\n"
    current_day=$(date +"%d")
    sleep 1m
  done
}

special_flow() {
  check_in
}

not_work_flow() {
  printf "Es fin de semana\n"
  current_day=$(date +"%d")
  while [ "$DAY" = "$current_day" ]; do
    printf "Mismo día... me duermo\n"
    current_day=$(date +"%d")
    sleep 1m
  done
}

while true; do
  DAY=$(date +"%d")
  DAY_OF_WEEK=$(date +"%u")

  log_in

  case $DAY_OF_WEEK in
  1) normal_flow ;;
  2) normal_flow ;;
  3) normal_flow ;;
  4) normal_flow ;;
  5) special_flow ;;
  6) not_work_flow ;;
  7) not_work_flow ;;
  esac
done
