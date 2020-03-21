# ffmpeg-2-youtube
Small script for setting up ffmpeg to stream to youtube

Obviously made for a raspberry pi setup.
You would need the silence.wav as an audio stream for youtube to accept your stream. You can also reference any other audiofile there. It has to be royalty free though.

# Quick start
- Set your client secret as environment variable:
``` export YOUTUBE_KEY="xxx-xxx-xxx" ```

- Adjust the path to the audio file (will error otherwise)
- ./stream.sh
