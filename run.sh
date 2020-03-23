#! /bin/bash
VBR="400k"
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"

SOURCE="/dev/video0"              # Source UDP
AUDIO_SOURCE="/home/pi/ffmpeg-2-youtube/music/silence.mp3"
FCOLOR=white
FFILE='/usr/share/fonts/dejavu/DejaVuSansMono-Bold.ttf'
LTIME=drawtext="fontsize=$FSIZE:fontfile=$FFILE:fontcolor=$FCOLOR:text='%{localtime\:%X}':x=10:y=10"

ffmpeg \
    -thread_queue_size 64 \
    -f v4l2 -input_format yuyv422 \
    -i "$SOURCE" \
    -stream_loop -1 -i "$AUDIO_SOURCE" \
    -vf $LTIME \
    -vcodec h264_omx -b:v $VBR -s 640*480 \
    -acodec copy \
    -f flv "$YOUTUBE_URL/$YOUTUBE_KEY"
