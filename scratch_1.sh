cd scans
mkdir cropped

for img in *.jpg; do
  width=$(identify -format "%w" "$img")
  height=$(identify -format "%h" "$img")
  crop_width=720
  x_offset=$(( (width - crop_width) / 2 ))
  convert "$img" -crop ${crop_width}x${height}+${x_offset}+0 +repage "cropped/$img"
done