function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 8663;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 8663 > /dev/null;
done;

for child in $(list_child_processes 8666);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/ben/Desktop/MusicPlaylist/MusicPlaylist.Server/bin/Debug/net10.0/95a40562312b40afa173bacb7f04253b.sh;
