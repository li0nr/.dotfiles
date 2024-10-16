#!/bin/sh
# the path where you want to save notes
NOTES=/mnt/g/My\ Drive/Notes
cd "$NOTES"
noteFilename="note-$(date +%Y-%m-%d).md"

if [ ! -f $noteFilename ]; then
  echo "# Notes for $(date +%Y-%m-%d)" > $noteFilename
fi

nvim -c "norm Go" \
  -c "norm Go## $(date +%H:%M)" \
  -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $noteFilename

# add this in your rc file
# notes(){
#   /home/li0nr/.config/notes.sh
# }
