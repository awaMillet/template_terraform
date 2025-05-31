#!/bin/sh
# template.iniファイルの変数を元にsrc配下ファイルの変数を一括変更
set -eu
script_dir=$(cd $(dirname $0);pwd)
root_dir="${script_dir}/.."
ini_file="${script_dir}/template.ini"

export LC_ALL=C

ini_keys=`cat $ini_file | grep "=" | sed -e "s/=.*//g"`
cd ${root_dir}/
for ini_key in ${ini_keys} ; do
  ini_value=`cat $ini_file | grep $ini_key | sed -e "s/.*=\(.*\)/\1/g"`

  echo;
  echo "Replace <${ini_key}> with ${ini_value}: start."
  echo "Check if <${ini_key}> exists in the repository."

  grep_result=`find . -type f | grep -v ".git/" | xargs grep "<${ini_key}>" | wc -l | sed -e "s/ //g"`

  if [ $grep_result -eq 0 ]; then
    echo "<${ini_key}> not found in the repository. Skip replacing."

  echo "Replace <${ini_key}> with ${ini_value}."
  else
    find . -type f | grep -v ".git/" | xargs sed -i "" "s/<${ini_key}>/${ini_value}/g"
    echo "The replacement process succeeded!"
  fi

  echo "Replace <${ini_key}> with ${ini_value}: end."
done
