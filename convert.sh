set -e

export GOOGLE_APPLICATION_CREDENTIALS="key.json"

echo "====Convert m4a to flac===="
ffmpeg -i $1.$2 -ab 160k -ac 1 -ar 16000 -vn $1.flac
echo "====👏👏👏Finished👏👏👏===="

ruby speech2text.rb $1