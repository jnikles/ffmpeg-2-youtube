#! /bin/bash
VBR="400k"
FPS="10"
QUAL="ultrafast"
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"

SOURCE="/dev/video0"              # Source UDP
AUDIO_SOURCE="/home/pi/music/silence.wav"
FSIZE=20
FCOLOR=white
FFILE='/usr/share/fonts/dejavu/DejaVuSansMono-Bold.ttf'
LTIME=drawtext="fontsize=$FSIZE:fontfile=$FFILE:fontcolor=$FCOLOR:text='%{localtime\:%X}':x=10:y=10"


ffmpeg \
    -i "$SOURCE" -deinterlace \
    -stream_loop -1 -i "$AUDIO_SOURCE" -filter:a "volume=0.5" \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -s 384*216 -r $FPS -g $(($FPS * 4)) -b:v $VBR \
    -vf $LTIME \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$YOUTUBE_KEY"
