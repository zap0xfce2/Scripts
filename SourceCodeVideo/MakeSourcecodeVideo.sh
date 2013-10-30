#/bin/sh

###
# Configuration Start
# Paths
VideoOutput=~/Desktop/gource.avi
AvatarDir=~/Desktop/avatar
GitFolder=~/Projekte/TideSDK/TallyTaurus/.git/
GourcePath=/usr/local/Cellar/gource/0.39/bin/gource
FFMpegPath=/usr/local/Cellar/ffmpeg/1.1.3/bin/ffmpeg
# Render settings
VideoResolution=1680x1050
HeaderFontSize=18
ToHide=mouse,progress,usernames
# Configuration End
###

#execute command
$GourcePath --output-ppm-stream - -s 1 -f -a 1 --key --highlight-dirs --file-idle-time 0 --multi-sampling -f -$VideoResolution --user-image-dir $AvatarDir --stop-at-end --hide $ToHide --font-size $HeaderFontSize -e 0.5 $GitFolder | $FFMpegPath -y -b 6000k -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -crf 1 -threads 0 -bf 0 $VideoOutput
