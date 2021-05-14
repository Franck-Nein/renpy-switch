pushd romfs/Contents/game/
find . -name "*.png" | parallel -eta cwebp -lossless {} -o {.}.png
find . -name "*.jpg" | parallel -eta cwebp {} -o {.}.jpg
find . -name "*.ogg" | parallel -eta oggdec {}
find . -name "*.wav" | parallel -eta opusenc {} --comp 10 {.}.ogg
find . -name "*.wav" | parallel -eta rm {}
popd
