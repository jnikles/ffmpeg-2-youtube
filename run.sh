#! /bin/bash
VBR="400k"
FPS="10"
QUAL="ultrafast"
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"

SOURCE="/dev/video0"              # Source UDP
AUDIO_SOURCE="/home/pi/ffmpeg-2-youtube/music/silence.wav"
FSIZE=20
FCOLOR=white
FFILE='/usr/share/fonts/dejavu/DejaVuSansMono-Bold.ttf'
LTIME=drawtext="fontsize=$FSIZE:fontfile=$FFILE:fontcolor=$FCOLOR:text='%{localtime\:%X}':x=10:y=10"

ffmpeg \
    -thread_queue_size 512 \
    -f v4l2 -input_format yuyv422 \
    -i "$SOURCE" \
    -stream_loop -1 -i "$AUDIO_SOURCE" \
    -vf $LTIME \
    -vcodec h264_omx -s 320*240 \
    -acodec pcm_s16le \
    -f flv "$YOUTUBE_URL/$YOUTUBE_KEY"
