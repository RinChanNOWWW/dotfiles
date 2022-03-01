for ($i = 0; $i -lt $args.Count; $i++) {
    if ("$($args[$i])".EndsWith(".flac")) {
        ffmpeg.exe -i $($args[$i]) -c:v copy -c:a alac "$("$($args[$i])".TrimEnd(".flac")).m4a"
    } elseif ("$($args[$i])".EndsWith(".mp3")) {
        ffmpeg.exe -i $($args[$i]) -c:v copy -c:a alac "$("$($args[$i])".TrimEnd(".mp3")).m4a"
    } else {
        Write-Output "未知格式"
    }
}