##########################
# Sampath Kunapareddy    #
# sampath.a926@gmail.com #
##########################
#!/bin/bash
#set -x
#clear
if [[ $# -eq 3 ]]; then
  FILE1=$1
  FILE2=$2
  if [[ $3 == File1_Entries_NotIn_File2 ]]; then
    for line in $(cat $FILE1); do
      RES=$(cat $FILE2 | grep -w "$line")
      if [[ -z $RES ]]; then
        echo "Not in $FILE2 : $line"
      fi
    done
  elif [[ $3 == File2_Entries_NotIn_File1 ]]; then
    for line in $(cat $FILE2); do
      RES=$(cat $FILE1 | grep -w "$line")
      if [[ -z $RES ]]; then
        echo "Not in $FILE1 : $line"
      fi
    done
  elif [[ $3 == File1_Entries_In_File2 ]]; then
    for line in $(cat $FILE1); do
      RES=$(cat $FILE2 | grep -w "$line")
      if [[ ! -z $RES ]]; then
        echo "In $FILE1 : $line"
      fi
    done
  elif [[ $3 == File2_Entries_In_File1 ]]; then
    for line in $(cat $FILE2); do
      RES=$(cat $FILE1 | grep -w "$line")
      if [[ ! -z $RES ]]; then
        echo "In $FILE2 : $line"
      fi
    done
  fi
else
  #clear
  echo -e "\n\n$0 \e[1m\"File1\" \"File2\""
  echo -e "\n\tFile1_Entries_NotIn_File2"
  echo -e "\tFile2_Entries_NotIn_File1"
  echo -e "\n\tFile1_Entries_In_File2"
  echo -e "\tFile2_Entries_In_File1\e[0m\n\n"
fi
