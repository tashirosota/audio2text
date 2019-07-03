# audio2text
## usage
### 準備するもの
 - ffmpeg
 - Ruby
 - key.json # googleの認証key
 - rokuon.wav
```
cd audio2text
ls 
=> README.md      convert.sh     speech2text.rb     rokuon.wav     key.json
sh convert.sh rokuon wav
```
1.ffmpegでいい塩梅に旺盛ファイルを変換
2.Rubyでgoogleにファイルをupload & speech2text apiを叩く
3.最終的にrokuon.txtが帰ってくる