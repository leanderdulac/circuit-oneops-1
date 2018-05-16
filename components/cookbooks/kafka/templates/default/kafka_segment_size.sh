#!/usr/bin/env bash

hunt() {
  find -O3 -name '*.log' -size +500M -printf '%h\n' > corrupt_dir.txt
  mailx -s "List of corrupted Folders" STRMSGCORE@email.wal-mart.com < corrupt_dir.txt
  rm corrupt_dir.txt
}

if [ -d /data/kafkalogs/ ]; then
  cd /data/kafkalogs/
  hunt
else
  cd /kafka/logs/
  hunt
fi
